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
            txtTo.Text = ddlTo.SelectedValue;
            txtFrom.Text = "eagenhayes@gmail.com";
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage message = new MailMessage(txtTo.Text, txtFrom.Text, txtSubject.Text, txtBody.Text);
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
                    UserName = "eagenhayes@gmail.com",
                    Password = "Sirfloyd99!"
                };
                
                client.Send(message);
                lblStatus.Text = "Message Sent";
            }
            catch(Exception ex)
            {
                lblStatus.Text = ex.StackTrace;
            }
            
        }
    }
}