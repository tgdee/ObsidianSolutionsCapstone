<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginChoice.aspx.cs" Inherits="Lab3.LoginChoice" %>

<!DOCTYPE html>
<html xmlns="http://w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Login page </title>
                <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
                <link href="Content/bootstrap.css" rel="stylesheet" />

                <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com">
                        <link href="https://fonts.googleapis.com/css2?family=Courier+Prime:wght@700&family=Palette+Mosaic&display=swap" rel="stylesheet">
</head>

<body class="background">
    <form id="form1" runat="server">

        <!-- Logo, want to join, apply button row -->
        <div class="row">
            <div class="col-md-6">
                <div class="logo">
                    <img src="images/logo.png" class="rounded float-left" class="img-fluid" alt="Responsive image">
                </div>
            </div>

            <div class="col-lg-6 ">
                <ul class="nav justify-content-end">
                    <li class="nav-item pr-1">
                        <asp:LinkButton ID="lbHome" OnClick="lbHome_Click" class="btn btn-success" runat="server">Home</asp:LinkButton>
                    </li>
            </div>

        </div>


        <!-- Welcome row -->
        <div class="welcome pl-4">
            <div class="row pl-5">
                <div class="text-white pl-5">
                    <div class="col-6 pl-5">
                        <div class="pl-5">
                            <h1 class="display-1 pl-5">
                                <p class="welcome pl-5">Login  Portal</p>
                            </h1>
                        </div>
                    </div>
                </div>

                <div class="col-6"></div>
            </div>
        </div>

        <!--buttons-->
        <div class="container-md">
            <div class="row">
                <div class="col">
                    <form>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Username</label>
                            <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <asp:TextBox ID="txtPassword" class="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="mb-3">
                            <asp:CheckBox ID="cbRememberMe" class="form-check-label pl-1" runat="server" />
                            <label class="form-check-label pl-1" for="exampleCheck1">Remember Me</label>
                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" class="btn btn-light" Text="Login" />
                            <asp:Button ID="btnSignUp" class="btn btn-light" OnClick="btnSignUp_Click" runat="server" Text="Sign Up" />
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblUserStat" runat="server"></asp:Label>
                        </div>
                    </form>
                </div>

                <!--filler col-->
                <div class="col">
                </div>
                <!--filler col-->
                <div class="col">
                </div>
            </div>
        </div>
    </form>



    <!--dont touch -->
    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>


