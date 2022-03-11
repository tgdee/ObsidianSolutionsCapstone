using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Lab3
{
    public partial class ResumeUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("~/LoginChoice.aspx");
            }
            if ((string)Session["AccountType"] == "Member" || (string)Session["AccountType"] == "Alum") //Restrictions on the Alum Account and Alum viewing Student pages
            {
                Session["CannotDo"] = "You are not a Student";
                Response.Redirect("~/Homepage.aspx");
            }
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension = Path.GetExtension(FileUpload1.FileName);

                if(fileExtension.ToLower() != ".pdf")
                {
                    lblMessage.Text = "Only Files with .pdf Extension are Allowed";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    int fileSize = FileUpload1.PostedFile.ContentLength;
                    int fileNameLength = FileUpload1.FileName.ToString().Length;

                    if(fileSize > 2097152 || fileNameLength > 20)          // Prevent file larger than this many bytes or 2MB from being uploaded
                    {
                        lblMessage.Text = "Maximum File Size (2MB) Exceeded OR Maximum File Name of 20 Letters Exceeded";
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Resumes/" + FileUpload1.FileName));
                        lblMessage.Text = "Resume Uploaded";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

                        try
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


    }
}