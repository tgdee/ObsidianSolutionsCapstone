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
        private ListView textListView = new ListView();
        

        protected void Page_Load(object sender, EventArgs e)
        {
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
            string cmd = "SELECT Title, Type, City, State, Industry, Deadline, CorpName, Link FROM  Opportunity WHERE (Title LIKE '%' + @title + '%') OR (Type LIKE '%' + @type + '%') OR (City LIKE '%' + @city + '%') OR (State LIKE '%' + @state + '%') OR (Industry LIKE '%' + @industry + '%') OR (Deadline LIKE '%' + @deadLine + '%') OR (CorpName LIKE '%' + @corpName + '%')";

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            da.SelectCommand.Parameters.AddWithValue("@title", txtSerach.Text);
            da.SelectCommand.Parameters.AddWithValue("@type", txtSerach.Text);
            da.SelectCommand.Parameters.AddWithValue("@city", txtSerach.Text);
            da.SelectCommand.Parameters.AddWithValue("@state", txtSerach.Text);
            da.SelectCommand.Parameters.AddWithValue("@industry", txtSerach.Text);
            da.SelectCommand.Parameters.AddWithValue("@deadLine", txtSerach.Text);
            da.SelectCommand.Parameters.AddWithValue("@corpName", txtSerach.Text);

            DataSet ds = new DataSet();
            da.Fill(ds, "table");

            lvStudentOpportunities.DataSource = ds.Tables["table"];
            lvStudentOpportunities.DataBind();
            con.Close();
        }

        protected void ListView()
        {
            try
            {
                string searchQuery = "SELECT Title, Type, City, State, Industry, Deadline, Link, CorpName FROM Opportunity";

                SqlCommand cmd = new SqlCommand(searchQuery, con);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.HasRows)
                {
                    while (reader.Read())
                    {

                    }
                }

                

                

                
                

            }
            catch (SqlException ex)
            {

            }

        }
    }
}