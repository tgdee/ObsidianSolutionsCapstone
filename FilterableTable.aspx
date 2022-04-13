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
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:ListView ID="Table1" runat="server">
            <LayoutTemplate>
                <div class="container-fluid">
                    <div class="column">
                        <div class="col align-self-start">
                            One of three columns
                        </div>
                        <div class="col align-self-start">
                            One of three columns
                        </div>
                        <div class="col align-self-start">
                            One of three columns
                        </div>
                    </div>
                </div>
            </LayoutTemplate>
        </asp:ListView>
    </form>
</body>
</html>
