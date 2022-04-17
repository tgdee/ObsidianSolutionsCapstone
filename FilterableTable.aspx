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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row no-gutters">
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title" runat="server">AnnounceTitle</h5>
                            <p class="card-text" runat="server">AnnounceBody</p>
                            <p class="card-text" runat="server"><small class="text-muted">AnnounceTimePost</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:ListView ID="lvAnnouncements" runat="server">
            <LayoutTemplate>
                <tr runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
            <ItemTemplate>
                <div>
                    <div class="card m-auto" style="max-width: 1000px;">
                        <div class="row">
                            <div class="col-auto">
                                <div class="card-body">
                                    <tr runat="server">
                                        <td>
                                            <h5 class="card-title" runat="server"><asp:Label ID="lblTitle" class="card-title" runat="server" Text='<%# Eval("AnnounceTitle") %>' /></h5>
                                            <br />
                                            <br />
                                        </td>
                                        <td>
                                            <p class="card-text" runat="server"><asp:Label ID="lblBody" class="card-text" runat="server" Text='<%# Eval("AnnounceBody") %>' /></p>
                                            <br />
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
    </form>
</body>
</html>
