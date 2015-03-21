using System.Collections.Generic;

namespace Sales.Data.Mongo
{
    using System;
    using System.Data.Entity;
    using System.IO;
    using System.Linq;
    using MongoDB.Driver;
    using Newtonsoft.Json;
    using ReplicateOracleDBIntoMSSQL.SQLModelCodeFirst;
    internal class SalesReporter
    {
        private const string ReportsPath = "../../../Json-Reports/";
        private const string ReportsFileExtension = ".json";

        private const string DatabaseHost = "mongodb://127.0.0.1";
        private const string DatabaseName = "Sales";

        public void Report(DateTime startDate, DateTime endDate)
        {
            Console.WriteLine("Started creating JSON reports...");

            if (!Directory.Exists(ReportsPath))
            {
                Console.WriteLine("Create Sales reports folder.");
                Directory.CreateDirectory(ReportsPath);
            }

            var db = new SQLEntities();
            var reports = GetJsonReport(db, startDate, endDate);

            SaveReportsToFiles(reports);
            SaveReportToMongoDb(reports);
        }

        /// <summary>
        /// Get information from SQL database.
        /// </summary>
        /// <param name="db">SupermarketsChain database</param>
        /// <param name="startDate">Start data</param>
        /// <param name="endDate">End date</param>
        /// <returns>Json Collection</returns>
        private static IQueryable<SalesReport> GetJsonReport(SQLEntities db, DateTime startDate, DateTime endDate)
        {
            Console.WriteLine("Generating reports from the SQL Server database data...");
            var report = db.Sales
                .Include(e => e.Product)
                .Include(e => e.Product.Vendor)
                .Where(s => s.SoldOn >= startDate && s.SoldOn <= endDate)
                .Select(x => new SalesReport
                {
                    ProductId = x.ProductId,
                    ProductName = x.Product.Name,
                    VendorName = x.Product.Vendor.Name,
                    TotalQuantitySold = x.Quantity,
                    TotalIncomes = x.Quantity * x.Product.Price
                });

            if (report.Any() == false)
            {
                throw new ArgumentNullException(string.Format("No sales between {0} and {1}", startDate.ToShortDateString(), endDate.ToShortDateString()));
            }

            return report;
        }

        private static void SaveReportsToFiles(IQueryable<SalesReport> reports)
        {
            Console.WriteLine("Start saving reports to files...");

            foreach (var report in reports)
            {
                string reportFilePath = string.Format("{0}{1}{2}", ReportsPath, report.ProductId, ReportsFileExtension);

                var writer = new StreamWriter(reportFilePath);

                using (writer)
                {
                    string serialized = JsonConvert.SerializeObject(report, Formatting.Indented);

                    writer.WriteLine(serialized);
                }
            }
            Console.WriteLine("End saving reports to files.");
        }

        private static void SaveReportToMongoDb(IQueryable<SalesReport> reports)
        {
            Console.WriteLine("Connecting to MongoDB ...");

            try
            {
                var db = GetDatabase(DatabaseName, DatabaseHost);
                var sales = db.GetCollection<SalesReport>("SalesByProductReports");

                sales.InsertBatch(reports);
                Console.WriteLine("{0} reports was saved to MongoDB.", reports.Count());

                //ShowMongoDbInformation(sales);
            }
            catch (MongoConnectionException ex)
            {
                Console.WriteLine("Connection failed, please check your mongod.exe", ex.Message);
            }
        }
        /// <summary>
        /// Show all information from Mongo Database
        /// </summary>
        /// <param name="sales"></param>
        private static void ShowMongoDbInformation(MongoCollection<SalesReport> sales)
        {
            foreach (var sale in sales.FindAll())
            {
                Console.WriteLine("ID:[{0}]\n\rProduct Name: {1}\n\rVendor Name: {2}\n\rTotal Quantity Sold: {3}\n\rTotal Incomes: {4}",
                    sale.Id, sale.ProductName, sale.VendorName, sale.TotalQuantitySold, sale.TotalIncomes);
                Console.WriteLine();
            }
        }

        /// <summary>
        /// Connect to MongoDb
        /// </summary>
        /// <param name="name">Database name</param>
        /// <param name="fromHost">Host name</param>
        /// <returns></returns>
        private static MongoDatabase GetDatabase(string name, string fromHost)
        {
            var mongoClient = new MongoClient(fromHost);
            var server = mongoClient.GetServer();

            return server.GetDatabase(name);
        }
    }
}