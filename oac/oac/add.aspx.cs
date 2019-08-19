using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;

namespace oac
{
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("index.aspx");
            }

            lblUserName.Text = "" + Session["username"];

            string CS = ConfigurationManager.ConnectionStrings["oacConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                if (!IsPostBack)
                {
                    SqlCommand cmd = new SqlCommand("SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%City%'",
                        con);
                    con.Open();
                    City.DataSource = cmd.ExecuteReader();
                    City.DataTextField = "ItemName"; //Column name
                    City.DataValueField = "ItemName"; //column name
                    City.DataBind();
                    con.Close();
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
            con.Open();
            if (!Image.HasFile)
            {
                lblMainTitle.Text = "Upload Failed: Please upload an image";
                lblMainTitle.ForeColor = Color.DarkRed;
                lblMainTitle.Visible = true;
            }
            else
            {
                OrgIdGenerate();

                if (City.SelectedItem.Text == "Windsor")
                {
                    ImagePG.Text = "upload/windsor1.jpg";
                }
                else if (City.SelectedItem.Text == "Chatham")
                {
                    ImagePG.Text = "upload/chatham1.jpg";
                }
                else
                {
                    ImagePG.Text = "upload/leamington1.jpg";
                }

                int length = Image.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                Image.PostedFile.InputStream.Read(pic, 0, length);

                String st =
                    "INSERT INTO [Organizations] ([OrgID], [OrgName], [Address], [City], [PostalCode], [PhoneNumber], [PhoneExtension], [FaxNumber], [Website], [OrgDescription], [Image], [Latitude], [Longitude], [ImagePG]) VALUES (@OrgID, @OrgName, @Address, @City, @PostalCode, @PhoneNumber, @PhoneExtension, @FaxNumber, @Website, @OrgDescription, @Image, @Latitude, @Longitude, @ImagePG)";

                SqlCommand cmd = new SqlCommand(st, con);
                cmd.Parameters.AddWithValue("@OrgID", OrgID.Text);
                cmd.Parameters.AddWithValue("@OrgName", OrgName.Text);
                cmd.Parameters.AddWithValue("@Address", Address.Text);
                cmd.Parameters.AddWithValue("@City", City.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@PostalCode", PostalCode.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber.Text);
                cmd.Parameters.AddWithValue("@PhoneExtension", PhoneExtension.Text);
                cmd.Parameters.AddWithValue("@FaxNumber", FaxNumber.Text);
                cmd.Parameters.AddWithValue("@Website", Website.Text);
                cmd.Parameters.AddWithValue("@OrgDescription", OrgDescription.Text);
                cmd.Parameters.AddWithValue("@Latitude", Latitude.Text);
                cmd.Parameters.AddWithValue("@Longitude", Longitude.Text);
                cmd.Parameters.AddWithValue("@Image", pic);
                cmd.Parameters.AddWithValue("@ImagePG", ImagePG.Text);

                cmd.ExecuteNonQuery();

                con.Close();

                OrgID.Text = string.Empty;
                OrgName.Text = string.Empty;

                Address.Text = string.Empty;
                PostalCode.Text = string.Empty;
                PhoneNumber.Text = string.Empty;
                PhoneExtension.Text = string.Empty;
                FaxNumber.Text = string.Empty;
                Website.Text = string.Empty;
                OrgDescription.Text = string.Empty;
                Latitude.Text = string.Empty;
                Longitude.Text = string.Empty;


                lblMainTitle.Text = "Upload Successful";
                lblMainTitle.ForeColor = Color.Green;
                lblMainTitle.Visible = true;
            }
        }

        protected void OrgIdGenerate()
        {
            int a;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
            con.Open();
            string query = "Select Max(OrgID) from Organizations";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string val = dr[0].ToString();
                if (val == "")
                {
                    OrgID.Text = "1";
                }
                else
                {
                    a = Convert.ToInt32(dr[0].ToString());
                    a = a + 1;
                    OrgID.Text = a.ToString();
                }
            }

            con.Close();
        }
    }
}