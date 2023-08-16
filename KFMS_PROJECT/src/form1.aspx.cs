using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFMS_PROJECT.src
{
    public partial class form1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (MedicalCenterDropdown.Items.Count == 0)
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;
                    string query = "SELECT ID, [اسم المركز/ المكان ] as  MedicalCenterName FROM Midd";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();

                            MedicalCenterDropdown.DataSource = reader;
                            MedicalCenterDropdown.DataTextField = "MedicalCenterName";
                            MedicalCenterDropdown.DataValueField = "ID";
                            MedicalCenterDropdown.DataBind();

                            reader.Close();
                        }
                    }

                    MedicalCenterDropdown.Items.Insert(0, new ListItem("", ""));
                    var userID = Session["UserID"];
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string insertQuery = @"
            INSERT INTO [EnrollmentRequests] (
                [UserID], [Name], [IDNumber], [Gender], [MobileNumber], [ExtensionNumber], 
                [CurrentEducationalDegree], [Major], [Position], [JobClassification], [MedicalCenterID], 
                [ExecutiveAdministration], [Department], [HospitalIDNumber], [EmploymentDate],[ImagePath]
            )
            VALUES (
                @UserID, @Name, @IDNumber, @Gender, @MobileNumber, @ExtensionNumber, 
                @CurrentEducationalDegree, @Major, @Position, @JobClassification, @MedicalCenterID, 
                @ExecutiveAdministration, @Department, @HospitalIDNumber, @EmploymentDate,@ImagePath
            ) SELECT SCOPE_IDENTITY()";

                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));
                    command.Parameters.AddWithValue("@Name", NameTextBox.Text);
                    command.Parameters.AddWithValue("@IDNumber", IDNumTextBox.Text);
                    command.Parameters.AddWithValue("@Gender", MaleRadioButton.Checked ? "Male" : "Female");
                    command.Parameters.AddWithValue("@MobileNumber", MobileNumTextBox.Text);
                    command.Parameters.AddWithValue("@ExtensionNumber", ExtensionNumTextBox.Text);
                    command.Parameters.AddWithValue("@CurrentEducationalDegree", CurrentEduDegreeTextBox.Text);
                    command.Parameters.AddWithValue("@Major", MajorTextBox.Text);
                    command.Parameters.AddWithValue("@Position", PositionTextBox.Text);
                    command.Parameters.AddWithValue("@JobClassification", JobClassificationTextBox.Text);
                    command.Parameters.AddWithValue("@MedicalCenterID", Convert.ToInt32(MedicalCenterDropdown.SelectedValue));
                    command.Parameters.AddWithValue("@ExecutiveAdministration", ExecAdministraionTextBox.Text);
                    command.Parameters.AddWithValue("@Department", DepartmentTextBox.Text);
                    command.Parameters.AddWithValue("@HospitalIDNumber", HospitalIDNumTextBox.Text);

                    command.Parameters.AddWithValue("@EmploymentDate", Convert.ToDateTime(EmploymentDateTextBox.Text));

                    // Handle image upload
                    if (ImageUpload.HasFile)
                    {
                        string imageName = Path.GetFileName(ImageUpload.FileName);
                        string imagePath = Path.Combine(Server.MapPath("~/Images/"), imageName);
                        ImageUpload.SaveAs(imagePath);
                        command.Parameters.AddWithValue("@ImagePath", "~/Images/" + imageName);
                    }
                    else
                    {
                        command.Parameters.AddWithValue("@ImagePath", DBNull.Value);
                    }
                    connection.Open();
                    int generatedID = Convert.ToInt32(command.ExecuteScalar());
                    if(generatedID!=0)
                    Response.Redirect("form2.aspx?EnrollmentRequestID=" + generatedID);

                }
            }
        }
    }
}