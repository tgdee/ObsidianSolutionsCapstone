using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.Net;

namespace Lab3
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Username"] == null)
            {
                Session["MustLogin"] = "You Must Login to Access that Page!";
                Response.Redirect("~/LoginChoice.aspx");
            }


            if (!IsPostBack)
            {
                BindNameDataList();
                BindEmailDataList();
                BindInfoDataList();


            }


        }

        protected void BindNameDataList()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];

            using(SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    dlStudentName.DataSource = null;
                    dlStudentName.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "SELECT FirstName, LastName FROM UserLogin WHERE Username=@userName";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if(dt.Rows.Count > 0)
                    {
                        dlStudentName.DataSource = dt;
                        dlStudentName.DataBind();
                    }
                }
                catch (SqlException e)
                {
                    ltError.Text = e.Message;
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                }

            }
        }

        protected void BindEmailDataList()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    dlStudentEmail.DataSource = null;
                    dlStudentEmail.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "SELECT Email FROM UserLogin WHERE Username=@userName";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlStudentEmail.DataSource = dt;
                        dlStudentEmail.DataBind();
                    }
                }
                catch (SqlException e)
                {
                    ltError.Text = e.Message;
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                }

            }
        }

        protected void BindInfoDataList()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    dlStudentInfo.DataSource = null;
                    dlStudentInfo.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "SELECT Major, Grade, GraduationYear FROM Student WHERE Username=@userName";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlStudentInfo.DataSource = dt;
                        dlStudentInfo.DataBind();
                    }
                }
                catch (SqlException e)
                {
                    ltError.Text = e.Message;
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                }

            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];            // Connect to AUTH from configuration

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))        // Create SQL Connection from Lab3
            {
                try
                {
                    ltError.Text = "";                                      // Clear errors in case there is old error 
                    dbConnection.Open();
                    string username = Session["Username"].ToString();       // Get the username of whomever is signed in from the Session variable
                    string firstName = txtFirstName.Text;
                    string lastName = txtLastName.Text;
                    string email = txtEmail.Text;
                    string oldPassword = txtPassword.Text;
                    string newPassword = txtNewPassword.Text;


                    string updateAccountSql = "UPDATE UserLogin SET FirstName=@firstName, LastName=@lastName, Email=@email WHERE Username=@userName";
                    SqlCommand cmd = new SqlCommand(updateAccountSql, dbConnection);
                    cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 20).Value = firstName;
                    cmd.Parameters.Add("@lastName", SqlDbType.NVarChar, 30).Value = lastName;       // Prepare sql command to update userlogin table
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
                    cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = username;

                    string updatePassSql = "UPDATE Pass SET PasswordHash=@passwordHash";
                    SqlCommand cmd1 = new SqlCommand(updatePassSql, dbConnection);                  // Prepare sql command to update Pass table
                    cmd1.Parameters.Add("@passwordHash", SqlDbType.NVarChar, 256).Value = PasswordHash.HashPassword(newPassword);

                    string queryCurrentPassword = "SELECT PasswordHash FROM Pass WHERE Username=@userName";
                    SqlCommand cmd2 = new SqlCommand(queryCurrentPassword, dbConnection);                   // Get the current password to check with the old 
                    cmd2.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = username;
                    string currentPassword = cmd2.ExecuteScalar().ToString();

                    if (PasswordHash.ValidatePassword(oldPassword, currentPassword))                // Check the old password and only update if it matches
                    {
                        cmd.ExecuteNonQuery();
                        cmd1.ExecuteNonQuery();
                        BindNameDataList();
                        BindEmailDataList();
                        BindInfoDataList();
                    }
                    else
                    {
                        ltError.Text = "Incorrect Old Password Update Failed";
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
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPassword.Text = "";
            txtNewPassword.Text = "";

        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            try
            {
                string updateResume = "DELETE FROM Resume WHERE StudentID=@studentId";                  // Use student id to determine which resume to delete

                connection.Open();

                using (SqlCommand cmd = new SqlCommand(updateResume, connection))
                {
                    cmd.Parameters.Add("StudentID", SqlDbType.NVarChar, 20).Value = GetStudentIDFromSql();

                    cmd.ExecuteNonQuery();

                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }


        }

        protected void btnViewResume_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            try
            {
                string queryResume = "SELECT FileLocation FROM Resume WHERE StudentID=@studentId";              // Use student id to determine which resume to open

                connection.Open();

                string fileLocation = "";

                using (SqlCommand cmd = new SqlCommand(queryResume, connection))
                {
                    cmd.Parameters.Add("StudentID", SqlDbType.Int).Value = Int32.Parse(GetStudentIDFromSql());

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            fileLocation = reader["FileLocation"].ToString();
                            string filePath = Server.MapPath(fileLocation);

                            WebClient user = new WebClient();

                            Byte[] fileBuffer = user.DownloadData(filePath);

                            if (fileBuffer != null)
                            {
                                Response.ContentType = "application/pdf";
                                Response.AddHeader("Content-Disposition", "inline; filename=" + filePath);          // Use WebClient to send HTTP commands to web browser
                                Response.AddHeader("content-length", fileBuffer.Length.ToString());
                                Response.BinaryWrite(fileBuffer);

                            }
                            else
                            {
                                lblMessage.ForeColor = Color.Red;
                                lblMessage.Text = "No Resume Available";
                            }
                        }

                    }
                    else
                    {
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "No Resume Available";
                    }

                    reader.Close();
                    connection.Close();

                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }

        }

        protected string GetStudentIDFromSql()
        {
            SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

            try
            {
                string queryString = "SELECT StudentID FROM Student WHERE Username=@userName";              // Get the student id of the currently signed in user
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension = Path.GetExtension(FileUpload1.FileName);

                if (fileExtension.ToLower() != ".pdf")
                {
                    lblMessage.Text = "Only Files with .pdf Extension are Allowed";             // Only allow pdfs
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    int fileSize = FileUpload1.PostedFile.ContentLength;
                    int fileNameLength = FileUpload1.FileName.ToString().Length;

                    if (fileSize > 2097152 || fileNameLength > 30)          // Prevent file larger than this many bytes or 2MB from being uploaded
                    {
                        lblMessage.Text = "Maximum File Size (2MB) Exceeded OR Maximum File Name of 30 Letters Exceeded";
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Resumes/" + FileUpload1.FileName));
                        lblMessage.Text = "Resume Uploaded";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

                        try
                        {
                            if (FirstUpload())          // Only let a student upload a new resume if they do not already have one
                            {
                                string insertString = "INSERT INTO Resume (FileName, FileLocation, StudentID) VALUES (@fileName, @fileLocation, @StudentID)";
                                dbConnection.Open();

                                using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                                {
                                    cmd.Parameters.Add("@fileName", SqlDbType.NVarChar, 50).Value = FileUpload1.FileName.ToString();
                                    cmd.Parameters.Add("@fileLocation", SqlDbType.NVarChar, 50).Value = "~/Resumes/" + FileUpload1.FileName;
                                    cmd.Parameters.Add("@StudentID", SqlDbType.Int).Value = GetStudentIDFromSql();
                                    cmd.ExecuteNonQuery();
                                }

                            }
                            else
                            {
                                lblMessage.ForeColor = Color.Red;
                                lblMessage.Text = "Maximum of 1 Resume Uploaded Please Delete then ReUpload!!!";        // Only allow one resume at a time to simplify data storage

                            }
                            
                        }
                        catch (SqlException ex)
                        {
                            lblMessage.Text = ex.Message;
                        }
                        finally
                        {
                            dbConnection.Close();
                            dbConnection.Dispose();
                        }

                    }
                }
            }
            else
            {
                lblMessage.Text = "Please Select a File to Upload";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected Boolean FirstUpload()
        {
            SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

            try
            {
                string queryResume = "SELECT Count(1) FROM Resume WHERE StudentID=@studentId";              // Check if a student has a submitted resume

                dbConnection.Open();

                SqlCommand command = new SqlCommand(queryResume, dbConnection);

                

                command.Parameters.Add("@studentId", SqlDbType.Int).Value = Int32.Parse(GetStudentIDFromSql());



                string check = command.ExecuteScalar().ToString();

                int intCheck = Convert.ToInt32(check);

                if(intCheck == 0)
                {
                    dbConnection.Close();
                    return true;
                }
                else
                {
                    dbConnection.Close();
                    return false;
                }

                
            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
                return false;
            }
        }

        protected void btnBio_Click(object sender, EventArgs e)
        {

        }
    }
}