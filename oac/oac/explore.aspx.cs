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
    public partial class explore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["oacConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                
            }
        }
    }
}