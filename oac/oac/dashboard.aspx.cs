using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oac
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSourceOrgStats.SelectCommand =
                "SELECT [OrgName], [PageViews] FROM [Organizations], [Users] WHERE [Organizations].[OrgID] = [Users].[OrgID] AND [Users].[UserName] = '" +
                Session["username"] + "'";

            SqlDataSourcePreviousActivities.SelectCommand =
                "select [Activities].[ActivityTitle], [Activities].[Address], [Activities].[City], [Activities].[PostalCode], [Activities].[Date] from Activities, Users WHERE [Activities].[OrgID] = [Users].[OrgID] AND [Users].[UserName] = '" +
                Session["username"] + "'";

            //Binds the data to the listview that will only display activties for users in a specific organization - this is based on the OrgID of the UserName
            SqlDataSourceActivity.SelectCommand =
                "select [Activities].[ActivityTitle], [Activities].[StartTime], [Activities].[EndTime], [Activities].[Date], [Activities].[ImagePG], [Activities].[AutoNumber] from Users, Activities where [Activities].[OrgID] = [Users].[OrgID] AND [Users].[UserName] = '" +
                Session["username"] + "'";

            //Set it equal to todays date in order to adjust for the week days in query
            lblStartTime.Text = System.DateTime.Now.ToString();

            //Calculate one week prior from todays date
            DateTime d = DateTime.Now;
            d = d.AddDays(-7);
            lblEndTime.Text = d.ToString();

            //Calculate all the upcoming activities for the month
            DateTime activitiesUpcoming = DateTime.Now;
            activitiesUpcoming = d.AddMonths(1);
            lblActivitiesUpcomingCalc.Text = activitiesUpcoming.ToString();

            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["oacConnectionString"].ToString();

                //Query for all of the organizations in the database
                con.Open();
                string query = "select COUNT(*) OrgName FROM Organizations";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblTotalOrgs.Text = dr[0].ToString();
                }

                con.Close();

                //Query for all of the activities in the database
                con.Open();
                string queryActivity = "select COUNT(*) ActivityTitle FROM Activities";
                SqlCommand cmdActivity = new SqlCommand(queryActivity, con);

                SqlDataReader drActivity = cmdActivity.ExecuteReader();
                if (drActivity.Read())
                {
                    lblTotalActivities.Text = drActivity[0].ToString();
                }

                con.Close();

                //Query for activities added within the last week
                con.Open();
                string queryActivityAdded =
                    "select COUNT([Activities].[ActivityTitle]) from Activities, Users WHERE Date >= '" +
                    lblStartTime.Text + "' AND Date <= '" + lblEndTime.Text +
                    "' AND [Activities].[OrgID] = [Users].[OrgID] AND [Users].[UserName] = '" + Session["username"] +
                    "'";
                SqlCommand cmdActivityAdded = new SqlCommand(queryActivityAdded, con);

                SqlDataReader drActivityAdded = cmdActivityAdded.ExecuteReader();
                if (drActivityAdded.Read())
                {
                    lblActivitiesAdded.Text = drActivityAdded[0].ToString();
                }

                con.Close();

                //Query for activities coming up in the next month
                con.Open();
                string queryActivityUpComing =
                    "select COUNT([Activities].[ActivityTitle]) from Activities, Users WHERE Date >= '" +
                    lblStartTime.Text + "' AND Date <= '" + lblActivitiesUpcomingCalc.Text +
                    "' AND [Activities].[OrgID] = [Users].[OrgID] AND [Users].[UserName] = '" + Session["username"] +
                    "'";
                SqlCommand cmdActivityUpcoming = new SqlCommand(queryActivityUpComing, con);

                SqlDataReader drActivityUpcoming = cmdActivityUpcoming.ExecuteReader();
                if (drActivityUpcoming.Read())
                {
                    lblActivitiesUpcoming.Text = drActivityUpcoming[0].ToString();
                }

                con.Close();
            }

            if (Session["username"] == null)
            {
                Response.Redirect("index.aspx");
            }

            lblUserName.Text = "" + Session["username"];
            lblUserNameDis.Text = lblUserName.Text;
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

        protected void SqlDataSourceActivity_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            SqlDataSourceActivity.SelectCommand =
                "select [Activities].[ActivityTitle], [Activities].[StartTime], [Activities].[EndTime], [Activities].[Date], [Activities].[ImagePG] from Users, Activities where [Activities].[OrgID] = [Users].[OrgID] AND [Users].[UserName] = '" +
                Session["username"] + "'";
            SqlDataSourceActivity.Select(DataSourceSelectArguments.Empty);
            SqlDataSourceActivity.DataBind();
        }
    }
}