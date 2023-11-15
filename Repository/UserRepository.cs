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
        public void AddAccountUser(User user) // add user
        {
            using (SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("Addacount", conn))
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
        public User AuthenticateUser(string username, string password)//AuthenticateUser
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
        public User GetUser(int? userId, string username, string password, string email, string userrole)//GetUser
        {
            using (SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("GetUser", conn))
                {
                    cmd.CommandType= CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password1", password);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("Userrole", userrole);
                    
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            User user = new User
                            {
                                UserId = reader.GetInt32(0),
                                Username = reader.GetString(1),
                                Password1 = reader.GetString(2),
                                Email = reader.GetString(3),
                                Userrole = reader.GetString(4)
                            };
                            return user;
                        }
                        else
                        {
                            return null;
                        }
                    }
                }
            }
        }
        public List<City> GetCities()//GetCities
        {
            List<City> cities = new List<City>();
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("select Cityid, city from City", conn))
                {
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while(reader.Read())
                        {
                            City c = new City();
                            {
                                c.Cityid = reader.GetInt32(0);
                                c.city = reader.GetString(1);
                                
                            };
                            cities.Add(c);
                        }
                    }
                }
            }
            return cities;
        }
        public List<Gender> GetGenders()//GetGenders
        {
            List<Gender> genders = new List<Gender>();
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("select GenderId, gender from Gender", conn))
                {
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while(reader.Read())
                        {
                            Gender g = new Gender();
                            {
                                g.GenderId = reader.GetInt32(0);
                                g.gender = reader.GetString(1);
                            };
                            genders.Add(g);
                        }
                    }
                }
            }
            return genders;
        }
        public void SaveUserProfile(UserProfile repo)
        {
            using (SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("SaveUserProfile", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", repo.Username);
                    cmd.Parameters.AddWithValue("@Brithdate", repo.Brithdate);
                    cmd.Parameters.AddWithValue("@Height", repo.Height);
                    cmd.Parameters.AddWithValue("@Firstname", repo.Firstname);
                    cmd.Parameters.AddWithValue("@Middlename", repo.Middlename);
                    cmd.Parameters.AddWithValue("@Lastname", repo.Lastname);
                    cmd.Parameters.AddWithValue("@Aboutme", repo.Aboutme);
                    cmd.Parameters.AddWithValue("@Cityid", repo.Cityid);
                    cmd.Parameters.AddWithValue("@Genderid", repo.Genderid);
                    cmd.Parameters.AddWithValue("@UserId", repo.UserId);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
    }
}
