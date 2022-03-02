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
    public partial class _Default : Page
    {



        protected void Page_Load(object sender, EventArgs e)
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

                try
                {
                    string insertString = "INSERT INTO Student (FirstName,LastName,Grade,GraduationYear,Major,PhoneNumber,Email) " +
                        " VALUES (@param1, @param2, @param3, @param4, @param5, @param6, @param7)";

                    dbConnection.Open();

                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        string firstName = txtFirstName.Text;
                        string lastName = txtLastName.Text;
                        string grade = txtGradeBox.Text;
                        int graduationYear = Int32.Parse(txtGradYear.Text);
                        string major = txtMajorBox.Text;
                        string phoneNumber = txtPNumber.Text;
                        string email = txtEmailBox.Text;


                        cmd.Parameters.Add("@param1", SqlDbType.NVarChar, 50).Value = firstName;
                        cmd.Parameters.Add("@param2", SqlDbType.NVarChar, 50).Value = lastName;
                        cmd.Parameters.Add("@param3", SqlDbType.NVarChar,50).Value = grade;
                        cmd.Parameters.Add("@param4", SqlDbType.Int).Value = graduationYear;
                        cmd.Parameters.Add("@param5", SqlDbType.NVarChar,50).Value = major;
                        cmd.Parameters.Add("@param6", SqlDbType.NVarChar, 50).Value = phoneNumber;
                        cmd.Parameters.Add("@param7", SqlDbType.NVarChar,50).Value = email;
                        



                        cmd.ExecuteNonQuery();

                        Response.Redirect("~/Student.aspx");

                    }
                }
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



        protected void gvStudent_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}