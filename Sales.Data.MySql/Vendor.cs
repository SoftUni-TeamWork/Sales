using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sales.Data.MySql
{
    public class Vendor
    {
        public Vendor()
        {
            this.Expenses = new HashSet<Expense>();
            this.Products = new HashSet<Product>();
        }

        public decimal Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Expense> Expenses { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
