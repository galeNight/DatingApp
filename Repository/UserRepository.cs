using DatingApp.Models;
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
        public void AddUser(User user)
        {
            using (SqlConnection conn =new SqlConnection())
            {

                conn.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Account(USername,Password1,Email,Userrole " +
                "Values (@Username,@Password1,@Email,@Userrole", conn))
                {
                    cmd.Parameters.AddWithValue("@Username", user.Username);
                    cmd.Parameters.AddWithValue("@Password1", user.Password1);
                    cmd.Parameters.AddWithValue("@Email", user.Email);
                    cmd.Parameters.AddWithValue("@Userrole", user.Userrole);
                    cmd.ExecuteNonQuery();
                }
            conn.Close();
            }
        }
        public User GetUserByUsername(string username)
        {
            using(SqlConnection conn =new SqlConnection())
            {

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Account WHERE Username =@Username",conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            return new User
                            {
                                UserId = (int)reader["UserId"],
                                Username = reader["Username"].ToString(),
                                Password1 = reader["Password1"].ToString(),
                                Email = reader["Email"].ToString(),
                                Userrole = reader["Userrole"].ToString()
                            };
                        }
                        return null;//user not found
                    }
                }
                conn.Close();
            }
        }
    }
}
