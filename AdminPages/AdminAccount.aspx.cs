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
    public partial class AdminAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Username"] == null)
            {
                Session["MustLogin"] = "You Must Login to Access that Page!";
                Response.Redirect("~/LoginChoice.aspx");
            }


            if (!IsPostBack)
            {
                BindDataList();
                DisplayResume();
            }

        }

        protected void BindDataList()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];

            using(SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    dlAccount.DataSource = null;
                    dlAccount.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "SELECT FirstName, LastName, Email FROM UserLogin WHERE Username=@userName";
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    command.Parameters.Add("@userName", SqlDbType.NVarChar, 50).Value = username;
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if(dt.Rows.Count > 0)
                    {
                        dlAccount.DataSource = dt;
                        dlAccount.DataBind();
                    }
                }
                catch (SqlException e)
                {
                    ltError.Text = e.Message;
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                }

            }
        }

        protected void DisplayResume()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];        // Connect to AUTH Database where Resume table is

            using(SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    string userName = Session["Username"].ToString();                                           // Find the current username of whomever is signed in
                    string queryResume = "SELECT FileName, FileLocation FROM Resume WHERE Username=@userName";  

                    dbConnection.Open();
                    
                    using (SqlCommand cmd = new SqlCommand(queryResume, dbConnection))
                    {
                        cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = userName;

                        SqlDataAdapter sdr = new SqlDataAdapter(cmd);               // FIll SqlDataAdapter using SELECT query
                        DataTable dt = new DataTable();
                        sdr.Fill(dt);                                               // Fill the data table using SqlDataAdapter
                        gvDisplay.DataSource = dt;                                  // Set the data datasource of the gridview to the new data table
                        gvDisplay.DataBind();                                       // Bind the data from the datasource to the grid view


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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];            // Connect to AUTH from configuration

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))        // Create SQL Connection from Lab3
            {
                try
                {
                    ltError.Text = "";                                      // Clear errors in case there is old error 
                    dbConnection.Open();
                    string username = Session["Username"].ToString();       // Get the username of whomever is signed in from the Session variable
                    string firstName = txtFirstName.Text;
                    string lastName = txtLastName.Text;
                    string email = txtEmail.Text;
                    string oldPassword = txtPassword.Text;
                    string newPassword = txtNewPassword.Text;


                    string updateAccountSql = "UPDATE UserLogin SET FirstName=@firstName, LastName=@lastName, Email=@email WHERE Username=@userName";
                    SqlCommand cmd = new SqlCommand(updateAccountSql, dbConnection);
                    cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 20).Value = firstName;
                    cmd.Parameters.Add("@lastName", SqlDbType.NVarChar, 30).Value = lastName;       // Prepare sql command to update userlogin table
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
                    cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = username;

                    string updatePassSql = "UPDATE Pass SET PasswordHash=@passwordHash";
                    SqlCommand cmd1 = new SqlCommand(updatePassSql, dbConnection);                  // Prepare sql command to update Pass table
                    cmd1.Parameters.Add("@passwordHash", SqlDbType.NVarChar, 256).Value = PasswordHash.HashPassword(newPassword);

                    string queryCurrentPassword = "SELECT PasswordHash FROM Pass WHERE Username=@userName";
                    SqlCommand cmd2 = new SqlCommand(queryCurrentPassword, dbConnection);                   // Get the current password to check with the old 
                    cmd2.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = username;
                    string currentPassword = cmd2.ExecuteScalar().ToString();

                    if (PasswordHash.ValidatePassword(oldPassword, currentPassword))                // Check the old password and only update if it matches
                    {
                        cmd.ExecuteNonQuery();
                        cmd1.ExecuteNonQuery();
                        BindDataList();
                    }
                    else
                    {
                        ltError.Text = "Incorrect Old Password Update Failed";
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
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPassword.Text = "";
            txtNewPassword.Text = "";

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton linkDownload = sender as LinkButton;
            GridViewRow gridRow = linkDownload.NamingContainer as GridViewRow;
            string downloadFile = gvDisplay.DataKeys[gridRow.RowIndex].Value.ToString();
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + downloadFile + "\"");
            Response.TransmitFile(Server.MapPath(downloadFile));
            Response.End();
        }

        protected void gvDisplay_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDisplay.SelectedRow;

            lblSelected.Text = "Currently Selected Resume: " + row.Cells[2].Text + ".";     // Notify the user which row is currently selected
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            GridViewRow row = gvDisplay.SelectedRow;

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    string deleteResume = "DELETE FROM Resume WHERE FileLocation=@fileLocation";
                    dbConnection.Open();
                    SqlCommand cmd = new SqlCommand(deleteResume, dbConnection);
                    cmd.Parameters.Add("@fileLocation", SqlDbType.NVarChar, 50).Value = row.Cells[3].Text;
                    cmd.ExecuteNonQuery();
                    lblSelected.Text = "";
                    DisplayResume();
                }
                catch (SqlException ex)
                {
                    lblSelected.Text = ex.Message;

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