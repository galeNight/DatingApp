// UserProfile model class
namespace DatingApp.Models
{
    public class UserProfile
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public DateTime Brithdate { get; set; }
        public string Height { get; set; }
        public string Firstname { get; set; }
        public string? Middlename { get; set; }
        public string Lastname { get; set; }
        public string Fullname => $"{Firstname} {Middlename} {Lastname}";
        public string Aboutme { get; set; }
        public int Cityid { get; set; }
        public int Genderid { get; set; }
        public int UserId { get; set; }
    }
}
