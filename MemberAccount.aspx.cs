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
    public partial class MemberAccount : System.Web.UI.Page
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
                BindBioData();
                BindSkillData();
                BindInterestData();
               
                if (Session["FileLocation"] != null)
                {
                    profilePic.ImageUrl = "~/UserImages/FileName";
                }

                else
                {
                    profilePic.ImageUrl = "~/UserImages/JMU_Campus.jpg";
                }
            }

        }

        protected void BindNameDataList()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    dlMemberName.DataSource = null;
                    dlMemberName.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "SELECT FirstName, LastName FROM UserLogin WHERE Username=@userName";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlMemberName.DataSource = dt;
                        dlMemberName.DataBind();
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
                    dlMemberEmail.DataSource = null;
                    dlMemberEmail.DataBind();
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
                        dlMemberEmail.DataSource = dt;
                        dlMemberEmail.DataBind();
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

        protected string GetMemberIDFromSql()
        {
            SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

            try
            {
                string queryString = "SELECT MemberID FROM Member WHERE Username=@userName";              // Get the Member id of the currently signed in user
                string userName = Session["Username"].ToString();
                dbConnection.Open();

                string memberId = "";

                using (SqlCommand cmd = new SqlCommand(queryString, dbConnection))
                {

                    cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = userName;
                    memberId = cmd.ExecuteScalar().ToString();
                }

                return memberId;
            }
            catch (SqlException ex)
            {
                return ex.Message;
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
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "SELECT BIO from MemberProfile WHERE Username=@Username";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
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

                    dlInterests.DataSource = null;
                    dlInterests.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "SELECT Interests from MemberProfile WHERE Username=@Username";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlInterests.DataSource = dt;
                        dlInterests.DataBind();
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
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "SELECT Skills from MemberProfile WHERE Username=@Username";      // Command to fill the data list
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
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

        protected void btnBioEdit_Click(object sender, EventArgs e)
        {
            txtBioEdit.Visible = true;
            btnBioEdit.Visible = false;
            btnBioSave.Visible = true;
            dlBio.Visible = false;
            btnBioCancel.Visible = true;

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["OSAG"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    dlBio.DataSource = null;
                    dlBio.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "Select BIO FROM MemberProfile WHERE Username=@Username";      // Command to update data
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlBio.DataSource = dt;
                        dlBio.DataBind();
                        txtBioEdit.Text = command.ExecuteScalar().ToString();
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

        protected void btnBioSave_Click(object sender, EventArgs e)
        {

            String newBio = txtBioEdit.Text.ToString();

            txtBioEdit.Visible = false;
            btnBioEdit.Visible = true;
            btnBioSave.Visible = false;

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["OSAG"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    dlBio.DataSource = null;
                    dlBio.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "UPDATE MemberProfile SET BIO = '" + newBio + "' WHERE Username=@Username";      // Command to update data
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
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
                    dlBio.Visible = true;
                    txtBioEdit.Text = null;
                    Response.Redirect("MemberAccount.aspx");
                }

            }

        }

        protected void btnBioCancel_Click(object sender, EventArgs e)
        {
            txtBioEdit.Visible = false;
            btnBioEdit.Visible = true;
            btnBioCancel.Visible = false;
            btnBioSave.Visible = false;
            dlBio.Visible = true;
            txtBioEdit.Text = null;
        }

        protected void btnInterestsEdit_Click(object sender, EventArgs e)
        {
            txtInterestsEdit.Visible = true;
            btnInterestsEdit.Visible = false;
            btnInterestsSave.Visible = true;
            dlInterests.Visible = false;
            btnInterestsCancel.Visible = true;

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["OSAG"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    dlInterests.DataSource = null;
                    dlInterests.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "Select Interests FROM MemberProfile WHERE Username=@Username";      // Command to update data
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlInterests.DataSource = dt;
                        dlInterests.DataBind();
                        txtInterestsEdit.Text = command.ExecuteScalar().ToString();
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

        protected void btnInterestsSave_Click(object sender, EventArgs e)
        {
            String newInterests = txtInterestsEdit.Text.ToString();

            txtInterestsEdit.Visible = false;
            btnInterestsEdit.Visible = true;
            btnInterestsSave.Visible = false;

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["OSAG"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    dlInterests.DataSource = null;
                    dlInterests.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "UPDATE MemberProfile SET Interests = '" + newInterests + "' WHERE Username=@Username";      // Command to update data
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlInterests.DataSource = dt;
                        dlInterests.DataBind();
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
                    dlInterests.Visible = true;
                    txtInterestsEdit.Text = null;
                    Response.Redirect("MemberAccount.aspx");
                }

            }
        }

        protected void btnInterestsCancel_Click(object sender, EventArgs e)
        {
            txtInterestsEdit.Visible = false;
            btnInterestsEdit.Visible = true;
            btnInterestsCancel.Visible = false;
            btnInterestsSave.Visible = false;
            dlInterests.Visible = true;
            txtInterestsEdit.Text = null;
        }

        protected void btnSkillsEdit_Click(object sender, EventArgs e)
        {
            txtSkillsEdit.Visible = true;
            btnSkillsEdit.Visible = false;
            btnSkillsSave.Visible = true;
            dlSkills.Visible = false;
            btnSkillsCancel.Visible = true;


            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["OSAG"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    dlSkills.DataSource = null;
                    dlSkills.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "Select Skills FROM MemberProfile WHERE Username=@Username";      // Command to update data
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlSkills.DataSource = dt;
                        dlSkills.DataBind();
                        txtSkillsEdit.Text = command.ExecuteScalar().ToString();
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

        protected void btnSkillsSave_Click(object sender, EventArgs e)
        {
            String newSkills = txtSkillsEdit.Text.ToString();

            txtSkillsEdit.Visible = false;
            btnSkillsEdit.Visible = true;
            btnSkillsSave.Visible = false;

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["OSAG"];

            using (SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    dlSkills.DataSource = null;
                    dlSkills.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "UPDATE MemberProfile SET Skills = '" + newSkills + "' WHERE Username=@Username";      // Command to update data
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
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
                    dlSkills.Visible = true;
                    txtSkillsEdit.Text = null;
                    Response.Redirect("MemberAccount.aspx");
                }

            }
        }

        protected void btnSkillsCancel_Click(object sender, EventArgs e)
        {
            txtSkillsEdit.Visible = false;
            btnSkillsEdit.Visible = true;
            btnSkillsCancel.Visible = false;
            btnSkillsSave.Visible = false;
            dlSkills.Visible = true;
            txtSkillsEdit.Text = null;

        }

        protected void btnChangePicture_Click(object sender, EventArgs e)
        {
            // PROFILE IMAGES WIP
            if (FileUpload3.PostedFile != null)
            {
                string strpath = Path.GetExtension(FileUpload3.PostedFile.FileName);
                if (strpath != ".jpg" && strpath != ".png" && strpath != ".jpeg")
                {
                    lblUploadMess.Text = "Only Image Files Allowed";
                    lblUploadMess.ForeColor = Color.Red;
                }
                else
                {
                    lblUploadMess.Text = "Profile Image Saved!";
                    lblUploadMess.ForeColor = Color.Green;

                    string fileimg = Path.GetFileName(FileUpload3.PostedFile.FileName);
                    FileUpload3.SaveAs(Server.MapPath("~/UserImages/") + fileimg);

                    SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

                    string insertString = "INSERT INTO MemberProfile (FileName, FileLocation, MemberID) VALUES (@fileName, @fileLocation, @MemberID)";
                    dbConnection.Open();

                    using (SqlCommand sqlcomm = new SqlCommand(insertString, dbConnection))
                    {
                        sqlcomm.Parameters.Add("@fileName", SqlDbType.NVarChar, 50).Value = FileUpload3.FileName.ToString();
                        sqlcomm.Parameters.Add("@fileLocation", SqlDbType.NVarChar, 50).Value = "~/UserImages/" + fileimg;
                        sqlcomm.Parameters.Add("@MemberID", SqlDbType.Int).Value = GetMemberIDFromSql();
                        sqlcomm.ExecuteNonQuery();
                    }
                    profilePic.ImageUrl = ("~/UserImages/" + fileimg);
                }
            }
            else
            {
                lblUploadMess.Text = "Error";
            }
        }
    }
}
