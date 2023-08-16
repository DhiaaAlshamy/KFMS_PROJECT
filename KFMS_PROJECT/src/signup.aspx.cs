using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFMS_PROJECT.src
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["KFMCConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string insertQuery = "INSERT INTO Users (Username, Password, Email, PhoneNumber,UserType) VALUES (@Username, @Password, @Email, @PhoneNumber,'employee')";

                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    connection.Open();

                    command.Parameters.AddWithValue("@Username", UsernameTextBox.Text);
                    command.Parameters.AddWithValue("@Password", PasswordTextBox.Text); 
                    command.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                    command.Parameters.AddWithValue("@PhoneNumber", PhoneNumberTextBox.Text);

                    command.ExecuteNonQuery();
                }
            }

            Response.Redirect("login.aspx"); 
        }

    }
}