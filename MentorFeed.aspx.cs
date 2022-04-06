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
    public partial class MentorFeed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                con.Open();
                //string cmd = "SELECT [Title], [Type], [City], [State], [Deadline], [Link], [Industry], [CorpName] FROM [Opportunity] ORDER BY [OpportunityID]";
                string cmd = "SELECT OpportunityID, Title, Type+', '+City+', '+State+', '+Industry+', '+Link+', '+CorpName AS Info FROM Opportunity";
                SqlDataAdapter da = new SqlDataAdapter(cmd, con);

                DataSet ds = new DataSet();

                da.Fill(ds, "table");
                lvStudentOpportunities.DataSource = ds.Tables["table"];
                lvStudentOpportunities.DataBind();
                con.Close();
            }

        }
    }
}