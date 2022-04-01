﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowseStudentOpportunities.aspx.cs" Inherits="Lab3.BrowseStudentOpportunities" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="StudentOpportunitiesStyle.css" rel="stylesheet" />
</head>
<body>
<section id="sectionJobList" class="section section-job-list gradient-light--lean-left">
      <div class="container">

        <div class="row row-grid justify-content-center">

          <div class="col-md-8 col-lg-7 col-xl-6 text-center">
            <h2 class="section__title mb-4">Jobs Openings at Fluxo</h2>

            <p>We’re always searching for amazing people to join our team. Take a look at our current openings.</p>

          </div>

          <div class="col-md-10">

            <form class="filter-form mt-5 mb-4" runat="server">
              <div class="row">

                <div class="col-md-4 mb-3">
                  <div class="form-group">
                      <label for="ddlIndustry">Industry </label>
                      <asp:DropDownList ID="ddlIndustry" runat="server" class="custom-select">
                          <asp:ListItem Selected="True" Value="0">-Select-</asp:ListItem>
                          <asp:ListItem Value="Banking">Banking</asp:ListItem>
                          <asp:ListItem Value="FinServices">Financial Services</asp:ListItem>
                          <asp:ListItem Value="HCare">Healthcare</asp:ListItem>
                          <asp:ListItem Value="Insurance">Insurance</asp:ListItem>
                          <asp:ListItem Value="ProServices">Professional Services</asp:ListItem>
                          <asp:ListItem Value="electricUtility">Utility</asp:ListItem>
                      </asp:DropDownList>

                  </div>
                </div>

                <div class="col-md-4 mb-3">
                  <div class="form-group">
                    <label for="ddlType">Type </label>
                    <asp:DropDownList ID="ddlType" runat="server" class="custom-select">
                          <asp:ListItem Selected="True" Value="0">-Select-</asp:ListItem>
                          <asp:ListItem Value="fullTime">Full-Time</asp:ListItem>
                          <asp:ListItem Value="partTime">Part-Time</asp:ListItem>
                          <asp:ListItem Value="internShip">Internship</asp:ListItem>
                      </asp:DropDownList>
                  </div>
                </div>

                <div class="col-md-4 mb-3">
                  <div class="form-group">
                    <label for="ddlLocation">Location </label>
                   <asp:DropDownList ID="ddlLocation" runat="server" class="custom-select">
                          <asp:ListItem Selected="True" Value="0">-Select-</asp:ListItem>
                          <asp:ListItem Value="virginia">Virginia, US</asp:ListItem>
                          <asp:ListItem Value="newYork">Michigan, US</asp:ListItem>
                          <asp:ListItem Value="michigan">New York, US</asp:ListItem>
                          <asp:ListItem Value="california">California, US</asp:ListItem>
                      </asp:DropDownList>
                  </div>
                </div>

                  <div class="col-md-5 mb-4">
                  <div class="form-group">
                    <label for="ddlMajor">Major </label>
                    <asp:DropDownList ID="ddlMajor" runat="server" class="custom-select">
                        <asp:ListItem Selected="True" Value="0">-Select-</asp:ListItem>
                        <asp:ListItem Value="accounting">Accounting</asp:ListItem>
                        <asp:ListItem Value="CIS">Computer Information Systems</asp:ListItem>
                        <asp:ListItem Value="economics">Economics</asp:ListItem>
                        <asp:ListItem Value="engineering">Engineering</asp:ListItem>
                        <asp:ListItem Value="finance">Finance</asp:ListItem>
                        <asp:ListItem Value="psych">Psychology</asp:ListItem>
                      </asp:DropDownList>
                  </div>
                </div>

                  <div class="col-md-5 mb-4">
                      <div class="form-group">
                          <label for="jobLocation">Employer </label>
                          <asp:DropDownList ID="ddlEmployer" runat="server" class="custom-select">
                              <asp:ListItem Selected="True" Value="0">-Select-</asp:ListItem>
                              <asp:ListItem Value="capOne">Capital One</asp:ListItem>
                              <asp:ListItem Value="dominionEnergy">Dominion Energy</asp:ListItem>
                              <asp:ListItem Value="eY">EY</asp:ListItem>
                              <asp:ListItem Value="freddieMac">Freddie Mac</asp:ListItem>
                              <asp:ListItem Value="jpMorgan">JP Morgan</asp:ListItem>
                              <asp:ListItem Value="markel">Markel</asp:ListItem>
                              <asp:ListItem Value="pnc">PNC</asp:ListItem>
                              <asp:ListItem Value="pra">PRA</asp:ListItem>
                              <asp:ListItem Value="schroders">Schroders</asp:ListItem>
                              <asp:ListItem Value="sentara">Sentara</asp:ListItem>
                          </asp:DropDownList>
                      </div>
                  </div>

                  <div class="col-md-5 mb-4">
                      <div class="form-group">
                          <label for="jobLocation">Search </label>
                          <asp:TextBox ID="txtSerach" class="form-control" runat="server"></asp:TextBox>

                      </div>

                  </div>
                  <div class="col-md-4 mb-4 pt-4 pl-3">
                      <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn-lg btn-success" />
                  </div>

              </div>
            </form>

              <div class="job-list__wrapper mb-6">
                  <h3 class="mb-4">Design</h3>
                  <div>
                      <asp:GridView ID="gvJobList" runat="server"></asp:GridView>
                  </div>
              </div>

              <%--<a href="career-single.html" class="card p-0 mb-3 border-0 shadow-sm shadow--on-hover">
                <div class="card-body">
                  <span class="row justify-content-between align-items-center">
                    <span class="col-md-5 color--heading">
                      <span class="badge badge-circle background--danger text-white mr-3">GD</span> Senior Graphic Designer
                    </span>

                    <span class="col-5 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-clock mr-1"></i> Full time
                    </span>

                    <span class="col-7 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-map-marker-alt mr-1"></i> San Fransisco, US
                    </span>

                    <span class="d-none d-md-block col-1 text-center color--text">
                      <small><i class="fas fa-chevron-right"></i></small>
                    </span>
                  </span>
                </div>
              </a> <!-- Job Card -->

              <a href="career-single.html" class="card p-0 mb-3 border-0 shadow-sm shadow--on-hover">
                <div class="card-body">
                  <span class="row justify-content-between align-items-center">
                    <span class="col-md-5 color--heading">
                      <span class="badge badge-circle background--tertiary text-white mr-3">UX</span> UI/UX Designer
                    </span>

                    <span class="col-5 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-clock mr-1"></i> Remote
                    </span>

                    <span class="col-7 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-map-marker-alt mr-1"></i> Anywhere
                    </span>

                    <span class="d-none d-md-block col-1 text-center color--text">
                      <small><i class="fas fa-chevron-right"></i></small>
                    </span>
                  </span>
                </div>
              </a> <!-- Job Card -->

              <a href="career-single.html" class="card p-0 mb-3 border-0 shadow-sm shadow--on-hover">
                <div class="card-body">
                  <span class="row justify-content-between align-items-center">
                    <span class="col-md-5 color--heading">
                      <span class="badge badge-circle background--warning text-white mr-3">AN</span> Multimedia Artist &amp; Animator
                    </span>

                    <span class="col-5 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-clock mr-1"></i> Full time
                    </span>

                    <span class="col-7 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-map-marker-alt mr-1"></i> Birmingham, UK
                    </span>

                    <span class="d-none d-md-block col-1 text-center color--text">
                      <small><i class="fas fa-chevron-right"></i></small>
                    </span>
                  </span>
                </div>
              </a> <!-- Job Card -->
            </div>

            <div class="job-list__wrapper mb-6">
              <h3 class="mb-4">Development</h3>

              <a href="career-single.html" class="card p-0 mb-3 border-0 shadow-sm shadow--on-hover">
                <div class="card-body">
                  <span class="row justify-content-between align-items-center">
                    <span class="col-md-5 color--heading">
                      <span class="badge badge-circle background--success text-white mr-3">FE</span> Front End Developer
                    </span>

                    <span class="col-5 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-clock mr-1"></i> Part time
                    </span>

                    <span class="col-7 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-map-marker-alt mr-1"></i> Sydney, AU
                    </span>

                    <span class="d-none d-md-block col-1 text-center color--text">
                      <small><i class="fas fa-chevron-right"></i></small>
                    </span>
                  </span>
                </div>
              </a> <!-- Job Card -->

              <a href="career-single.html" class="card p-0 mb-3 border-0 shadow-sm shadow--on-hover">
                <div class="card-body">
                  <span class="row justify-content-between align-items-center">
                    <span class="col-md-5 color--heading">
                      <span class="badge badge-circle background--warning2 text-white mr-3">MD</span> Mobile Developer
                    </span>

                    <span class="col-5 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-clock mr-1"></i> Full-time
                    </span>

                    <span class="col-7 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-map-marker-alt mr-1"></i> San Fransisco, US
                    </span>

                    <span class="d-none d-md-block col-1 text-center color--text">
                      <small><i class="fas fa-chevron-right"></i></small>
                    </span>
                  </span>
                </div>
              </a> <!-- Job Card -->

              <a href="career-single.html" class="card p-0 mb-3 border-0 shadow-sm shadow--on-hover">
                <div class="card-body">
                  <span class="row justify-content-between align-items-center">
                    <span class="col-md-5 color--heading">
                      <span class="badge badge-circle background--info text-white mr-3">NT</span> .NET Developer
                    </span>

                    <span class="col-5 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-clock mr-1"></i> Full time
                    </span>

                    <span class="col-7 col-md-3 my-3 my-sm-0 color--text">
                      <i class="fas fa-map-marker-alt mr-1"></i> Manchester, UK
                    </span>

                    <span class="d-none d-md-block col-1 text-center color--text">
                      <small><i class="fas fa-chevron-right"></i></small>
                    </span>
                  </span>
                </div>
              </a> <!-- Job Card -->
            </div>
          </div>

        </div>
      </div>--%>
    </section>

    <script src="Scripts/jquery-3.6.0.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>