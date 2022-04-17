using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;

namespace Lab3
{
    public partial class FilterableTable : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                con.Open();
                string cmd = "SELECT[AnnouncementID],[AnnounceTitle],[AnnounceBody],[AnnounceTimePost],[MemberUsername] FROM [Announcement]";

                SqlDataAdapter da = new SqlDataAdapter(cmd, con);

                DataSet ds = new DataSet();

                da.Fill(ds, "table");
                lvAnnouncements.DataSource = ds.Tables["table"];
                lvAnnouncements.DataBind();
                con.Close();
            }
        }
    }
}