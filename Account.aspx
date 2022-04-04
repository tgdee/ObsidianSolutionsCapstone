<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="Lab3.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> student profile</title>
    <link href="StyleSheet.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style> 
.background { 
background-repeat: repeat;
background-attachment:scroll;
background-position: center center;
background-size: cover;
background-image:url("images/fadedbackground.png");
}
 

</style>

</head>


<body class="background">
 
    <div class="container">
        <div class="row">
    <!--logo-->
          <div class="col">
            <img src="images/logo.png" class="rounded float-left" alt="Responsive image" >
          </div>
    <!--nav bar-->
        </div>
        <div class="row">
    <!--create profile/ profile photo placeholder-->
          <div class="col">
            <div> <div class="card" style="width: 18rem;">
                <img class="card-img-top rounded-circle img-thumbnail" src="images/DefaultProfileIMG.jpg" alt="Upload Image">
                <div class="card-body">
                  <h5 class="card-title">
                      <asp:DataList ID="dlStudentName" runat="server">
                          <ItemTemplate>
                              <table>
                                  <tr>
                                      <div class="card-title">
                                          Name: <%# DataBinder.Eval(Container.DataItem, "FirstName") %> <%# DataBinder.Eval(Container.DataItem, "LastName") %>
                                      </div>
                                  </tr>
                              </table> 
                          </ItemTemplate>
                      </asp:DataList>
                  </h5>
                  <p class="card-text">
                      <asp:DataList ID="dlStudentEmail" runat="server">
                         <ItemTemplate>
                             <table>
                                 <tr>
                                     <div class="card-text">Email: <%# DataBinder.Eval(Container.DataItem, "Email") %></div>
                                 </tr>
                             </table>
                         </ItemTemplate>
                      </asp:DataList>
                      <asp:DataList ID="dlStudentInfo" runat="server">
                         <ItemTemplate>
                             <table>
                                 <tr>
                                     <div class="card-text">Major: <%# DataBinder.Eval(Container.DataItem, "Major") %></div>
                                     <div class="card-text">Grade: <%# DataBinder.Eval(Container.DataItem, "Grade") %></div>
                                     <div class="card-text">Graduation Year: <%# DataBinder.Eval(Container.DataItem, "GraduationYear") %></div>
                                 </tr>
                             </table>
                         </ItemTemplate>
                      </asp:DataList>

                  </p>
                  <label for="formFile" class="form-label fw-bold">Upload Resume</label>
                  <input class="form-control" type="file" id="formResume">
                  <br />
                  <label for="formFile" class="form-label fw-bold">Upload Portfolio</label>
                  <input class="form-control" type="file" id="formPortfolio">
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
                  <a href="#" class="btn btn-light">Edit Bio</a>
                </div>
              </div>
          </div>
    <!--Interests/skills  -->
          <div class="col">
            <div class="card border-secondary mb-3" style="max-width: 18rem;">
                <div class="card-header">Interests</div>
                <div class="card-body text-secondary">
                  <h5 class="card-title">Secondary card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn btn-light">Edit Interests</a>
                </div>
              </div>
              <div class="card border-secondary mb-3" style="max-width: 18rem;">
                <div class="card-header">Skills</div>
                <div class="card-body text-secondary">
                  <h5 class="card-title">Secondary card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn btn-light">Edit Skills</a>
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


    <asp:SqlDataSource ID="sqltesting" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>"
        SelectCommand="SELECT FirstName, LastName, Email FROM UserLogin WHERE Username=@userName">
    </asp:SqlDataSource>

    <asp:Table runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell HorizontalAlign="Center">
                <asp:Label ID="lblHeaderMessage" runat="server" Text="Account Information" Font-Underline="true"></asp:Label>
                <br />
                <br />
                <asp:Literal ID="ltError" runat="server" Text=""></asp:Literal>
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DataList ID="dlAccount" runat="server" RepeatDirection="Vertical" RepeatColumns="3" RepeatLayout="Flow" CellPadding="50" CellSpacing="50">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th style="width:300px" align="left">First Name</th>
                                <th style="width:300px" align="left">Last Name</th>
                                <th style="width:300px" align="left">Email</th>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width:300px" align="left"> <asp:Label ID="lblFirstName" Text='<%# DataBinder.Eval(Container.DataItem, "FirstName") %>' runat="server"></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblLastName" Text='<%# DataBinder.Eval(Container.DataItem, "LastName") %>' runat="server"></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblEmail" Text='<%# DataBinder.Eval(Container.DataItem, "Email") %>' runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                    <br />
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter New First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfFirstName" runat="server" Enabled="true" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter New Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfLastName" runat="server" Enabled="true" ValidationGroup="UpdateValidation" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter New Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfEmail" runat="server" Enabled="true" ControlToValidate="txtEmail" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter Old Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfPassword" runat="server" Enabled="true" ControlToValidate="txtPassword" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtNewPassword" CssClass="form-control" ValidationGroup="UpdateValidation" runat="server" placeholder="Enter New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfNewPassword" runat="server" Enabled="true" ControlToValidate="txtNewPassword" ErrorMessage="Enter New Password" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <br />
                <div class="btnUp">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ValidationGroup="UpdateValidation" OnClick="btnUpdate_Click"/>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />

    <h1>Upload Resume</h1>
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnUpload" runat="server" ValidationGroup="DisplayResumeValidation" Text="Upload File" OnClick="btnUpload_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true"></asp:Label>
            <br />
            <br />
        </div>



    <br />
    <asp:Button ID="btnViewResume" runat="server" Text="View Your Resume" ValidationGroup="DisplayResumeValidation" OnClick="btnViewResume_Click" />
    <br />
    <asp:Button ID="btnDelete" runat="server" Text="Delete Selected Resume" OnClick="btnDelete_Click" ValidationGroup="DisplayResumeValidation" />


</asp:Content>
