namespace ReplicateOracleDBIntoMSSQL.Migrations
{
    using System.Data.Entity.Migrations;
    using System;
    using OracleModel;
    using SQLModelCodeFirst;
    using System.Linq;

    public sealed class Configuration : DbMigrationsConfiguration<SQLEntities>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(SQLEntities context)
        {
           
        }

        public static void SynchronizeSQLDb(SQLEntities context)
        {
            MeasurmentUnitsSeed(context);
            VendorsSeed(context);
            SupermarketsSeed(context);
            ProductsSeed(context);
            SalesSeed(context);
        }

        private static void MeasurmentUnitsSeed(SQLEntities context)
        {
            var db = new OracleEntities();
            
            
            var measurmentUnits = db.MEASURMENT_UNITS.ToList();
            foreach (var measurmentUnit in measurmentUnits)
            {
                if (!(context.MeasurmentUnits.Any(p => p.Id == measurmentUnit.ID)))
                {
                    context.MeasurmentUnits.Add(new MeasurmentUnit
                    {
                        Name = measurmentUnit.NAME,
                        //Id = (int) measurmentUnit.ID
                    });
                }
            }

            context.SaveChanges();
        }

        private static void VendorsSeed(SQLEntities context)
        {
            var db = new OracleEntities();

            var vendors = db.VENDORS.ToList();

            foreach (var vendor in vendors)
            {
                if (!(context.Vendors.Any(p => p.Id == vendor.ID)))
                {
                    context.Vendors.Add(new Vendor
                    {
                        //Id = (int) vendor.ID,
                        Name = vendor.NAME
                    });
                }
            }

            context.SaveChanges();

        }

        private static void SupermarketsSeed(SQLEntities context)
        {
            var db = new OracleEntities();

            var supermarkets = db.SUPERMARKETS.ToList();

            foreach (var supermarket in supermarkets)
            {
                if (!(context.Supermarkets.Any(p => p.Id == supermarket.ID)))
                {
                    context.Supermarkets.Add(new Supermarket
                    {
                        //Id = (int) supermarket.ID,
                        Name = supermarket.NAME
                    });
                }
            }

            context.SaveChanges();
        }

        private static void ProductsSeed(SQLEntities context)
        {
            var db = new OracleEntities();
            var products = db.PRODUCTS.ToList();

            foreach (var product in products)
            {
                if (!(context.Products.Any(p => p.Id == product.ID)))
                {
                    context.Products.Add(new Product
                    {
                        //Id = (int) product.ID,
                        Name = product.NAME,
                        MeasurmentUnitId = (int) product.MEASURMENT_UNIT_ID,
                        Price = product.PRICE,
                        VendorId = (int) product.VENDOR_ID
                    });
                }
            }

            context.SaveChanges();
        }



        private static void SalesSeed(SQLEntities context)
        {
            var db = new OracleEntities();

            var sales = db.SALES.ToList();

            foreach (var sale in sales)
            {
                if (!(context.Sales.Any(p => p.Id == sale.ID)))
                {
                    context.Sales.Add(new Sale
                    {
                        //Id = (int) sale.ID,
                        SupermarketId = (int) sale.SUPERMARKET_ID,
                        Quantity = (int) sale.QUANTITY,
                        SoldOn = (DateTime) sale.SOLD_ON,
                        ProductId = (int) sale.PRODUCT_ID
                    });
                }
            }

            context.SaveChanges();
        }
    }
}