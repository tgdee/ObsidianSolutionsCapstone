<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberChoice.aspx.cs" Inherits="Lab3.MemberChoice" MasterPageFile="~/StudentMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
  border-radius: 50px;
}

.rowtwo{ 
  margin-bottom: 50px;
}

.rowthree{
  margin-bottom: 50px;
}


</style>
    <body class="background">
        <div class="header"> 
            <h1 style="align-content:center"> Our Leaders</h1>
            <%-- <div> <input type="text" placeholder="Search..."></div>--%>
        </div>

        <%--First Row of Mentors--%>
        <div class="rowone"> 
    <div class="container">
        <div class="row">
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/NoraC.png" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-right" style="font-size:large;font-weight:bold">
                  <asp:Label ID="Label1" runat="server" Text="Nora Crouch"></asp:Label>
                 <%-- Nora Crouch--%>
                <%--<a href="https://www.capitalonecareers.com/" target="https://www.capitalonecareers.com/" class="btn btn-outline-dark">Learn More</a>--%>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/charles_may.jpeg" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">               
                  <asp:Label ID="Label2" runat="server" Text="Charles May"></asp:Label>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/LesaMoore.jpg" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">
                  <asp:Label ID="Label3" runat="server" Text="Lesa Moore"></asp:Label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   <%-- Second Row of Leaders--%>
    <div class="rowtwo">
        <div class="container">
        <div class="row">
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/malcom_taylor.jpeg"class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-right" style="font-size:large;font-weight:bold">
                  <asp:Label ID="Label4" runat="server" Text="Malcom Taylor"></asp:Label>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/Angela_Russell.jpeg" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">               
                  <asp:Label ID="Label5" runat="server" Text="Angela J Russell"></asp:Label>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/derek_Steele.png" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">
                  <asp:Label ID="Label6" runat="server" Text="Derek Steele"></asp:Label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
       <%-- Third Row of Leaders--%>
    <div class="rowthree">
        <div class="container">
        <div class="row">
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/kimberely-hundley.jpeg" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-right" style="font-size:large;font-weight:bold">
                  <asp:Label ID="Label7" runat="server" Text="Kimberley Hundley"></asp:Label>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/VondaSpark.jpg" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">               
                  <asp:Label ID="Label8" runat="server" Text="Vonda Sparks"></asp:Label>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">
                <asp:LinkButton ID="LinkButton6" runat="server" OnClick="SearchLeader" Text="All Leaders"></asp:LinkButton>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>














    </body>
</asp:Content>
