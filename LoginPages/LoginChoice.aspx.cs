using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab3
{
    public partial class LoginChoice : System.Web.UI.Page
    {
         

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MustLogin"] != null)
            {
                lblUserStat.ForeColor = Color.Red;
                lblUserStat.Text = Session["MustLogin"].ToString();
            }
            else
            {
                lblUserStat.Text = "Please Continue to Login!";
            }

        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentLoginPage.aspx");
        }

        protected void btnMember_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberLoginPage.aspx");
        }

        protected void btnNewAccount_Click(object sender, EventArgs e)
        {
            // Response.Redirect("~/NewAccount.aspx");
        }
    }
}