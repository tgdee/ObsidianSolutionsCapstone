using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Lab3
{


    public partial class LoginChoice : System.Web.UI.Page
    {
        protected void lbHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //connect to database to retrieve stored password string
            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());


                sc.Open();
                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES

                using (var command = new SqlCommand("dbo.JeremyEzellLab3", sc) { CommandType = CommandType.StoredProcedure })
                {
                    command.Parameters.Add("@UserName", SqlDbType.NVarChar, 20).Value = txtUsername.Text;

                    SqlDataReader reader = command.ExecuteReader();         // create a reader

                    if (reader.HasRows)                                     // if the username exists, it will continue
                    {
                        while (reader.Read())                               // this will read the single record that matches the entered username
                        {
                            string storedHash = reader["PasswordHash"].ToString();              // store the database password into this variable

                            if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash))    // if the entered password matches what is stored, it will show success
                            {
                                Session["CannotDo"] = "";
                                Session["Username"] = txtUsername.Text;
                                Session["AccountType"] = GetAccountType();
                                if ((GetApprovedStatus().Equals("Approved") && GetAccountType().Equals("Student")))     // Login if the user is approved or admin
                                {
                                    Response.Redirect("~/Account.aspx");
                                }
                                else if ((GetApprovedStatus().Equals("Approved") && GetAccountType().Equals("Alum")) || GetApprovedStatus().Equals("Admin"))
                                {
                                    Response.Redirect("~/MemberAccount.aspx");
                                }
                                //else if (GetApprovedStatus().Equals("Admin"))
                                //{
                                //    Response.Redirect("~/AdminPages/AdminHomepage");
                                //}
                                else
                                {
                                    Session.Abandon();
                                    lblUserStat.Text = "Unapproved Account Contact Administrator";                    // Abandon session and tell user his account is unapproved
                                }

                            }
                            else
                                lblUserStat.Text = "Invalid Password or Username";
                        }
                    }
                    else
                        lblUserStat.Text = "Invalid Password or Username";                                            // if the username doesn't exist, it will show failure

                    sc.Close();
                    sc.Dispose();
                }
            }
            catch (SqlException ex)
            {
                lblUserStat.Text = ex.Message;
            }

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AccountCreation.aspx");
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["MustLogin"] != null)
            {
                lblUserStat.ForeColor = Color.Red;
                lblUserStat.Text = Session["MustLogin"].ToString();
            }

        }



        protected string GetAccountType()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {

                dbConnection.Open();
                string queryAccountType = "SELECT AccountType FROM UserLogin WHERE Username=@userName";         // Get the users account type to track permissions
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
                string queryApprovedStatus = "SELECT AccountState FROM UserLogin WHERE Username=@userName";     // Get the users approval state
                string userName = Session["Username"].ToString();
                dbConnection.Open();
                SqlCommand cmd = new SqlCommand(queryApprovedStatus, dbConnection);
                cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = userName;

                string accountType = cmd.ExecuteScalar().ToString();

                return accountType;
            }
        }

    }
}