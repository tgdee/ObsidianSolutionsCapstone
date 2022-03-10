<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberInformation.aspx.cs" Inherits="Lab3.MemberInformation" %>
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
                <asp:DataList ID="dlMemberInfo" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" CellPadding="50" CellSpacing="40">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <%--<th style="width:300px" align="left">Username</th>--%>
                                <th style="width:300px" align="left">First Name</th>
                                <th style="width:300px" align="left">Last Name</th>
                                <th style="width:300px" align="left">Email</th> 
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <%--<td style="width:300px" align="left"> <asp:Label ID="lblUsername" runat="server" ></asp:Label></td>--%>
                                <td style="width:300px" align="left"> <asp:Label ID="lblFirstName" runat="server" ></asp:Label> </td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblLastName" runat="server" ></asp:Label></td>
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
