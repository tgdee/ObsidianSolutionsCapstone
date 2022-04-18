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
                  <asp:LinkButton ID="Link" runat="server" OnClick="Link_Click">Nora Crouch</asp:LinkButton>
                 <%-- Nora Crouch--%>
                <%--<a href="https://www.capitalonecareers.com/" target="https://www.capitalonecareers.com/" class="btn btn-outline-dark">Learn More</a>--%>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/charles_may.jpeg" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">               
                 <asp:LinkButton ID="Lk2" runat="server" OnClick="Lk2_Click">Charles May</asp:LinkButton>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/LesaMoore.jpg" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">
                <asp:LinkButton ID="Lk3" runat="server" OnClick="Lk3_Click">Lesa Moore</asp:LinkButton>
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
                  <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Malcom Taylor</asp:LinkButton>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/Angela_Russell.jpeg" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">               
                 <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Angela J Russell</asp:LinkButton>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/derek_Steele.png" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Derek Steele</asp:LinkButton>
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
                  <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton1_Click" Text="Kimberley Hundley"></asp:LinkButton>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-60" style="width: 18rem;">
              <img src="images/VondaSpark.jpg" class="card-img-top rounded-circle img-thumbnail" alt="...">
              <div class="card-body align-content-center" style="font-size:large;font-weight:bold">               
                 <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton2_Click" Text="Vonda Sparks"></asp:LinkButton>
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
