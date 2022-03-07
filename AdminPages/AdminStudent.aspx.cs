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
    public partial class AdminStudent : Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

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
            gvSearch.DataSource = ds;

            gvSearch.DataBind();

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

        }

        protected void gvSearch_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
        }
    }
}