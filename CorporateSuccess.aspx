<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorporateSuccess.aspx.cs" Inherits="Lab3.CorporateSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvCorporateSuccess" runat="server" 
                DataSource="SqlDataSource1" AllowSorting="true" AutoGenerateColumns="true">
                <Columns>
                    <asp:BoundField ReadOnly="true" HeaderText="CorporateSponsor" DataField="CorporateSponsor" SortExpression="CorporateSponsor" />
                     <asp:BoundField DataField="Introductions" HeaderText="Introductions" SortExpression="Introductions" />
                    <asp:BoundField DataField="Applied" HeaderText="Applied" SortExpression="Applied" />
                    <asp:BoundField DataField="Interviewed" HeaderText="Interviewed" SortExpression="Interviewed" />
                    <asp:BoundField DataField="Offer" HeaderText="Offer" SortExpression="Offer" />
                    <asp:BoundField DataField="Acceptance" HeaderText="Acceptance" SortExpression="Acceptance" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="" 
            SelectCommand="SELECT * FROM CorporateSuccess">
        </asp:SqlDataSource>
    </form>
</body>
</html>
