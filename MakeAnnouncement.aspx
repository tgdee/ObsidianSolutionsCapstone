<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="MakeAnnouncement.aspx.cs" Inherits="Lab3.MakeAnnouncement" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Make an Announcement</title>
        <link href="StyleSheet.css" rel="stylesheet">
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <link href="CustomButtons.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <style>
            div {
                text-align:center;
            }
        </style>
        <div class="bg-image" style="background-image: url(/images/faded%20background.png); margin-top: 0px; background-size: cover">
            <div class="container my-auto">
                <div class="jumbotron">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-offset-2 col-xs-8">
                                <h1 class="display-4" style="color: #78518f">Create Announcement</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <div class="form-group">
            <label for="txtSubject" class="col-form">Subject</label>
            <br />
            <asp:TextBox ID="txtSubject" class="form-control" placeholder="Enter Subject" Width="99%" CssClass="align-content-center" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtMessage" class="col-form-label">Message</label>
            <br />
            <asp:TextBox ID="txtMessage" class="form-control" TextMode="MultiLine" Rows="10" Width="99%" CssClass="align-content-center" placeholder="Enter message here" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnSendMessage" runat="server" Text="Post" OnClick="btnSendMessage_Click" class="customPurpleButton" />
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblSent" runat="server" Text=""></asp:Label>
        </div>
        <script src="Scripts/jquery-3.6.0.slim.js"></script>
        <script src="Scripts/popper.min.js"></script>
        <script src="Scripts/bootstrap.bundle.min.js"></script>
    </body>
    </html>
</asp:Content>
