<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobApplication.aspx.cs" Inherits="Lab3.JobApplication" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1>Job Application Page </h1>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>
    <div>
        <%--create the table for information to be placed into--%>
        <asp:Table runat="server" Height="200px" Width="500px">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCompany" runat="server" Text="Company Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCompany" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqFieldValidatorCompany" runat="server" Enabled="true" ControlToValidate="txtCompany" ErrorMessage="Enter Company Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDate" runat="server" Text="Date:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqFieldValidatorDate" Enabled="true" runat="server" ControlToValidate="txtDate" ErrorMessage="Enter Date" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPosition" runat="server" Text="Position Title:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPosition" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqFieldValidatorPosition" Enabled="true" runat="server" ControlToValidate="txtPosition" ErrorMessage="Enter Position Title" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblStudentID" runat="server" Text="Student Email:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlStudent" runat="server" Width="200px" DataSourceID="ScholarshipSource" DataTextField="Email" OnSelectedIndexChanged="btnApply_Click"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <asp:Button ID="btnApply" runat="server" Text="Apply" OnClick="btnApply_Click" />
    </div>
   <%-- reference database sources to get the information in ddls--%>
    <asp:SqlDataSource
        ID="MemberSource"
        SelectCommand="SELECT Email FROM DBO.Member"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource
        ID="ScholarshipSource"
        SelectCommand="SELECT Email FROM DBO.Student"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        runat="server"></asp:SqlDataSource>
</asp:Content>
