<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeFile="MentorSearchforStudents.aspx.cs" Inherits="Lab3.MentorSearchforStudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor page</title>
    <link href="StyleSheet.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime:wght@700&family=Palette+Mosaic&display=swap" rel="stylesheet">
    </head>
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

<body class="background">

<!--logo-->
<div class="col">
  <img src="images/logo.png" class="rounded float-left" alt="Responsive image" >
</div>

    <asp:SqlDataSource ID="SqlMentorSearch" runat="server" ConnectionString="OSAG" 
        SelectCommand="SELECT Username, BIO, ProfilePic FROM MemberProfile JOIN Member WHERE MemberProfile.Username=@username"></asp:SqlDataSource>

<!-- Header -->

<div class="header"> 
 <h1> Our Mentors </h1>
 <div> <input type="text" placeholder="Search..."></div>
</div>


<!--First row of cards -->
<div class="rowone"> 
    <div class="container">
        <div class="row">
          <div class="col">
            <div class="card h-100" style="width: 18rem;">
              <img src="" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">
                          <asp:DataList ID="dlMenstorName" runat="server">
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <div class="fw-normal">
                                                        <%# DataBinder.Eval(Container.DataItem, "FirstName") %> <%# DataBinder.Eval(Container.DataItem, "LastName") %>
                                                    </div>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                </h5>
                <p class="card-text"><p> Mentors Bio</p>
                <a href="..." class="btn btn-outline-dark">Message </a>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100" style="width: 18rem;">
              <img src="..." class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Devena</h5>
                <p class="card-text"><p> Mentors Bio</p>
                <a href="..." class="btn btn-outline-dark">Message </a>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100" style="width: 18rem;">
              <img src="..." class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Stith</h5>
                <p class="card-text"><p> Mentors Bio</p>
                <a href="..." class="btn btn-outline-dark">Message  </a>
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
          <img src="..." class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Sparks</h5>
            <p class="card-text"><p> Mentors Bio</p>
            <a href="..." class="btn btn-outline-dark">Message  </a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="..." class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Crouch</h5>
            <p class="card-text"><p> Mentors Bio</p>
            <a href="..." class="btn btn-outline-dark">Message  </a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="..." class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Steele</h5>
            <p class="card-text"><p> Mentors Bio</p>
            <a href="..." class="btn btn-outline-dark">Message  </a>
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
          <img src="..." class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Taylor</h5>
            <p class="card-text"><p> Mentors Bio</p>
            <a href="..." class="btn btn-outline-dark">Message  </a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="..." class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">May</h5>
            <p class="card-text"><p> Mentors Bio</p>
            <a href="..." class="btn btn-outline-dark">Message  </a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100" style="width: 18rem;">
          <img src="..." class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title"> McMillian</h5>
            <p class="card-text"> <p> Mentors Bio</p>
            <a href="..." class="btn btn-outline-dark">Message  </a>
          </div>
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

</asp:Content>
