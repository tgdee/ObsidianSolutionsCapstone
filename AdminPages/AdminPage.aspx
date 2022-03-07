<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Lab3.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Literal ID="ltError" Text="" runat="server"></asp:Literal>
            <asp:GridView ID="gvApprovedAccounts" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="UserAccounts" OnSelectedIndexChanged="gvApprovedAccounts_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="AccountType" HeaderText="AccountType" SortExpression="AccountType" />
                    <asp:BoundField DataField="AccountState" HeaderText="AccountState" SortExpression="AccountState" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblSelected" runat="server" Text=""></asp:Label>
            <br />
            <asp:Button ID="btnApprove" runat="server" Text="Approve/Unapprove" OnClick="btnApprove_Click" />
        </div>
        <br />
        <asp:Button ID="btnReturn" runat="server" Text="Previous Page <-" OnClick="btnReturn_Click" />
    </form>
    <asp:SqlDataSource ID="UserAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:AUTHConnectionString %>" DeleteCommand="DELETE FROM [UserLogin] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [UserLogin] ([FirstName], [LastName], [Username], [AccountType]) VALUES (@FirstName, @LastName, @Username, @AccountType)" SelectCommand="SELECT * FROM [UserLogin] ORDER BY [UserID]" UpdateCommand="UPDATE [UserLogin] SET [FirstName] = @FirstName, [LastName] = @LastName, [Username] = @Username, [AccountType] = @AccountType WHERE [UserID] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="AccountType" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="AccountType" Type="Int32" />
            <asp:Parameter Name="UserID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</body>
</html>

