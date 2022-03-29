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
        // Sql connection to database named Lab3 
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnApplication_Click(object sender, EventArgs e)
        {
            
            // SQL insert string for StudentApplication table
            string insertApplicationQuery = "INSERT INTO StudentApplication (FirstName, LastName, EmailAddress, ApplicationFileAddress, ResumeFileAddress, TranscriptFileAddress) " +
                "VALUES (@firstName, @lastName, @emailAddress, @applicationFile, @resumeFile, @transcriptFile)";

            using (SqlCommand cmd = new SqlCommand(insertApplicationQuery, con))
            {
                try
                {
                    con.Open();
                    
                    // Create strings from the textbox controls to add as parameters
                    string firstName = txtFirstName.Text;
                    string lastName = txtLastName.Text;
                    string emailAddress = txtEmail.Text;

                    // Call methods to create and upload application essay, resume, and transcript if the essay is less than or equal to 500 words
                    if( WordCount(txtEssayControl.Text) <= 500 )
                    {
                        ResumeTranscriptUpload();
                        ApplicationUpload();
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Application over 500 Word maximum.";
                        return;
                    }
                    

                    // Create strings of the different file locations to add as parameters
                    string applicationFileLocation = "~/Applications/" + txtFirstName.Text + "_" + txtLastName.Text + "_application";
                    string transcriptFileLocation = "~/ApplyingTranscripts/" + txtFirstName.Text + "_" + txtLastName.Text + "_transcript";
                    string resumeFileLocation = "~/ApplyingResumes/" + txtFirstName.Text + "_" + txtLastName.Text + "_resume";


                    cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 35).Value = firstName;
                    cmd.Parameters.Add("@lastName", SqlDbType.NVarChar, 35).Value = lastName;

                    cmd.Parameters.Add("@emailAddress", SqlDbType.NVarChar, 254).Value = emailAddress;              // Need to make other email columns store this many chars

                    cmd.Parameters.Add("@applicationFile", SqlDbType.NVarChar, 254).Value = applicationFileLocation;
                    cmd.Parameters.Add("@transcriptFile", SqlDbType.NVarChar, 254).Value = transcriptFileLocation;
                    cmd.Parameters.Add("@resumeFile", SqlDbType.NVarChar, 254).Value = resumeFileLocation;

                    cmd.ExecuteNonQuery();

                    

                    con.Close();
                }
                catch (SqlException ex)
                {
                    lblMessage.Text = ex.Message;
                    
                }
                
            }

        }

        protected void ResumeTranscriptUpload()
        {
            if (fuResume.HasFile && fuTranscript.HasFile)                                           // Check there is a resume and transcript ready to be uploaded
            {
                string fileExtensionResume = Path.GetExtension(fuResume.FileName);
                string fileExtensionTranscript = Path.GetExtension(fuTranscript.FileName);

                if (fileExtensionResume.ToLower() != ".pdf" && fileExtensionTranscript.ToLower() != ".pdf")
                {
                    lblMessage.Text = "Only Resumes and Transcripts with .pdf Extension are Allowed";             // Only allow pdfs
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                else
                {
                    // Store basic attributes about the resume and transcript file such as name length and data size
                    int fileSizeResume = fuResume.PostedFile.ContentLength;
                    int fileResumeNameLength = fuResume.FileName.ToString().Length;
                    int fileSizeTranscript = fuTranscript.PostedFile.ContentLength;
                    int fileTranscriptNameLength = fuTranscript.FileName.ToString().Length;

                    // Prevent file larger than 5MB or with a name longer than 30 from being uploaded
                    if (fileSizeResume > 5242880 || fileSizeTranscript > 5242880 || fileResumeNameLength > 30 || fileTranscriptNameLength > 30)          
                    {
                        lblMessage.Text = "Maximum File Size (5MB) Exceeded OR Maximum File Name of 30 Letters Exceeded";
                        return;
                    }
                    else
                    {
                        fuResume.SaveAs(Server.MapPath("~/ApplyingResumes/" + txtFirstName.Text + "_" + txtLastName.Text + "_resume.pdf"));
                        fuTranscript.SaveAs(Server.MapPath("~/ApplyingTranscripts/" + txtFirstName.Text + "_" + txtLastName.Text + "_transcript.pdf"));                      
                        
                    }
                }
            }
        }

        protected void ApplicationUpload()
        {
            try
            {
                //Pass the filepath and filename to the StreamWriter Constructor using the students first/last name for their application
                StreamWriter sw = new StreamWriter(Server.MapPath("~/Applications/" + txtFirstName.Text + "_" + txtLastName.Text + "_application.txt"));

                // Write the  text 
                sw.WriteLine(txtEssayControl.Text);
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Application Succcessfully Submitted";

                sw.Close();

            }
            catch (Exception e)
            {
                lblMessage.Text = e.Message;
            }

        }

        int WordCount(string text)
        {
            // Use algorithm to count words instead of .Split(). Reduce garbage collector work load

            int wordCount = 0;
            int index = 0;

            // skip whitespace until first word
            while (index < text.Length && char.IsWhiteSpace(text[index]))
                index++;

            while (index < text.Length)
            {
                // check if current char is part of a word
                while (index < text.Length && !char.IsWhiteSpace(text[index]))
                    index++;

                wordCount++;

                // skip whitespace until next word
                while (index < text.Length && char.IsWhiteSpace(text[index]))
                    index++;
            }

            return wordCount;
        }
    }

}