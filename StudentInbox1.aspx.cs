using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Lab3
{
    public partial class StudentInbox1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            txtFrom.Text = "oleschoolfakeemail@gmail.com";
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage message = new MailMessage(txtFrom.Text, txtTo.Text, txtSubject.Text, txtBody.Text);
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network
                };
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "oleschoolfakeemail@gmail.com",
                    Password = "oleschool123!"
                };
                
                client.Send(message);
                lblStatus.Text = "Message Sent";
            }
            catch(Exception ex)
            {
                lblStatus.Text = "An error occurred";
            }
            
        }

        protected void ddlTo_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtTo.Text = ddlTo.SelectedValue;
        }
    }
}