using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace oac
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string email = ""; //Include your email address here

            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress(email);
            mail.Subject = Subject.Text;

            StringBuilder Body = new StringBuilder();
            Body.Append("Name :   " + Name.Text);
            Body.Append("Email :   " + Email.Text);
            Body.Append("Message :   " + Message.Text);

            mail.Body = Body.ToString();
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential
                ("Username", "Password"); // Enter senders User name and password for the email account
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
    }
}