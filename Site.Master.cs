using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab3
{
    public partial class SiteMaster : MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lblUserStat.Text = Session["Username"] + " is logged in!";
                lblUserStat.ForeColor = Color.Green;
            }
            else
            {

                lblUserStat.Text = "You Must Login to Access That Page";    
                lblUserStat.ForeColor = Color.Red;
                Response.Redirect("~/LoginChoice.aspx");
            }

            if ((string)Session["AccountType"] == "Member") //Restrictions on the Alum Account and Member viewing Student pages
            {
                Session["CannotDo"] = "You are not a Student";
                Response.Redirect("~/LoginChoice.aspx");

            }
            //else if ((string)Session["AccountType"] == "Admin") // Restrictions on the Admin account viewing student pages
            //{
            //    Session["CannotDo"] = "You are not a Member";
            //    Response.Redirect("~/AdminPages/AdminHomepage.aspx");

            //}
            else
            {
                lblNope.Text = "";
            }

            lblNope.ForeColor = Color.Red;
            lblNope.Text = Session["CannotDo"].ToString();
        }

        protected void btnFullLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginChoice.aspx");
        }

    }
}