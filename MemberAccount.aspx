<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberAccount.aspx.cs" Inherits="Lab3.MemberAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>student profile</title>
        <link href="StyleSheet.css" rel="stylesheet">
        <link href="ProfileButtons.css" rel="stylesheet" />
        <link href="Border.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <style>
            .background {
                background-repeat: repeat;
                background-attachment: scroll;
                background-position: center center;
                background-size: cover;
                background-image: url("images/fadedbackground.png");
            }
        </style>

    </head>


    <body class="background">
        <div class="container">
            <div class="row gutters-sm">
                <!--create profile/ profile photo placeholder-->
                <div class="col-md-4">
                    <div class="card border-secondary" style="width: 24rem;">
                        <br />
                        <asp:Image ID="profilePic" CssClass="card-img-top rounded-circle img-thumbnail align-content-center" Height="350px" Width="400px" runat="server" />
                        <!-- <img class="card-img-top rounded-circle img-thumbnail" src="images/john2.jpg" alt="Upload Image" /> -->
                        <div class="card-body">
                            <h5 class="card-title">
                                <!-- IMG UPLOADING WIP -->
                                <asp:FileUpload ID="FileUpload3" CssClass="profileButtonFile" runat="server" />
                                <%--<asp:FileUpload ID="FileUpload2" CssClass="profileButtonFile" runat="server" />--%>
                                <asp:Button ID="btnChangePicture" OnClick="btnChangePicture_Click" runat="server" Text="Change Picture" CssClass="profileButton" />
                                <asp:Label ID="lblUploadMess" runat="server" Text=""></asp:Label>
                                <asp:DataList ID="dlMemberName" runat="server">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <div class="card-title fw-bold">Name:</div>
                                                <div class="fw-normal">
                                                    <%# DataBinder.Eval(Container.DataItem, "FirstName") %> <%# DataBinder.Eval(Container.DataItem, "LastName") %>
                                                </div>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </h5>
                            <p class="card-text">
                                <asp:DataList ID="dlMemberEmail" runat="server">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <div class="card-text fw-bold">Email:</div>
                                                <div class="fw-normal"><%# DataBinder.Eval(Container.DataItem, "Email") %></div>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </p>
                        </div>
                    </div>
                </div>
                <!--Member Bio-->
                <div class="col-md-8">
                    <div class="card border-secondary mb-3">
                        <div class="card-header fw-bold">Bio</div>
                        <div class="card-body">
                            <p class="card-text">
                                <asp:DataList ID="dlBio" runat="server">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <div class="card-text fw-normal">
                                                    <%# DataBinder.Eval(Container.DataItem,"BIO")%>
                                                </div>
                                            </tr>
                                        </table>
                                    </ItemTemplate>

                                </asp:DataList>
                                <asp:TextBox ID="txtBioEdit" runat="server" Visible="false" CssClass="form-control" MaxLength="2000"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnBioEdit" CssClass="profileButton" runat="server" Text="Edit Bio" OnClick="btnBioEdit_Click"/>
                                <asp:Button ID="btnBioSave" CssClass="profileButton" runat="server" Text="Save" Visible="false" OnClick="btnBioSave_Click"/>
                                <asp:Button ID="btnBioCancel" CssClass="profileButton" runat="server" Text="Cancel" Visible="false" OnClick="btnBioCancel_Click"/>
                            </p>
                        </div>
                    </div>
                    <!--Interests/skills  -->
                    <div class="row justify-content-center">
                        <div class="col">
                            <div class="card border-secondary mb-3">
                                <div class="card-header fw-bold">Interests</div>
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:DataList runat="server" ID="dlInterests">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <div class="card-text fw-normal">
                                                            <%# DataBinder.Eval(Container.DataItem,"Interests")%>
                                                        </div>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:TextBox ID="txtInterestsEdit" runat="server" Visible="false" CssClass="form-control" MaxLength="500"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="btnInterestsEdit" CssClass="profileButton" runat="server" Text="Edit Interests" OnClick="btnInterestsEdit_Click"/>
                                        <asp:Button ID="btnInterestsSave" CssClass="profileButton" runat="server" Text="Save" Visible="false" OnClick="btnInterestsSave_Click"/>
                                        <asp:Button ID="btnInterestsCancel" CssClass="profileButton" runat="server" Text="Cancel" Visible="false" OnClick="btnInterestsCancel_Click"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-secondary mb-3">
                                <div class="card-header fw-bold">Skills</div>
                                <div class="card-body">
                                    <p class="card-text">
                                        <asp:DataList runat="server" ID="dlSkills">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <div class="card-text fw-normal">
                                                            <%# DataBinder.Eval(Container.DataItem,"Skills")%>
                                                        </div>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:TextBox ID="txtSkillsEdit" runat="server" Visible="false" CssClass="form-control" MaxLength="500"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="btnSkillsEdit" CssClass="profileButton" runat="server" Text="Edit Skills" OnClick="btnSkillsEdit_Click"/>
                                        <asp:Button ID="btnSkillsSave" CssClass="profileButton" runat="server" Text="Save" Visible="false" OnClick="btnSkillsSave_Click"/>
                                        <asp:Button ID="btnSkillsCancel" CssClass="profileButton" runat="server" Text="Cancel" Visible="false" OnClick="btnSkillsCancel_Click"/>
                                    </p>
                                </div>
                            </div>
                        </div>
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
        SelectCommand="SELECT FirstName, LastName, Email FROM UserLogin WHERE Username=@userName"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OSAG %>"
        SelectCommand="SELECT * FROM MemberProfile WHERE Username=@Username"></asp:SqlDataSource>


    <!-- PREXISTING CODE 
    <asp:Literal ID="ltError" runat="server" Text=""></asp:Literal>
    <asp:Table runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell HorizontalAlign="Center">
                <asp:Label ID="lblHeaderMessage" runat="server" Text="Account Information" Font-Underline="true"></asp:Label>
                <br />
                <br />
                <%--<asp:Literal ID="ltError" runat="server" Text=""></asp:Literal>--%>
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
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter New Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfLastName" runat="server" Enabled="true" ValidationGroup="UpdateValidation" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter New Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfEmail" runat="server" Enabled="true" ControlToValidate="txtEmail" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter Old Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfPassword" runat="server" Enabled="true" ControlToValidate="txtPassword" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
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
    <%--<br />
    <h3>Uploaded Resumes</h3>
    <asp:GridView ID="gvDisplay" runat="server" DataKeyNames="FileLocation" ValidationGroup="DisplayResumeValidation" OnSelectedIndexChanged="gvDisplay_SelectedIndexChanged" >
        <Columns>
            <asp:CommandField ShowSelectButton="true" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Download Resume" ValidationGroup="DisplayResumeValidation" OnClick="LinkButton1_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>--%>
    <%--</asp:GridView>
    <%--<br />
    <asp:Label ID="lblSelected" runat="server" Text=""></asp:Label>
    <asp:Button ID="btnDelete" runat="server" Text="Delete Selected Resume" OnClick="btnDelete_Click" ValidationGroup="DisplayResumeValidation" />--%>--%>
    
    -->

</asp:Content>
