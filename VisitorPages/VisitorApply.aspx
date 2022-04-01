<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitorApply.aspx.cs" Inherits="Lab3.VisitorPages.VisitorApply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Process</title>
     <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="CustomButtons.css" rel="stylesheet" type="text/css" />
</head>
<body class="bg-image" style="background-image:url(/images/faded%20background.png);margin-top:0px;background-size:cover">
    <form id="form1" runat="server">
        <div class="container my-5">
            <div class="jumbotron">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-offset-2 col-xs-8">
                            <h1 class="display-4" style="color: #7b38d8">Student Application Process</h1>
                        </div>
                        <div class="col-xs-2">
                            <img class="img-thumbnail" src="/images/logo_transparent_background.jpg" />
                        </div>
                    </div>
                </div>
            </div>
            </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-offset-2 col-xs-8">
                    <h2 class="display-4" style="color: #7b38d8">Information Needed to Apply:</h2>
                </div>
            </div>
            <div class="row">
                <h3 class="display-4">In order to recieve the full benefits that Ole School Alumni Group offers, each applicatant will be required to provide their full first and last name, a 500 word essay, an uploaded resume, and transcript. </h3>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-xs-offset-2 col-xs-8">
                    <h2 class="display-4" style="color: #7b38d8">Benefits of Applying With Ole School:</h2>
                </div>
            </div>
            <div class="row">
                <h3 class="display-4">Ole School offers mentoring and counsel to current students through our various services. We provide scholarship, internship, and job opportunities through our affiliated parteners in the business community. Additionally, we keep students updated on current events and opportunites so that they can take full advantage of their time in higher education.</h3>
            </div>
            <br />
            <br />
            <div class="row">
                <h2 class="display-4" style="color: #7b38d8">Ready To Apply Today?</h2>
            </div>
            <div class="row">
                <asp:Button ID="btnApply" runat="server" Text="Apply Now!" OnClick="btnApply_Click" />
            </div>
            <br />
            <br />
            <div class="row">
                <asp:Button ID="btnBack" runat="server" Text="<-- Return To Home Page" OnClick="btnBack_Click" />
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
