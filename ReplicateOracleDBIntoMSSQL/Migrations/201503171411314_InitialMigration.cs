namespace ReplicateOracleDBIntoMSSQL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialMigration : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.MeasurmentUnits",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        VendorId = c.Int(nullable: false),
                        MeasurmentUnitId = c.Int(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.MeasurmentUnits", t => t.MeasurmentUnitId, cascadeDelete: true)
                .ForeignKey("dbo.Vendors", t => t.VendorId, cascadeDelete: true)
                .Index(t => t.VendorId)
                .Index(t => t.MeasurmentUnitId);
            
            CreateTable(
                "dbo.Sales",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        SoldOn = c.DateTime(nullable: false),
                        SupermarketId = c.Int(nullable: false),
                        ProductId = c.Int(nullable: false),
                        Quantity = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .ForeignKey("dbo.Supermarkets", t => t.SupermarketId, cascadeDelete: true)
                .Index(t => t.SupermarketId)
                .Index(t => t.ProductId);
            
            CreateTable(
                "dbo.Supermarkets",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Vendors",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Products", "VendorId", "dbo.Vendors");
            DropForeignKey("dbo.Sales", "SupermarketId", "dbo.Supermarkets");
            DropForeignKey("dbo.Sales", "ProductId", "dbo.Products");
            DropForeignKey("dbo.Products", "MeasurmentUnitId", "dbo.MeasurmentUnits");
            DropIndex("dbo.Sales", new[] { "ProductId" });
            DropIndex("dbo.Sales", new[] { "SupermarketId" });
            DropIndex("dbo.Products", new[] { "MeasurmentUnitId" });
            DropIndex("dbo.Products", new[] { "VendorId" });
            DropTable("dbo.Vendors");
            DropTable("dbo.Supermarkets");
            DropTable("dbo.Sales");
            DropTable("dbo.Products");
            DropTable("dbo.MeasurmentUnits");
        }
    }
}
