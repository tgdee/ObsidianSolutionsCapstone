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
    public partial class ApplicationPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            else
            {

            }
        }

        protected void BtnApplication_Click(object sender, EventArgs e)
        {
            
            
            string insertApplicationQuery = "INSERT INTO Application (FirstName, LastName, ApplicationFile, ResumeFile, TranscriptFile) VALUES (@firstName, @lastName, @applicationFile, @resumeFile, @transcriptFile)";

            using (SqlCommand cmd = new SqlCommand(insertApplicationQuery, con))
            {
                try
                {
                    con.Open();
                    string firstName = txtFirstName.Text;
                    string lastName = txtLastName.Text;

                    ResumeTranscriptUpload();
                    //ApplicationUpload();

                    string applicationFileLocation = Server.MapPath("~/Applications/" + txtLastName.Text + "application");
                    string transcriptFileLocation = Server.MapPath("~ApplyingTranscripts/" + txtLastName.Text + "transcript");
                    string resumeFileLocation = Server.MapPath("~ApplyingResumes/" + txtLastName.Text + "resume");


                    cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 30).Value = firstName;
                    cmd.Parameters.Add("@lastName", SqlDbType.NVarChar, 30).Value = lastName;
                    cmd.Parameters.Add("@applicationFile", SqlDbType.NVarChar, 40).Value = applicationFileLocation;
                    cmd.Parameters.Add("@applicationFile", SqlDbType.NVarChar, 40).Value = transcriptFileLocation;
                    cmd.Parameters.Add("@applicationFile", SqlDbType.NVarChar, 40).Value = resumeFileLocation;

                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "Succesfully Uploaded";
                }
                catch (SqlException ex)
                {
                    lblMessage.Text = ex.Message;
                    
                }
                

            }


        }

        protected void ResumeTranscriptUpload()
        {
            if (fuResume.HasFile && fuTranscript.HasFile)
            {
                string fileExtensionResume = Path.GetExtension(fuResume.FileName);
                string fileExtensionTranscript = Path.GetExtension(fuTranscript.FileName);

                if (fileExtensionResume.ToLower() != ".pdf" && fileExtensionTranscript.ToLower() != ".pdf")
                {
                    lblMessage.Text = "Only Resumes and Transcripts with .pdf Extension are Allowed";             // Only allow pdfs
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    int fileSizeResume = fuResume.PostedFile.ContentLength;
                    int fileResumeNameLength = fuResume.FileName.ToString().Length;
                    int fileSizeTranscript = fuTranscript.PostedFile.ContentLength;
                    int fileTranscriptNameLength = fuTranscript.FileName.ToString().Length;

                    if (fileSizeResume > 2097152 || fileSizeTranscript > 2097152 || fileResumeNameLength > 30 || fileTranscriptNameLength > 30)          // Prevent file larger than this many bytes or 2MB from being uploaded
                    {
                        lblMessage.Text = "Maximum File Size (2MB) Exceeded OR Maximum File Name of 30 Letters Exceeded";
                    }
                    else
                    {
                        fuResume.SaveAs(Server.MapPath("~/Resumes/" + fuResume.FileName));
                        fuTranscript.SaveAs(Server.MapPath("~/Transcripts/" + fuTranscript.FileName));
                        //ApplicationUpload();
                        lblMessage.Text = "Application Succcessfully Submitted";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                    }
                }
            }
        }

        //protected void ApplicationUpload()
        //{
        //    try
        //    {
        //        //Pass the filepath and filename to the StreamWriter Constructor 
        //        StreamWriter sw = new StreamWriter(Server.MapPath("~/Applications/" + txtLastName.Text));
        //        // Write the  text



        //        if (txtApplication.Text.Replace(" ", "").Length > 500)
        //        {
        //            lblMessage.ForeColor = Color.Red;
        //            lblMessage.Text = "Essay is over 500 characters";
        //        }
        //        else
        //        {
        //            sw.WriteLine(txtApplication.Text);
                    

        //        }

        //        sw.Close();

        //    }
        //    catch (Exception e)
        //    {
        //        lblMessage.Text = e.Message;
        //    }

        //}
    }

}