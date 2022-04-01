<%@ Page Title="" Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="NewHomePage.aspx.cs" Inherits="Lab3.NewHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="bg-image" style="background-image:url(images/faded%20background.png);margin-top:0px;background-size:cover">
    
        <div class="col-lg-6 ">
                <ul class="nav justify-content-end">
                    <li class="nav-item pr-1">
                        <asp:LinkButton ID="lbLogin" OnClick="lbLogin_Click" class="btn btn-success" runat="server">Login / Sign Up</asp:LinkButton>
                    </li>
                    </ul>
            </div>
        <div>
        <asp:Panel runat="server" HorizontalAlign="Center">
        <br />
        <br />
        <br />        
        <h1>Ole School Alumni Group</h1>
        <asp:Image ID="Image1" runat="server" Height="200" Width="200" ImageUrl="~/images/logo.png" />
        <br />
        <br />
                
    </asp:Panel>
        </div>
      </div>

</asp:Content>
