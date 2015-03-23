namespace ReplicateOracleDBIntoMSSQL.SQLModelCodeFirst
{
    using System.Data.Entity;

    public class SQLEntities : DbContext
    {
        private const string ConnectionString =
            "server=.;database=SupermarketsChain;Integrated Security=True;";
        public SQLEntities()
            : base(ConnectionString)
        {

        }
    
        public virtual DbSet<MeasurmentUnit> MeasurmentUnits { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Sale> Sales { get; set; }
        public virtual DbSet<Supermarket> Supermarkets { get; set; }
        public virtual DbSet<Vendor> Vendors { get; set; }
        //public virtual DbSet<Expenses> Expenses { get; set; }
    }
}