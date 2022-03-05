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
            //Creates the restriction of accesing the pages depending on if the user is a member or a student
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

        protected void btnApply_Click(object sender, EventArgs e)
        {
         

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    //create the string variables from text input
                    string CompanyName = txtCompany.Text;
                    string Date = txtDate.Text;
                    string Position = txtPosition.Text;



                    string StudEmail = ddlStudent.SelectedValue;
                    

                    string getStudentIdSql = "SELECT Student.StudentID FROM Student WHERE Student.Email='" + StudEmail + "'";
                    //opens the dataase conenction and places information inside
                    dbConnection.Open();

                    SqlCommand sqlCommand = new SqlCommand(getStudentIdSql, dbConnection);
                    string studentId = sqlCommand.ExecuteScalar().ToString();

                    string insertString = "INSERT INTO JobApplication (CompanyName, ApplicationDate, PositionTitle, StudentID) " +
                            " VALUES (@param1, @param2, @param3, @param4)";

                    
                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {

                        cmd.Parameters.Add("@param1", SqlDbType.NVarChar, 50).Value = CompanyName;
                        cmd.Parameters.Add("@param2", SqlDbType.Date).Value = Date;
                        cmd.Parameters.Add("@param3", SqlDbType.NVarChar, 50).Value = Position;
                        cmd.Parameters.Add("@param4", SqlDbType.Int).Value = studentId;


                        cmd.ExecuteNonQuery();

                        dbConnection.Close();


                    }


                }
                //Catch any error on the user input and display message
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;

                }
                finally
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                }

                //After executing the text boxes will clear
                txtCompany.Text = "";
                txtDate.Text = "";
                txtPosition.Text = "";


            }
        }
    }
}