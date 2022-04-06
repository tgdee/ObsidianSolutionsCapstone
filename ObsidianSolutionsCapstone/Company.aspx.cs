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
    public partial class Company : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);      // Create an initial conenction with the database 

        protected void Page_Load(object sender, EventArgs e)
        //Master Page covers the restriction of accesing pages without login
        {

            if (!Page.IsPostBack)
            {
                DisplayGvEmployer();
            }
        }


        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            ltError.Text = "";

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                //creates the insert strings for the database 
                try
                {
                    string insertString = "INSERT INTO Company (MeetingTime, CompanyName, Email, FirstName, LastName) " +
                        " VALUES (@meetingTime, @companyName, @email, @firstName, @lastName)";

                    dbConnection.Open();

                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        string firstName = txtFirstName.Text;
                        string lastName = txtLastName.Text;
                        DateTime meetingTime = DateTime.Parse(txtMeetingTime.Text);
                        string email = txtEmail.Text;
                        string companyName = txtCompanyName.Text;

                        cmd.Parameters.Add("@companyName", SqlDbType.NVarChar, 50).Value = companyName;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
                        cmd.Parameters.Add("@meetingTime", SqlDbType.DateTime).Value = meetingTime;
                        cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 50).Value = firstName;
                        cmd.Parameters.Add("lastName", SqlDbType.NVarChar, 50).Value = lastName;

                        cmd.ExecuteNonQuery();

                        Response.Redirect("~/Company.aspx");

                    }
                }
                //create the error message in case of user input mistake
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

        protected void gvCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvCompany.SelectedRow;    //Select a specific row within the grid view

            string check = row.Cells[1].Text;   // Chooses the cell with the information wanted

            Session["EmployerID"] = check;

            Response.Redirect("~/CompanyInformation.aspx"); //Redirect to the page for informaiton to be edited
        }

        protected void DisplayGvEmployer()
        {
            try
            {
                string searchQuery = "SELECT * FROM Company";

                SqlCommand cmd = new SqlCommand(searchQuery, con);

                con.Open();

                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();

                da.SelectCommand = cmd;

                DataSet ds = new DataSet();

                da.Fill(ds, "EmployerID");
                da.Fill(ds, "MeetingTime");
                da.Fill(ds, "CompanyName");
                da.Fill(ds, "Email");
                da.Fill(ds, "FirstName");
                da.Fill(ds, "LastName");



                ViewState["ds"] = ds;

                gvCompany.DataSource = ds;

                gvCompany.DataBind();







                for (int i = 0; i < gvCompany.Rows.Count; i++)       // Check if gridview member has rows and if it does hide the member id header and row cells
                {
                    gvCompany.HeaderRow.Cells[1].Visible = false;
                    gvCompany.Rows[i].Cells[1].Visible = false;
                    gvCompany.HeaderRow.Cells[7].Visible = false;
                    gvCompany.Rows[i].Cells[7].Visible = false;
                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }



        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            GridViewRow row = gvCurrentJobApplication.SelectedRow;                                   // Create a gridview row to select the row data

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {


                    string applicationNumber = gvCurrentJobApplication.DataKeys[gvCurrentJobApplication.SelectedIndex].Values["ApplicationNumber"].ToString();

                    if (row.Cells[6].Text.Equals("Unawarded"))         // Check if the row is unapproved 
                    {
                        // Update sql
                        string updateToApprove = "UPDATE JobApplication SET JobApplication.Awarded='Awarded' WHERE JobApplication.ApplicationNumber=@appNumber";
                        SqlCommand sqlCommand = new SqlCommand(updateToApprove, dbConnection);
                        sqlCommand.Parameters.Add("@appNumber", SqlDbType.Int).Value = Int32.Parse(applicationNumber);
                        dbConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                        Response.Redirect("~/Company.aspx");

                    }
                    else if (row.Cells[6].Text.Equals("Awarded"))
                    {
                        // Update sql
                        string updateToUnapprove = "UPDATE JobApplication SET JobApplication.Awarded='Unawarded' WHERE JobApplication.StudentID=@appNumber";
                        SqlCommand sqlCommand = new SqlCommand(updateToUnapprove, dbConnection);
                        sqlCommand.Parameters.Add("@appNumber", SqlDbType.Int).Value = Int32.Parse(applicationNumber);
                        dbConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                        Response.Redirect("~/Company.aspx");

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




        protected void gvCurrentJobApplication_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvCurrentJobApplication.SelectedRow;

            btnApprove.Visible = true;

            if (row.Cells[6].Text.Equals("Unawarded"))
            {
                btnApprove.Text = "Award";
            }
            else
            {
                btnApprove.Text = "Unaward";
            }

            lblSelectedStudent.Text = "Currently Selected Student: " + row.Cells[4].Text + " " + row.Cells[5].Text + ".";
        }

    }
}
