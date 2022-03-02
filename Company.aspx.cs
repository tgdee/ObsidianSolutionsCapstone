using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Lab3
{
    public partial class Company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
            //Master Page covers the restriction of accesing pages without login
        {
            if (!Page.IsPostBack)
            {

            }
        }


        protected void btnAddRow_Click(object sender, EventArgs e)
        {

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                //creates the insert strings for the database 
                try
                {
                    string insertString = "INSERT INTO Company (MeetingTime, CompanyName, Email, FirstName, LastName) " +
                        " VALUES (@meetingTime, @companyName, @email, @firstName, @lastName)";

                    dbConnection.Open();

                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        string firstName = txtFirstName.Text;
                        string lastName = txtLastName.Text;
                        DateTime  meetingTime = DateTime.Parse(txtMeetingTime.Text);
                        string email = txtEmail.Text;
                        string companyName = txtCompanyName.Text;

                        cmd.Parameters.Add("@companyName", SqlDbType.NVarChar, 50).Value = companyName;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
                        cmd.Parameters.Add("@meetingTime", SqlDbType.DateTime).Value = meetingTime;
                        cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 50).Value = firstName;
                        cmd.Parameters.Add("lastName", SqlDbType.NVarChar, 50).Value = lastName;

                        cmd.ExecuteNonQuery();

                        Response.Redirect("~/Company.aspx");

                    }
                }
                //create the error message in case of user input mistake
                catch (SqlException ex)
                {
                    ltError.Text = ex.Message;
                }
                finally
                {
                    dbConnection.Close();
                    dbConnection.Dispose();

                }
            }

        }


    }

}
