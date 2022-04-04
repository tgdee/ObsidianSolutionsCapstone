<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewStudentProfile.aspx.cs" Inherits="Lab3.NewStudentProfile" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Profile</title>
    <link href="StyleSheet.css" rel="stylesheet">
    <script src="https://code.iconify.design/2/2.2.0/iconify.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="background">
    <style>
        .background {
            background-repeat: repeat;
            background-attachment: scroll;
            background-position: center center;
            background-size: cover;
            background-image: url("images/fadedbackground.png");
        }
    </style>

    <form id="form1" runat="server">
        <asp:Label runat="server" ID="lbl"></asp:Label>
        <div class="container">
            <div class="row">
                <!--logo-->
                <div class="col">
                    <img src="images/logo.png" class="img-fluid rounded float-left" alt="Responsive image">
                </div>
                <!--nav bar-->
                <div class="col">
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link active" href='NewHomePage.aspx'>
                                <ion-icon name="home-outline"></ion-icon>
                                Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <ion-icon name="person-outline"></ion-icon>
                                Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <ion-icon name="briefcase-outline"></ion-icon>
                                Jobs</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <!--create profile/ profile photo placeholder-->
                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="https://via.placeholder.com/150" alt="No Profile Picture Set" class="rounded-circle" width="150" />
                                    <div class="mt-3">
                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="lblFullName" class="h4 align-items-center" runat="server" Text="Name Name"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="lblMajor" class="text-secondary mb-1" runat="server" Text="Major"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="lblHome" class="text-muted font-size-sm" runat="server" Text="San Francisco, CA"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mt-3">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                    <h6 class="mb-0">
                                        Graduation Year
                                        &nbsp&nbsp&nbsp
                                        <asp:Label ID="lblGradYear" class="text-secondary ps-5" runat="server" Text="Not Set"></asp:Label>
                                    </h6>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                    <h6 class="mb-0">
                                        Current Grade
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                        <asp:Label ID="lblGrade" class="text-secondary ps-5" runat="server" Text="Not Set"></asp:Label>
                                    </h6>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                    <h6 class="mb-0">
                                        Phone Number
                                         &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                        <asp:Label ID="lblPhoneNumber" class="text-secondary ps-0" runat="server" Text="Not Set"></asp:Label>
                                    </h6>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                    <h6 class="mb-0">
                                        Email Address
                                         &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                        <asp:Label ID="lblEmailAddress" class="text-secondary ps-5" runat="server" Text="Not Set"></asp:Label>
                                    </h6>
                                </li>
                            </ul>
                        </div>

                        <div class="card mt-3">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                    <h6 class="mb-0">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook mr-2 icon-inline text-primary">
                                            <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
                                        <asp:HyperLink ID="hlFacebook" NavigateUrl="https://www.facebook.com/" runat="server">Facebook</asp:HyperLink>
                                    </h6>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                    <h6 class="mb-0">
                                        <span class="iconify" data-icon="logos:linkedin-icon"></span>
                                        <asp:HyperLink ID="HyperLink2" NavigateUrl="https://www.linkedin.com/" class="ps-2" runat="server">LinkedIn</asp:HyperLink>
                                    </h6>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-header">
                                CEO Statement
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    <asp:Label ID="lblCeoStmt" runat="server" Text="(CEO STATEMENT HERE)"></asp:Label>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>



    <!--Dont touch-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>