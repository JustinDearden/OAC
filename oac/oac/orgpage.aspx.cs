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
    public partial class orgpage : System.Web.UI.Page
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
                    "SELECT [OrgName], [Address], [City], [PostalCode], [NumServices], [OrgDescription], [PhoneNumber], [Website], [ImagePG], [ImageSP], [ImageSPT] FROM [Organizations] WHERE OrgID = '" +
                    Label1.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    LabelTitle.Text = dr[0].ToString();
                    LabelAddress.Text = dr[1].ToString();
                    LabelCity.Text = dr[2].ToString();
                    LabelPostalCode.Text = dr[3].ToString();
                    LabelNumServices.Text = dr[4].ToString();
                    LabelOrgDesc.Text = dr[5].ToString();
                    lblAddress.Text = dr[1].ToString();
                    lblCity.Text = dr[2].ToString();
                    lblPostalCode.Text = dr[3].ToString();
                    LabelPhoneNumber.Text = dr[6].ToString();
                    LabelWebsite.Text = dr[7].ToString();
                    Image1.ImageUrl = dr[8].ToString();
                    Image2.ImageUrl = dr[9].ToString();
                    Image3.ImageUrl = dr[10].ToString();
                }

                con.Close();
            }
        }

        protected void CategoryView_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
            con.Open();
            string query = "SELECT [OrgID], [ServiceName], [SeviceDesc] FROM [OrgAddServices] WHERE OrgID = '" +
                           Label1.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
            }

            con.Close();
        }

        protected void PagViewUpdate()
        {
            int a;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();
            con.Open();
            string query = "Select MAX(PageViews) from Organizations WHERE OrgID = '" + Label1.Text + "'";
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
            String st = "UPDATE [Organizations] SET PageViews=@PageViews WHERE OrgID = '" + Label1.Text + "'";
            SqlCommand cmd = new SqlCommand(st, con);
            cmd.Parameters.AddWithValue("@PageViews", PageViews.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}