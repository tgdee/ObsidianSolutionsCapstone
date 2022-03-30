<%@ Page Title="" Language="C#" MasterPageFile="~/AccountCreationMaster.Master" AutoEventWireup="true" CodeBehind="AccountCreation.aspx.cs" Inherits="Lab3.AccountCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>OSAG Account Creation Page</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="CustomButtons.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
        <div class="container my-5">
            <div class="jumbotron">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-offset-2 col-xs-8">
                            <h1 class="display-4" style="color: #7b38d8">Create Account</h1>
                        </div>
                        <div class="col-xs-2">
                            <img class="img-thumbnail" src="/images/logo_transparent_background.jpg" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Literal ID="ltError" runat="server" Text=""></asp:Literal>
            </div>
            <div class="form-group">
                <label for="ddlAccountType">Account Type</label>
                <asp:DropDownList ID="ddlAccountType" class="form-control" runat="server">
                    <asp:ListItem Text="Alum" Value="N"></asp:ListItem>
                    <asp:ListItem Text="Student" Value="Y"></asp:ListItem>
                    
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtFirstName" class="form-label">First Name</label>
                <asp:TextBox ID="txtFirstName" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqfFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="txtLastName" class="col-form-label">Last Name</label>
                <asp:TextBox ID="txtLastName"  class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqfLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="txtUserName" class="form-label">User Name</label>
                <asp:TextBox ID="txtUserName" class="form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rqfUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="Enter Username" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email address</label>
                <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqfEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Email" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                <small id="emailHelp" class="form-text text-muted">Use your JMU email if you have one.</small>
            </div>
            <div class="form-group">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqfPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Panel ID="pnlTextBox" runat="server" Visible="false">
                </asp:Panel>
            </div>
            <div class="form-group">
                <label for="txtGrade" class="form-label">Grade Level (Students Only)</label>
                <asp:TextBox ID="txtGrade" class="form-control" runat="server"></asp:TextBox>
            </div> 
            <div class="form-group">
                <label for="txtGraduationYear" class="form-label">Graduation Year (Students Only)</label>
                <asp:TextBox ID="txtGraduationYear" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtMajor" class="form-label">Major (Students Only)</label>
                <asp:TextBox ID="txtMajor" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPhoneNumber" class="form-label">Phone Number (Students Only)</label>
                <asp:TextBox ID="txtPhoneNumber" class="form-control" runat="server"></asp:TextBox>
               
            </div>
            <div class="form-group">
                <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
            </div>

   
    <div class="form-group">
    <asp:Button ID="btnReturn" runat="server" Text="Previous Page <-" OnClick="btnRetur_Click" ValidationGroup="vdGroup" />


            </div>
            </div>
            
        
    
    
    
   <%-- <h4>Create New Account </h4>
    <br />
    <asp:Literal ID="ltError" runat="server" Text=""></asp:Literal>
    <br />
    <br />
    <asp:Label ID="lblAccountType" runat="server" Text="Account Type: "></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:DropDownList ID="ddlAccountType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAccountType_SelectedIndexChanged">
        <asp:ListItem Text="Alum" Value="N"></asp:ListItem>
        <asp:ListItem Text="Student" Value="Y"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtFirstName" runat="server" placeholder="Enter First Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtLastName" runat="server" placeholder="Enter Last Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblUserName" runat="server" Text="Username:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter Username"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="Enter Username" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Email" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Panel ID="pnlTextBox" runat="server" Visible="false">
    Grade:
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtGrade" runat="server" placeholder="Enter Grade" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqfGrade" runat="server" ControlToValidate="txtGrade" ErrorMessage="Enter Grade" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
        <br />
        <br />
    Graduation Year:
    <asp:TextBox ID="txtGraduationYear" runat="server" placeholder="Enter Year"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqfGraduationYear" runat="server" ControlToValidate="txtGraduationYear" ErrorMessage="Enter Year" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
        <br />
        <br />
    Major:
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtMajor" runat="server" placeholder="Enter Major"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqfMajor" runat="server" ControlToValidate="txtMajor" ErrorMessage="Enter Major" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
        <br />
        <br />
    Phone Number:
        &nbsp
    <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="1231231234"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqfPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Enter Number" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
        <br />
        <br />
    </asp:Panel>



    <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
    <br />
    <br />
    <asp:Button ID="btnReturn" runat="server" Text="Previous Page <-" OnClick="btnRetur_Click" ValidationGroup="vdGroup" />--%>
</asp:Content>
