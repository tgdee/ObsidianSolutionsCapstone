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
            GridViewRow row = gvApprovedAccounts.SelectedRow;

            if(row.Cells[6].Text.Equals("Unapproved"))
            {
                btnApprove.Text = "Approve";
            }
            else
            {
                btnApprove.Text = "Unapprove";
            }


            lblSelected.Text = "Currently Selected UserID: " + row.Cells[1].Text + ".";
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            GridViewRow row = gvApprovedAccounts.SelectedRow;

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];

            using(SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    if (row.Cells[6].Text.Equals("Unapproved"))
                    {
                        string updateToApprove = "UPDATE UserLogin SET UserLogin.AccountState='Approved' WHERE UserLogin.UserID=" + row.Cells[1].Text;
                        dbConnection.Open();
                        SqlCommand cmd = new SqlCommand(updateToApprove, dbConnection);
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        string updateToUnapprove = "UPDATE UserLogin SET UserLogin.AccountState='Unapproved' WHERE UserLogin.UserID=" + row.Cells[1].Text;
                        dbConnection.Open();
                        SqlCommand cmd = new SqlCommand(updateToUnapprove, dbConnection);
                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("~/AdminPage.aspx");

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