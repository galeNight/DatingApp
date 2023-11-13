using System.ComponentModel.DataAnnotations;

namespace DatingApp.Models
{
    public class UserProfile
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public DateTime Brithdate { get; set; }
        public string Height { get; set; }
        public string Aboutme { get; set; }
    }
}
