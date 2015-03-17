namespace ReplicateOracleDBIntoMSSQL
{
    using SQLModelCodeFirst;
    
    public class Start
    {
        public static void Main()
        {

            Migrations.Configuration.SynchronizeSQLDb(new SQLEntities());

        }
    }
}