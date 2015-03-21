namespace Sales.Data.Mongo
{
    using Newtonsoft.Json;
    using MongoDB.Bson;
    using MongoDB.Bson.Serialization.Attributes;

    [JsonObject(MemberSerialization.OptIn)]
    public class SalesReport
    {
        [JsonIgnore]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }

        [JsonProperty("product-id")]
        [BsonElement("product-id")]
        public int ProductId { get; set; }

        [JsonProperty("product-name")]
        [BsonElement("product-name")]
        public string ProductName { get; set; }

        [JsonProperty("vendor-name")]
        [BsonElement("vendor-name")]
        public string VendorName { get; set; }

        [JsonProperty("total-quantity-sold")]
        [BsonElement("total-quantity-sold")]
        [BsonRepresentation(BsonType.Double)]
        public decimal TotalQuantitySold { get; set; }

        [JsonProperty("total-incomes")]
        [BsonElement("total-incomes")]
        [BsonRepresentation(BsonType.Double)] 
        public decimal TotalIncomes { get; set; }
    }
}
