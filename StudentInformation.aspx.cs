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
    public partial class StudentInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindDataList();
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

                dbConnection.Open();

                using (var sqlComm = new SqlCommand("dbo.spUpdateStudentInfo", dbConnection) { CommandType = CommandType.StoredProcedure })
                {
                    int selectedStudentId = Int32.Parse(Session["StudentID"].ToString());

                    sqlComm.Parameters.Add("@StudentID", SqlDbType.Int).Value = selectedStudentId;
                    sqlComm.Parameters.Add("@FirstName", SqlDbType.NVarChar, 20).Value = txtFirstName.Text;
                    sqlComm.Parameters.Add("@LastName", SqlDbType.NVarChar, 30).Value = txtLastName.Text;
                    sqlComm.Parameters.Add("@Grade", SqlDbType.NVarChar, 20).Value = txtGrade.Text;
                    sqlComm.Parameters.Add("@GraduationYear", SqlDbType.NVarChar, 20).Value = txtGraduationYear.Text;
                    sqlComm.Parameters.Add("@Major", SqlDbType.NVarChar, 20).Value = txtMajor.Text;
                    sqlComm.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar, 10).Value = txtPhoneNumber.Text;
                    sqlComm.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = txtEmail.Text;

                    sqlComm.ExecuteNonQuery();

                    dbConnection.Close();

                    BindDataList();
                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }
        }

        protected void BindDataList()
        {
            try
            {
                
                SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

                using (var sqlComm = new SqlCommand("dbo.spStudentInformation", dbConnection) { CommandType = CommandType.StoredProcedure })
                {

                    string selectedStudentId = Session["StudentID"].ToString();

                    dlStudentInfo.DataSource = null;
                    dlStudentInfo.DataBind();
                    dbConnection.Open();
                    sqlComm.Parameters.Add("@StudentID", SqlDbType.Int).Value = Int32.Parse(selectedStudentId); 
                   
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlComm);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlStudentInfo.DataSource = dt;
                        dlStudentInfo.DataBind();
                    }
                    else
                    {
                        ltError.Text = "Student Information For this Student Does Not Exist. Please Create it on the Student Page";  // NEED TO CREATE THIS ON OTHER PAGES!!!
                    }

                    dbConnection.Close();
                }
            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }

        }

    }
}