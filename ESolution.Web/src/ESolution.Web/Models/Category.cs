using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ESolution.Web.Models
{
    public class Category
    {
        [Key]
        public long CategoryId { get; set; }
        public string CategoryName { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
