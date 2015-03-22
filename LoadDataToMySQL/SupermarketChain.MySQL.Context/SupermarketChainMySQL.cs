using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Sales.Data.MySql;

namespace LoadDataToMySQL.SupermarketChain.MySQL.Context
{
    public class SupermarketChainMySQL : DbContext
    {
        public SupermarketChainMySQL(DbConnection connection)
        : base(connection, true)
        {
        }

        public virtual DbSet<Sales.Data.MySql.Income> Income { get; set; }

        public virtual DbSet<Sales.Data.MySql.Expense> Expense { get; set; }

        public virtual DbSet<Sales.Data.MySql.Product> Product { get; set; }

        public virtual DbSet<Sales.Data.MySql.Vendor> Vendor { get; set; }
    }
}
