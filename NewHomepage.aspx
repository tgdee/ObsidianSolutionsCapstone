<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewHomepage.aspx.cs" Inherits="Lab3.NewHomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body class="bg-image" style="background-image:url(images/faded%20background.png);margin-top:0px;background-size:cover">
    <form id="form1" runat="server">
        <div class="col-lg-6 ">
                <ul class="nav justify-content-end">
                    <li class="nav-item pr-1">
                        <asp:LinkButton ID="lbLogin" OnClick="lbLogin_Click" class="btn btn-success" runat="server">Login / Sign Up</asp:LinkButton>
                    </li>
                    </ul>
            </div>
        <div>
        <asp:Panel runat="server" HorizontalAlign="Center">
        <br />
        <br />
        <br />        
        <h1>Ole School Alumni Group</h1>
        <asp:Image ID="Image1" runat="server" Height="200" Width="200" ImageUrl="~/images/logo.png" />
        <br />
        <br />
                
    </asp:Panel>
        </div>

    </form>
    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
