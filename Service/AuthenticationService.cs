// Service class for managing user authentication
using DatingApp.Models;
using System.Reflection.Metadata;

namespace DatingApp.Service
{
    public class AuthenticationService
    {
        // Property to store the currently logged-in user
        public User LoggedInUser { get;private set; }
        // Method to set the currently logged-in user
        public void setloggedinUser(User user)
        {
            LoggedInUser = user;
        }
        // Method to log out the current user
        public void logout()
        {
            LoggedInUser = null;
        }
    }
}
