<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InternshipApplication.aspx.cs" Inherits="Lab3.InternshipApplication" MasterPageFile="~/StudentMaster.Master" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server"> 
 <br />
    <br />
    <h1>Job Application Page </h1>
        <h4>
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </h4>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblCompany" runat="server" Text="Company Name"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtCompany" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqFieldValidatorCompany" runat="server" Enabled="true" ControlToValidate="txtCompany" ErrorMessage="Enter Company Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtDate" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldDate" runat="server" Enabled="true" ControlToValidate="txtDate" ErrorMessage="Enter Date" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblPosition" runat="server" Text="Position Title"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtPosition" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPosition" runat="server" Enabled="true" ControlToValidate="txtPosition" ErrorMessage="Enter POsition Title" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEmail" runat="server" Text="Student Email"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DropDownList ID="ddlStudent" runat="server" Width="200px" DataSourceID="StudentTableDataSource" DataTextField="Email" OnSelectedIndexChanged="btnApply_Click"></asp:DropDownList>            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
     <br />
     <br />
     <asp:Button ID="btnApply" runat="server" Text="Apply" OnClick="btnApply_Click" />
         
      <asp:SqlDataSource
        ID="StudentTableDataSource"
        SelectCommand="SELECT Email FROM DBO.Student"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        runat="server"></asp:SqlDataSource>     
            
    
</asp:Content>