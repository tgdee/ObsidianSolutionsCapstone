using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Lab3
{
    public partial class NewStudentProfile : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                LoadStudentData();
            }
            

        }

        protected void LoadStudentData()
        {

            con.Open();

            string sqlSelet = "SELECT * FROM Student WHERE Username=@userName";

            SqlCommand cmd = new SqlCommand(sqlSelet, con);

            cmd.Parameters.Add("@userName", SqlDbType.NVarChar, 20).Value = "goeketx";

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string fName = reader["FirstName"].ToString();
                    string lName = reader["LastName"].ToString();
                    string grade = reader["Grade"].ToString();
                    string gradYear = reader["GraduationYear"].ToString();
                    string major = reader["Major"].ToString();
                    string phoneNumber = reader["PhoneNumber"].ToString();
                    string email = reader["Email"].ToString();

                    lblFullName.Text = fName + " " + lName;
                    lblMajor.Text = major;
                    lblGradYear.Text = gradYear;
                    lblGrade.Text = grade;
                    lblPhoneNumber.Text = phoneNumber;
                    lblEmailAddress.Text = email;

                }
            }

            con.Close();


        }

        protected void CheckForEmptyData()
        {
            if ()

        }
    }
}