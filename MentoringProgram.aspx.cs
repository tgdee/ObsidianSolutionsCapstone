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
    public partial class MentoringProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)        //Check if login has occurred and boot out if it hasnt
            {
                Session["MustLogin"] = "You Must Login to Access that Page!";   
                Response.Redirect("LoginChoice.aspx");
            }
            if ((string)Session["AccountType"] =="Student")      // Check if user is a member and boot out if they are not
            {
                Response.Redirect("~/Homepage.aspx");
                Session["GetOuttaHereMember"] = "You are not a student";
            }

        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    string StudEmail = ddlStudent.SelectedValue;
                    string MemEmail = ddlMember.SelectedValue;


                    string getStudentIdSql = "SELECT Student.StudentID FROM Student WHERE Student.Email='" + StudEmail + "'";   //Create query to get student id from email
                    string getMemIdSql = "SELECT Member.MemberID FROM Member WHERE Member.Email='" + MemEmail + "'";              //Create query to get member id from email

                    dbConnection.Open();

                    SqlCommand sqlCommandStudent = new SqlCommand(getStudentIdSql, dbConnection);
                    string studentId = sqlCommandStudent.ExecuteScalar().ToString();                    // Execute query and store student id

                    SqlCommand sqlCommandMember = new SqlCommand(getMemIdSql, dbConnection);
                    string memberID = sqlCommandMember.ExecuteScalar().ToString();

                    string insertString = "INSERT INTO Mentorship (MemberID, StudentID) " +
                            " VALUES (@memId, @studId)";


                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {

                        cmd.Parameters.Add("@memId", SqlDbType.Int).Value = memberID;           //Add parameters from student id and member id variables
                        cmd.Parameters.Add("@studId", SqlDbType.Int).Value = studentId;


                        cmd.ExecuteNonQuery();

                        dbConnection.Close();

                        Response.Redirect("~/MentoringProgram.aspx");       //Refresh page to update the drop down lists
                    }


                }
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

        protected void btnViewActiveMentors_Click(object sender, EventArgs e)
        {

        }

        protected void gvActiveMentors_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

    }

}

