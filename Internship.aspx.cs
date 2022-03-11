using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Lab3
{
    public partial class Internship : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);      // Create an initial conenction with the database 


        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayGvInternship();
        }


        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];


            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {

                try
                {
                    string insertString = "INSERT INTO Internship (CompanyName, InternshipType, InternshipStartDate, InternshipCity) " +
                        " VALUES (@param1, @param2, @param3, @param4)";

                    dbConnection.Open();

                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        string companyName = txtCompanyName.Text;
                        string internshipType = txtInternshipType.Text;
                        DateTime startDateTime = DateTime.Parse(txtInternshipStartDate.Text);
                        string city = txtInternshipCity.Text;

                        cmd.Parameters.Add("@param1", SqlDbType.NVarChar, 50).Value = companyName;
                        cmd.Parameters.Add("@param2", SqlDbType.NVarChar, 50).Value = internshipType;
                        cmd.Parameters.Add("@param3", SqlDbType.DateTime).Value = startDateTime;
                        cmd.Parameters.Add("@param4", SqlDbType.NVarChar, 50).Value = city;

                        cmd.ExecuteNonQuery();

                        Response.Redirect("~/Internship.aspx");

                    }
                }
                catch (Exception ex)
                {
                    ltError.Text = ex.Message;
                }
                finally
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                    
                }
               

            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCompanyName.Text = "";
            txtInternshipCity.Text = "";
            txtInternshipStartDate.Text = "";
            txtInternshipType.Text = "";
        }

        protected void gvInternship_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvInternship.SelectedRow;    //Select a specific row within the grid view

            string check = row.Cells[1].Text;   // Chooses the cell with the information wanted

            Session["InternshipID"] = check;

            Response.Redirect("~/InternshipInformation.aspx"); //Redirect to the page for informaiton to be edited
        }

        protected void DisplayGvInternship()
        {
            try
            {
                string searchQuery = "SELECT * FROM Internship";

                SqlCommand cmd = new SqlCommand(searchQuery, con);

                con.Open();

                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();

                da.SelectCommand = cmd;

                DataSet ds = new DataSet();

                da.Fill(ds, "InternshipID");
                da.Fill(ds, "CompanyName");
                da.Fill(ds, "InternshipType");          //Fill the new adapter with variables
                da.Fill(ds, "InternshipStartDate");
                da.Fill(ds, "InternshipCity");



                ViewState["ds"] = ds;

                gvInternship.DataSource = ds;

                gvInternship.DataBind();



                for (int i = 0; i < gvInternship.Rows.Count; i++)       // Check if gridview member has rows and if it does hide the member id header and row cells
                {
                    gvInternship.HeaderRow.Cells[1].Visible = false;
                    gvInternship.Rows[i].Cells[1].Visible = false;
                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }



        }

        protected void gvInternshipApplications_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvInternshipApplications.SelectedRow;

            if (row.Cells[5].Text.Equals("Unawarded"))
            {
                btnAward.Text = "Award";
            }
            else
            {
                btnAward.Text = "Unaward";
            }

            lblSelectedStudent.Text = "Currently Selected Student: " + row.Cells[3].Text + " " + row.Cells[4].Text + ".";

        }

        protected void btnAward_Click(object sender, EventArgs e)
        {
            GridViewRow row = gvInternshipApplications.SelectedRow;                                   // Create a gridview row to select the row data

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    string internshipId = gvInternshipApplications.DataKeys[gvInternshipApplications.SelectedIndex].Values["InternshipNumber"].ToString();

                    if (row.Cells[5].Text.Equals("Unawarded"))         // Check if the row is unapproved 
                    {
                        // Update sql
                        string updateToApprove = "UPDATE InternshipApplication SET InternshipApplication.Awarded='Awarded' WHERE InternshipApplication.InternshipNumber=@internshipNumber";
                        SqlCommand sqlCommand = new SqlCommand(updateToApprove, dbConnection);
                        sqlCommand.Parameters.Add("@internshipNumber", SqlDbType.Int).Value = Int32.Parse(internshipId);
                        dbConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                        Response.Redirect("~/Internship.aspx");

                    }
                    else if (row.Cells[5].Text.Equals("Awarded"))
                    {
                        // Update sql
                        string updateToUnapprove = "UPDATE InternshipApplication SET InternshipApplication.Awarded='Unawarded' WHERE InternshipApplication.InternshipNumber=@internshipNumber";
                        SqlCommand sqlCommand = new SqlCommand(updateToUnapprove, dbConnection);
                        sqlCommand.Parameters.Add("@studentId", SqlDbType.Int).Value = Int32.Parse(internshipId);
                        dbConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                        Response.Redirect("~/Internship.aspx");

                    }



                }
                catch (SqlException ex)
                {
                    ltError.Text = ex.Message;
                }
                finally
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                }


            }

        }
    }
}
