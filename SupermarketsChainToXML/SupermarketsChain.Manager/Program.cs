namespace SupermarketsChain.Manager
{
    using SupermarketsChain.Data;
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;
    using System.Threading;
    using System.Xml;
    using System.Xml.Linq;

    internal class Summary : IComparable<Summary>
    {
        public Summary(DateTime date, decimal totalSum)
        {
            this.Date = date;
            this.TotalSum = totalSum;
        }

        public DateTime Date { get; set; }

        public decimal TotalSum { get; set; }

        public int CompareTo(Summary other)
        {
            return this.Date.CompareTo(other.Date);
        }
    }

    public class Program
    {
        public static void Main()
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.InvariantCulture;
            const string XmlResultFileName = @"..\..\..\result.xml";

            var context = new SupermarketsChainEntities();
            var startDate = new DateTime(2015, 1, 1);
            var endDate = new DateTime(2015, 3, 30);

            Console.WriteLine("Generating report from sales to xml...");
            var sales = SalesByVendors(context, startDate, endDate);
            GenerateXmlFromSales(sales, XmlResultFileName);
            Console.WriteLine("The report is done!");
        }

        private static Dictionary<string, SortedSet<Summary>> SalesByVendors(SupermarketsChainEntities context, DateTime startDate, DateTime endDate)
        {
            using (context)
            {
                var salesResult = new Dictionary<string, SortedSet<Summary>>();
                var sales = context.Sales.Select(s => new
                {
                    s.Product,
                    s.Product.Vendor,
                    s.SoldOn
                });

                foreach (var sale in sales)
                {
                    if (startDate <= sale.SoldOn && sale.SoldOn <= endDate)
                    {
                        var vendorName = sale.Product.Vendor.Name;
                        if (!salesResult.ContainsKey(vendorName))
                        {
                            salesResult[vendorName] = new SortedSet<Summary>();
                        }
                        var summary = new Summary(sale.SoldOn, sale.Product.Price);
                        var summariesWithEqualDates = salesResult[vendorName].Where(x => x.Date == summary.Date);

                        if (summariesWithEqualDates.Count() == 0)
                        {
                            salesResult[vendorName].Add(summary);
                        }
                        else
                        {
                            summariesWithEqualDates.FirstOrDefault().TotalSum += summary.TotalSum;
                        }
                    }
                }

                return salesResult;
            }
        }

        private static void GenerateXmlFromSales(Dictionary<string, SortedSet<Summary>> sales, string resultFileName)
        {
            var doc = new XDocument();
            var xSales = new XElement("sales");
            foreach (var sale in sales)
            {
                var summaries = sale.Value;
                var xSale = new XElement("sale");
                
                foreach (var summary in summaries)
                {
                    var xSummary = new XElement("summary");
                    xSummary.Add(new XAttribute("date", summary.Date.ToString("dd-MMM-yyyy")));
                    xSummary.Add(new XAttribute("total-sum", string.Format("{0:F2}", summary.TotalSum)));
                    xSale.Add(xSummary);
                }

                xSale.Add(new XAttribute("vendor", sale.Key));
                xSales.Add(xSale);
            }

            doc.Add(xSales);
            doc.Save(resultFileName);
        }
    }
}
