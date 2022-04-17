<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="JobOpportunities.aspx.cs" Inherits="Lab3.JobOpportunities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <br />
    <br />
    <style>
        h1 {
            text-align: center;
        }
    </style>
    <h1>Feed</h1>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>   
    <asp:ListView ID="lvAnnouncements" runat="server">
            <layouttemplate>
                <tr runat="server" id="itemplaceholder" />
            </layouttemplate>
            <itemtemplate>
                <div>
                    <div class="card m-auto" style="max-width: 1000px;">
                        <div class="row">
                            <div class="col-auto">
                                <div class="card-body">
                                    <tr runat="server">
                                        <td>
                                            <h5 class="card-title" runat="server"><asp:Label ID="lblTitle" class="card-title" runat="server" Text='<%# Eval("AnnounceTitle") %>' /></h5>
                                            <br />
                                        </td>
                                        <td>
                                            <p class="card-text" runat="server"><asp:Label ID="lblBody" class="card-text" runat="server" Text='<%# Eval("AnnounceBody") %>' /></p>
                                            <br />
                                        </td>
                                        <td>
                                            <p class="card-text" runat="server"><small class="text-muted"><asp:Label ID="lblDate" class="card-text" runat="server" Text='<%# Eval("AnnounceTimePost") %>' /></small></p>
                                        </td>
                                    </tr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    <asp:ListView ID="lvStudentOpportunities" runat="server">
        <LayoutTemplate>
            <div class="container-fluid m-auto">
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
        <ItemTemplate>
            <tr runat="server">
                <td>
                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="lblInfo" runat="server" Text='<%# Eval("Info") %>' />
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</asp:Content>