<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Lab3.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblUserStat" runat="server" Text="" Font-Bold="true"></asp:Label>
    <asp:Panel runat="server" HorizontalAlign="Center">
        <br />
        <br />
        <br />
        <br />
        <br />
        <h1>Lab3: Shane McCarthy & Timothy Goeke</h1>
        <asp:Image ID="Image1" runat="server" Height="200" Width="200" ImageUrl="~/images/5db340cf51d14.image.jpg" />
        <br />
        <br />
        <asp:Label ID="lblUserLoggedIn" runat="server" Text="" Font-Bold="true" Font-Size="Larger" ForeColor="Green"></asp:Label>
        <asp:Label ID="lblNotStudent" runat="server" Text="" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:Label>
    </asp:Panel>
    
</asp:Content>
