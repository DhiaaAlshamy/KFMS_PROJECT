using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFMS_PROJECT.src
{

    public partial class form2 : System.Web.UI.Page
    {
        int enrollmentRequestID;
        string connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            enrollmentRequestID= Convert.ToInt32(Request.QueryString["EnrollmentRequestID"]);;
            connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;
            if (!IsPostBack)
            {
                PopulateEducationalInstitutions();
            }
        }

        private void PopulateEducationalInstitutions()
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string selectQuery = "SELECT [ID], [Institution] FROM [univ]";
                SqlCommand command = new SqlCommand(selectQuery, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    ListItem item = new ListItem(reader["Institution"].ToString(), reader["ID"].ToString());
                    EducationalInstitutionDropdown.Items.Add(item);
                }

                reader.Close();
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {

            // Get other form inputs
            int educationalInstitutionID = Convert.ToInt32(EducationalInstitutionDropdown.SelectedValue);
            string city = CityTextBox.Text;
            string expectedDegree = ExpectedDegreeTextBox.Text;
            string major = MajorTextBox.Text;
            DateTime semesterStartDate = Convert.ToDateTime(SemesterStartDateTextBox.Text);
            int totalYearsOfEducation = Convert.ToInt32(TotalYearsOfEducationTextBox.Text);
            DateTime expectedGraduationDate = Convert.ToDateTime(ExpectedGraduationDateTextBox.Text);

            // Store attachment file paths in the AffiliationInfo table
            string cvAttachmentPath = SaveAttachmentAndGetPath(CVFile);
            string nationalIDAttachmentPath = SaveAttachmentAndGetPath(NationalIDFile);
            string performanceEvaluationAttachmentPath = SaveAttachmentAndGetPath(EvaluationFile);
            string acceptanceLetterAttachmentPath = SaveAttachmentAndGetPath(AcceptanceLetterFile);
            string consentFormAttachmentPath = SaveAttachmentAndGetPath(ConsentFormFile);

            // Insert affiliation information
            string insertQuery = "INSERT INTO AffiliationInfo (EnrollmentRequestID,EducationalInstitutionID,City,ExpectedDegree,Major,SemesterStartDate,TotalYearsOfEducation,ExpectedGraduationDate,CVAttachment,NationalIDAttachment,PerformanceEvaluationAttachment,AcceptanceLetterAttachment,ConsentFormAttachment) " +
                " VALUES (@EnrollmentRequestID, @InstitutionName, @City, @ExpectedDegree, @Major, @SemesterStartDate, @TotalYears, @ExpectedGraduationDate, @CVAttachment, @NationalIDAttachment, @PerformanceEvaluationAttachment, @AcceptanceLetterAttachment, @ConsentFormAttachment)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@EnrollmentRequestID", enrollmentRequestID);
                    command.Parameters.AddWithValue("@InstitutionName", educationalInstitutionID);
                    command.Parameters.AddWithValue("@City", city);
                    command.Parameters.AddWithValue("@ExpectedDegree", expectedDegree);
                    command.Parameters.AddWithValue("@Major", major);
                    command.Parameters.AddWithValue("@SemesterStartDate", semesterStartDate);
                    command.Parameters.AddWithValue("@TotalYears", totalYearsOfEducation);
                    command.Parameters.AddWithValue("@ExpectedGraduationDate", expectedGraduationDate);
                    command.Parameters.AddWithValue("@CVAttachment", cvAttachmentPath);
                    command.Parameters.AddWithValue("@NationalIDAttachment", nationalIDAttachmentPath);
                    command.Parameters.AddWithValue("@PerformanceEvaluationAttachment", performanceEvaluationAttachmentPath);
                    command.Parameters.AddWithValue("@AcceptanceLetterAttachment", acceptanceLetterAttachmentPath);
                    command.Parameters.AddWithValue("@ConsentFormAttachment", consentFormAttachmentPath);

                    if (command.ExecuteNonQuery()>0)
                    {
                        Response.Redirect("~/src/termsApprove.aspx");
                    }


                }
            }

        }

        private string SaveAttachmentAndGetPath(FileUpload fileUpload)
        {
            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.FileName);
                string filePath = Server.MapPath("~/Attachments/") + fileName;
                fileUpload.SaveAs(filePath);
                return filePath;
            }
            return null;
        }

    }
}