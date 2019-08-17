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
    public partial class a_explore : System.Web.UI.Page
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
    }
}