// Repository class for database operations
using DatingApp.Models;
using DatingApp.Pages;
using System.Data;
using System.Data.SqlClient;

namespace DatingApp.Repository
{
    public class UserRepository
    {
        private readonly IConfiguration _configuration;
        private readonly string _connstring;//connectionstring
        public UserRepository(IConfiguration Config) // Constructor to initialize the repository with a configuration
        {
            _configuration = Config;
            _connstring = _configuration.GetConnectionString("DefaultConnection");
        }
        // Method to add an account user to the database
        public void AddAccountUser(User user) 
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
        // Method to authenticate a user based on username and password
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
        // Method to get user information based on various parameters
        public User GetUser(int? userId, string username, string password, string email, string userrole) 
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
        // Method to get a list of cities from the database
        public List<City> GetCities()
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
        // Method to get a list of genders from the database
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
        // Method to save user profile information to the database
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
        // Method to get user profile information based on user ID
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
        // Method to update user profile information in the database
        public void UpdateUserProfile(UserProfile userProfile)
        {
            using (SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("UpdateUSerProfile", conn))
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
        // Method to get the name of a city based on city ID
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
        // Method to get the name of a gender based on gender ID
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
        // Method to check if a user has a profile in the database
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
        // metode to delete userprofile with StoredProcedure
        public void DeleteProfile(int userId)
        {
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("DeleteUserProfile", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        // methode to delete useraccount with StoredProcedure
        public void DeleteAccount(int userId)
        {
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("DeleteProfileAndAccount", conn))
                {
                    cmd.CommandType= CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        // methode to delete profile and account
        public void DeleteProfileAndAccount(int userId)
        {
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd=new SqlCommand("DeleteProfileAndAccount", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        // methode add Like
        public void AddLike(int liker,int likee, int statuss)

        {
            using (SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("AddLike", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Liker", liker);
                    cmd.Parameters.AddWithValue("@Likee", likee);
                    cmd.Parameters.AddWithValue("@Statuss", statuss);
                    cmd.ExecuteNonQuery();// conflit foreign key
                                          // The INSERT statement conflicted with the FOREIGN KEY constraint "FK__likes__Liker__70DDC3D8".
                                          // The conflict occurred in database "DatingApp", table "dbo.UserProfile", column 'Id'.
                                          // The statement has been terminated.'
                }
            }
        }
        // remove Like
        public void RemovieLike(int liker,int likee)
        {
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("RemoveLike",conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Liker", liker);
                    cmd.Parameters.AddWithValue("@Likee", likee);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        // methode is Liked
        public bool IsLiked(int liker,int likee)
        {
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("CheckLikeStatus",conn))
                {
                    cmd.CommandType= CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Liker", liker);
                    cmd.Parameters.AddWithValue("@Likee", likee);
                    SqlParameter IsLiked = new SqlParameter("@IsLiked",SqlDbType.Bit);
                    {
                        IsLiked.Direction = ParameterDirection.Output;
                    }
                    cmd.Parameters.Add(IsLiked);
                    cmd.ExecuteNonQuery();
                    return (bool)IsLiked.Value;
                }
            }
        }
        // methode to get getLikedProfile
        public List<UserProfile>GetLikedProfiles(int liker)
        {
            List<UserProfile>likedProfile = new List<UserProfile>();
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("GetLikedProfiles",conn))
                {
                    cmd.CommandType= CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Liker", liker);
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            UserProfile profile = new UserProfile();
                            {
                                profile.UserId = (int)reader["UserId"];
                            };
                            likedProfile.Add(profile);
                        }
                    }
                }
            }
            return likedProfile;
        }
        public List<UserProfile> GetAllUserProfiles()
        {
            List<UserProfile> userProfile = new List<UserProfile>();
            using(SqlConnection conn = new SqlConnection(_connstring))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("GetAllUserProfiles", conn))
                {
                    cmd.CommandType= CommandType.StoredProcedure;
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            UserProfile profile = new UserProfile();
                            {
                                profile.UserId = reader.GetInt32(reader.GetOrdinal("UserId"));
                                profile.Username = reader.GetString(reader.GetOrdinal("username"));
                                profile.Brithdate = reader.GetDateTime(reader.GetOrdinal("Brithdate"));
                                profile.Height = reader.GetString(reader.GetOrdinal("Height"));
                                profile.Firstname = reader.GetString(reader.GetOrdinal("Firstname"));
                                profile.Middlename = reader.IsDBNull(reader.GetOrdinal("Middlename")) ? null : reader.GetString(reader.GetOrdinal("Middlename"));
                                profile.Aboutme = reader.IsDBNull(reader.GetOrdinal("Aboutme")) ? null : reader.GetString(reader.GetOrdinal("Aboutme"));
                                profile.Cityid = reader.IsDBNull(reader.GetOrdinal("Cityid")) ? 0 : reader.GetInt32(reader.GetOrdinal("Cityid"));
                                profile.Genderid = reader.IsDBNull(reader.GetOrdinal("Genderid")) ? 0 : reader.GetInt32(reader.GetOrdinal("Genderid"));
                            }
                            userProfile.Add(profile);
                        }
                    }
                }
            }
            return userProfile;
        }
    }
}
