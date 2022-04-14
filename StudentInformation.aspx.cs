using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Lab3
{
    public partial class StudentInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["StudentID"] != null && Session["Username"] != null)
                {
                    //BindDataList();
                    BindName();
                    BindBioData();
                    BindInterestData();
                    BindSkillData();

                }
                else if (Session["Username"] != null)
                {
                    Response.Redirect("~/Homepage.aspx");
                }
                else
                {
                    Response.Redirect("~/LoginChoice.aspx");
                }

            }

        }
        protected void BindName()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
                try
            {
                dlName.DataSource = null;
                dlName.DataBind();
                connection.Open();
                string username = Session["Username"].ToString();
                string studentID = Session["StudentID"].ToString();
                string sqlCommandString = "SELECT FirstName,LastName, Major, Email FROM Student WHERE StudentID=@studentID";      // Command to fill the data list
                SqlCommand command = new SqlCommand(sqlCommandString, connection);
                command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                command.Parameters.Add("@studentID", SqlDbType.Int).Value = studentID;
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    dlName.DataSource = dt;
                    dlName.DataBind();
                }
            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
        }
        protected void BindBioData()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["OSAG"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    dlBio.DataSource = null;
                    dlBio.DataBind();
                    connection.Open();
                    string studUserName = Session["StudentUserName"].ToString();
                    string studentID = Session["StudentID"].ToString();
                    string sqlCommandString = "SELECT BIO from StudentProfile WHERE Username=@userName";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = studUserName;
                    command.Parameters.Add("@studentID", SqlDbType.Int).Value = studentID;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlBio.DataSource = dt;
                        dlBio.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    ltError.Text = ex.Message;
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                }

            }
        }

        protected void BindInterestData()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["OSAG"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    dlInterest.DataSource = null;
                    dlInterest.DataBind();
                    connection.Open();
                    string studUserName = Session["StudentUserName"].ToString();
                    string sqlCommandString = "SELECT Interests from StudentProfile WHERE Username=@Username";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = studUserName;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlInterest.DataSource = dt;
                        dlInterest.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    ltError.Text = ex.Message;
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                }

            }
        }

        protected void BindSkillData()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["OSAG"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    dlSkills.DataSource = null;
                    dlSkills.DataBind();
                    connection.Open();
                    string studUserName = Session["StudentUserName"].ToString();
                    string sqlCommandString = "SELECT Skills from StudentProfile WHERE Username=@Username";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = studUserName;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlSkills.DataSource = dt;
                        dlSkills.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    ltError.Text = ex.Message;
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                }

            }
        }

        //protected void btnUpdate_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

        //        dbConnection.Open();

        //        using (var sqlComm = new SqlCommand("dbo.spUpdateStudentInfo", dbConnection) { CommandType = CommandType.StoredProcedure })
        //        {
        //            int selectedStudentId = Int32.Parse(Session["StudentID"].ToString());

        //            sqlComm.Parameters.Add("@StudentID", SqlDbType.Int).Value = selectedStudentId;
        //            sqlComm.Parameters.Add("@FirstName", SqlDbType.NVarChar, 20).Value = txtFirstName.Text;
        //            sqlComm.Parameters.Add("@LastName", SqlDbType.NVarChar, 30).Value = txtLastName.Text;
        //            sqlComm.Parameters.Add("@Grade", SqlDbType.NVarChar, 20).Value = txtGrade.Text;
        //            sqlComm.Parameters.Add("@GraduationYear", SqlDbType.NVarChar, 20).Value = txtGraduationYear.Text;
        //            sqlComm.Parameters.Add("@Major", SqlDbType.NVarChar, 20).Value = txtMajor.Text;
        //            sqlComm.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar, 10).Value = txtPhoneNumber.Text;
        //            sqlComm.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = txtEmail.Text;

        //            sqlComm.ExecuteNonQuery();

        //            dbConnection.Close();

        //            BindDataList();
        //        }

        //    }
        //    catch (SqlException ex)
        //    {
        //        ltError.Text = ex.Message;
        //    }
        //}

        //protected void BindDataList()
        //{
        //    try
        //    {

        //        SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

        //        using (var sqlComm = new SqlCommand("dbo.spStudentInformation", dbConnection) { CommandType = CommandType.StoredProcedure })
        //        {

        //            string selectedStudentId = Session["StudentID"].ToString();

        //            dlStudentInfo.DataSource = null;
        //            dlStudentInfo.DataBind();
        //            dbConnection.Open();
        //            sqlComm.Parameters.Add("@StudentID", SqlDbType.Int).Value = Int32.Parse(selectedStudentId); 

        //            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlComm);
        //            DataTable dt = new DataTable();
        //            dataAdapter.Fill(dt);
        //            if (dt.Rows.Count > 0)
        //            {
        //                dlStudentInfo.DataSource = dt;
        //                dlStudentInfo.DataBind();
        //            }
        //            else
        //            {
        //                ltError.Text = "Student Information For this Student Does Not Exist. Please Create it on the Student Page";  // NEED TO CREATE THIS ON OTHER PAGES!!!
        //            }

        //            dbConnection.Close();
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        ltError.Text = ex.Message;
        //    }

        //}

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if ((string)Session["AccountType"] == "Admin")
            {
                Response.Redirect("~/AdminPages/AdminStudent.aspx");
            }
            else
            {
                Response.Redirect("~/Student.aspx");
            }
        }
    }
}