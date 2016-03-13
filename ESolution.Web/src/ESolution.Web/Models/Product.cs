using System.ComponentModel.DataAnnotations;

namespace ESolution.Web.Models
{
    public class Product
    {
        [Key]
        public long ProductId { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public long CategoryId { get; set; }
        public virtual Category Category { get; set; }
    }
}
