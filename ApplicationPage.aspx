<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationPage.aspx.cs" Inherits="Lab3.ApplicationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            OSAG Application Page
        </div>
    </form>
    First Name:
    &nbsp
    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
    <br />
    Last Name:
    &nbsp
    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
    <br />
    <br />
    500 Word Essay: Describe your concept of diversity, and what experiences have you had that inform your thoughts.
    <br />
    <br />
    <asp:TextBox ID="txtApplication" runat="server" Height="397px" Width="733px"></asp:TextBox>
    <br />
    <br />
    Upload Resume:
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
    <asp:FileUpload ID="fuResume" runat="server" />
    <br />
    <br />
    Upload Transcript:
    &nbsp&nbsp&nbsp
    <asp:FileUpload ID="fuTranscript" runat="server" />
    <br />
    <br />
    <asp:Button ID="BtnApplication" runat="server" Text="Submit Application" OnClick="BtnApplication_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</body>
</html>
