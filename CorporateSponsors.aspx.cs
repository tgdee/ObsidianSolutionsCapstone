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
    public partial class CorporateSponsors : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DisplayGvCorporateSuccess();
            }
        }
        protected void DisplayGvCorporateSuccess()
        {
            try
            {
                string searchQuery = "SELECT * FROM CorporateSuccess";

                SqlCommand cmd = new SqlCommand(searchQuery, con);

                con.Open();

                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter
                {
                    SelectCommand = cmd
                };

                DataSet ds = new DataSet();

                da.Fill(ds, "CorporateSponsor");
                da.Fill(ds, "Introductions");
                da.Fill(ds, "Applied");
                da.Fill(ds, "Interviewed");
                da.Fill(ds, "Offer");
                da.Fill(ds, "Acceptance");

                ViewState["ds"] = ds;

                gvCorporateSuccess.DataSource = ds;

                gvCorporateSuccess.DataBind();


                // Check if gridview member has rows and if it does hide the member id header and row cells and change headers

                for (int i = 0; i < gvCorporateSuccess.Rows.Count; i++)
                {
                    gvCorporateSuccess.HeaderRow.Cells[0].Text = "Corporate Sponsor";

                }

                con.Close();

            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
    }
}