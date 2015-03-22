namespace XmlParsing
{
    using System;
    using ReplicateOracleDBIntoMSSQL.SQLModelCodeFirst;
    using System.Xml;
    class ImportFromXml
    {
        static void Main(string[] args)
        {
            XmlDocument xml = new XmlDocument();
            xml.Load(@"C:\Users\Darko\Documents\Visual Studio 2013\Projects\DbFirstTest\Data\Sample-Vendor-Expenses.xml");
            XmlNodeList Vendors = xml.DocumentElement.SelectNodes("/expenses-by-month/vendor");

            var dbContext = new SQLEntities();
            foreach (XmlNode item in Vendors)
            {
                string vendorName = item.Attributes["name"].Value;

                var addVendor = dbContext.Vendors.Add(new Vendor {Name = vendorName});
 
                    foreach (XmlNode expens in item.ChildNodes)
                    {
                        var vendorId = addVendor.Id;
                        DateTime expenseMonth = DateTime.Parse(expens.Attributes["month"].Value);
                        decimal expensePrice = Convert.ToDecimal(expens.InnerText);
                        Console.WriteLine("Vendor: " + vendorId + "Expense: " + expensePrice + ", " + "Expense Month: " + expenseMonth);

                        
                        dbContext.Expenses.Add(new Expenses { ExpenseDate = expenseMonth, VendorId = vendorId, Expense = expensePrice});
                        
                     }
                
                dbContext.SaveChanges();
            }
        }
    }
}
