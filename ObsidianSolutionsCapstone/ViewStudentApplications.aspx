<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStudentApplications.aspx.cs" Inherits="Lab3.ViewStudentApplications" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Applications</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron text-center">
                <h1 class="display-4">View Applications</h1>
            </div>
            <asp:GridView ID="gvStudentApplications" class="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ApplicationID" DataSourceID="SqlDataSourceStudentApplications" OnSelectedIndexChanged="gvStudentApplications_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ApplicationID" HeaderText="ApplicationID" InsertVisible="False" ReadOnly="True" SortExpression="ApplicationID" Visible="False" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
                    <asp:BoundField DataField="ApplicationFileAddress" HeaderText="ApplicationFileAddress" SortExpression="ApplicationFileAddress" />
                    <asp:BoundField DataField="ResumeFileAddress" HeaderText="ResumeFileAddress" SortExpression="ResumeFileAddress" />
                    <asp:BoundField DataField="TranscriptFileAddress" HeaderText="TranscriptFileAddress" SortExpression="TranscriptFileAddress" />
                </Columns>
            </asp:GridView>
            
        </div>
    </form>
    <asp:SqlDataSource ID="SqlDataSourceStudentApplications" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" SelectCommand="SELECT * FROM [StudentApplication] ORDER BY [ApplicationID]"></asp:SqlDataSource>
</body>
<script src="Scripts/jquery-3.6.0.slim.js"></script>
<script src="Scripts/popper.min.js"></script>
<script src="Scripts/bootstrap.bundle.min.js"></script>
</html>
