<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumeUpload.aspx.cs" Inherits="Lab3.ResumeUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Upload Resume</h1>
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload File" OnClick="btnUpload_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnReturn" runat="server" Text="<- Previous Page"  OnClick="btnReturn_Click" />
            <br />
        </div>
    </form>
</body>
</html>
