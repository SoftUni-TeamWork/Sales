namespace ImportZippedXLSFilesInSQLServer
{
    using System;
    using System.Windows.Forms;
    using Ionic.Zip;
    using Spire.Xls;
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using ReplicateOracleDBIntoMSSQL.SQLModelCodeFirst;

    public class Start
    {
        [STAThread]
        public static void Main()
        {
            Console.WriteLine("Please choose a zip file with reports:");
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.ShowDialog();

            var data = new Dictionary<DateTime, ICollection<Dictionary<string, ICollection<string[]>>>>();
            using (ZipFile zip = new ZipFile(ofd.FileName))
            {
                var date = new DateTime();
                foreach (var zipEntry in zip)
                {
                    if (zipEntry.IsDirectory)
                    {
                        date = GetDateFromZipEntry(zipEntry);
                    }
                    else
                    {
                        InsertXlsData(zipEntry, data, date);
                        Console.WriteLine("Excel file to be added: " + zipEntry);
                        Console.WriteLine();
                    }
                }
            }


            using (var db = new SQLEntities())
            {
                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Console.WriteLine("MSSQL transaction started: ");
                        Console.WriteLine();
                        foreach (var dateKey in data.Keys)
                        {
                            foreach (var dateFolder in data[dateKey])
                            {
                                foreach (var supermarketXls in dateFolder)
                                {
                                    var supermarketName = supermarketXls.Key;
                                    if (db.Supermarkets.Any(p => p.Name == supermarketName))
                                    {
                                        foreach (var row in supermarketXls.Value)
                                        {
                                            var productName = row[0];
                                            var quantity = int.Parse(row[1]);
                                            var price = decimal.Parse(row[2]);
                                            if (db.Products.Any(q => q.Name == productName && q.Price == price))
                                            {
                                                var newSale = new Sale
                                                {
                                                    SoldOn = dateKey,
                                                    SupermarketId =
                                                        db.Supermarkets.First(p => p.Name == supermarketName).Id,
                                                    ProductId = db.Products.First(p => p.Name == productName &&
                                                        p.Price == price).Id,
                                                    Quantity = quantity
                                                };
                                                if (db.Sales.FirstOrDefault(p => p.SoldOn == newSale.SoldOn &&
                                                                        p.SupermarketId == newSale.SupermarketId &&
                                                                        p.ProductId == newSale.ProductId) == null)
                                                {
                                                    db.Sales.Add(newSale);
                                                    db.SaveChanges();                                                    
                                                }
                                                else
                                                {
                                                    Console.WriteLine("There is already imported .xls report for product {0} on date {1}, in supermarket {2}!",
                                                        db.Products.First(p => p.Id == newSale.ProductId).Name, newSale.SoldOn,
                                                        db.Supermarkets.First(p => p.Id ==newSale.SupermarketId).Name);
                                                    Console.WriteLine();
                                                }

                                            }
                                            else
                                            {
                                                var rnd = new Random();
                                                var newVendor = new Vendor
                                                {
                                                    Name = "New Vendor RandGen " + rnd.Next(1, int.MaxValue)
                                                };
                                                db.Vendors.Add(newVendor);
                                                db.SaveChanges();
                                                var newProduct = new Product
                                                {
                                                    Name = productName,
                                                    Price = price,
                                                    VendorId = db.Vendors.First(p => p.Name == newVendor.Name).Id,
                                                    MeasurmentUnitId = rnd.Next(1, 4)
                                                };
                                                db.Products.Add(newProduct);
                                                db.SaveChanges();
                                                db.Sales.Add(new Sale
                                                {
                                                    SoldOn = dateKey,
                                                    SupermarketId =
                                                        db.Supermarkets.First(p => p.Name == supermarketName).Id,
                                                    ProductId =
                                                        db.Products.First(p => p.Name == productName && p.Price == price)
                                                            .Id,
                                                    Quantity = quantity
                                                });                                                
                                                db.SaveChanges();                                                
                                            }
                                        }
                                    }
                                    else
                                    {
                                        var newSupermarket = new Supermarket
                                        {
                                            Name = supermarketName
                                        };
                                        db.Supermarkets.Add(newSupermarket);
                                        db.SaveChanges();
                                        foreach (var row in supermarketXls.Value)
                                        {
                                            var productName = row[0];
                                            var quantity = int.Parse(row[1]);
                                            var price = decimal.Parse(row[2]);
                                            if (db.Products.Any(q => q.Name == productName && q.Price == price))
                                            {
                                                var newSale = new Sale
                                                {
                                                    SoldOn = dateKey,
                                                    SupermarketId =
                                                        db.Supermarkets.First(p => p.Name == newSupermarket.Name).Id,
                                                    ProductId = db.Products.First(p => p.Name == productName &&
                                                        p.Price == price).Id,
                                                    Quantity = quantity
                                                };
                                                if (db.Sales.FirstOrDefault(p => p.SoldOn == newSale.SoldOn &&
                                                                        p.SupermarketId == newSale.SupermarketId &&
                                                                        p.ProductId == newSale.ProductId) == null)
                                                {
                                                    db.Sales.Add(newSale);
                                                    db.SaveChanges();                                                    
                                                }
                                                else
                                                {
                                                    Console.WriteLine("There is already imported .xls report for product {0} on date {1}, in supermarket {2}!",
                                                        db.Products.First(p => p.Id == newSale.ProductId).Name, newSale.SoldOn,
                                                        db.Supermarkets.First(p => p.Id == newSale.SupermarketId).Name);
                                                    Console.WriteLine();
                                                }                                                
                                            }
                                            else
                                            {
                                                var rnd = new Random();
                                                var newVendor = new Vendor
                                                {
                                                    Name = "New Vendor RandGen " + rnd.Next(1, int.MaxValue).ToString()
                                                };
                                                db.Vendors.Add(newVendor);
                                                db.SaveChanges();
                                                var newProduct = new Product
                                                {
                                                    Name = productName,
                                                    Price = price,
                                                    VendorId = db.Vendors.First(p => p.Name == newVendor.Name).Id,
                                                    MeasurmentUnitId = rnd.Next(1, 4)
                                                };
                                                db.Products.Add(newProduct);
                                                db.SaveChanges();
                                                db.Sales.Add(new Sale
                                                {
                                                    SoldOn = dateKey,
                                                    SupermarketId =
                                                        db.Supermarkets.First(p => p.Name == newSupermarket.Name).Id,
                                                    ProductId =
                                                        db.Products.First(p => p.Name == productName && p.Price == price)
                                                            .Id,
                                                    Quantity = quantity
                                                });
                                                db.SaveChanges();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Console.WriteLine("End of transaction, result:");
                        //throw new Exception(); for test purposes - what happens if something went wrong
                        db.SaveChanges();
                        dbContextTransaction.Commit();
                        Console.WriteLine("Data from zip file successfully added to MS SQL DB without duplicate entries");
                        Console.WriteLine();
                        
                        
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Transaction failed, no changes in MSSQL made!\nThe data from the zip file couldn't be imported in the SQL Database. Exception: {0}", e.Message);
                        //dbContextTransaction.Rollback(); no need to rollback, because if exception occurs, transaction is not made
                    }
                    
                }
            }

        }

        private static void InsertXlsData(ZipEntry zipEntry, Dictionary<DateTime, ICollection<Dictionary<string, ICollection<string[]>>>> data, DateTime date)
        {
            var xlsRows = DataRowsFromZipEntry(zipEntry);
            var supermarketName = xlsRows[0].ItemArray[1].ToString();
            ICollection<string[]> rows = new List<string[]>();
            for (int i = 2; i < xlsRows.Count - 1; i++)
            {
                var columns = new string[3];
                for (int j = 1; j < 4; j++)
                {
                    columns[j - 1] = xlsRows[i].ItemArray[j].ToString();
                }
                rows.Add(columns);
            }
            var xlsFile = new Dictionary<string, ICollection<string[]>>();
            xlsFile.Add(supermarketName, rows);
            ICollection<Dictionary<string, ICollection<string[]>>> dataEntry
                = new List<Dictionary<string, ICollection<string[]>>>();
            dataEntry.Add(xlsFile);
            if (data.ContainsKey(date))
            {
                data[date].Add(xlsFile);
            }
            else
            {
                data.Add(date, dataEntry);
            }
        }

        private static DateTime GetDateFromZipEntry(ZipEntry zipEntry)
        {
            DateTime date;
            var dateComponents = zipEntry.FileName.Split(new[] { '-', '/' },
                StringSplitOptions.RemoveEmptyEntries);
            date = new DateTime(int.Parse(dateComponents[2]), MonthToInt(dateComponents[1]),
                int.Parse(dateComponents[0]));
            return date;
        }

        private static List<DataRow> DataRowsFromZipEntry(ZipEntry zipEntry)
        {
            zipEntry.Extract(ExtractExistingFileAction.OverwriteSilently);
            var xlsFile = new Workbook();
            xlsFile.LoadFromFile(zipEntry.FileName);
            var sheet = xlsFile.Worksheets[0];
            var xlsRows = sheet.ExportDataTable().AsEnumerable().ToList();
            return xlsRows;
        }

        private static int MonthToInt(string month)
        {
            switch (month)
            {
                case "Jan":
                    return 1;
                case "Feb":
                    return 2;
                case "Mar":
                    return 3;
                case "Apr":
                    return 4;
                case "May":
                    return 5;
                case "Jun":
                    return 6;
                case "Jul":
                    return 7;
                case "Aug":
                    return 8;
                case "Sep":
                    return 9;
                case "Oct":
                    return 10;
                case "Nov":
                    return 11;
                case "Dec":
                    return 12;
                default:
                    throw new ArgumentOutOfRangeException("month", "Month name is not in correct format!");
            }
        }
    }
}