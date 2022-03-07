using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Lab3
{
    public partial class AdminInternship : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];


            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {

                try
                {
                    string insertString = "INSERT INTO Internship (CompanyName, InternshipType, InternshipStartDate, InternshipCity) " +
                        " VALUES (@param1, @param2, @param3, @param4)";

                    dbConnection.Open();

                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        string companyName = txtCompanyName.Text;
                        string internshipType = txtInternshipType.Text;
                        DateTime startDateTime = DateTime.Parse(txtInternshipStartDate.Text);
                        string city = txtInternshipCity.Text;

                        cmd.Parameters.Add("@param1", SqlDbType.NVarChar, 50).Value = companyName;
                        cmd.Parameters.Add("@param2", SqlDbType.NVarChar, 50).Value = internshipType;
                        cmd.Parameters.Add("@param3", SqlDbType.DateTime).Value = startDateTime;
                        cmd.Parameters.Add("@param4", SqlDbType.NVarChar, 50).Value = city;

                        cmd.ExecuteNonQuery();

                        Response.Redirect("~/Internship.aspx");

                    }
                }
                catch (Exception ex)
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCompanyName.Text = "";
            txtInternshipCity.Text = "";
            txtInternshipStartDate.Text = "";
            txtInternshipType.Text = "";
        }
    }
}
