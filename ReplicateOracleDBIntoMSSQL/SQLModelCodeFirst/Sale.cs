namespace ReplicateOracleDBIntoMSSQL.SQLModelCodeFirst
{
    using System;
    public class Sale
    {
        public int Id { get; set; }
        public DateTime SoldOn { get; set; }
        public int SupermarketId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    
        public virtual Product Product { get; set; }
        public virtual Supermarket Supermarket { get; set; }
    }
}
