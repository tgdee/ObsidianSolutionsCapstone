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
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Username"] == null)
            {
                Session["MustLogin"] = "You Must Login to Access that Page!";
                Response.Redirect("~/LoginChoice.aspx");
            }


            if (!IsPostBack)
            {
                BindDataList();
            }

        }

        protected void BindDataList()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using(SqlConnection connection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    dlAccount.DataSource = null;
                    dlAccount.DataBind();
                    connection.Open();
                    string username = Session["Username"].ToString();
                    string sqlCommandString = "";
                    if ((bool)Session["isStudent"])
                    {
                        sqlCommandString = "SELECT Student.FirstName, Student.LastName, Student.Email, StudentUser.Password " +
                            "FROM Student INNER JOIN StudentUser ON Student.StudentID=StudentUser.StudentID AND StudentUser.UserName= '" + username + "'";
                    }
                    else if ((bool)Session["isMember"])
                    {
                        sqlCommandString = "SELECT Member.FirstName, Member.LastName, Member.Email, MemberUser.Password " +
                            "FROM Member INNER JOIN MemberUser ON Member.MemberID=MemberUser.MemberID AND MemberUser.Username= '" + username + "'";
                    }
                    SqlCommand command = new SqlCommand(sqlCommandString, connection);
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    if(dt.Rows.Count > 0)
                    {
                        dlAccount.DataSource = dt;
                        dlAccount.DataBind();
                    }
                }
                catch (SqlException e)
                {
                    ltError.Text = e.Message;
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                }

            }
        }

        protected void DisplayResume()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["AUTH"];        // Connect to AUTH Database where Resume table is

            using(SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    string userName = Session["Username"].ToString();       // Find the current username of whomever is signed in
                    string queryResume = "SELECT FileName, FileLocation FROM Resume WHERE Username=@userName";

                    dbConnection.Open();
                    
                    using (SqlCommand cmd = new SqlCommand(queryResume, dbConnection))
                    {
                        cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = userName;

                        SqlDataAdapter sdr = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sdr.Fill(dt);
                        gvDisplay.DataSource = dt;
                        gvDisplay.DataBind();


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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            

            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];

            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try
                {
                    ltError.Text = "";
                    dbConnection.Open();
                    string username = Session["Username"].ToString();
                    string firstName = txtFirstName.Text;
                    string lastName = txtLastName.Text;
                    string email = txtEmail.Text;
                    string password = txtPassword.Text;

                    string sql1 = "";
                    string sql2 = "";

                    if((bool)Session["isStudent"])
                    {
                        sql1 = string.Format("UPDATE Student SET Student.FirstName=@FirstName, Student.LastName=@LastName, Student.Email=@Email " +
                        "FROM Student INNER JOIN StudentUser " +
                        "ON Student.StudentID=StudentUser.StudentID AND StudentUser.Username = '" + username + "'");

                        sql2 = string.Format("UPDATE StudentUser SET StudentUser.Password=@Password FROM StudentUser " +
                           "INNER JOIN Student ON StudentUser.StudentID=Student.StudentID WHERE StudentUser.UserName='" + username + "'");
                    }
                    else if ((bool)Session["isMember"])
                    {
                        sql1 = string.Format("UPDATE Member SET Member.FirstName=@FirstName, Member.LastName=@LastName, Member.Email=@Email " +
                            "FROM Member INNER JOIN MemberUser " +
                            "ON Member.MemberID=MemberUser.MemberID AND MemberUser.UserName = '" + username + "'");
                        sql2 = string.Format("UPDATE MemberUser SET MemberUser.Password=@Password FROM MemberUser " +
                            "INNER JOIN Member ON MemberUser.MemberID=Member.MemberID WHERE MemberUser.UserName= '" + username + "'");
                    }


                    SqlCommand cmd1 = new SqlCommand(sql1, dbConnection);
                    SqlCommand cmd2 = new SqlCommand(sql2, dbConnection);
                    cmd1.Parameters.AddWithValue("@FirstName", firstName);
                    cmd1.Parameters.AddWithValue("@LastName", lastName);
                    cmd1.Parameters.AddWithValue("@Email", email);
                    cmd2.Parameters.AddWithValue("@Password", password);

                    cmd1.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    BindDataList();

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
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPassword.Text = "";

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton linkDownload = sender as LinkButton;
            GridViewRow gridRow = linkDownload.NamingContainer as GridViewRow;
            string downloadFile = gvDisplay.DataKeys[gridRow.RowIndex].Value.ToString();
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + downloadFile + "\"");
            Response.TransmitFile(Server.MapPath(downloadFile));
            Response.End();
        }
    }
}