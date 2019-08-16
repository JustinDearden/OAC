using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;
using System.Data.SqlClient;


namespace oac
{
    public partial class login : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();

        static string Encrypt(string value)
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(value));
                return Convert.ToBase64String(data);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoginDate.Text = System.DateTime.Now.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string PassEncrypt = Encrypt(Password.Text);
            string CS = ConfigurationManager.ConnectionStrings["oacConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                string query = "SELECT COUNT(1) FROM Users WHERE username=@username AND password=@password";
                SqlCommand sqlCmd = new SqlCommand(query, con);
                sqlCmd.Parameters.AddWithValue("@username", UserName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@password", PassEncrypt);
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1)
                {
                    //Selects the OrgName for the user on their signin
                    SqlConnection conOrgID = new SqlConnection();
                    conOrgID.ConnectionString =
                        ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
                    conOrgID.Open();
                    String stOrgID =
                        "select [Organizations].[OrgID] from Organizations, Users where [Users].[OrgID] = [Organizations].[OrgID] AND [Users].[UserName] = '" +
                        UserName.Text + "'";

                    SqlCommand comOrgID = new SqlCommand(stOrgID, conOrgID);
                    SqlDataReader dr = comOrgID.ExecuteReader();
                    if (dr.Read())
                    {
                        OrgID.Text = dr[0].ToString();
                    }

                    conOrgID.Close();

                    //Uploads the values to the table
                    SqlConnection conLogin = new SqlConnection();
                    conLogin.ConnectionString =
                        ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
                    conLogin.Open();
                    String st =
                        "INSERT INTO [LoginHistory] ([UserName], [LoginDate], [OrgID]) VALUES (@UserName, @LoginDate, @OrgID)";

                    SqlCommand com = new SqlCommand(st, con);
                    com.Parameters.AddWithValue("@UserName", UserName.Text);
                    com.Parameters.AddWithValue("@LoginDate", LoginDate.Text);
                    com.Parameters.AddWithValue("@OrgID", OrgID.Text);

                    com.ExecuteNonQuery();

                    conLogin.Close();

                    Session["username"] = UserName.Text.Trim();
                    Response.Redirect("a_index.aspx");
                }
                else
                {
                    lblErrorMessage.Visible = true;
                }
            }
        }
    }
}