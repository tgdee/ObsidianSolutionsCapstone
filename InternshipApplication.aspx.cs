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
    public partial class InternshipApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    string CompanyName = HttpUtility.HtmlEncode(txtCompany.Text);
                    string Date = HttpUtility.HtmlEncode(txtDate.Text);
                    string Position = HttpUtility.HtmlEncode(txtPosition.Text);



                    string StudEmail = ddlStudent.SelectedValue;

                    // Needs to be paramertized
                    string getStudentIdSql = "SELECT Student.StudentID FROM Student WHERE Student.Email='" + StudEmail + "'";

                    dbConnection.Open();

                    SqlCommand sqlCommand = new SqlCommand(getStudentIdSql, dbConnection);
                    string studentId = sqlCommand.ExecuteScalar().ToString();

                    string insertString = "INSERT INTO InternshipApplication (CompanyName, InternshipDate, PositionTitle, StudentID) " +
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
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;

                }
                finally
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                }

                txtCompany.Text = "";
                txtDate.Text = "";
                txtPosition.Text = "";


            }
        }
    
    }
}