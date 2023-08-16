using System;
using System.Data.SqlClient;
using System.Configuration;

namespace KFMS_PROJECT.src
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorMessageLiteral.Visible = false; 
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string selectQuery = "SELECT ID, Username,UserType FROM Users WHERE Username = @Username AND Password = @Password";

                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@Username", UsernameTextBox.Text);
                    command.Parameters.AddWithValue("@Password", PasswordTextBox.Text); 

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read()) // Check if any row was returned
                        {
                            // Store the user ID in the session
                            int userID = reader.GetInt32(0);
                            Session["UserID"] = reader["ID"].ToString();
                            Session["UserName"] = reader["UserName"].ToString();
                            Session["UserType"] = reader["UserType"].ToString();
                            string userType = reader["UserType"].ToString();
                            // Successful login, redirect to a secure page
                            if (userType.Substring(0, 5) == "admin")
                                Response.Redirect("/src/adminDashboard.aspx");
                            else
                                Response.Redirect("/src/myEnrollmentRequests.aspx");

                        }
                        else

                        {
                            // Invalid credentials, show an error message
                            ErrorMessageLiteral.Text = "Invalid username or password.";
                            ErrorMessageLiteral.Visible = true;
                        }
                    }
                }
            }
        }

       
    }
}
