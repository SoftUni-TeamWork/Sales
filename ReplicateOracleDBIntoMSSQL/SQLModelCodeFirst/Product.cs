namespace ReplicateOracleDBIntoMSSQL.SQLModelCodeFirst
{
    using System.Collections.Generic;
    
    public class Product
    {
        public Product()
        {
            this.Sales = new HashSet<Sale>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public int VendorId { get; set; }
        public int MeasurmentUnitId { get; set; }
        public decimal Price { get; set; }
    
        public virtual MeasurmentUnit MeasurmentUnit { get; set; }
        public virtual Vendor Vendor { get; set; }
        public virtual ICollection<Sale> Sales { get; set; }
    }
}
