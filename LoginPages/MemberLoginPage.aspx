<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberLoginPage.aspx.cs" Inherits="Lab3.MemberLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <asp:Table ID="tblMemberLogin" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>
                        <asp:Label ID="lblTitle" runat="server" Text="DukeGroup Member Login"></asp:Label>
                    </asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="true" Font-Size="Larger"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="btnLogin" runat="server" Text="Login ->" OnClick="btnLogin_Click" />
            <br />
            <br />
            <asp:Button ID="btnReturn" runat="server" Text="Previous Page" OnClick="btnReturn_Click" />
        </div>
    </form>
</body>
</html>
