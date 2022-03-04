using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace Lab3
{
    public partial class StudentLoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }
        protected void Btn_Click(object sender, EventArgs e)
        {
            String sqlQuery = "SELECT COUNT(*) FROM StudentUser WHERE UserName=@Username AND Password=@Password";

            SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnection);

            sqlCommand.Parameters.AddWithValue("@Username", txtUsername.Text);
            sqlCommand.Parameters.AddWithValue("@Password", txtPassword.Text);

            sqlConnection.Open();

            int count = Convert.ToInt32(sqlCommand.ExecuteScalar());

            if (count == 1)
            {
                Session["Username"] = txtUsername.Text;
                Session["isMember"] = false;
                Session["isStudent"] = true;
                Response.Redirect("~/Homepage.aspx");
            }
            else
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Font.Bold = true;
                lblStatus.Text = "Username Password was Incorret. Please Try Again.";

            }
       
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginChoice.aspx");

        }
    }
}