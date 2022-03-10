﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace Lab3
{
    public partial class AdminAccountCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {


            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];        // Create webconfiguratiuon to AUTH database

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))        // Create sqlConnection to AUTH database
            {
                try
                {
                    string insertStringUserLogin = "INSERT INTO UserLogin (FirstName, LastName, Username, Email, AccountType) " +      // Insert statement for UserLogin table
                        "VALUES (@firstName, @lastName, @userName, @email, @accountType)";


                    

                    dbConnection.Open();    // Open database

                    using (SqlCommand cmd = new SqlCommand(insertStringUserLogin, dbConnection))        // Create first insert command
                    {
                        string fName = txtFirstName.Text;
                        string lName = txtLastName.Text;            // Get values to insert from ddl and txtbox 
                        string userName = txtUserName.Text;
                        string email = txtEmail.Text;
                        string accountType = ddlAccountType.SelectedItem.Text;

                        cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 20).Value = fName;
                        cmd.Parameters.Add("@lastName", SqlDbType.NVarChar, 30).Value = lName;      // Add values as parameters
                        cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = userName;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
                        cmd.Parameters.Add("@accountType", SqlDbType.NVarChar, 7).Value = accountType;


                        cmd.ExecuteNonQuery();

                        
                    }


                    string queryLastUserId = "SELECT UserID FROM UserLogin WHERE UserId=(SELECT max(UserID) FROM UserLogin)";   // Query to get most recent userId which
                                                                                                                                // will be the just created UserLogin

                    string insertStringPass = "INSERT INTO Pass (UserID, Username, PasswordHash) " +           // insert string for Pass table
                        "VALUES (@userId, @userName, @passWordHash)";

                    using (SqlCommand cmd1 = new SqlCommand(insertStringPass, dbConnection))         // Create SqlCommand for insertString
                    {
                        SqlCommand queryCmd = new SqlCommand(queryLastUserId, dbConnection);        // Create SqlCommand for userId query
                        int userId = (Int32)queryCmd.ExecuteScalar();                               // Store the userId to int variable
                        string userName = txtUserName.Text;
                        string passWord = txtPassword.Text;

                        cmd1.Parameters.Add("@userId", SqlDbType.Int).Value = userId;
                        cmd1.Parameters.Add("@userName", SqlDbType.NVarChar, 30).Value = userName;                                   // Add the values as parameters
                        cmd1.Parameters.Add("@passWordHash", SqlDbType.NVarChar, 256).Value = PasswordHash.HashPassword(passWord);   // with PasswordHash's HashPassword

                        cmd1.ExecuteNonQuery();

                    }


                    txtFirstName.Text = "";
                    txtLastName.Text = "";
                    txtUserName.Text = "";
                    txtEmail.Text = "";
                    txtPassword.Text = "";
                }
                
                catch (SqlException ex)
                {

                    ltError.Text = ex.Message;      // Display exceptions in literal

                }
                finally
                {

                    dbConnection.Close();
                    dbConnection.Dispose();
                }
            }
            
        }

        protected void btnRetur_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage.aspx");
        }
    }
}