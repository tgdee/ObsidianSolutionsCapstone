<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="Lab3.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Table runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell HorizontalAlign="Center">
                <asp:Label ID="lblHeaderMessage" runat="server" Text="Account Information" Font-Underline="true"></asp:Label>
                <br />
                <br />
                <asp:Literal ID="ltError" runat="server" Text=""></asp:Literal>
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DataList ID="dlAccount" runat="server" RepeatDirection="Vertical" RepeatColumns="4" RepeatLayout="Flow" CellPadding="50" CellSpacing="50">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th style="width:300px" align="left">First Name</th>
                                <th style="width:300px" align="left">Last Name</th>
                                <th style="width:300px" align="left">Email</th>
                                <th style="width:300px" align="left">Password</th>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width:300px" align="left"> <asp:Label ID="lblFirstName" Text='<%# DataBinder.Eval(Container.DataItem, "firstName") %>' runat="server"></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblLastName" Text='<%# DataBinder.Eval(Container.DataItem, "lastName") %>' runat="server"></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblEmail" Text='<%# DataBinder.Eval(Container.DataItem, "email") %>' runat="server"></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblPassword" Text='<%# DataBinder.Eval(Container.DataItem, "password") %>' runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <div class="form-inline">
                    <br />
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter New First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfFirstName" runat="server" Enabled="true" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Enter New Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfLastName" runat="server" Enabled="true" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter New Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfEmail" runat="server" Enabled="true" ControlToValidate="txtEmail" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfPassword" runat="server" Enabled="true" ControlToValidate="txtPassword" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <br />
                <div class="btnUp">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"/>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
