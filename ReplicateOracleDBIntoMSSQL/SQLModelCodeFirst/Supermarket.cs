namespace ReplicateOracleDBIntoMSSQL.SQLModelCodeFirst
{
    using System.Collections.Generic;
    
    public class Supermarket
    {
        public Supermarket()
        {
            this.Sales = new HashSet<Sale>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<Sale> Sales { get; set; }
    }
}
