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
    public partial class BrowseStudentOpportunities : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        

        protected void Page_Load(object sender, EventArgs e)
        {
            // Upon first page load add all the data from the Opportunity table into the ListView
            if (!Page.IsPostBack)
            {
                con.Open();
                string cmd = "SELECT [Title], [Type], [City], [State], [Deadline], [Link], [Industry], [CorpName] FROM [Opportunity] ORDER BY [OpportunityID]";

                SqlDataAdapter da = new SqlDataAdapter(cmd, con);

                DataSet ds = new DataSet();

                da.Fill(ds, "table");
                lvStudentOpportunities.DataSource = ds.Tables["table"];
                lvStudentOpportunities.DataBind();
                con.Close();
            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            con.Open();

            string typeParam = "";
            string industryParam = "";
            string corpNameParam = "";
            string cityParam = "";
            string stateParam = "";

            // Create cmd string NOT including the columns which can be selected using a drop down list
            string cmd = "SELECT Title, Type, City, State, Industry, Deadline, CorpName, Link FROM Opportunity WHERE ((Title LIKE '%' + @title + '%') OR (Deadline LIKE '%' + @deadLine + '%')";

            // Check which ddls are not being used and add the correct text and set the params. This is done first so the query is correctly built with the ANDs coming last
            if (ddlType.SelectedValue.Equals("0"))
            {
                cmd += " OR (Type LIKE '%' + @type + '%')";
                typeParam = txtSearch.Text;
            }

            if (ddlIndustry.SelectedValue.Equals("0"))
            {
                cmd += " OR (Industry LIKE '%' + @industry + '%')";
                industryParam = txtSearch.Text;
            }

            if (ddlEmployer.SelectedValue.Equals("0"))
            {
                cmd += " OR (CorpName LIKE '%' + @corpName + '%')";
                corpNameParam = txtSearch.Text;
            }

            if (ddlCity.SelectedValue.Equals("0"))
            {
                cmd += "OR (City LIKE '%' + @city + '%')";
                cityParam = txtSearch.Text;
            }

            if (ddlState.SelectedValue.Equals("0"))
            {
                cmd += "OR (State LIKE '%' + @state + '%')";
                stateParam = txtSearch.Text;
            }
 

            // Add the ending ) after LIKEs but before the ANDs
            cmd += ")";

            // Check which ddls are being used and add the ANDs and set the params.
            if (!ddlType.SelectedValue.Equals("0"))
            {
                cmd += " AND (Type = @type)";
                typeParam = ddlType.SelectedItem.Text;
            }

            if (!ddlIndustry.SelectedValue.Equals("0"))
            {
                cmd += " AND (Industry = @industry)";
                industryParam = ddlIndustry.SelectedItem.Text;
            }

            if (!ddlEmployer.SelectedValue.Equals("0"))
            {
                cmd += " AND (CorpName = @corpName)";
                corpNameParam = ddlEmployer.SelectedItem.Text;
            }

            if (!ddlCity.SelectedValue.Equals("0"))
            {
                cmd += "AND (City = @city)";
                cityParam = ddlCity.SelectedItem.Text;
            }

            if (!ddlState.SelectedValue.Equals("0"))
            {
                cmd += "AND (State = @state)";
                stateParam = ddlState.SelectedItem.Text;
            }



            SqlDataAdapter da = new SqlDataAdapter(cmd, con);



            da.SelectCommand.Parameters.AddWithValue("@title", txtSearch.Text);
            da.SelectCommand.Parameters.AddWithValue("@deadLine", txtSearch.Text);

            da.SelectCommand.Parameters.AddWithValue("@city", cityParam);
            da.SelectCommand.Parameters.AddWithValue("@state", stateParam);
            da.SelectCommand.Parameters.AddWithValue("@type", typeParam);
            da.SelectCommand.Parameters.AddWithValue("@industry", industryParam);
            da.SelectCommand.Parameters.AddWithValue("@corpName", corpNameParam);



            DataSet ds = new DataSet();
            da.Fill(ds, "table");

            lvStudentOpportunities.DataSource = ds.Tables["table"];
            lvStudentOpportunities.DataBind();
            con.Close();
        }

    }
}