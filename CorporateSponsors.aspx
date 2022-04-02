<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="CorporateSponsors.aspx.cs" Inherits="Lab3.CorporateSponsors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <div = class="container my-auto">
            <table class="table caption-top">
                <asp:GridView ID="gvCorporateSuccess" runat="server" 
                    class="table table-hover table table-bordered table-condensed" 
                    Width="1085px" EmptyDataText="Student Record Not Found">

                </asp:GridView>
            </table>
            <div class="p-3"></div>
            <asp:Label ID="lblMessage" runat="server" class="form-label"></asp:Label>
        </div>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>

</asp:Content>
