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
    public partial class MemberTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

        }


        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    string insertString = "INSERT INTO Member (FirstName, LastName, Email) VALUES (@firstName, @lastName, @email)";

                    dbConnection.Open();

                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        string firstName = txtMemberFirstName.Text;
                        string lastName = txtMemberLastName.Text;
                        string email = txtMemberEmail.Text;

                        cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 50).Value = firstName;
                        cmd.Parameters.Add("@lastName", SqlDbType.NVarChar, 50).Value = lastName;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;

                        cmd.ExecuteNonQuery();

                        Response.Redirect("~/MemberTest.aspx");

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