<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="CorporateSponsors.aspx.cs" Inherits="Lab3.CorporateSponsors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link href="Content/bootstrap.css" rel="stylesheet" />
    <h4 class="display-6 ">Search Students</h4>
        <div class="row p-1">
            <div class="col">
                <label for="txtCorpNameSearch">Corporate Sponsor</label>
            </div>
            <div class="col">
                <label for="txtIndustrySearch">Industry</label>
            </div>
        </div>
    <div class="row p-1">
            <div class="col">
                <asp:TextBox ID="txtCorpNameSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtIndustrySearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
        </div>
    <div class="row p-1 pt-2">
            <div class="col">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" class="btn btn-success"/>
            </div>
        </div>    
    <div = class="container my-auto">
            <table class="table caption-top">
                <asp:GridView ID="gvCorporateSponsor" runat="server" 
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
