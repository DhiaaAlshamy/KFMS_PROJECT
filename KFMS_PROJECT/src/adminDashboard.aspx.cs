using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFMS_PROJECT.src
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int newRequestsCount = 0;
            int approvedRequestsCount = 0;

            // Fetch new requests count from the database
            string connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM EnrollmentRequests WHERE ApprovedBy is Null";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    newRequestsCount = Convert.ToInt32(command.ExecuteScalar());
                    newRequestsCountLiteral.Text = newRequestsCount.ToString();
                }
                query = "SELECT COUNT(*) FROM EnrollmentRequests WHERE ApprovedBy is Not NULL";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    approvedRequestsCount = Convert.ToInt32(command.ExecuteScalar());
                    approvedRequestsCountLiteral.Text = approvedRequestsCount.ToString();
                }
            }

        }
    }
}
