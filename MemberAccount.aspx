<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberAccount.aspx.cs" Inherits="Lab3.MemberAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="ProfileButtons.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet">
    

    <!-- MEMBER ACCOUNT BOOTSTRAP WIP -->
    <br />
    <br />
    <div class="row">
        <div class="col">
            <div class="text-center font-weight-bold">
                <div class="text-decoration-underline">
                <asp:Label ID="lblMentorTitle" runat="server" Text="Ole School Mentors"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="row">
      <div class="col">
        <div class="card border-secondary" style="width: 18rem;">
          <div class="card-body">
            <div class="d-flex flex-column align-items-center">
            <asp:Image ID="profilePic" CssClass="card-img-top rounded-circle img-thumbnail" Height="200px" Width="200px" runat="server" />
            <br />
                <asp:FileUpload ID="FileUpload1" CssClass="profileButtonFile" runat="server" />
                <asp:Button ID="btnUploadPicture" CssClass="profileButton" runat="server" Text="Change Picture" />
            <br />
            <p class="card-text">Sample text in area where name, region, and contact info will be displayed</p>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-5 offset-md-3">
        <div class="card border-secondary">
            <div class="card-header font-weight-bold">
                Professional Bio
            </div>
          <div class="card-body">
              <div class="d-flex flex-column align-items-center">
            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
              <asp:Button ID="btnEditBio" CssClass="profileButton" runat="server" Text="Edit Bio" />
              </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
    <div class="col-md-4 offset-md-4">
        <div class="card border-secondary">
            <div class="card-header font-weight-bold">
                Interests
            </div>
          <div class="card-body">
              <div class="d-flex flex-column align-items-center">
              <asp:Button ID="btnEditInterests" CssClass="profileButton" runat="server" Text="Edit Interests" />
              </div>
          </div>  
       </div>
    </div>
    <div class="col-md-4">
        <div class="card border-secondary">
            <div class="card-header font-weight-bold">
                Skills
            </div>
          <div class="card-body">
              <div class="d-flex flex-column align-items-center">
              <asp:Button ID="btnEditSkills" CssClass="profileButton" runat="server" Text="Edit Skills" />
              </div>
          </div>  
       </div>
    </div>
  </div>
    
    
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
