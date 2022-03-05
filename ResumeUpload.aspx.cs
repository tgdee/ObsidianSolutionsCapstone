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

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension = Path.GetExtension(FileUpload1.FileName);

                if(fileExtension.ToLower() != ".pdf" && fileExtension.ToLower() != ".docx")
                {
                    lblMessage.Text = "Only Files with .pdf or .docx Extension are Allowed";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    int fileSize = FileUpload1.PostedFile.ContentLength;

                    if(fileSize > 2097152)
                    {
                        lblMessage.Text = "Maximum File Size (2MB) Exceeded";
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Resumes/" + FileUpload1.FileName));
                        lblMessage.Text = "Resume Uploaded";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

                        SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString);

                        try
                        {
                            string insertString = "INSERT INTO Resume (FileName, FileLocation) VALUES (@fileName, @fileLocation)";
                            dbConnection.Open();

                            using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                            {
                                cmd.Parameters.Add("@fileName", SqlDbType.NVarChar, 50).Value = FileUpload1.FileName.ToString();
                                cmd.Parameters.Add("@fileLocation", SqlDbType.NVarChar, 50).Value = "~/Resumes/" + FileUpload1.FileName;
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