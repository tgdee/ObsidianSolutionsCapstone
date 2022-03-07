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
    public partial class AdminScholarship : System.Web.UI.Page
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
                    string insertString = "INSERT INTO Scholarship (ScholarshipName, ScholarshipAmount, ScholarshipType, ScholarshipCondition) " +
                        " VALUES (@name, @amount, @type, @condition)";

                    dbConnection.Open();

                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        string scholarshipName = txtScholarshipName.Text;
                        string scholarshipAmount = txtScholarshipAmount.Text;
                        string scholarshipType = txtScholarshipType.Text;
                        string scholarshipCondition = txtScholarshipCondition.Text;

                        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = scholarshipName;
                        cmd.Parameters.Add("@amount", SqlDbType.NVarChar, 50).Value = scholarshipAmount;
                        cmd.Parameters.Add("@type", SqlDbType.NVarChar, 50).Value = scholarshipType;
                        cmd.Parameters.Add("@condition", SqlDbType.NVarChar, 50).Value = scholarshipCondition;

                        cmd.ExecuteNonQuery();

                        Response.Redirect("~/Scholarship.aspx");

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
