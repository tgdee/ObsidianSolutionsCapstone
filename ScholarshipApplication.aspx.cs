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
    public partial class ScholarshipApplication : System.Web.UI.Page
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

                    //creates the strings for textboxes and sql commands for the ddl 
                    string date = DateTime.Now.ToString();
                    string scholarshipName = ddlScholarshipNames.SelectedItem.Value;
                    string email = txtStudentEmail.Text;
                    int scholarshipId = ddlScholarshipNames.SelectedIndex;
                    string studentId = GetStudentIDFromSql();

                    
                    dbConnection.Open();


                    string insertString = "INSERT INTO ScholarshipApplication (StudentID, Date, ScholarshipName, ScholarshipID, Email) " +
                            " VALUES (@studentId, @date, @scholarshipName, @scholarshipId, @email)";


                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        cmd.Parameters.Add("@studentId", SqlDbType.Int).Value = studentId;
                        cmd.Parameters.Add("@date", SqlDbType.Date).Value = date;
                        cmd.Parameters.Add("@scholarshipName", SqlDbType.NVarChar, 50).Value = scholarshipName;
                        cmd.Parameters.Add("@scholarshipId", SqlDbType.Int).Value = scholarshipId;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
                        

                        cmd.ExecuteNonQuery();

                        dbConnection.Close();

                        Response.Redirect("~/ScholarshipApplication.aspx");

                    }


                }
                //display an error messge to the user 
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;

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