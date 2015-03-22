using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sales.Data.MySql
{
    public class Product
    {
        [Key]
        public decimal Id { get; set; }
        
        public string Name { get; set; }
        
        [ForeignKey("Product")]
        public decimal VendorId { get; set; }

        public decimal Price { get; set; }

        public virtual Vendor Vendor { get; set; }
    }
}
