<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorporateSponsor.aspx.cs" Inherits="Lab3.CorporateSponsor" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>job page</title>
    <link href="StyleSheet.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime:wght@700&family=Palette+Mosaic&display=swap" rel="stylesheet">


<style> 
.background { 
background-repeat: repeat;
background-attachment:scroll;
background-position: center center;
background-size: cover;
background-image:url("images/fadedbackground.png");
}
.header{ 
  text-align:left;
  text-decoration: underline;
  font-family: 'Courier Prime', monospace;
  margin-left: 70px;
  margin-bottom: 10px;
}
.rowone{ 
  margin-bottom: 50px;
}

.rowtwo{ 
  margin-bottom: 50px;
}

.rowthree{
  margin-bottom: 50px;
}


</style>
</head>
<body class="background">
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

<!--logo-->
<div class="col">
  <img src="images/logo.png" class="rounded float-left" alt="Responsive image" >
</div>

<!-- Header -->

<div class="header"> 
 <h1> Current Sponsors</h1>
 <div> <input type="text" placeholder="Search..."></div>
</div>


<!--First row of cards -->
<div class="rowone"> 
    <div class="container">
        <div class="row">
          <div class="col">
            <div class="card h-100" style="width: 18rem;">
              <img src="images/capitalone.png" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Capital One</h5>
                <p class="card-text">American bank holding company specializing in credit cards, auto loans, banking, and savings accounts</p>
                <a href="https://www.capitalonecareers.com/" class="btn btn-outline-dark">Learn More</a>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100" style="width: 18rem;">
              <img src="images/dominionenergy.png" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title"> Dominion Energy</h5>
                <p class="card-text">Dominion Energy, Inc. (Dominion) is a producer and distributor of energy. Dominion is focused on providing electricity, natural gas and related services to customers primarily in the eastern and Rocky Mountain regions of the United States.</p>
                <a href="https://careers.dominionenergy.com/" class="btn btn-outline-dark">Learn More</a>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100" style="width: 18rem;">
              <img src="images/ey.png" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Ernst & Young</h5>
                <p class="card-text">Ernst & Young Global Limited, doing business as EY, is a multinational professional services network with headquarters in London, England. EY is one of the largest professional services networks in the world.</p>
                <a href="https://www.ey.com/en_us/careers" class="btn btn-outline-dark">Learn More</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<!--Second row of cards -->
<div class="rowtwo"> 
<div class="container">
    <div class="row">
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/freddiemac.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Freddie Mac</h5>
            <p class="card-text">The Federal Home Loan Mortgage Corporation, commonly known as Freddie Mac, is a publicly traded, government-sponsored enterprise, headquartered in Tysons Corner, Virginia.</p>
            <a href="https://careers.freddiemac.com/us/en" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/j.p morgan.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">J.P. Morgan</h5>
            <p class="card-text">JPMorgan Chase & Co. is an American multinational investment bank and financial services holding company headquartered in New York City and incorporated in Delaware.</p>
            <a href="https://careers.jpmorgan.com/us/en/home" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/markel.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Markel Insurance</h5>
            <p class="card-text">JPMorgan Chase & Co. is an American multinational investment bank and financial services holding company headquartered in New York City and incorporated in Delaware.</p>
            <a href="https://www.markel.com/insurance/careers-at-markel" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<!--Thrid row of cards-->
<div class="rowthree"> 
<div class="container">
    <div class="row">
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/schroders.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Schroders</h5>
            <p class="card-text">Schroders plc is a British multinational asset management company, founded in 1804. The company employs over 5,000 people worldwide in 32 locations around Europe, America, Asia, Africa and the Middle East.</p>
            <a href="https://schroders.referrals.selectminds.com/careers" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/sentara.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Sentara Healthcare</h5>
            <p class="card-text">Sentara Healthcare is a not-for-profit healthcare organization serving Virginia and northeastern North Carolina.</p>
            <a href="https://www.sentaracareers.com/" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/roweprice.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">T. Rowe Price</h5>
            <p class="card-text">T. Rowe Price Group, Inc. is an American publicly owned global investment management firm that offers funds, advisory services, account management, and retirement plans and services for individuals, institutions, and financial intermediaries.</p>
            <a href="https://www.troweprice.com/corporate/us/en/careers.html" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!--fourth row of cards -->
<div class="rowthree"> 
  <div class="container">
      <div class="row">
        <div class="col">
          <div class="card h-100" style="width: 18rem;">
            <img src="images/pnc.png" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">PNC Bank</h5>
              <p class="card-text">The PNC Financial Services Group, Inc. is an American bank holding company and financial services corporation based in Pittsburgh, Pennsylvania. Its banking subsidiary, PNC Bank, operates in 27 states and the District of Columbia, with 2,629 branches and 9,523 ATMs.</p>
              <a href="https://careers.pnc.com/global/en" class="btn btn-outline-dark">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card h-100" style="width: 18rem;">
            <img src="images/pra.png" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">PRA Group</h5>
              <p class="card-text">PRA Group, Inc. is a publicly traded global debt buyer based in Norfolk, Virginia and their mission is to deliver nonperforming loan solutions that drive success through a long-term focus and customer care.</p>
              <a href="https://www.pragroup.com/careers/" class="btn btn-outline-dark">Learn More</a>
            </div>
          </div>
        </div>
          <div class="col">
          <div>
          
           
            </div>
          </div>
        </div>        
      </div>
    </div>
  


<!--Dont touch -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
