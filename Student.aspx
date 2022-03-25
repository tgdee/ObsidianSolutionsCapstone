<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Lab3._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <br />
    <br />
    <h1>Student Information Page</h1>
    <h4>
        <br />
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </h4>
    <div class="container">
        <div class="row row-cols-4">
            <section class="col">
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
                <br />
                &nbsp
                <asp:TextBox ID="txtGrade" runat="server" ValidationGroup="1"></asp:TextBox>
                <br />
                <asp:Label ID="lblGraduationYear" runat="server" Text="Graduation Year"></asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:TextBox ID="txtGraduationYear" runat="server" placeholder="YYYY" ValidationGroup="1"></asp:TextBox>
                <br />
                <asp:Label ID="Label12" runat="server" Text="Major"></asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:TextBox ID="txtMajor" runat="server" ValidationGroup="1"></asp:TextBox>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Phone Number"></asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:TextBox ID="txtPhoneNumber" runat="server" ValidationGroup="1"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" class="btn.success"/>
            </section>
        </div>
    </div>
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
                        /*Used some javascript to open a new window... Could probably find a different way to do this but i think its pretty neat at least thats what my mom said*/
                    </script>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</asp:Content>
