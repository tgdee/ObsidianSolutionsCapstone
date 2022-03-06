using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab3
{
    public partial class StudentHomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["GetOuttaHereMember"] != null)
            {

            }
        }

        //    protected string LogInType()
        //    {
        //        if ((bool)Session["isMember"])
        //        {
        //            return "Member";
        //        }
        //        if ((bool)Session["isStudent"])
        //        {
        //            return "Student";
        //        }
        //        return "";
        //    }

        //}
    }
}