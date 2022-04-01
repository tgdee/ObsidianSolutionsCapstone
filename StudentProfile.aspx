﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="Lab3.StudentProfile" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> student profile</title>
    <link href="StyleSheet.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>

<style> 
.background { 
background-repeat: repeat;
background-attachment:scroll;
background-position: center center;
background-size: cover;
background-image:url("images/fadedbackground.png");
}
 

</style>


<body class="background">
 
    <div class="container">
        <div class="row">
    <!--logo-->
          <div class="col">
            <img src="images/logo.png" class="rounded float-left" alt="Responsive image" >
          </div>
    <!--nav bar-->
          <div class="col">
            <ul class="nav justify-content-end">
                <li class="nav-item">
                  <a class="nav-link active" href="#"><ion-icon name="home-outline"></ion-icon>Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"><ion-icon name="person-outline"></ion-icon>Profile</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"> <ion-icon name="briefcase-outline"></ion-icon>Jobs</a>
                </li>
              </ul>
          </div>
        </div>
        <div class="row">
    <!--create profile/ profile photo placeholder-->
          <div class="col">
            <div> <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="..." alt="Card image cap">
                <div class="card-body">
                  <h5 class="card-title">Name:</h5>
                  <p class="card-text"> 
                      <p> Age:</p>
                      <p> Region:</p>
                      <p> Major</p>
                  </p>
                  <a href="#" class="btn btn-light">Resume</a>
                  <a href="#" class="btn btn-light">Portfolio</a>
                </div>
              </div></div>
          </div>
    <!--CEO Statement-->
          <div class="col">
            <div class="card border-secondary mb-3" style="max-width: 18rem;">
                <div class="card-header">BIO</div>
                <div class="card-body text-secondary">
                  <h5 class="card-title">Secondary card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
    <!--Interests/skills  -->
          <div class="col">
            <div class="card border-secondary mb-3" style="max-width: 18rem;">
                <div class="card-header">Intrests</div>
                <div class="card-body text-secondary">
                  <h5 class="card-title">Secondary card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
              <div class="card border-secondary mb-3" style="max-width: 18rem;">
                <div class="card-header">Skills</div>
                <div class="card-body text-secondary">
                  <h5 class="card-title">Secondary card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
              </div>
          </div>
<!--dont touch closing tags-->
</div>
</div>
    
    

<!--Dont touch-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>  
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script> 
</body>
</html>