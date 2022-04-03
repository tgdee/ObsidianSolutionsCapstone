<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowseStudentOpportunities.aspx.cs" Inherits="Lab3.BrowseStudentOpportunities" %>

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
                    <h2 class="section__title mb-4">Browse Opportunities</h2>

                    <p>Take a look at our Corporate Sponsor's current openings.</p>

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
                            
                            <div class="col-md-4 mb-3">
                                <div class="form-group">
                                    <label for="ddlCity">City </label>
                                    <asp:DropDownList ID="ddlCity" runat="server" class="custom-select">
                                        <asp:ListItem Selected="True" Value="0">-Select-</asp:ListItem>
                                        <asp:ListItem Value="newYorkCity">New York City</asp:ListItem>
                                        <asp:ListItem Value="hBurg">Harrisonburg</asp:ListItem>
                                        <asp:ListItem Value="mcLean">McLean</asp:ListItem>
                                        <asp:ListItem Value="chicago">Chicago</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4 mb-3">
                                <div class="form-group">
                                    <label for="ddlState">State </label>
                                    <asp:DropDownList ID="ddlState" runat="server" class="custom-select">
                                        <asp:ListItem Selected="True" Value="0">-Select-</asp:ListItem>
                                        <asp:ListItem Value="virginia">Virginia</asp:ListItem>
                                        <asp:ListItem Value="newYork">Michigan</asp:ListItem>
                                        <asp:ListItem Value="michigan">New York</asp:ListItem>
                                        <asp:ListItem Value="california">California</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4 mb-3">
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
                                    <label for="txtSearch">Search </label>
                                    <asp:TextBox ID="txtSearch" class="form-control" runat="server"></asp:TextBox>

                                </div>

                            </div>
                            <div class="col-md-4 mb-4 pt-4 pl-3">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn-lg btn-success" />
                            </div>

                        </div>
                       
                        <div class="job-list__wrapper mb-6">
                            <h3 class="mb-4">Opportunities</h3>
                            <div>
                                <asp:ListView ID="lvStudentOpportunities" runat="server">
                                    <LayoutTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4>Browse Opportunities</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="table-responsive" id="tableScorll" tabindex="2" style="height: 400px; overflow: hidden; outline: none;">
                                                                <table class="table table-striped" id="tbl1" runat="server">
                                                                    <tr runat="server">
                                                                        <th runat="server">Title</th>
                                                                        <th runat="server">Type</th>
                                                                        <th runat="server">City</th>
                                                                        <th runat="server">State</th>
                                                                        <th runat="server">Industry</th>
                                                                        <th runat="server">Deadline</th>
                                                                        <th runat="server">Link</th>
                                                                        <th runat="server">Employer</th>
                                                                    </tr>
                                                                    <tr runat="server" id="itemPlaceholder" />
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NumericPagerField />
                                            </Fields>
                                        </asp:DataPager>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                                <tr runat="server">
                                                    <td>
                                                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblType" runat="server" Text='<%# Eval("Type") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblIndustry" runat="server" Text='<%# Eval("Industry") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblDeadLine" runat="server" Text='<%# Eval("Deadline") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblLink" runat="server" Text='<%# Eval("Link") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblCorpName" runat="server" Text='<%# Eval("CorpName") %>' />
                                                    </td>
                                                </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>



        <asp:SqlDataSource ID="sdsOpportunities" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" SelectCommand="SELECT [Title], [Type], [City], [State], [Deadline], [Link], [Industry], [CorpName] FROM [Opportunity] ORDER BY [OpportunityID]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsEmployerName" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" SelectCommand="SELECT [CorpName] FROM [Opportunity] ORDER BY [CorpName]"></asp:SqlDataSource>
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
