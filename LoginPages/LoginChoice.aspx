<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginChoice.aspx.cs" Inherits="Lab3.LoginChoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <%--create the input boxes for the user--%>
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
                        <asp:Label ID="lblChoice" runat="server" Text="Are you a Student or Faculty Member?" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="btnStudent" runat="server" Text="Student" OnClick="btnStudent_Click"/>
            <asp:Button ID="btnMember" runat="server" Text="Member" OnClick="btnMember_Click"  />
        </div>
    </form>
</body>
</html>
