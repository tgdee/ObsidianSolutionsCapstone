<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Lab3._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <br />
    <br />
    <div class="container my-5">
        <div class="jumbotron border">
            <div class="row">
                <div class="col-xs-offset-2 col-xs-8">
                    <h1 class="display-4">Student Information</h1>
                </div>
                <div class="col-xs-2">
                    <%--<img class="img-thumbnail" src="/images/logo_transparent_background.jpg" />--%>
                </div>
            </div>
        </div>
    </div>
    <div>
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </div>

    <div class="container my-auto">
        <h4 class="display-6 ">Search Students</h4>
        <div class="row p-1">
            <div class="col">
                <label for="txtFirstNameSearch">First Name</label>
            </div>
            <div class="col">
                <label for="txtLastNameSearch">Last Name</label>
            </div>
            <div class="col">
                <label for="txtUserNameSearch">Username</label>
            </div>
            <div class="col">
                <label for="txtEmailSearch">Email</label>
            </div>
        </div>
        <div class="row p-1">
            <div class="col">
                <asp:TextBox ID="txtFirstNameSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtLastNameSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtUserNameSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtEmailSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
        </div>
        <div class="row p-0 pt-3">
            <div class="col">
                <label for="txtGradeSearch">Grade</label>
            </div>
            <div class="col">
                <label for="txtGraduationYear">Graduation Year</label>
            </div>
            <div class="col">
                <label for="txtMajor">Major</label>
            </div>
            <div class="col">
                <label for="txtPhoneNumber">Phone Number</label>
            </div>
        </div>
        <div class="row p-1">
            <div class="col">
                <asp:TextBox ID="txtGrade" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtGraduationYear" class="form-control" runat="server" placeholder="YYYY" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtMajor" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtPhoneNumber" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
        </div>
        <div class="row p-1 pt-2">
            <div class="col">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" class="btn btn-success"/>
            </div>
        </div>
    </div>
            

            

                
               
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
                        /*Used some javascript to open a new window. Need to find a different way to do this cus if the student has no resume it opens a duplicate page*/
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
