using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace Lab3
{
    
    
    public partial class LoginChoice : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MustLogin"] != null)
            {
                lblUserStat.ForeColor = Color.Red;
                lblUserStat.Text = Session["MustLogin"].ToString();
            }
            else
            {
                lblUserStat.Text = "Please Continue to Login!";
            }

        }


        protected void btnNewAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AccountCreation.aspx");
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {

            // connect to database to retrieve stored password string
            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                

                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;
                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.CommandText = "SELECT PasswordHash FROM Pass WHERE Username = @Username";
                findPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable

                        if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                        {
                            Session["Username"] = txtUsername.Text;
                            Session["AccountType"] = GetAccountType();
                            Response.Redirect("~/Homepage.aspx");
                        }
                        else
                            lblStatus.Text = "Invalid Password or Username";
                    }
                }
                else // if the username doesn't exist, it will show failure
                    lblStatus.Text = "Invalid Password or Username";

                sc.Close();
                sc.Dispose();
            }
            catch (SqlException ex)
            {
                lblStatus.Text = ex.Message;
            }
        }

        protected string GetAccountType()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {

                string queryAccountType = "SELECT AccountType FROM UserLogin WHERE Username=@userName";
                string userName = Session["Username"].ToString();
                SqlCommand cmd = new SqlCommand(queryAccountType, dbConnection);
                cmd.Parameters.Add("@userName", System.Data.SqlDbType.NVarChar, 20).Value = userName;

                string accountType = cmd.ExecuteScalar().ToString();

                return accountType;

            }

        }

        protected string GetApprovedStatus()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                string queryApprovedStatus = "SELECT AccountState FROM UserLogin WHERE ";
            }
        }

    }
}