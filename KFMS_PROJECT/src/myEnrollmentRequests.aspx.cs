using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace KFMS_PROJECT.src
{
    public partial class myEnrollmentRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;
            string query = "";
            string UserID = Session["UserID"]?.ToString().Trim();
            query = $@"SELECT
                    er.RequestID,
                    er.Name,
                    er.IDNumber,
                    er.Gender,
                    er.MobileNumber,
                    er.ExtensionNumber,
                    u.Username,
                    u.UserType,
                    CASE
                        WHEN u.UserType = 'admin1' THEN 'تمت الموافقة من قبل المدير المباشر'
                        WHEN u.UserType = 'admin2' THEN 'تمت الموافقة من قبل مدير الإدارة'
                        WHEN u.UserType = 'admin3' THEN 'تمت الموافقة من قبل المدير التنفيذي المشارك'
                        WHEN u.userType is NULL THEN 'لم تتم الموافقة بعد'
                    END AS ApprovalStatus
                FROM EnrollmentRequests er
                LEFT OUTER JOIN Users u ON er.ApprovedBy = u.ID
                where er.UserID={UserID}; ";

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