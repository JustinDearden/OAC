using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oac
{
    public partial class listing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String qstring = Request.QueryString["id"];
            Label1.Text = qstring;
            PagViewUpdate();
            PagViewInsert();

            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
                con.Open();

                string query =
                    "SELECT [ActivityTitle], [Address], [City], [PostalCode], [CategoryOne], [StreamOne], [ActivityDesc], [PhoneNumber], [Website], [HostName], [TargetOne], [TargetTwo], [Date], [StartTime], [EndTime], [ImagePG], [ImageSP], [ImageSPT] FROM [Activities] WHERE AutoNumber = '" +
                    Label1.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    LabelTitle.Text = dr[0].ToString();
                    LabelAddress.Text = dr[1].ToString();
                    LabelCity.Text = dr[2].ToString();
                    LabelPostalCode.Text = dr[3].ToString();
                    LabelCategory.Text = dr[4].ToString();
                    LabelStream.Text = dr[5].ToString();
                    LabelDesc.Text = dr[6].ToString();
                    lblAddress.Text = dr[1].ToString();
                    lblCity.Text = dr[2].ToString();
                    lblPostalCode.Text = dr[3].ToString();
                    LabelPhoneNumber.Text = dr[7].ToString();
                    LabelWebsite.Text = dr[8].ToString();
                    LabelHostName.Text = dr[9].ToString();
                    LabelTagOne.Text = dr[10].ToString();
                    LabelTagTwo.Text = dr[11].ToString();
                    LabelDate.Text = Convert.ToDateTime(dr[12]).ToString("dd/MM/yyyy");
                    LabelStart.Text = dr[13].ToString();
                    LabelEnd.Text = dr[14].ToString();
                    Image2.ImageUrl = dr[15].ToString();
                    Image3.ImageUrl = dr[16].ToString();
                    Image4.ImageUrl = dr[17].ToString();
                }

                lblWebsiteAddress.Text = LabelWebsite.Text;

                con.Close();
            }
        }

        protected void PagViewUpdate()
        {
            int a;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
            con.Open();
            string query = "Select MAX(PageViews) from Activities WHERE AutoNumber = '" + Label1.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string val = dr[0].ToString();
                if (val == "")
                {
                    PageViews.Text = "1";
                }
                else
                {
                    a = Convert.ToInt32(dr[0].ToString());
                    a = a + 1;
                    PageViews.Text = a.ToString();
                }
            }

            con.Close();
        }

        protected void PagViewInsert()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
            con.Open();
            String st = "UPDATE [Activities] SET PageViews=@PageViews WHERE AutoNumber = '" + Label1.Text + "'";
            SqlCommand cmd = new SqlCommand(st, con);
            cmd.Parameters.AddWithValue("@PageViews", PageViews.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}