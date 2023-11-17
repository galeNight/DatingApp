using DatingApp.Models;
using System.Data;
using System.Data.SqlClient;

namespace DatingApp.Repository
{
    public class UserRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connstring;//connectionstring
        public UserRepository(IConfiguration Config)
        {
            _configuration = Config;
            _connstring = _configuration.GetConnectionString("DefaultConnection");
        }
        public void AddAccountUser(User user) //AddAccountUser to database
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
        public User AuthenticateUser(string username, string password)//AuthenticateUser tjeck of crorrect user login
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
        public User GetUser(int? userId, string username, string password, string email, string userrole)//GetUser from database
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
        public List<City> GetCities()//GetCities from database
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
        public List<Gender> GetGenders()//GetGenders form database
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

        public void SaveUserProfile(UserProfile repo)//saveuserprofile to database
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
                    cmd.Parameters.AddWithValue("@Middlename", (object)repo.Lastname ?? DBNull.Value);
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
        public UserProfile GetUserProfile(int userId)
        {
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand ("select * from UserProfile where UserId = @UserId",conn))
                {
                    cmd.Parameters.AddWithValue("UserId", userId);
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            return new UserProfile()
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                Username = reader.GetString(reader.GetOrdinal("Username")),
                                Brithdate = reader.GetDateTime(reader.GetOrdinal("Brithdate")),
                                Height = reader.GetString(reader.GetOrdinal("height")),
                                Firstname = reader.GetString(reader.GetOrdinal("Firstname")),
                                Middlename = reader.IsDBNull(reader.GetOrdinal("Middlename")) ? null : reader.GetString(reader.GetOrdinal("Middlename")),
                                Lastname = reader.GetString(reader.GetOrdinal("Lastname")),
                                Aboutme = reader.IsDBNull(reader.GetOrdinal("Aboutme")) ? null : reader.GetString(reader.GetOrdinal("Aboutme")),
                                Cityid = reader.IsDBNull(reader.GetOrdinal("Cityid")) ? 0 : reader.GetInt32(reader.GetOrdinal("Cityid")),
                                Genderid = reader.IsDBNull(reader.GetOrdinal("Genderid")) ? 0 : reader.GetInt32(reader.GetOrdinal("Genderid")),
                                UserId = reader.GetInt32(reader.GetOrdinal("UserId")),
                            };
                        }
                        return null; // User profile not found for the given user ID
                    }
                }
            }
        }
        public void UpdateUserProfile(UserProfile userProfile)
        {
            using (SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("UpdateUserProfile", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", userProfile.Id);
                    cmd.Parameters.AddWithValue("@Username", userProfile.Username);
                    cmd.Parameters.AddWithValue("@Brithdate", userProfile.Brithdate);
                    cmd.Parameters.AddWithValue("@Height", userProfile.Height);
                    cmd.Parameters.AddWithValue("@Firstname", userProfile.Firstname);
                    cmd.Parameters.AddWithValue("@Middlename", (object)userProfile.Middlename ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Lastname", userProfile.Lastname);
                    cmd.Parameters.AddWithValue("@Aboutme", userProfile.Aboutme);
                    cmd.Parameters.AddWithValue("@Cityid", userProfile.Cityid);
                    cmd.Parameters.AddWithValue("@Genderid", userProfile.Genderid);
                    cmd.Parameters.AddWithValue("@UserId", userProfile.UserId);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
        public string GetcityName(int cityId)
        {
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd =new SqlCommand("select city from City where Cityid = @Cityid", conn))
                {
                    cmd.Parameters.AddWithValue("@Cityid", cityId);
                    return cmd.ExecuteScalar()?.ToString();
                }
            }
        }
        public string GetGenderName(int genderId)
        {
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("select gender from Gender where Genderid = @Genderid", conn))
                {
                    cmd.Parameters.AddWithValue("@Genderid", genderId);
                    return cmd.ExecuteScalar()?.ToString();
                }
            }
        }
        public bool UserHasProfile(int userId)
        {
            using(SqlConnection conn= new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("select top 1 1 from UserProfile Where UserId = @UserId",conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        return reader.Read();
                    }
                }
            }
        }
    }
}
