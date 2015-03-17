namespace ReplicateOracleDBIntoMSSQL.SQLModelCodeFirst
{
    using System.Collections.Generic;
    
    public class MeasurmentUnit
    {
        public MeasurmentUnit()
        {
            this.Products = new HashSet<Product>();
        }
   
        public int Id { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<Product> Products { get; set; }
    }
}
