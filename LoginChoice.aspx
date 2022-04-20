<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginChoice.aspx.cs" Inherits="Lab3.LoginChoice" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Login page </title>
   <link href="StyleSheet.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime:wght@700&family=Palette+Mosaic&display=swap" rel="stylesheet">
 
</head>
<style>
img{
width:100%;
height:auto;}
  
.welcome{
 margin-top: 50px;
 margin-left: 350px;
 font-family: 'Courier Prime', monospace;
 font-style: italic;
 color: white;
 font-size: 40px;
 -webkit-text-stroke: 2px #7b53a7;
}
 
.background {
background-attachment:scroll;
background-position: center center;
background-size: cover;
background-image:url("images/fadedbackground.png");
margin-bottom: 0px;
}
 
.logo{
   height:200px;
   width:200px;
}
 
.join{
   text-align: right;
   margin-right: 150px;
   margin-bottom: 220px;
}
 
.textbuttons{
   margin-left: 250px;
   margin-right: 250px;
   text-align:left;
}
</style>
 
 
<body class="background">
 
<div class="container"></div>
 
 
<!-- Logo, want to join, home button row -->
<div class="row">
     <div class="col-md-6">
         <div class="logo"> <img src="images/logo.png" class="rounded float-left" class="img-fluid" alt="Responsive image"> </div> </div>
         <div class="col-lg-6 ">
           <ul class="nav justify-content-end">
               <li class="nav-item">
                 <a class="nav-link active" href="NewHomePage.aspx"><ion-icon name="home-outline"></ion-icon>Home</a>
               </li>
            </ul>
          </div>
  
</div>
 
<!-- Welcome row -->
<div class="welcome">
<div class="row">
   <div class="text-white">
   <div class="col-6"> <h1 class="display-1"><p class="text-center"> WELCOME!</p></h1></div>
   </div>
   <div class="col-6">  </div>
</div>
</div>
 
<!--buttons-->
<div class="container">
   <div class="row">
     <div class="col">
       <div class="textbuttons">
       <form id="form1" runat="server">
           <div class="mb-3">
               <asp:Label ID="Label1" runat="server" Text="Username" ForeColor="White"></asp:Label>
               <%--<label for="exampleInputEmail1" class="form-label">Username </label>--%>
               <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
             </div>
             <div class="mb-3">
                 <asp:Label ID="Label2" runat="server" Text="Password" ForeColor="White"></asp:Label>
               <%--<label for="exampleInputPassword1" class="form-label">Password</label>--%>
               <asp:TextBox ID="txtPassword" class="form-control" runat="server"></asp:TextBox>

             </div>
             <div class="mb-3 form-check">
               <input type="checkbox" class="form-check-input" id="exampleCheck1">
                 <asp:Label ID="Label3" runat="server" Text="Remember Me" ForeColor="White"></asp:Label>
               <%--<label class="form-check-label" for="exampleCheck1">Remeber Me</label>--%>
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
     </div>
    
  
 
<!--Closing div tags don't touch-->
</div>
</div>
  
 
<!--dont touch -->
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>


