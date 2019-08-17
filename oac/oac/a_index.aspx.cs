using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oac
{
    public partial class a_index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //If the session has a Username variable then then pages can be marked with is to ensure a user is logged in to see them
            if (Session["username"] == null)
            {
                Response.Redirect("index.aspx");
            }
            else
            {
                lblUserName.Text = "" + Session["username"];
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