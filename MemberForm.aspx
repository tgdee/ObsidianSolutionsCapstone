<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="MemberForm.aspx.cs" Inherits="Lab3.MemberForm" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="CustomButtons.css" rel="stylesheet" type="text/css" />
    <div class="bg-image" style="background-image: url(/images/faded%20background.png); margin-top: 0px; background-size: cover">
        <div class="container my-auto">
            <div class="jumbotron">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-offset-2 col-xs-8">
                            <h1 class="display-4" style="color: #78518f">Message a Student</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row p-1">
        <div class="col">
            <label for="txtFirstName" class="form-label">First Name</label>
            <asp:TextBox ID="txtFirstName" class="form-control" placeholder="John" runat="server"></asp:TextBox>
        </div>
        <div class="col">
            <label for="txtLastName" class="col-form-label">Last Name</label>
            <asp:TextBox ID="txtLastName" class="form-control" placeholder="Doe" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
    </div>
    <div class="row p-1">
        <div class="col">
            <label for="txtStudentFirstName" class="col-form-label">Student First name</label>
            <asp:TextBox ID="txtStudentFirstName" class="form-control"  placeholder="John" runat="server"></asp:TextBox>
        </div>
        <div class="col">
            <label for="txtStudentLastName" class="col-form-label">Student Last name</label>
            <asp:TextBox ID="txtStudentLastName" class="form-control" placeholder="Doe" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label for="txtSubject" class="col-form">Subject</label>
        <asp:TextBox ID="txtSubject" class="form-control" placeholder="Subject" Columns="10" runat="server"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="txtMessage" class="col-form-label">Message</label>
        <asp:TextBox ID="txtMessage" class="form-control" TextMode="MultiLine" Rows="10" Columns="10" placeholder="Enter message here" runat="server"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Button ID="btnSendMessage" runat="server" Text="Send" OnClick="btnSendMessage_Click" class="customPurpleButton" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="true" ForeColor="Red" class="form-label"></asp:Label>
    </div>
    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
