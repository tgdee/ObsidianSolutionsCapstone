x`<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationPage.aspx.cs" Inherits="Lab3.ApplicationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Application Page</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="CustomButtons.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-5">
            <div class="jumbotron">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-offset-2 col-xs-8">
                            <h1 class="display-4" style="color: #7b38d8">Student Application</h1>
                        </div>
                        <div class="col-xs-2">
                            <img class="img-thumbnail" src="/images/logo_transparent_background.jpg" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="txtFirstName" class="form-label">First Name</label>
                <asp:TextBox ID="txtFirstName" class="form-control" placeholder="John" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtLastName" class="col-form-label">Last Name</label>
                <asp:TextBox ID="txtLastName"  class="form-control" placeholder="Doe" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email address</label>
                <asp:TextBox ID="txtEmail" class="form-control" placeholder="name@example.com" runat="server"></asp:TextBox>
                <small id="emailHelp" class="form-text text-muted">Use your JMU email if you have one.</small>
            </div>
            <div class="form-group">
                <label for="ddlSelectGrade">Grade Level</label>
                <asp:DropDownList ID="ddlSelectGrade" class="form-control" runat="server">
                    <asp:ListItem Text="Freshman" Value="Freshman"></asp:ListItem>
                    <asp:ListItem Text="Sophomore" Value="Sophomore"></asp:ListItem>
                    <asp:ListItem Text="Junior" Value="Junior"></asp:ListItem>
                    <asp:ListItem Text="Senior" Value="Senior"></asp:ListItem>
                    <asp:ListItem Text="Transfer" Value="Transfer"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtEssay">500 Word Essay: Describe your concept of diversity, and what experiences you have had that inform your thoughts.</label>
                <asp:TextBox ID="txtEssayControl" class="form-control" TextMode="Multiline" Rows="10" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="fuResume">Upload Resume</label>
                <asp:FileUpload ID="fuResume" class="form-control-file" runat="server" />
                <small id="uploadResumeHelp" class="form-text text-muted">Format as PDF and less than 5MB.</small>
            </div>
            <div class="form-group">
                <label for="fuTranscript">Upload Transcript</label>
                <asp:FileUpload ID="fuTranscript" class="form-control-file" runat="server" />
                <small id="uploadTranscriptHelp" class="form-text text-muted">Format as PDF and less than 5MB.</small>
            </div>
            <div class="form-group">
            <asp:Button ID="BtnApplication" runat="server" Text="Submit" OnClick="BtnApplication_Click" class="customPurpleButton" />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
            </div>
    </form>
    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
