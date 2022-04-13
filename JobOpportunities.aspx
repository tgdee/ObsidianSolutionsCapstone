<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="JobOpportunities.aspx.cs" Inherits="Lab3.JobOpportunities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <br />
    <br />
    <h1>Feed </h1>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>
<%--    <div>
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
        
    </div>--%>
    <%--<div class="row p-1 pt-2">
            <div class="col">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" class="btn btn-success"/>
            </div>
        </div>--%>    
    <%--<div = class="container my-auto">
        <table class="table caption-top" "table-light">
            <asp:GridView ID="gvOpportunity" runat="server"
                class="table table-hover table table-bordered table-condensed"
                OnSelectedIndexChanged="gvOpportunity_SelectedIndexChanged"
                Width="1085px" EmptyDataText="Job Record Not Found">
                <Columns>
                    <asp:CommandField selecttext="Apply" ShowSelectButton="true"/>
                    <asp:BoundField HeaderText="Job Title" DataField="Title" SortExpression="Title"/>
                    <asp:BoundField HeaderText="Information" DataField="Link" SortExpression="Link"/>
                </Columns>
            </asp:GridView>
        </table>
            <div class="p-3"></div>
            <asp:Label ID="lblMessage" runat="server" class="form-label"></asp:Label>
        </div>--%>
    <asp:ListView ID="lvStudentOpportunities" runat="server">
        <LayoutTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-sm-auto col-md-auto">
                        <div class="card">
                            <div class="card-header">
                                <h4>Browse Opportunities</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive" id="tableScorll" tabindex="2" style="height: 400px; overflow: hidden; outline: none;">
                                    <input class="form-control" id="myInput" type="text" placeholder="Search.." onkeyup="function()">
                                    <br>
                                    <table class="table table-striped" id="tbl1" runat="server">
                                        <tbody id="myTable">
                                            <tr runat="server">
                                                <th runat="server">Title</th>
                                                <th runat="server">Info</th>
                                            </tr>
                                            <tr runat="server" id="itemPlaceholder" />
                                        </tbody>
                                    </table>
                                </div>
                                <script>
                                    $(document).ready(function () {
                                        $("#myInput").on("keyup", function () {
                                            var value = $(this).val().toLowerCase();
                                            $("#myTable tr").filter(function () {
                                                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                            });
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:DataPager ID="DataPager1" runat="server">
                <Fields>
                    <asp:NumericPagerField />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ListView ID="lvAnnouncements" runat="server">
        <LayoutTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-sm-auto col-md-auto">
                        <div class="card">
                            <div class="card-header">
                                <h4>Announcements</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive" id="tableScorll" tabindex="2" style="height: 400px; overflow: hidden; outline: none;">
                                    <table class="table table-striped" id="tbl1" runat="server">
                                        <tbody id="myTable">
                                            <tr runat="server">
                                                <th runat="server">Title</th>
                                                <th runat="server">Body</th>
                                            </tr>
                                            <tr runat="server" id="itemPlaceholder" />
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:DataPager ID="DataPager1" runat="server">
                <Fields>
                    <asp:NumericPagerField />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <tr runat="server">
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="lblInfo" runat="server" Text='<%# Eval("Info") %>' />
                </td>
                <td>
                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="lblBody" runat="server" Text='<%# Eval("Body") %>' />
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</asp:Content>