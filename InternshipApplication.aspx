<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InternshipApplication.aspx.cs" Inherits="Lab3.InternshipApplication" MasterPageFile="~/StudentMaster.Master" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1>Internship Application Page </h1>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>
    <asp:Table ID="Table1" runat="server" Height="200px" Width="500px">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblInternship" runat="server" Text="Company Name"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DropDownList ID="ddlCompanyNames" runat="server" DataSourceID="sdsCompanyNames" ValidationGroup="1" DataTextField="CompanyName" DataValueField="CompanyName" AppendDataBoundItems="true">
                    <asp:ListItem Text="Please Select" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" ControlToValidate="ddlCompanyNames" InitialValue="0" ValidationGroup="1" ErrorMessage="Company Name Not Selected" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPosition" runat="server" Text="Internship Title"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPosition" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPosition" ValidationGroup="1" runat="server" Enabled="true" ControlToValidate="txtPosition" ErrorMessage="Enter Internship Title" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStudentEmail" runat="server" Text="Student Email:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtStudentEmail" runat="server" placeholder="Enter Email Used to Apply"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvStudentEmail" Enabled="true" runat="server" ValidationGroup="1" ControlToValidate="txtStudentEmail" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <asp:Button ID="btnApply" runat="server" ValidationGroup="1" Text="Apply" OnClick="btnApply_Click" />

    <asp:SqlDataSource ID="sdsCompanyNames" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" SelectCommand="SELECT [CompanyName] FROM [Internship] ORDER BY [CompanyName]"></asp:SqlDataSource>


</asp:Content>
