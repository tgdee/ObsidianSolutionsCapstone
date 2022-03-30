<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentInformation.aspx.cs" Inherits="Lab3.StudentInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
        <div class="main-body">

            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="main-breadcrumb pt-3">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Homepage.aspx">Home</a></li>
                    <li class="breadcrumb-item"><a href="Student.aspx">Student</a></li>
                    <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex flex-column align-items-center text-center">
                                <img src="https://via.placeholder.com/150" alt="Admin" class="rounded-circle" width="150" />
                                <div class="mt-3">
                                    <div class="row">
                                        <div class="col">
                                            <asp:Label ID="lblFullName" class="h4 align-items-center" runat="server" Text="Name Name"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <asp:Label ID="lblMajor" class="text-secondary mb-1" runat="server" Text="Major"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <asp:Label ID="lblHome" class="text-muted font-size-sm" runat="server" Text="San Francisco, CA"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <asp:Button ID="btnFavorite" class="btn btn-primary" runat="server" Text="Favorite" />
                                        </div>
                                        <div class="col">
                                            <asp:Button ID="btnMessage" class="btn btn-outline-primary" runat="server" Text="Message" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mt-3">
                        <ul class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                            <li>
                            <h6 class="mb-0">Facebook</h6><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" ></svg>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>





        </div>
    </div>

    
    
    
    
    <br />
    <br />
    <asp:Table ID="Table1" runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>
                <asp:Label ID="lblHeader" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Literal ID="ltError" runat="server"></asp:Literal>
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DataList ID="dlStudentInfo" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" CellPadding="50" CellSpacing="50">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th style="width:400px" align="left">Username</th>
                                <th style="width:400px" align="left">First Name</th>
                                <th style="width:400px" align="left">Last Name</th>
                                <th style="width:400px" align="left">Grade</th>
                                <th style="width:400px" align="left">Graduation Year</th>
                                <th style="width:400px" align="left">Major</th>
                                <th style="width:400px" align="left">PhoneNumber</th>
                                <th style="width:400px" align="left">Email</th> 
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width:400px" align="left"> <asp:Label ID="lblUsername" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UserName") %>' ></asp:Label></td>
                                <td style="width:400px" align="left"> <asp:Label ID="lblFirstName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FirstName") %>' ></asp:Label> </td>
                                <td style="width:400px" align="left"> <asp:Label ID="lblLastName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LastName") %>'></asp:Label></td>
                                <td style="width:400px" align="left"> <asp:Label ID="lblGrade" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Grade") %>'></asp:Label></td>
                                <td style="width:400px" align="left"> <asp:Label ID="lblGraduationYear" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "GraduationYear") %>'></asp:Label></td>
                                <td style="width:400px" align="left"> <asp:Label ID="lblMajor" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Major") %>'></asp:Label></td>
                                <td style="width:400px" align="left"> <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PhoneNumber") %>'></asp:Label></td>
                                <td style="width:400px" align="left"> <asp:Label ID="lblEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Email") %>'></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <br />
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New First Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfFirstName" runat="server" Enabled="true" ControlToValidate="txtFirstName" ErrorMessage="Enter a First Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Last Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfLastName" runat="server" Enabled="true" ControlToValidate="txtLastName" ErrorMessage="Enter a Last Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtGrade" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Grade"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfGrade" runat="server" Enabled="true" ControlToValidate="txtGrade" ErrorMessage="Enter a Grade" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtGraduationYear" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Graduation Year"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfGraduationYear" runat="server" Enabled="true" ControlToValidate="txtGraduationYear" ErrorMessage="Enter a Graduation Year" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtMajor" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Major"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfMajor" runat="server" Enabled="true" ControlToValidate="txtMajor" ErrorMessage="Enter a Major" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Phone Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfPhoneNumber" runat="server" Enabled="true" ControlToValidate="txtPhoneNumber" ErrorMessage="Enter a Phone Number" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfEmail" runat="server" Enabled="true" ControlToValidate="txtEmail" ErrorMessage="Enter a Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <br />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ValidationGroup="UpdateValidation" OnClick="btnUpdate_Click" />
                <br />
                <br />
                <asp:Button ID="btnReturn" runat="server" Text="<- Previous Page" ValidationGroup="ReturnValidation" OnClick="btnReturn_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
