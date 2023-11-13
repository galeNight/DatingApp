namespace DatingApp.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Password1 { get; set; }
        public string Email { get; set; }
        public string Userrole { get; set; }
        public bool HasProfile { get; set; }
    }
}
