using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab3
{
    public partial class AdminMaster : System.Web.UI.MasterPage
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

            if ((string)Session["AccountType"] == "Student") //Restrictions on the Alum Account viewing Student pages
            {
                Session["CannotDo"] = "You are not an Admin";
                Response.Redirect("~/StudentHomepage.aspx");

            }
            else if ((string)Session["AccountType"] == "Alum") // Restrictions on the Admin account viewing student pages
            {
                Session["CannotDo"] = "You are not an Admin";
                Response.Redirect("~/Homepage.aspx");

            }
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
            Response.Redirect("~/LoginChoice.aspx");
        }
    }
}