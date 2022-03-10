<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Lab3._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <h1>Student Information Page</h1>
    <h4>
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </h4>
    
    <h3>Search Student</h3>
    <asp:Label ID="Label8" runat="server" Text="First Name"></asp:Label>
    &nbsp
    <asp:TextBox ID="txtFirstNameSearch" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label9" runat="server" Text="Last Name"></asp:Label>
    &nbsp
    <asp:TextBox ID="txtLastNameSearch" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label14" runat="server" Text="Username"></asp:Label>
    &nbsp&nbsp
    <asp:TextBox ID="txtUserNameSearch" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label10" runat="server" Text="Email"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtEmailSearch" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label11" runat="server" Text="Account State:"></asp:Label>
    &nbsp
    <asp:DropDownList ID="ddlAccountState" runat="server">
        <asp:ListItem Text="Approved" Value="1"></asp:ListItem>
        <asp:ListItem Text="Unapproved" Value="2"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" />
    <br />
    <br />




    <asp:GridView ID="gvSearch" runat="server" OnSelectedIndexChanged="gvSearch_SelectedIndexChanged" EmptyDataText="Student Record Not Found" OnRowCreated="gvSearch_RowCreated">
        <Columns>
            <asp:CommandField ShowSelectButton="true" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="lblSelectedStudent" runat="server" ></asp:Label>


    <br />
    <br />

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <asp:GridView ID="gvStudent" runat="server" OnSelectedIndexChanged="gvStudent_SelectedIndexChanged" Width="500px" EmptyDataText="Student Record Not Found">
        <Columns>
            <asp:CommandField ShowSelectButton="true" />
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbDownloadResume" runat="server" Text="Load Resume" ValidationGroup="DisplayResumeValidation" OnClick="lbDownloadResume_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <asp:Label ID="LblFirstName" runat="server" Text="First Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtFirstName" runat="server" placeholder="Enter First Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfFirst" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="LblLastName" runat="server" Text="Last Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtLastName" runat="server" placeholder="Enter Last Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfLast" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblGrade" runat="server" Text="Grade"></asp:Label>
    <br />
    <asp:TextBox ID="txtGradeBox" runat="server" placeholder="Grade"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfGrade" runat="server" ControlToValidate="txtGradeBox" ErrorMessage="Enter Grade" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="LblGradYear" runat="server" Text="Graduation Year"></asp:Label>
    <br />
    <asp:TextBox ID="txtGradYear" runat="server" placeholder="Enter Graduation Year"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfGraduationYear" runat="server" ControlToValidate="txtGradYear" ErrorMessage="Enter Grad Year" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblMajor" runat="server" Text="Major"></asp:Label>
    <br />
    <asp:TextBox ID="txtMajorBox" runat="server" placeholder="Enter Major"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfMajor" runat="server" ControlToValidate="txtMajorBox" ErrorMessage="Enter Grade" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblNumber" runat="server" Text="Phone Number"></asp:Label>
    <br />
    <asp:TextBox ID="txtPNumber" runat="server" placeholder="Enter Phone Number"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfPNumber" runat="server" ControlToValidate="txtPNumber" ErrorMessage="Enter Number" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
    <br />
    <asp:TextBox ID="txtEmailBox" runat="server" placeholder="Enter Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfEmail" runat="server" ControlToValidate="txtEmailBox" ErrorMessage="Enter Email" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
     <asp:Button ID="btnAddRow" runat="server" Text="Add New Row" CssClass="btn btn-primary" OnClick="btnAddRow_Click" />
       
</asp:Content>
