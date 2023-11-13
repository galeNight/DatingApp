using DatingApp.Models;
using System.Data;
using System.Data.SqlClient;

namespace DatingApp.Repository
{
    public class UserRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connstring;
        public UserRepository(IConfiguration Config)
        {
            _configuration = Config;
            _connstring = _configuration.GetConnectionString("DefaultConnection");
        }
        public void AddUser(User user) // add user
        {
            using (SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("dbo.Addacount", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", user.Username);
                    cmd.Parameters.AddWithValue("@Password1", user.Password1);
                    cmd.Parameters.AddWithValue("Email", user.Email);
                    cmd.Parameters.AddWithValue("Userrole", user.Userrole);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
        public User AuthenticateUser(string username, string password)
        {
            using (SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("AuthenticateUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password1", password);

                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            return new User
                            {
                                UserId = (int)reader["UserId"],
                                Username = reader["Username"].ToString(),
                                Userrole = reader["Userrole"].ToString()
                            };
                        }
                        return null;// user not found or invalid credentials
                    }
                }
            }
        }
    }
}
