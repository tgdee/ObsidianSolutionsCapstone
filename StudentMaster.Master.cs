﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab3
{
    public partial class StudentMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
            //Creates the restricstion on entering pages if you are a member or student
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
                Response.Redirect("LoginChoice.aspx");
            }

            if ((string)Session["AccountType"] == "Alum" || (string)Session["AccountType"] == "Admin")
            {
                Response.Redirect("~/Homepage.aspx");
                Session["GetOuttaHereMember"] = "You are not a student";
            }
        }


        protected void btnFullLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginC");

        }
    }
 }
