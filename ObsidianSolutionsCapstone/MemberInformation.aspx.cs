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
        readonly SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                if(Session["MemberID"] != null && Session["Username"] != null)
                {
                    DisplayUserData();
                }
                else if (Session["Username"] != null)
                {
                    Response.Redirect("~/Homepage.aspx");
                }
                else
                {
                    Response.Redirect("~/LoginChoice.aspx");
                }

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
                    int selectedMemberId = Int32.Parse(Session["MemberID"].ToString());


                    sqlComm.Parameters.Add("@MemberID", SqlDbType.Int).Value = selectedMemberId;
                    sqlComm.Parameters.Add("@FirstName", SqlDbType.NVarChar, 20).Value = txtFirstName.Text;
                    sqlComm.Parameters.Add("@LastName", SqlDbType.NVarChar, 30).Value = txtLastName.Text;
                    sqlComm.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = txtEmail.Text;

                    sqlComm.ExecuteNonQuery();

                    dbConnection.Close();

                    DisplayUserData();


                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }
        }

        protected void DisplayUserData()
        {
            try
            {
                int selectedMemberId = Int32.Parse(Session["MemberID"].ToString());     // get the memberId frome the session variable set on member test


                con.Open();

                using (var command = new SqlCommand("dbo.spMemberInformation", con) { CommandType = CommandType.StoredProcedure })
                {

                    command.Parameters.Add("@MemberID", SqlDbType.Int).Value = selectedMemberId;

                    SqlDataAdapter da = new SqlDataAdapter(command);

                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    if(dt.Rows.Count > 0)
                    {
                        dlMemberInfo.DataSource = dt;
                        dlMemberInfo.DataBind();
                    }

                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
            

        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if((string)Session["AccountType"] == "Admin")
            {
                Response.Redirect("~/AdminPages/AdminMember.aspx");
            }
            else
            {
                Response.Redirect("~/MemberTest.aspx");
            }
        }

      

        //protected void BindDataList()
        //{
        //    try
        //    {
        //        SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

        //        using (var sqlComm = new SqlCommand("dbo.spMemberInformation", dbConnection) { CommandType = CommandType.StoredProcedure })
        //        {

        //            string selectedMemberId = Session["MemberID"].ToString();
        //            int memberId = Int32.Parse(selectedMemberId);


        //            dlMemberInfo.DataSource = null;
        //            dlMemberInfo.DataBind();
        //            dbConnection.Open();
        //            sqlComm.Parameters.Add("@MemberID", SqlDbType.Int).Value = memberId; 

        //            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlComm);
        //            DataTable dt = new DataTable();
        //            dataAdapter.Fill(dt);
        //            if (dt.Rows.Count > 0)
        //            {
        //                dlMemberInfo.DataSource = dt;
        //                dlMemberInfo.DataBind();
        //            }
        //            else
        //            {
        //                ltError.Text = "Member Information For this Member Does Not Exist. Please Create it on the Member Page";  // NEED TO CREATE THIS ON OTHER PAGES!!!
        //            }

        //            dbConnection.Close();
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        ltError.Text = ex.Message;
        //    }

        //}

    }
}