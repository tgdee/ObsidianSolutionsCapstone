<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentInformation.aspx.cs" Inherits="Lab3.StudentInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                <asp:DataList ID="dlStudentInfo" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" CellPadding="50" CellSpacing="40">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th style="width:300px" align="left">Username</th>
                                <th style="width:300px" align="left">First Name</th>
                                <th style="width:300px" align="left">Last Name</th>
                                <th style="width:300px" align="left">Grade</th>
                                <th style="width:300px" align="left">Graduation Year</th>
                                <th style="width:300px" align="left">Major</th>
                                <th style="width:300px" align="left">PhoneNumber</th>
                                <th style="width:300px" align="left">Email</th> 
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width:300px" align="left"> <asp:Label ID="lblUsername" runat="server" ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblFirstName" runat="server" ></asp:Label> </td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblLastName" runat="server" ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblGrade" runat="server" ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblGraduationYear" runat="server" ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblMajor" runat="server" ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblPhoneNumber" runat="server" ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblEmail" runat="server" ></asp:Label></td>
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
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
