<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobApplication.aspx.cs" Inherits="Lab3.JobApplication" MasterPageFile="~/StudentMaster.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1>Job Application Page </h1>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>
    <div>
        <asp:Table runat="server" Height="200px" Width="500px">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCompany" runat="server" Text="Company Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlCompanyNames" runat="server" DataSourceID="sdsCompanyNames" ValidationGroup="1" DataTextField="CompanyName" DataValueField="EmployerID" AppendDataBoundItems="true">
                        <asp:ListItem Text="Please Select" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" InitialValue="0" ValidationGroup="1" ErrorMessage="Company Name Not Selected" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPosition" runat="server" Text="Position Title:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPosition" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqFieldValidatorPosition" Enabled="true" ValidationGroup="1" runat="server" ControlToValidate="txtPosition" ErrorMessage="Enter Position Title" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <asp:Button ID="btnApply" runat="server" Text="Apply" ValidationGroup="1" OnClick="btnApply_Click" />
    </div>

    <asp:SqlDataSource ID="sdsCompanyNames" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" SelectCommand="SELECT [CompanyName] FROM [Company] ORDER BY [CompanyName]"></asp:SqlDataSource>
</asp:Content>
