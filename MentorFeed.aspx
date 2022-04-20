<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MentorFeed.aspx.cs" Inherits="Lab3.MentorFeed" %>
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
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .list1
        {
            float: left;
        }
        .list2
        {
            float: right;
        }
    </style>
    <h1>Leader Feed</h1>
    <div class="list1">
        <asp:ListView ID="lvAnnouncements" runat="server">
            <LayoutTemplate>
                <div class="col-md-4" style="padding: 9px">
                    <asp:Button ID="btnNewAnnounce" runat="server" Text="Announcements" OnClick="btnNewAnnounce_Click" class="btn-lg btn-success" />
                </div>
                <tr runat="server" id="itemplaceholder"/>
            </LayoutTemplate>
            <ItemTemplate>
                <div>
                    <div class="card m-auto border" style="max-width: 550px;">
                        <div class="row">
                            <div class="col-auto">
                                <div class="card-body">
                                    <tr runat="server">
                                        <td>
                                            <h5 class="card-title" runat="server">
                                                <asp:Label ID="lblTitle" class="card-title" runat="server" Text='<%# Eval("AnnounceTitle") %>' /></h5>
                                            <br />
                                        </td>
                                        <td>
                                            <p class="card-text" runat="server">
                                                <small>
                                                    <asp:Label ID="lblMember" class="card-text" runat="server" Text='<%# Eval("FullName") %>' /></small>
                                            </p>
                                        </td>
                                        <td>
                                            <p class="card-text" runat="server">
                                                <asp:Label ID="lblBody" class="card-text" runat="server" Text='<%# Eval("AnnounceBody") %>' />
                                            </p>
                                            <br />
                                        </td>
                                        <td>
                                            <p class="card-text" runat="server">
                                                <small class="text-muted">
                                                    <asp:Label ID="lblDate" class="card-text" runat="server" Text='<%# Eval("AnnounceTimePost") %>' /></small>
                                            </p>
                                        </td>
                                    </tr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <div class="list2">
        <asp:ListView ID="lvStudentOpportunities" runat="server">
            <LayoutTemplate>
                <div class="col-md-6" style="padding: 12px; align-content:center; font-size: 20pt">
                    <h4">Current Opportunites</h4>
                </div>
                <div class="container-fluid" style="max-width: 550px;">
                    <div class="row">
                        <div class="col-auto">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive" id="tableScorll" tabindex="2" style="height: 400px; overflow: hidden; outline: none;">
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
                <div width="600px">
                    <tr runat="server">
                        <td>
                            <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblInfo" runat="server" Text='<%# Eval("Info") %>' />
                        </td>
                    </tr>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</asp:Content>
