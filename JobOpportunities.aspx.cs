using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Lab3
{
    public partial class JobOpportunities : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //DisplayGvOpportunity();
            // Upon first page load add all the data from the Opportunity table into the ListView
            if (!Page.IsPostBack)
            {
                con.Open();
                //string cmd = "SELECT [Title], [Type], [City], [State], [Deadline], [Link], [Industry], [CorpName] FROM [Opportunity] ORDER BY [OpportunityID]";
                string cmd = "SELECT OpportunityID, Title, Type+', '+City+', '+State+', '+Industry+', '+Link+', '+CorpName AS Info FROM Opportunity";
                SqlDataAdapter da = new SqlDataAdapter(cmd, con);

                DataSet ds = new DataSet();

                da.Fill(ds, "table");
                lvStudentOpportunities.DataSource = ds.Tables["table"];
                lvStudentOpportunities.DataBind();

                con.Close();

                con.Open();
                string sqlcmd = "SELECT[AnnouncementID],[AnnounceTitle],[AnnounceBody],[AnnounceTimePost],[MemberUsername] FROM [Announcement]";
                SqlDataAdapter daa = new SqlDataAdapter(sqlcmd, con);

                DataSet dataset = new DataSet();

                daa.Fill(dataset, "table");
                lvAnnouncements.DataSource = dataset.Tables["table"];
                lvAnnouncements.DataBind();
                con.Close();

            }
        }


        //protected void DisplayGvOpportunity()
        //{

        //    try
        //    {
        //        string searchQuery = "SELECT OpportunityID, Title, Type+', '+City+', '+State+', '+Industry+', '+Link+', '+CorpName AS Info FROM Opportunity";

        //        SqlCommand cmd = new SqlCommand(searchQuery, con);

        //        con.Open();

        //        cmd.ExecuteNonQuery();

        //        SqlDataAdapter da = new SqlDataAdapter
        //        {
        //            SelectCommand = cmd
        //        };

        //        DataSet ds = new DataSet();
        //        da.Fill(ds, "OpportunityID");
        //        da.Fill(ds, "Title");
        //        da.Fill(ds, "Info");
        //        //da.Fill(ds, "Type");
        //        //da.Fill(ds, "City");
        //        //da.Fill(ds, "State");
        //        //da.Fill(ds, "Industry");
        //        //da.Fill(ds, "Deadline");
        //        //da.Fill(ds, "Link");
        //        //da.Fill(ds, "CorpName");


        //        ViewState["ds"] = ds;

        //        gvOpportunity.DataSource = ds;

        //        gvOpportunity.DataBind();


        //        //Check if gridview member has rows and if it does hide the member id header and row cells and change headers

        //        for (int i = 0; i < gvOpportunity.Rows.Count; i++)
        //        {
        //            gvOpportunity.HeaderRow.Cells[1].Visible = false;
        //            gvOpportunity.Rows[i].Cells[1].Visible = false;
        //            //gvOpportunity.HeaderRow.Cells[8].Text = "Company";
        //        }

        //        con.Close();

        //    }
        //    catch (SqlException ex)
        //    {
        //        lblMessage.Text = ex.Message;
        //    }
        //}

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    try
        //    {

        //        using (SqlCommand command = new SqlCommand("dbo.spSearchOpportunity", con) { CommandType = CommandType.StoredProcedure })  // Use stored procedure because it does not work in code
        //        {
        //            command.Parameters.Add("@Title", SqlDbType.NVarChar, 50).Value = txtTitleSearch.Text;
        //            command.Parameters.Add("@Type", SqlDbType.NVarChar, 30).Value = txtTypeSearch.Text;
        //            command.Parameters.Add("@City", SqlDbType.NVarChar, 20).Value = txtCitySearch.Text;
        //            command.Parameters.Add("@State", SqlDbType.NVarChar, 2).Value = txtStateSearch.Text;
        //            command.Parameters.Add("@Industry", SqlDbType.NVarChar, 30).Value = txtIndustrySearch.Text;
        //            command.Parameters.Add("@CorpName", SqlDbType.NVarChar, 30).Value = txtCorpNameSearch.Text;



        //            con.Open();


        //            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);               // Fill a data adapter with data gathered from stored procedure

        //            DataTable dt = new DataTable();

        //            dataAdapter.Fill(dt);                                                   // Fill a datatable

        //            gvOpportunity.DataSource = dt;                                              // Set the gridview's datasource to the filled datatable

        //            gvOpportunity.DataBind();                                                   // Bind the gridviews datasource data with the displayed gridview

        //        }


        //    }
        //    catch (SqlException ex)
        //    {
        //        lblMessage.Text = ex.Message;
        //    }



        //    for (int i = 0; i < gvOpportunity.Rows.Count; i++)       // Check if gridview member has rows and if it does hide the member id header and row cells on every row
        //    {
        //        gvOpportunity.HeaderRow.Cells[0].Visible = false;
        //        gvOpportunity.Rows[i].Cells[0].Visible = false;
        //    }

        //    con.Close();
        //}

        //protected void gvOpportunity_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    GridViewRow row = gvOpportunity.SelectedRow;        // Makes a gridview row equal to the selected row of gvOpportunity

        //    string opportunityId = row.Cells[1].Text;        // Stores the opportunity id in Session for use on Job Application page

        //    Session["OpportunityID"] = opportunityId;

        //    Response.Redirect("~/JobApplication.aspx");         // Redirect to Job Application page
        //}
    }
}