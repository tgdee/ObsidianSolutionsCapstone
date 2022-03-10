﻿using System;
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
    public partial class _Default : Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                DisplayGvStudent();
            }
        }

        protected void DisplayGvStudent()
        {
            
            try
            {
                string searchQuery = "SELECT * FROM Student";

                SqlCommand cmd = new SqlCommand(searchQuery, con);

                con.Open();

                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter();

                da.SelectCommand = cmd;

                DataSet ds = new DataSet();

                da.Fill(ds, "StudentID");
                da.Fill(ds, "Username");
                da.Fill(ds, "FirstName");
                da.Fill(ds, "LastName");
                da.Fill(ds, "Grade");
                da.Fill(ds, "GraduationYear");
                da.Fill(ds, "Major");
                da.Fill(ds, "PhoneNumber");
                da.Fill(ds, "Email");

                ViewState["ds"] = ds;

                gvStudent.DataSource = ds;

                gvStudent.DataBind();



                gvStudent.HeaderRow.Cells[1].Visible = false;



                for (int i = 0; i < gvStudent.Rows.Count; i++)       // Check if gridview member has rows and if it does hide the member id header and row cells
                {
                    gvStudent.Rows[i].Cells[1].Visible = false;
                }

            }
            catch (SqlException ex)
            {
                ltError.Text = ex.Message;
            }
        }



        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = "SELECT * FROM UserLogin WHERE(FirstName like '%' + @FirstName + '%' or LastName like '&' + @LastName + '%' or Username like '&' + @Username + '%'" +
                "or Email like '&' + @Email + '%') AND AccountState = @AccountState AND AccountType='Student'";
            SqlCommand cmd = new SqlCommand(searchQuery, con);
            cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 20).Value = txtFirstNameSearch.Text;
            cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 30).Value = txtLastName.Text;
            cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 20).Value = txtUserNameSearch.Text;
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = txtEmailSearch.Text;
            cmd.Parameters.Add("@AccountState", SqlDbType.NVarChar, 10).Value = ddlAccountState.SelectedItem.Text;


            con.Open();
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();

            da.Fill(ds, "FirstName");
            da.Fill(ds, "LastName");
            da.Fill(ds, "Username");
            da.Fill(ds, "Email");
            da.Fill(ds, "AccountState");
            ViewState["ds"] = ds;
            gvSearch.DataSource = da;

            gvSearch.DataBind();
            if(gvSearch.Rows.Count == 1)
            {
                gvSearch.HeaderRow.Cells[1].Visible = false;
                gvSearch.Rows[0].Cells[1].Visible = false;          
            }

            con.Close();

            
        }




        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];


            using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {

                try
                {
                    string insertString = "INSERT INTO Student (FirstName,LastName,Grade,GraduationYear,Major,PhoneNumber,Email) " +
                        " VALUES (@param1, @param2, @param3, @param4, @param5, @param6, @param7)";

                    dbConnection.Open();

                    using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
                    {
                        string firstName = txtFirstName.Text;
                        string lastName = txtLastName.Text;
                        string grade = txtGradeBox.Text;
                        int graduationYear = Int32.Parse(txtGradYear.Text);
                        string major = txtMajorBox.Text;
                        string phoneNumber = txtPNumber.Text;
                        string email = txtEmailBox.Text;


                        cmd.Parameters.Add("@param1", SqlDbType.NVarChar, 50).Value = firstName;
                        cmd.Parameters.Add("@param2", SqlDbType.NVarChar, 50).Value = lastName;
                        cmd.Parameters.Add("@param3", SqlDbType.NVarChar, 50).Value = grade;
                        cmd.Parameters.Add("@param4", SqlDbType.Int).Value = graduationYear;
                        cmd.Parameters.Add("@param5", SqlDbType.NVarChar, 50).Value = major;
                        cmd.Parameters.Add("@param6", SqlDbType.NVarChar, 50).Value = phoneNumber;
                        cmd.Parameters.Add("@param7", SqlDbType.NVarChar, 50).Value = email;




                        cmd.ExecuteNonQuery();

                        Response.Redirect("~/Student.aspx");

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



        protected void gvStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvStudent.SelectedRow;        // Makes a gridview row equal to the selected row of gvStudent

            string studentId = row.Cells[1].Text;        // Stores the student id in Session for use on Student Information page

            Session["StudenID"] = studentId;

            Response.Redirect("~/StudentInformation.aspx");         // Redirect to student information page
        }

        protected void gvSearch_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvSearch.SelectedRow;

            lblSelectedStudent.Text = "Currently Selected Student: " + row.Cells[2].Text + " " + row.Cells[3].Text;

            DisplayResume();
        }


        protected void lbDownloadResume_Click(object sender, EventArgs e)
        {
            //LinkButton linkDownload = sender as LinkButton;
            //GridViewRow gridRow = linkDownload.NamingContainer as GridViewRow;
            //string downloadFile = gvDisplay.DataKeys[gridRow.RowIndex].Value.ToString();
            //Response.AddHeader("Content-Disposition", "attachment;filename=\"" + downloadFile + "\"");
            //Response.TransmitFile(Server.MapPath(downloadFile));
            //Response.End();
        }

        protected void DisplayResume()
        {

            try
            {

                string userName = Session["Username"].ToString();

                string queryResume = "SELECT FileName, FileLocation FROM Resume WHERE Username=@userName";      // Find the current username of whomever is signed in

                con.Open();

                using (SqlCommand cmd = new SqlCommand(queryResume, con))
                {
                    cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = userName;

                    SqlDataAdapter sdr = new SqlDataAdapter(cmd);               // Fill SqlDataAdapter using SELECT query
                    DataTable dt = new DataTable();
                    sdr.Fill(dt);                                               // Fill the data table using SqlDataAdapter
                    



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


    }
}
