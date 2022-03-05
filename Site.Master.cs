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

                Session["MustLogin"] = "You Must Login to Access that Page!";
                Response.Redirect("LoginChoice.aspx");
            }
        }

        protected void btnFullLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginChoice.aspx");
        }

    }
}