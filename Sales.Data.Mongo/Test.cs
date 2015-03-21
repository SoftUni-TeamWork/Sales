namespace Sales.Data.Mongo
{
    using System;

    public class Test
    {
        public static void Main()
        {
            var reporter = new SalesReporter();
            reporter.Report(new DateTime(2015, 01, 15), new DateTime(2015, 03, 7));
        }
    }
}
