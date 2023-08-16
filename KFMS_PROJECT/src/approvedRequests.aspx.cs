using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFMS_PROJECT.src
{
    public partial class approvedRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;
            string query = "SELECT RequestID, Name, IDNumber, Gender, MobileNumber, ExtensionNumber FROM EnrollmentRequests WHERE ApprovedBy IS NOT NULL";
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