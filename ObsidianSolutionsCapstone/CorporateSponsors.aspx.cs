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
                DisplayGvCorporateSponsor();
            }
        }
        protected void DisplayGvCorporateSponsor()
        {
            try
            {
                string searchQuery = "SELECT * FROM CorporateSponsor";

                SqlCommand cmd = new SqlCommand(searchQuery, con);

                con.Open();

                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter
                {
                    SelectCommand = cmd
                };

                DataSet ds = new DataSet();
                da.Fill(ds, "CorporateID");
                da.Fill(ds, "CorpName");
                da.Fill(ds, "Industry");
                da.Fill(ds, "JoinDate");
                da.Fill(ds, "Introductions");
                da.Fill(ds, "Applied");
                da.Fill(ds, "Interviewed");
                da.Fill(ds, "Offer");
                da.Fill(ds, "Acceptance");


                ViewState["ds"] = ds;

                gvCorporateSponsor.DataSource = ds;

                gvCorporateSponsor.DataBind();


                //Check if gridview member has rows and if it does hide the member id header and row cells and change headers

                for (int i = 0; i < gvCorporateSponsor.Rows.Count; i++)
                {
                    gvCorporateSponsor.HeaderRow.Cells[0].Visible = false;
                    gvCorporateSponsor.Rows[i].Cells[0].Visible = false;
                    gvCorporateSponsor.HeaderRow.Cells[1].Text = "Corporate Sponsor";
                    gvCorporateSponsor.HeaderRow.Cells[3].Text = "Join Date";

                }

                con.Close();

            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {

                using (SqlCommand command = new SqlCommand("dbo.spSearchCorporateSponsor", con) { CommandType = CommandType.StoredProcedure })  // Use stored procedure because it does not work in code
                {
                    command.Parameters.Add("@CorpName", SqlDbType.NVarChar, 30).Value = txtCorpNameSearch.Text;
                    command.Parameters.Add("@Industry", SqlDbType.NVarChar, 50).Value = txtIndustrySearch.Text;
                    

                    con.Open();


                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);               // Fill a data adapter with data gathered from stored procedure

                    DataTable dt = new DataTable();

                    dataAdapter.Fill(dt);                                                   // Fill a datatable

                    gvCorporateSponsor.DataSource = dt;                                              // Set the gridview's datasource to the filled datatable

                    gvCorporateSponsor.DataBind();                                                   // Bind the gridviews datasource data with the displayed gridview

                }


            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }



            for (int i = 0; i < gvCorporateSponsor.Rows.Count; i++)       // Check if gridview member has rows and if it does hide the member id header and row cells on every row
            {
                gvCorporateSponsor.HeaderRow.Cells[0].Visible = false;
                gvCorporateSponsor.Rows[i].Cells[0].Visible = false;
            }

            con.Close();

        }
    }
}