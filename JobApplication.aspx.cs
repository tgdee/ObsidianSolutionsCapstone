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
    public partial class JobApplication : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayGvOpportunity();
        }

        protected string GetStudentIDFromSql()
        {
            SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

            try
            {
                string queryString = "SELECT StudentID FROM Student WHERE Username=@userName";
                string userName = Session["Username"].ToString();
                dbConnection.Open();

                string studentId = "";

                using (SqlCommand cmd = new SqlCommand(queryString, dbConnection))
                {

                    cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = userName;
                    studentId = cmd.ExecuteScalar().ToString();
                }

                return studentId;
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
         

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    //create the string variables from text input
                    string companyName = ddlCompanyNames.SelectedItem.Text;
                    string date = DateTime.Now.ToString();
                    string position = txtPosition.Text;
                    string applyingStudentId = GetStudentIDFromSql();
                    string email = txtStudentEmail.Text;
                    
                    dbConnection.Open();


                    string insertString = "INSERT INTO JobApplication (CompanyName, ApplicationDate, PositionTitle, StudentID, Email) " +
                            " VALUES (@companyName, @applicationDate, @positionTitle, @studentId, @email)";

                    
                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {

                        cmd.Parameters.Add("@companyName", SqlDbType.NVarChar, 50).Value = companyName;
                        cmd.Parameters.Add("@applicationDate", SqlDbType.Date).Value = date;
                        cmd.Parameters.Add("@positionTitle", SqlDbType.NVarChar, 50).Value = position;
                        cmd.Parameters.Add("@studentId", SqlDbType.Int).Value = applyingStudentId;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;


                        cmd.ExecuteNonQuery();


                    }


                }
                
                catch (SqlException ex)                        //Catch Sql Exception
                {
                    lblError.Text = ex.Message;

                }
                finally
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                }

                                                            
                txtPosition.Text = "";                          //Clear textboxes after insert
                txtStudentEmail.Text = "";
            }
        }
        protected void DisplayGvOpportunity()
        {

            try
            {
                string searchQuery = "SELECT * FROM Opportunity";

                SqlCommand cmd = new SqlCommand(searchQuery, con);

                con.Open();

                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter
                {
                    SelectCommand = cmd
                };

                DataSet ds = new DataSet();
                da.Fill(ds, "OpportunityID");
                da.Fill(ds, "Title");
                da.Fill(ds, "Type");
                da.Fill(ds, "City");
                da.Fill(ds, "State");
                da.Fill(ds, "Industry");
                da.Fill(ds, "Deadline");
                da.Fill(ds, "Link");
                da.Fill(ds, "CorpName");


                ViewState["ds"] = ds;

                gvOpportunity.DataSource = ds;

                gvOpportunity.DataBind();


                //Check if gridview member has rows and if it does hide the member id header and row cells and change headers

                for (int i = 0; i < gvOpportunity.Rows.Count; i++)
                {
                    gvOpportunity.HeaderRow.Cells[0].Visible = false;
                    gvOpportunity.Rows[i].Cells[0].Visible = false;
                    gvOpportunity.HeaderRow.Cells[8].Text = "Company";

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

                using (SqlCommand command = new SqlCommand("dbo.spSearchOpportunity", con) { CommandType = CommandType.StoredProcedure })  // Use stored procedure because it does not work in code
                {
                    command.Parameters.Add("@Title", SqlDbType.NVarChar, 50).Value = txtTitleSearch.Text;
                    command.Parameters.Add("@Type", SqlDbType.NVarChar, 30).Value = txtTypeSearch.Text;
                    command.Parameters.Add("@City", SqlDbType.NVarChar, 20).Value = txtCitySearch.Text;
                    command.Parameters.Add("@State", SqlDbType.NVarChar, 2).Value = txtStateSearch.Text;
                    command.Parameters.Add("@Industry", SqlDbType.NVarChar, 30).Value = txtIndustrySearch.Text;
                    command.Parameters.Add("@CorpName", SqlDbType.NVarChar, 30).Value = txtCorpNameSearch.Text;



                    con.Open();


                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);               // Fill a data adapter with data gathered from stored procedure

                    DataTable dt = new DataTable();

                    dataAdapter.Fill(dt);                                                   // Fill a datatable

                    gvOpportunity.DataSource = dt;                                              // Set the gridview's datasource to the filled datatable

                    gvOpportunity.DataBind();                                                   // Bind the gridviews datasource data with the displayed gridview

                }


            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }



            for (int i = 0; i < gvOpportunity.Rows.Count; i++)       // Check if gridview member has rows and if it does hide the member id header and row cells on every row
            {
                gvOpportunity.HeaderRow.Cells[0].Visible = false;
                gvOpportunity.Rows[i].Cells[0].Visible = false;
            }

            con.Close();
        }
    }
}