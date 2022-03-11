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
    public partial class Scholarship : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);      // Create an initial conenction with the database 

        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayGvScholarship();
        }

        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {

                try
                {
                    string insertString = "INSERT INTO Scholarship (ScholarshipName, ScholarshipAmount, ScholarshipType, ScholarshipCondition) " +
                        " VALUES (@name, @amount, @type, @condition)";

                    dbConnection.Open();

                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        string scholarshipName = txtScholarshipName.Text;
                        string scholarshipAmount = txtScholarshipAmount.Text;
                        string scholarshipType = txtScholarshipType.Text;
                        string scholarshipCondition = txtScholarshipCondition.Text;

                        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = scholarshipName;
                        cmd.Parameters.Add("@amount", SqlDbType.NVarChar, 50).Value = scholarshipAmount;
                        cmd.Parameters.Add("@type", SqlDbType.NVarChar, 50).Value = scholarshipType;
                        cmd.Parameters.Add("@condition", SqlDbType.NVarChar, 50).Value = scholarshipCondition;

                        cmd.ExecuteNonQuery();

                        Response.Redirect("~/Scholarship.aspx");

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

        protected void gvScholarship_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvScholarship.SelectedRow;    //Select a specific row within the grid view

            string check = row.Cells[1].Text;   // Chooses the cell with the information wanted

            Session["ScholarshipID"] = check;

            Response.Redirect("~/ScholarshipInformation.aspx"); //Redirect to the page for informaiton to be edited
        }

        protected void DisplayGvScholarship()
        {
            try
            {
                string searchQuery = "SELECT * FROM Scholarship";

                SqlCommand cmd = new SqlCommand(searchQuery, con);

                con.Open();

                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();

                da.SelectCommand = cmd;

                DataSet ds = new DataSet();

                da.Fill(ds, "ScholarshipID");
                da.Fill(ds, "ScholarshipName");
                da.Fill(ds, "ScholarshipAmount");
                da.Fill(ds, "ScholarshipType");
                da.Fill(ds, "ScholarrshipCondition");
               


                ViewState["ds"] = ds;

                gvScholarship.DataSource = ds;

                gvScholarship.DataBind();



                for (int i = 0; i < gvScholarship.Rows.Count; i++)       // Check if gridview member has rows and if it does hide the member id header and row cells
                {
                    gvScholarship.HeaderRow.Cells[1].Visible = false;
                    gvScholarship.Rows[i].Cells[1].Visible = false;
                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }



        }

        protected void btnAward_Click(object sender, EventArgs e)
        {
            GridViewRow row = gvScholarshipApplications.SelectedRow;                                   // Create a gridview row to select the row data

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {

                    string applicationNumber = gvScholarshipApplications.DataKeys[gvScholarshipApplications.SelectedIndex].Values["ApplicationNumber"].ToString();


                    if (row.Cells[5].Text.Equals("Unawarded"))         // Check if the row is unapproved 
                    {
                        // Update sql
                        string updateToApprove = "UPDATE ScholarshipApplication SET ScholarshipApplication.Awarded='Awarded' WHERE ScholarshipApplication.ApplicationNumber=@appNumber";
                        SqlCommand sqlCommand = new SqlCommand(updateToApprove, dbConnection);
                        sqlCommand.Parameters.Add("@appNumber", SqlDbType.Int).Value = applicationNumber;
                        dbConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                        Response.Redirect("~/Scholarship.aspx");

                    }
                    else if (row.Cells[5].Text.Equals("Awarded"))
                    {
                        // Update sql
                        string updateToUnapprove = "UPDATE ScholarshipApplication SET ScholarshipApplication.Awarded='Unawarded' WHERE ScholarshipApplication.StudentID=@appNumber";
                        SqlCommand sqlCommand1 = new SqlCommand(updateToUnapprove, dbConnection);
                        sqlCommand1.Parameters.Add("@appNumber", SqlDbType.Int).Value = applicationNumber;
                        dbConnection.Open();
                        sqlCommand1.ExecuteNonQuery();
                        Response.Redirect("~/Scholarship.aspx");

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

        protected void gvScholarshipApplications_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvScholarshipApplications.SelectedRow;

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
    }
}
