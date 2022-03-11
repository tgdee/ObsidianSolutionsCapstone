<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScholarshipApplication.aspx.cs" Inherits="Lab3.ScholarshipApplication" MasterPageFile="~/StudentMaster.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <br />
    <br />
    <h1>Scholarship Application Page</h1>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>
    <div>
        <asp:Table runat="server" Height="200px" Width="500px">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblScholarship" runat="server" Text="Scholarship Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlScholarshipNames" runat="server" DataSourceID="sdsScholarshipNames" ValidationGroup="1" DataTextField="ScholarshipName" DataValueField="ScholarshipName" AppendDataBoundItems="true">
                        <asp:ListItem Text="Please Select" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvScholarshipName" runat="server" ControlToValidate="ddlScholarshipNames" InitialValue="0" ValidationGroup="1" ErrorMessage="Scholarship Name Not Selected" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblStudentEmail" runat="server" Text="Student Email:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtStudentEmail" runat="server" placeholder="Enter Preferred Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStudentEmail" Enabled="true" runat="server" ValidationGroup="1" ControlToValidate="txtStudentEmail" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <asp:Button ID="btnApply" runat="server" Text="Apply ->" OnClick="btnApply_Click" />
    </div>
    <asp:SqlDataSource ID="sdsScholarshipNames" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" SelectCommand="SELECT [ScholarshipName] FROM [Scholarship] ORDER BY [ScholarshipID]"></asp:SqlDataSource>
</asp:Content>
