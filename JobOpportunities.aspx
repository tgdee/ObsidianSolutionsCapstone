<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="JobOpportunities.aspx.cs" Inherits="Lab3.JobOpportunities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1>Job Application Page </h1>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>
    <div>
        <h4 class="display-6 ">Search Jobs</h4>
        <div class="row p-1">
            <div class="col">
                <label for="txtTitleSearch">Title</label>
            </div>
            <div class="col">
                <label for="txtTypeSearch">Type</label>
            </div>
            <div class="col">
                <label for="txtCitySearch">City</label>
            </div>
            <div class="col">
                <label for="txtStateSearch">State</label>
            </div>
            <div class="col">
                <label for="txtIndustrySearch">Industry</label>
            </div>
            <div class="col">
                <label for="txtCorpNameSearch">Corporate Sponsor</label>
            </div>
        </div>
    </div>
    <div class="row p-1">
        <div class="col">
            <asp:TextBox ID="txtTitleSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtTypeSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtCitySearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtStateSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtIndustrySearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtCorpNameSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        
    </div>
    <div class="row p-1 pt-2">
            <div class="col">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" class="btn btn-success"/>
            </div>
        </div>    
    <div = class="container my-auto">
        <table class="table caption-top">
            <asp:GridView ID="gvOpportunity" runat="server"
                class="table table-hover table table-bordered table-condensed"
                OnSelectedIndexChanged="gvOpportunity_SelectedIndexChanged"
                Width="1085px" EmptyDataText="Job Record Not Found">
                <Columns>
                    <asp:CommandField selecttext="Apply" ShowSelectButton="true"/>
                </Columns>
            </asp:GridView>
        </table>
            <div class="p-3"></div>
            <asp:Label ID="lblMessage" runat="server" class="form-label"></asp:Label>
        </div>
</asp:Content>
