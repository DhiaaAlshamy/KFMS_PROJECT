using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFMS_PROJECT.src
{
    public partial class showRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;
            string query="";
            string userType = Session["UserType"]?.ToString().Trim();
            if (userType == "admin1")
                 query = "SELECT RequestID, Name, IDNumber, Gender, MobileNumber, ExtensionNumber FROM EnrollmentRequests WHERE ApprovedBy IS NULL";
            else if (userType == "admin2")
                 query = $"SELECT RequestID, Name, IDNumber, Gender, MobileNumber, ExtensionNumber FROM EnrollmentRequests WHERE ApprovedBy in (select ID from Users where UserType = 'admin1')";
            else if (userType == "admin3")
                query = $"SELECT RequestID, Name, IDNumber, Gender, MobileNumber, ExtensionNumber FROM EnrollmentRequests WHERE ApprovedBy in (select ID from Users where UserType = 'admin2')";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridViewRequests.DataSource = dataTable;
                GridViewRequests.DataBind();
            }
        }
        protected void GridViewRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Show")
            {
                int requestID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("viewEnrollmetRequest.aspx?requestID=" + requestID);


            }
        }
    }
}

