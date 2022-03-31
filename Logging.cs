using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace Lab3
{
    public class Logging
    {
        public static void SendEmail(string emailBody)
        {
            MailMessage mailMessage = new MailMessage("tgdee123@yahoo.com", "smccarthy1145@gmail.com")
            {
                Subject = "Test",
                Body = emailBody
            };

            SmtpClient smtpClient = new SmtpClient("smtp.mail.yahoo.com", 587)
            {
                Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "tgdee123@yahoo.com",
                    Password = "hilezapxvwzdjjcy"
                },
                EnableSsl = true
            };
            smtpClient.Send(mailMessage);
        }
    }
}