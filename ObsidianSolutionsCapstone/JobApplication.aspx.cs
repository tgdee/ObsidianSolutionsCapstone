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
    public partial class JobApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected string GetStudentIDFromSql()
        {
            SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

            try
            {
                string queryString = "SELECT StudentID FROM Student WHERE Username=@userName";
                string userName = Session["Username"].ToString();
                dbConnection.Open();

                string studentId = "";

                using (SqlCommand cmd = new SqlCommand(queryString, dbConnection))
                {

                    cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = userName;
                    studentId = cmd.ExecuteScalar().ToString();
                }

                return studentId;
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
         

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    //create the string variables from text input
                    string companyName = ddlCompanyNames.SelectedItem.Text;
                    string date = DateTime.Now.ToString();
                    string position = ddlPosition.SelectedItem.Text;
                    string applyingStudentId = GetStudentIDFromSql();
                    string email = txtStudentEmail.Text;
                    
                    dbConnection.Open();


                    string insertString = "INSERT INTO JobApplication (CompanyName, ApplicationDate, PositionTitle, StudentID, Email) " +
                            " VALUES (@companyName, @applicationDate, @positionTitle, @studentId, @email)";

                    
                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {

                        cmd.Parameters.Add("@companyName", SqlDbType.NVarChar, 50).Value = companyName;
                        cmd.Parameters.Add("@applicationDate", SqlDbType.Date).Value = date;
                        cmd.Parameters.Add("@positionTitle", SqlDbType.NVarChar, 50).Value = position;
                        cmd.Parameters.Add("@studentId", SqlDbType.Int).Value = applyingStudentId;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;


                        cmd.ExecuteNonQuery();


                    }


                }
                
                catch (SqlException ex)                        //Catch Sql Exception
                {
                    lblError.Text = ex.Message;

                }
                finally
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                }

                                                            
                //Clear textboxes after insert
                txtStudentEmail.Text = "";
            }
        }
    }
}