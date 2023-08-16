using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace KFMS_PROJECT.src
{
    public partial class viewEnrollmentRequest : System.Web.UI.Page
    {
        int enrollmentRequestID;
        string connectionString;
        protected void Page_PreInit(object sender, EventArgs e)
        {

            string userType = Session["UserType"]?.ToString().Trim();
            if (userType == "employee")
                this.MasterPageFile = "~/Employee.master";
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;
            enrollmentRequestID = Convert.ToInt32(Request.QueryString["requestID"]); ;

            if (!IsPostBack)
            {
                BindEnrollmentRequest();
            }
        }

        private void BindEnrollmentRequest()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = @"SELECT
                                    er.RequestID as RequestID,
                                                er.Name AS [ApplicantName],
                                                er.IDNumber AS [IDNumber],
                                                er.Gender,
                                                er.MobileNumber,
                                                er.ExtensionNumber,
                                                er.CurrentEducationalDegree,
                                                er.Major AS [ApplicantMajor],
                                                er.Position,
                                                er.JobClassification,
                                                md.[اسم المركز/ المكان ] AS [R2HospitalMedicalCenter],
                                                er.ExecutiveAdministration,
                                                er.Department,
                                                er.HospitalIDNumber AS [HospitalIDNumber],
                                                er.EmploymentDate AS [EmploymentDateatR2],
                                                un.Institution AS [EducationalInstitutionName],
                                                ai.City,
                                                ai.ExpectedDegree,
                                                ai.Major AS [ExpectedMajor],
                                                ai.SemesterStartDate,
                                                ai.TotalYearsOfEducation,
                                                ai.ExpectedGraduationDate,
                                                ai.CVAttachment,
                                                er.ImagePath,
                                                ai.CVAttachment,
                                                ai.ConsentFormAttachment,
                                                ai.AcceptanceLetterAttachment,
                                                ai.NationalIDAttachment,
                                                ai.PerformanceEvaluationAttachment,
                                                u.Username AS [RequestedBy] 
                                                
                                            FROM EnrollmentRequests er
                                            LEFT JOIN AffiliationInfo ai ON er.RequestID = ai.EnrollmentRequestID
                                            LEFT JOIN Midd md on er.MedicalCenterID = md.ID
                                            LEFT JOIN univ un on ai.EducationalInstitutionID=un.ID
                                            LEFT JOIN Users u ON er.UserID = u.ID WHERE er.RequestID = @EnrollmentRequestID;";

                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@EnrollmentRequestID", enrollmentRequestID);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    EnrollmentFormView.DataSource = reader;
                    EnrollmentFormView.DataBind();
                }
            }
        }

        protected void ApproveButton_Click(object sender, EventArgs e)
        {
            Button approveButton = (Button)sender;
            int requestID = Convert.ToInt32((sender as Button).CommandArgument);

            string adminId = (Session["UserID"].ToString());

            bool approvalSuccess = UpdateRequestApproval(requestID, adminId);

            if (approvalSuccess)
            {
                Response.Redirect("~/src/approvalSuccess.aspx");
            }
            else
            {
            }
            BindEnrollmentRequest();
        }
        protected void DownloadAttachment(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "DownloadAttachment")
            {
                string cvAttachmentPath = e.CommandArgument.ToString();
                string fileName = System.IO.Path.GetFileName(cvAttachmentPath);
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.TransmitFile(cvAttachmentPath);
                Response.End();
            }
        }


        private bool UpdateRequestApproval(int requestID, string approvedBy)
        {
         

            string updateQuery = "UPDATE EnrollmentRequests SET ApprovedBy = @ApprovedBy WHERE RequestID = @RequestID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@ApprovedBy", approvedBy);
                    command.Parameters.AddWithValue("@RequestID", requestID);

                    int rowsAffected = command.ExecuteNonQuery();

                    return rowsAffected > 0;
                }
            }
        }
        protected string GetUserTypeButtonLabel(string userType)
        {
            switch (userType)
            {
                case "admin1":
                    return "Approve موافقة المدير المباشر";
                case "admin2":
                    return "Approve موافقة مدير الإدارة";
                case "admin3":
                    return "Approve موافقة المدير التنفيذي المشارك";
                default:
                    return "Approve";
            }
        }



    }
}
