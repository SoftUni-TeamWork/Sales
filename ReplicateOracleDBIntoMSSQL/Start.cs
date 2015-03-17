using System;

namespace ReplicateOracleDBIntoMSSQL
{
    using SQLModelCodeFirst;
    
    public class Start
    {
        public static void Main()
        {
            Console.WriteLine("Start of data migration from Oracle to MS SQL, please wait :-)");
            Migrations.Configuration.SynchronizeSQLDb(new SQLEntities());
            Console.WriteLine("Successful data migration!");
        }
    }
}