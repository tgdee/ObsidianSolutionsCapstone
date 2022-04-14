using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;


namespace Lab3
{
    public partial class _Default : Page
    {
        readonly SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            // Load the gridview with all student information upon first page load
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

                SqlDataAdapter da = new SqlDataAdapter
                {
                    SelectCommand = cmd
                };

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


                // Check if gridview member has rows and if it does hide the member id header and row cells and change headers

                for (int i = 0; i < gvStudent.Rows.Count; i++)       
                {
                    gvStudent.HeaderRow.Cells[2].Visible = false;
                    gvStudent.Rows[i].Cells[2].Visible = false;
                    gvStudent.HeaderRow.Cells[4].Text = "First Name";
                    gvStudent.HeaderRow.Cells[5].Text = "Last Name";
                    gvStudent.HeaderRow.Cells[7].Text = "Graduation Year";
                    gvStudent.HeaderRow.Cells[9].Text = "Phone Number";

                }

                con.Close();

            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }
        }




    protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {

                using (SqlCommand command = new SqlCommand("dbo.spSearchStudentInfo", con) { CommandType = CommandType.StoredProcedure })  // Use stored procedure because it does not work in code
                {
                    command.Parameters.Add("@FirstName", SqlDbType.NVarChar, 20).Value = txtFirstNameSearch.Text;
                    command.Parameters.Add("@LastName", SqlDbType.NVarChar, 30).Value = txtLastNameSearch.Text;
                    command.Parameters.Add("@Username", SqlDbType.NVarChar, 20).Value = txtUserNameSearch.Text;
                    command.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = txtEmailSearch.Text;
                    command.Parameters.Add("@Grade", SqlDbType.NVarChar, 10).Value = txtGrade.Text;
                    command.Parameters.Add("@GraduationYear", SqlDbType.NVarChar, 4).Value = txtGraduationYear.Text;
                    command.Parameters.Add("@Major", SqlDbType.NVarChar, 50).Value = txtMajor.Text;
                    command.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar, 10).Value = txtPhoneNumber.Text;

                    con.Open();


                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);               // Fill a data adapter with data gathered from stored procedure

                    DataTable dt = new DataTable();

                    dataAdapter.Fill(dt);                                                   // Fill a datatable

                    gvStudent.DataSource = dt;                                              // Set the gridview's datasource to the filled datatable

                    gvStudent.DataBind();                                                   // Bind the gridviews datasource data with the displayed gridview

                }


            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }
           


            for (int i = 0; i < gvStudent.Rows.Count; i++)       // Check if gridview member has rows and if it does hide the member id header and row cells on every row
            {
                gvStudent.HeaderRow.Cells[2].Visible = false;
                gvStudent.Rows[i].Cells[2].Visible = false;
            }

            con.Close();

        }

        // Commented this method out because it seems like it is obsolete under the new design on the user's creating their accounts and then waiting for approval

        //protected void btnAddRow_Click(object sender, EventArgs e)
        //{
        //    var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Lab3"];


        //    using (SqlConnection dbConnection = new SqlConnection(connectionFromConfiguration.ConnectionString))
        //    {

        //        try
        //        {
        //            string insertString = "INSERT INTO Student (FirstName,LastName,Grade,GraduationYear,Major,PhoneNumber,Email) " +
        //                " VALUES (@param1, @param2, @param3, @param4, @param5, @param6, @param7)";

        //            dbConnection.Open();

        //            using (SqlCommand cmd = new SqlCommand(insertString, dbConnection))
        //            {
        //                string firstName = txtFirstName.Text;
        //                string lastName = txtLastName.Text;
        //                string grade = txtGradeBox.Text;
        //                int graduationYear = Int32.Parse(txtGradYear.Text);
        //                string major = txtMajorBox.Text;
        //                string phoneNumber = txtPNumber.Text;
        //                string email = txtEmailBox.Text;


        //                cmd.Parameters.Add("@param1", SqlDbType.NVarChar, 50).Value = firstName;
        //                cmd.Parameters.Add("@param2", SqlDbType.NVarChar, 50).Value = lastName;
        //                cmd.Parameters.Add("@param3", SqlDbType.NVarChar, 50).Value = grade;
        //                cmd.Parameters.Add("@param4", SqlDbType.NVarChar, 4).Value = graduationYear;
        //                cmd.Parameters.Add("@param5", SqlDbType.NVarChar, 50).Value = major;
        //                cmd.Parameters.Add("@param6", SqlDbType.NVarChar, 50).Value = phoneNumber;
        //                cmd.Parameters.Add("@param7", SqlDbType.NVarChar, 50).Value = email;




        //                cmd.ExecuteNonQuery();

        //                Response.Redirect("~/Student.aspx");

        //            }
        //        }
        //        catch (SqlException ex)
        //        {
        //            lblMessage.Text = ex.Message;
        //        }
        //        finally
        //        {
        //            dbConnection.Close();
        //            dbConnection.Dispose();

        //        }


        //    }
        //}         // Commented this out because now that u



        protected void gvStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvStudent.SelectedRow;        // Makes a gridview row equal to the selected row of gvStudent

            string studentId = row.Cells[2].Text;        // Stores the student id in Session for use on Student Information page
            string studentUserName = row.Cells[3].Text;

            Session["StudentUserName"] = studentUserName;
            Session["StudentID"] = studentId;

            Response.Redirect("~/StudentInformation.aspx");         // Redirect to student information page
        }



        protected void lbViewPDF_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;                       // Get the row of the clicked on link button

            string studentId = clickedRow.Cells[2].Text;

            try
            {
                string queryResume = "SELECT FileLocation FROM Resume WHERE StudentID=@studentId";

                connection.Open();

                string fileLocation = "";

                using (SqlCommand cmd = new SqlCommand(queryResume, connection))
                {
                    cmd.Parameters.Add("StudentID", SqlDbType.NVarChar, 20).Value = studentId;

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())                                               // Check if theres a file to read before reading it
                        {
                            fileLocation = reader["FileLocation"].ToString();
                            string filePath = Server.MapPath(fileLocation);

                            WebClient user = new WebClient();                               // Use WebClient to send data to new URL

                            Byte[] fileBuffer = user.DownloadData(filePath);                // Get the bytes of the users resume

                            if (fileBuffer != null)
                            {
                                Response.ContentType = "application/pdf";                                       // Specify opening a resume
                                Response.AddHeader("Content-Disposition", "inline; filename=" + filePath);      // Specify file name to HTTP
                                Response.AddHeader("content-length", fileBuffer.Length.ToString());
                                Response.BinaryWrite(fileBuffer);                                               // Write the binary to HTTP

                            }
                            else
                            {
                                lblMessage.Text = "No Resume Available For Selected Student";
                            }
                        }

                    }
                    else
                    {
                        lblMessage.Text = "No Resume Available For Selected Student";
                    }

                    reader.Close();
                    connection.Close();

                }

            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }


        }

    }
}
