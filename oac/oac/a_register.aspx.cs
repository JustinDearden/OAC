using System;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace oac
{
    public partial class a_register : System.Web.UI.Page
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
            string CS = ConfigurationManager.ConnectionStrings["oacConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                if (!IsPostBack)
                {
                    SqlCommand cmd2 = new SqlCommand("SELECT [OrgName], [OrgID] FROM [Organizations]", con);
                    con.Open();
                    OrgName.DataSource = cmd2.ExecuteReader();
                    OrgName.DataTextField = "OrgName"; //Column name
                    OrgName.DataValueField = "OrgID"; //column name
                    OrgName.DataBind();
                    con.Close();
                }
            }

            if (Session["username"] == null)
            {
                Response.Redirect("index.aspx");
            }

            lblUserName.Text = "" + Session["username"];
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Password.Text != conPassword.Text)
            {
                lblmsg.Text = "Passwords Do Not Match!";
            }
            else
            {
                //Password Encryption
                con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ConnectionString;
                con.Open();

                try
                {
                    UserIDGenerate();

                    Password.Text = Encrypt(Password.Text);

                    String st =
                        "INSERT INTO [Users] ([UserName], [Password], [Email], [FirstName], [LastName], [ID], [OrgID]) VALUES (@UserName, @Password, @Email, @FirstName, @LastName, @ID, @OrgID)";

                    SqlCommand cmd = new SqlCommand(st, con);
                    cmd.Parameters.AddWithValue("@UserName", UserName.Text);
                    cmd.Parameters.AddWithValue("@Password", Password.Text);
                    cmd.Parameters.AddWithValue("@Email", Email.Text);
                    cmd.Parameters.AddWithValue("@FirstName", FirstName.Text);
                    cmd.Parameters.AddWithValue("@LastName", LastName.Text);
                    cmd.Parameters.AddWithValue("@ID", ID.Text);
                    cmd.Parameters.AddWithValue("@OrgID", OrgName.SelectedValue);

                    cmd.ExecuteNonQuery();

                    con.Close();

                    lblmsg.Text = "Account Created Successfully";
                    FirstName.Text = string.Empty;
                    LastName.Text = string.Empty;
                    Email.Text = string.Empty;
                    Password.Text = string.Empty;
                    conPassword.Text = string.Empty;
                }
                catch (SqlException ex)
                {
                    if (ex.Number == 2627)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Username Already Exists";
                    }
                    else
                    {
                        lblmsg.Text = "An Error : " + ex.Message;
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }

        protected void UserIDGenerate()
        {
            int a;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
            con.Open();
            string query = "Select Max(ID) from Users";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string val = dr[0].ToString();
                if (val == "")
                {
                    ID.Text = "1";
                }
                else
                {
                    a = Convert.ToInt32(dr[0].ToString());
                    a = a + 1;
                    ID.Text = a.ToString();
                }
            }

            con.Close();
        }
    }
}