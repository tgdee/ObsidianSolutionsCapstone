﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendEmailTest.aspx.cs" Inherits="Lab3.SendEmailTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtEmailBody" runat="server"></asp:TextBox>
            <asp:Button ID="btnSendEmail" runat="server" Text="Send Email" OnClick="btnSendEmail_Click" />
        </div>
    </form>
</body>
</html>
