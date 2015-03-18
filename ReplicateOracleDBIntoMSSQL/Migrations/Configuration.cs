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
                if (!(context.MeasurmentUnits.Any(p => p.Name == measurmentUnit.NAME)))
                {
                    context.MeasurmentUnits.Add(new MeasurmentUnit
                    {
                        Name = measurmentUnit.NAME
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
                if (!(context.Vendors.Any(p => p.Name == vendor.NAME)))
                {
                    context.Vendors.Add(new Vendor
                    {
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
                if (!(context.Supermarkets.Any(p => p.Name == supermarket.NAME)))
                {
                    context.Supermarkets.Add(new Supermarket
                    {
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
                if (!(context.Products.Any(p => p.Name == product.NAME)))
                {
                    context.Products.Add(new Product
                    {
                        Name = product.NAME,
                        MeasurmentUnitId = (int) product.MEASURMENT_UNIT_ID,
                        Price = product.PRICE,
                        VendorId = (int) product.VENDOR_ID
                    });
                }
                else
                {
                    var existingEntity = context.Products.First(p => p.Name == product.NAME);
                    if (existingEntity.MeasurmentUnitId != (int)product.MEASURMENT_UNIT_ID ||
                        existingEntity.Price != product.PRICE ||
                        existingEntity.VendorId != (int)product.VENDOR_ID)
                    {
                        existingEntity.MeasurmentUnitId = (int) product.MEASURMENT_UNIT_ID;
                        existingEntity.Price = product.PRICE;
                        existingEntity.VendorId = (int) product.VENDOR_ID;
                    }
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
                if (!(context.Sales.Any(p => p.SupermarketId == (int)sale.ID &&
                                            p.Quantity == (int)sale.QUANTITY &&
                                            p.SoldOn == (DateTime)sale.SOLD_ON &&
                                            p.ProductId == (int)sale.PRODUCT_ID)))
                {
                    context.Sales.Add(new Sale
                    {
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