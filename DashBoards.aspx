<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashBoards.aspx.cs" Inherits="Lab3.DashBoards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div>
       <asp:Literal ID="ltError" Text="" runat="server"></asp:Literal>
            <asp:GridView ID="CorporateSuccess" runat="server" AutoGenerateColumns="False" DataKeyNames="CorporateSponsor" DataSourceID="CorporateSuccess">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="CorporateSponsor" HeaderText="Corporate Sponsor" Visible="True" ReadOnly="True" SortExpression="CorporateSponsor" />
                    <asp:BoundField DataField="Introductions" HeaderText="Introductions" SortExpression="Introductions" />
                    <asp:BoundField DataField="Applied" HeaderText="Applied" SortExpression="Applied" />
                    <asp:BoundField DataField="Interviewed" HeaderText="Interviewed" SortExpression="Interviewed" />
                    <asp:BoundField DataField="Offer" HeaderText="Offer" SortExpression="Offer" />
                    <asp:BoundField DataField="Acceptance" HeaderText="Acceptance" SortExpression="Acceptance" />
                </Columns>
            </asp:GridView>
       <asp:SqlDataSource ID="UserAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" 
           SelectCommand="SELECT * FROM [CorporateSuccess] ORDER BY [CorporateSponsor]">
    </asp:SqlDataSource>
   </div>
</asp:Content>
