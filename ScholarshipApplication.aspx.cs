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
            //create the restriction of access depending on user or member status
        {
            if (Session["Username"] == null)
            {
                Session["MustLogin"] = "You Must Login to Access that Page!";
                Response.Redirect("LoginPages/LoginChoice.aspx");
            }
            if ((bool)Session["isMember"])
            {
                Response.Redirect("~/Homepage.aspx");
                Session["GetOuttaHereMember"] = "You are not a student";
            }
        }

        protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    //creates the strings for textboxes and sql commands for the ddl 
                    string scholarshipAppDate = txtDate.Text.ToString();
                    string scholarshipName = ddlScholarshipName.SelectedValue;

                    string studEmail = ddlStudent.SelectedValue;



                    string getStudentIdSql = "SELECT Student.StudentID FROM Student WHERE Student.Email='" + studEmail + "'";
                    string getScholarshipIdSql = "SELECT Scholarship.ScholarshipID FROM Scholarship WHERE Scholarship.ScholarshipName='" + scholarshipName + "'"; 

                    //opnes the conenction and uploads the data depending on the user choices
                    dbConnection.Open();

                    SqlCommand sqlCommand = new SqlCommand(getStudentIdSql, dbConnection);
                    string studentId = sqlCommand.ExecuteScalar().ToString();

                    SqlCommand sqlCommand1 = new SqlCommand(getScholarshipIdSql, dbConnection);
                    string scholarshipId = sqlCommand1.ExecuteScalar().ToString();

                    string insertString = "INSERT INTO ScholarshipApplication (StudentID, Date, ScholarshipName, ScholarshipID) " +
                            " VALUES (@studentId, @date, @name, @scholarshipId)";


                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        cmd.Parameters.Add("@studentId", SqlDbType.Int).Value = studentId;
                        cmd.Parameters.Add("@date", SqlDbType.Date).Value = scholarshipAppDate;
                        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = scholarshipName;
                        cmd.Parameters.Add("@scholarshipId", SqlDbType.Int).Value = scholarshipId;
                        
                        


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