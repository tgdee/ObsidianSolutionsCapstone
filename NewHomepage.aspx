﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="NewHomePage.aspx.cs" Inherits="Lab3.NewHomePage" %>



<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

   
    <div class="container-lg justify-content-center"  >
        <div class="bg-image" style="background-color:#ffb6c1 ">
            <div>
                <asp:Panel runat="server" HorizontalAlign="Center">     
                    <h1> Ole School Alumni Group</h1>
                    <asp:Image ID="Image1" runat="server" Height="500" Width="800px" ImageUrl="images/JMU_Campus.jpg"/>
                    <br />
                    <br />        
                
                <div class="row">
                    <div class="col-8"><h2>Our Mission</h2>
                        <p>
                            The Ole School Alumni Group is a grassroots, non-profit organization envisioned by three African American James Madison University (JMU) alumni that graduated in the 1980s. They recalled priceless memories and experiences; recognized the value of retaining old & new traditions; saw the need for reconnecting, networking, and most importantly, providing scholarships. Founded in 2005, the group is committed to giving back to JMU in support of African American recruitment and retention efforts. OSAG provides scholarships, mentorship, internships, and recruitment support aimed at building minority recruitment and retention at JMU and beyond.
                        </p>
                    </div>
                    <br />
                    <br />
                    <div class="col-8"><iframe width="500" height="315" src="https://www.youtube.com/embed/ABiRjz3--10" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
                    </div>
                </asp:Panel>
         </div>
  <%--       <ul class="nav justify-content-end">
                    <li class="nav-item pr-1">
                        <asp:LinkButton ID="lbLogin" OnClick="lbLogin_Click" class="btn btn-success" runat="server">Login / Sign Up</asp:LinkButton>
                    </li>
                </ul>--%>

            </div>

      </div>



    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
  </asp:Content>
    
  

