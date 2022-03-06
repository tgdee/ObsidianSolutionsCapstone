using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Lab3
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvApprovedAccounts_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvApprovedAccounts.SelectedRow;       // Create a gridview row to select the row data

            if(row.Cells[6].Text.Equals("Unapproved"))              // Check the current entry in the AccountState row
            {
                btnApprove.Text = "Approve";                        // Set the button to describe what it should do
            }
            else
            {
                btnApprove.Text = "Unapprove";                      
            }


            lblSelected.Text = "Currently Selected UserID: " + row.Cells[1].Text + ".";         // Display which user is selected 
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            GridViewRow row = gvApprovedAccounts.SelectedRow;                                   // Create a gridview row to select the row data

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];    

            using(SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    if (row.Cells[6].Text.Equals("Unapproved"))         // Check if the row is unapproved 
                    {
                        // Update sql
                        string updateToApprove = "UPDATE UserLogin SET UserLogin.AccountState='Approved' WHERE UserLogin.UserID=" + row.Cells[1].Text;
                        dbConnection.Open();
                        SqlCommand cmd = new SqlCommand(updateToApprove, dbConnection);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("~/AdminPage.aspx");
                    }
                    else if (row.Cells[6].Text.Equals("Approved"))
                    {
                        // Update sql
                        string updateToUnapprove = "UPDATE UserLogin SET UserLogin.AccountState='Unapproved' WHERE UserLogin.UserID=" + row.Cells[1].Text;
                        dbConnection.Open();
                        SqlCommand cmd = new SqlCommand(updateToUnapprove, dbConnection);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("~/AdminPage.aspx");
                    }
                    else
                    {
                        lblSelected.ForeColor = System.Drawing.Color.Red;
                        lblSelected.Text = "Cannot Approve or Unapprove Admin";

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