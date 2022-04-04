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
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="https://careers.dominionenergy.com/" class="btn btn-outline-dark">Learn More</a>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100" style="width: 18rem;">
              <img src="images/ey.png" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="https://careers.freddiemac.com/us/en" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/j.p morgan.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="https://careers.jpmorgan.com/us/en/home" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/markel.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="https://schroders.referrals.selectminds.com/careers" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/sentara.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="https://www.sentaracareers.com/" class="btn btn-outline-dark">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="images/roweprice.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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
              <h5 class="card-title">Card title</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              <a href="https://careers.pnc.com/global/en" class="btn btn-outline-dark">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card h-100" style="width: 18rem;">
            <img src="images/pra.png" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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
