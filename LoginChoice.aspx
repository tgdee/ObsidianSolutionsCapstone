<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginChoice.aspx.cs" Inherits="Lab3.LoginChoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="tblLoginChoice" runat="server" >
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>
                        <asp:Label ID="lblHeader" runat="server" Text="Welcome to the Duke Group Login Page!" ></asp:Label>                    
                    </asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblUserStat" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <asp:Label ID="lblUsername" runat="server" Text="Username" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="LblPassword" runat="server" Text="Password" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            

            <asp:Button ID="btnGo" runat="server" Text="Login ->" OnClick="btnGo_Click" />
            <br />
            <br />
            <formview>
                <asp:Label ID="LblAccount" runat="server" Text="Don't have an account yet?" Font-Bold="true"></asp:Label>
                <br />
                <asp:Button ID="btnNewAccount" runat="server" Text="Create New Account" OnClick="btnNewAccount_Click" />
                <br />
                <asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="true" Font-Size="Larger"></asp:Label>
            </formview>
        </div>
    </form>
</body>
</html>
