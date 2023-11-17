using DatingApp.Models;

namespace DatingApp.Service
{
    public class AuthenticationService
    {
        public User LoggedInUser { get;private set; }
        public void setloggedinUser(User user)
        {
            LoggedInUser = user;
        }
        public void logout()
        {
            LoggedInUser = null;
        }
    }
}
