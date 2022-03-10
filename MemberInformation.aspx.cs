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
    public partial class MemberInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
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

                using (var sqlComm = new SqlCommand("dbo.spUpdateMemberInfo", dbConnection) { CommandType = CommandType.StoredProcedure })
                {
                    string selectedMemberID = Session["MemberID"].ToString();


                    sqlComm.Parameters.Add("@MemberID", SqlDbType.Int).Value = selectedMemberID;
                    sqlComm.Parameters.Add("@FirstName", SqlDbType.NVarChar, 20).Value = txtFirstName.Text;
                    sqlComm.Parameters.Add("@LastName", SqlDbType.NVarChar, 30).Value = txtLastName.Text;
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

                using (var sqlComm = new SqlCommand("dbo.spMemberInformation", dbConnection) { CommandType = CommandType.StoredProcedure })
                {
                    //Session["MemberID"] = ((int)Session["MemberID"]);
                    // selectedMemberID = Session["MemberID"];
                    int selectedMemberID = 
                    
                    dlMemberInfo.DataSource = null;
                    dlMemberInfo.DataBind();
                    dbConnection.Open();
                    sqlComm.Parameters.Add("@MemberID", SqlDbType.Int).Value = selectedMemberID; 
                   
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlComm);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlMemberInfo.DataSource = dt;
                        dlMemberInfo.DataBind();
                    }
                    else
                    {
                        ltError.Text = "Member Information For this Member Does Not Exist. Please Create it on the Member Page";  // NEED TO CREATE THIS ON OTHER PAGES!!!
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