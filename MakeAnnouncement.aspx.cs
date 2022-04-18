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

namespace Lab3
{
    public partial class MakeAnnouncement : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            String messageQuery = "INSERT INTO Announcement (AnnounceTitle, AnnounceBody, AnnounceTimePost, MemberUsername) VALUES (@Title, @Body, @Time, @Username)";
            
            using (SqlCommand command = new SqlCommand(messageQuery, con))
            {
                try
                {
                    con.Open();
                    String subject = txtSubject.Text;
                    String message = txtMessage.Text;
                    String username = Session["Username"].ToString();
                    String time = DateTime.Now.ToString();

                    command.Parameters.Add("@Title", SqlDbType.NVarChar, 50).Value = subject;
                    command.Parameters.Add("@Body", SqlDbType.NVarChar, 2000).Value = message;
                    command.Parameters.Add("@Time", SqlDbType.DateTime).Value = time;
                    command.Parameters.Add("@Username", SqlDbType.NVarChar, 20).Value = username;

                    command.ExecuteNonQuery();

                    con.Close();
                    lblSent.Text = "Announcement Posted!";
                }
                catch (SqlException ex)
                {
                    lblMessage.Text = ex.Message;
                }
            }
        }
    }
}