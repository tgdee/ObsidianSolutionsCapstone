<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginChoice.aspx.cs" Inherits="Lab3.LoginChoice" %>

<!DOCTYPE html>
<html xmlns="http://w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page </title>
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css"/>
    <link href="Content/bootstrap.css" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
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
                            <p class="welcome pl-5">Student  Portal</p>
                        </h1>
                    </div>
                </div>
            </div>

                <div class="col-6"></div>
            </div>
        </div>

        <!--buttons-->
        <div class="container">
            <div class="row">
                <div class="col">
                    <form>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Username </label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Remeber Me</label>
                        </div>
                        <button type="submit" class="btn btn-light">Login</button>
                        <button type="submit" class="btn btn-light">Sign Up</button>
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











<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="bg-image" style="background-image:url(images/loginBackground.png);margin-top:0px;background-size:cover">
    <form id="form1" runat="server">
        <h1>
            <image> <img src="images/logo_transparent_background.jpg" /></image>
        </h1>
        <div class="text-right">
             <asp:Label ID="lblAccount" runat="server" Text="Want to Join?" Font-Italic="true" ForeColor="White"></asp:Label>
             <asp:Button ID="btnNewAccount" runat="server" class="rounded-pill" Text="Apply" OnClick="btnNewAccount_Click" ForeColor="#331b47" BackColor="White"/>
        </div>
    <div align="center">
            <asp:Table ID="tblLoginChoice" runat="server" >
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>
                        <asp:Label ID="lblHeader" runat="server" Text="Welcome!" class="labek"></asp:Label>                    
                    </asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblUserStat" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>     
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <asp:Label ID="lblUsername" runat="server" Text="Username" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="LblPassword" runat="server" Text="Password" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
           <br />
            <br />
            <asp:Button ID="btnGo" runat="server" Text="Login ->" OnClick="btnGo_Click" />
            <br />
            <br />
        </div>
            
            <formview >
                
                <br />
               
                <br />
                <asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="true" Font-Size="Larger"></asp:Label>
            </formview>
       
    </form>

    <script src="Script/jquery-3.6.0.min.js"> </script>
    <script src="Script/popper.min.js"> </script>
    <script src="Script/bootstrap.bundle.min.js"> </script>

</body>
</html>--%>
