<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilterableTable.aspx.cs" Inherits="Lab3.FilterableTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bootstrap Example</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
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
</head>
<body>
    <form id="form1" runat="server">
    <div class="list1">
        <asp:ListView ID="lvAnnouncements" runat="server">
            <LayoutTemplate>
                <div class="col-md-6" style="padding: 12px; align-content:center; font-size: 15pt">
                    <h4">Announcements</h4>
                </div>
                <tr runat="server" id="itemplaceholder" />
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
                <div class="col-md-6" style="padding: 12px; align-content:center; font-size: 15pt">
                    <h4">Current Opportunites</h4>
                </div>
                <div class="container-fluid" style="max-width: 550px;">
                    <div class="row">
                        <div class="col-auto">
                            <div class="card">
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
    </form>
</body>
</html>
