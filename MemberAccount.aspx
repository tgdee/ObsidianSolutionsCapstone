<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberAccount.aspx.cs" Inherits="Lab3.MemberAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Literal ID="ltError" runat="server" Text=""></asp:Literal>
    <asp:Table runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell HorizontalAlign="Center">
                <asp:Label ID="lblHeaderMessage" runat="server" Text="Account Information" Font-Underline="true"></asp:Label>
                <br />
                <br />
                <%--<asp:Literal ID="ltError" runat="server" Text=""></asp:Literal>--%>
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DataList ID="dlAccount" runat="server" RepeatDirection="Vertical" RepeatColumns="3" RepeatLayout="Flow" CellPadding="50" CellSpacing="50">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th style="width:300px" align="left">First Name</th>
                                <th style="width:300px" align="left">Last Name</th>
                                <th style="width:300px" align="left">Email</th>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width:300px" align="left"> <asp:Label ID="lblFirstName" Text='<%# DataBinder.Eval(Container.DataItem, "FirstName") %>' runat="server"></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblLastName" Text='<%# DataBinder.Eval(Container.DataItem, "LastName") %>' runat="server"></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblEmail" Text='<%# DataBinder.Eval(Container.DataItem, "Email") %>' runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                    <br />
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter New First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfFirstName" runat="server" Enabled="true" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter New Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfLastName" runat="server" Enabled="true" ValidationGroup="UpdateValidation" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter New Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfEmail" runat="server" Enabled="true" ControlToValidate="txtEmail" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter Old Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfPassword" runat="server" Enabled="true" ControlToValidate="txtPassword" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtNewPassword" CssClass="form-control" ValidationGroup="UpdateValidation" runat="server" placeholder="Enter New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfNewPassword" runat="server" Enabled="true" ControlToValidate="txtNewPassword" ErrorMessage="Enter New Password" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <br />
                <div class="btnUp">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ValidationGroup="UpdateValidation" OnClick="btnUpdate_Click"/>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <%--<br />
    <h3>Uploaded Resumes</h3>
    <asp:GridView ID="gvDisplay" runat="server" DataKeyNames="FileLocation" ValidationGroup="DisplayResumeValidation" OnSelectedIndexChanged="gvDisplay_SelectedIndexChanged" >
        <Columns>
            <asp:CommandField ShowSelectButton="true" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Download Resume" ValidationGroup="DisplayResumeValidation" OnClick="LinkButton1_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>--%>
    <%--</asp:GridView>
    <%--<br />
    <asp:Label ID="lblSelected" runat="server" Text=""></asp:Label>
    <asp:Button ID="btnDelete" runat="server" Text="Delete Selected Resume" OnClick="btnDelete_Click" ValidationGroup="DisplayResumeValidation" />--%>--%>


</asp:Content>
