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
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                DisplayGvMember();
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

        protected void gvMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvMember.SelectedRow;

            string check = row.Cells[1].Text;

            Session["MemberID"] = check;

            Response.Redirect("~/MemberInformation.aspx");
        }

        protected void DisplayGvMember()
        {
            try
            {
                string searchQuery = "SELECT * FROM Member";

                SqlCommand cmd = new SqlCommand(searchQuery, con);

                con.Open();

                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();

                da.SelectCommand = cmd;

                DataSet ds = new DataSet();

                da.Fill(ds, "MemberID");
                da.Fill(ds, "FirstName");
                da.Fill(ds, "LastName");
                da.Fill(ds, "Email");

                ViewState["ds"] = ds;

                gvMember.DataSource = ds;

                gvMember.DataBind();

                if(gvMember.Rows.Count == 1)                        // Check if gridview member has rows and if it does hide the member id header and row cells
                {
                    gvMember.HeaderRow.Cells[1].Visible = false;
                    gvMember.Rows[0].Cells[1].Visible = false;
                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }


            
        }
    }
}