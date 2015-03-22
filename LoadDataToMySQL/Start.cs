using LoadDataToMySQL.SupermarketChain.MySQL.Context;
using MySql.Data.MySqlClient;

namespace LoadDataToMySQL
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    using Sales.Data.MySql;

    class Start
    {
        static void Main()
        {
            using (MySqlConnection conn = new MySqlConnection("Server=127.0.0.1;Database=supermarkets_chain_entities_mysql;Uid=root;Pwd="))
            {
                using (SupermarketChainMySQL context = new SupermarketChainMySQL(conn))
                {
                    context.Product.Add(new Product()
                    {
                        Name = "1234"
                    });

                    context.SaveChanges();
                }
            }
        }
    }
}
