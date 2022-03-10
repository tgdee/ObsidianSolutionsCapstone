<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Lab3._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
    <asp:Label ID="Label11" runat="server" Text="Grade"></asp:Label>
    &nbsp
    <asp:TextBox ID="txtGrade" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Graduation Year"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtGraduationYear" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Major"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtMajor" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Phone Number"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtPhoneNumber" runat="server" ValidationGroup="1"></asp:TextBox>
    
    <br />
    <br />
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" />
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
                    <asp:LinkButton ID="lbViewPDF" runat="server" Text="View Resume" ValidationGroup="ViewPDF" OnClientClick="openInNewTab()" OnClick="lbViewPDF_Click">View Resume</asp:LinkButton>
                    <script type="text/javascript">
                        function openInNewTab() {
                            window.document.forms[0].target = '_blank';
                            setTimeout(function () { window.document.forms[0].target = ''; }, 0);
                        }
                    </script>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <br />
    <br />



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
