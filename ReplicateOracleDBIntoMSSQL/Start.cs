using System;

namespace ReplicateOracleDBIntoMSSQL
{
    using SQLModelCodeFirst;
    
    public class Start
    {
        public static void Main()
        {
            Console.WriteLine("Start of data migration from Oracle to MS SQL, please wait :-)");
            try
            {
                Migrations.Configuration.SynchronizeSQLDb(new SQLEntities());
                Console.WriteLine("Successful data migration!");
            }
            catch (Exception e)
            {
                Console.WriteLine("The data could not be migrated into MS SQL." +
                                                " Please check your connection string parameter and try again." +
                                                " Inner Exception message: {0}", e.Message);
            }
            
        }
    }
}