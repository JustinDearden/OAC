using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;

namespace oac
{
    public partial class activity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check the session the ensure user is valid
            if (Session["username"] == null)
            {
                Response.Redirect("index.aspx");
            }

            //Displays the username in the top navigation bar
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

                    SqlCommand cmd2 = new SqlCommand("SELECT [OrgName], [OrgID] FROM [Organizations]", con);
                    con.Open();
                    OrgName.DataSource = cmd2.ExecuteReader();
                    OrgName.DataTextField = "OrgName"; //Column name
                    OrgName.DataValueField = "OrgID"; //column name
                    OrgName.DataBind();
                    con.Close();

                    SqlCommand cmdStreamOne =
                        new SqlCommand("SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Stream%'", con);
                    con.Open();
                    StreamOne.DataSource = cmdStreamOne.ExecuteReader();
                    StreamOne.DataTextField = "ItemName"; //Column name
                    StreamOne.DataValueField = "ItemName"; //column name
                    StreamOne.DataBind();
                    con.Close();

                    SqlCommand cmdStreamTwo =
                        new SqlCommand("SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Stream%'", con);
                    con.Open();
                    StreamTwo.DataSource = cmdStreamTwo.ExecuteReader();
                    StreamTwo.DataTextField = "ItemName"; //Column name
                    StreamTwo.DataValueField = "ItemName"; //column name
                    StreamTwo.DataBind();
                    con.Close();

                    SqlCommand cmdCategoryOne =
                        new SqlCommand("SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Category%'", con);
                    con.Open();
                    CategoryOne.DataSource = cmdCategoryOne.ExecuteReader();
                    CategoryOne.DataTextField = "ItemName"; //Column name
                    CategoryOne.DataValueField = "ItemName"; //column name
                    CategoryOne.DataBind();
                    con.Close();

                    SqlCommand cmdCategoryTwo =
                        new SqlCommand("SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Category%'", con);
                    con.Open();
                    CategoryTwo.DataSource = cmdCategoryTwo.ExecuteReader();
                    CategoryTwo.DataTextField = "ItemName"; //Column name
                    CategoryTwo.DataValueField = "ItemName"; //column name
                    CategoryTwo.DataBind();
                    con.Close();

                    SqlCommand cmdTargetOne =
                        new SqlCommand("SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Target%'", con);
                    con.Open();
                    TargetOne.DataSource = cmdTargetOne.ExecuteReader();
                    TargetOne.DataTextField = "ItemName"; //Column name
                    TargetOne.DataValueField = "ItemName"; //column name
                    TargetOne.DataBind();
                    con.Close();

                    SqlCommand cmdTargetTwo =
                        new SqlCommand("SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Target%'", con);
                    con.Open();
                    TargetTwo.DataSource = cmdTargetTwo.ExecuteReader();
                    TargetTwo.DataTextField = "ItemName"; //Column name
                    TargetTwo.DataValueField = "ItemName"; //column name
                    TargetTwo.DataBind();
                    con.Close();
                }
            }
        }

        //Logout
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
                if (City.SelectedItem.Text == "Windsor")
                {
                    ImagePG.Text = "upload/13.jpg";
                }
                else if (City.SelectedItem.Text == "Windsor")
                {
                    ImagePG.Text = "upload/12.jpg";
                }
                else
                {
                    ImagePG.Text = "upload/11.jpg";
                }

                int length = Image.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                Image.PostedFile.InputStream.Read(pic, 0, length);

                String st =
                    "INSERT INTO [Activities] ([OrgName], [OrgID], [StreamOne], [StreamTwo], [CategoryOne], [CategoryTwo], [ActivityTitle], [Address], [City], [PostalCode], [HostName], [PhoneNumber], [PhoneExtension], [ActivityDesc], [Website], [Email], [TargetOne], [TargetTwo], [Date], [StartTime], [EndTime], [FaxNumber], [Image], [ImagePG]) VALUES (@OrgName, @OrgID, @StreamOne, @StreamTwo, @CategoryOne, @CategoryTwo, @ActivityTitle, @Address, @City, @PostalCode, @HostName, @PhoneNumber, @PhoneExtension, @ActivityDesc, @Website, @Email, @TargetOne, @TargetTwo, @Date, @StartTime, @EndTime, @FaxNumber, @Image, @ImagePG)";

                SqlCommand cmd = new SqlCommand(st, con);
                cmd.Parameters.AddWithValue("@OrgName", OrgName.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@OrgID", OrgName.SelectedValue);
                cmd.Parameters.AddWithValue("@StreamOne", StreamOne.Text);
                cmd.Parameters.AddWithValue("@StreamTwo", StreamTwo.Text);
                cmd.Parameters.AddWithValue("@CategoryOne", CategoryOne.Text);
                cmd.Parameters.AddWithValue("@CategoryTwo", CategoryTwo.Text);
                cmd.Parameters.AddWithValue("@ActivityTitle", ActivityTitle.Text);
                cmd.Parameters.AddWithValue("@Address", Address.Text);
                cmd.Parameters.AddWithValue("@City", City.Text);
                cmd.Parameters.AddWithValue("@PostalCode", PostalCode.Text);
                cmd.Parameters.AddWithValue("@HostName", HostName.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber.Text);
                cmd.Parameters.AddWithValue("@PhoneExtension", PhoneExtension.Text);
                cmd.Parameters.AddWithValue("@ActivityDesc", ActivityDesc.Text);
                cmd.Parameters.AddWithValue("@Website", Website.Text);
                cmd.Parameters.AddWithValue("@Email", Email.Text);
                cmd.Parameters.AddWithValue("@TargetOne", TargetOne.Text);
                cmd.Parameters.AddWithValue("@TargetTwo", TargetTwo.Text);
                cmd.Parameters.AddWithValue("@Date", Date.Text);
                cmd.Parameters.AddWithValue("@StartTime", StartTime.Text);
                cmd.Parameters.AddWithValue("@EndTime", EndTime.Text);
                cmd.Parameters.AddWithValue("@FaxNumber", FaxNumber.Text);
                cmd.Parameters.AddWithValue("@Image", pic);
                cmd.Parameters.AddWithValue("@ImagePG", ImagePG.Text);

                cmd.ExecuteNonQuery();

                con.Close();

                lblMainTitle.Text = "Upload Successful";
                lblMainTitle.ForeColor = Color.Green;
                lblMainTitle.Visible = true;
            }
        }
    }
}