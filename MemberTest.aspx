<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberTest.aspx.cs" Inherits="Lab3.MemberTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <div class="container my-auto">
        <div class="jumbotron border">
            <div class="row">
                <div class="col-xs-offset-2 col-xs-8">
                    <h1 class="display-4">Member Information</h1>
                </div>
                <div class="col-xs-2">
                    <%--<img class="img-thumbnail" src="/images/logo_transparent_background.jpg" />--%>
                </div>
            </div>
        </div>
        <h4 class="display-6 ">Search Member Information</h4>
        <div class="row p-1">
            <div class="col">
                <label for="txtFirstNameSearch">First Name</label>
            </div>
            <div class="col">
                <label for="txtLastNameSearch">Last Name</label>
            </div>
            <div class="col">
                <label for="txtUserNameSearch">Username</label>
            </div>
            <div class="col">
                <label for="txtEmailSearch">Email</label>
            </div>
        </div>
        <div class="row p-1">
            <div class="col">
                <asp:TextBox ID="txtFirstNameSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtLastNameSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtUserNameSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
            <div class="col">
                <asp:TextBox ID="txtEmailSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
            </div>
        </div>
        
        
        <div class="row p-1 pt-2">
            <div class="col">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" class="btn btn-success"/>
            </div>
        </div>
    </div>













   <%-- <br />
    <br />
    <h1>Member Information</h1>--%>
    <h4>
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </h4>

    <div class="container my-auto">
    <table class="table caption-top">
    <caption class="pt-5">List of students</caption>

    <asp:GridView ID="gvMember" runat="server" class="table table-hover table-bordered table-condensed" OnSelectedIndexChanged="gvMember_SelectedIndexChanged" Width="500px" EmptyDataText="Member Record Not Found">
        <Columns>
            <asp:CommandField ShowSelectButton="true" />
        </Columns>
    </asp:GridView>
        </table>
        <asp:Label ID="lblMessage" runat="server" class="form-label"></asp:Label>
        </div>







    <%--<asp:GridView ID="gvMember" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MemberID" DataSourceID="MemberDataSource" Height="150px" Width="451px" AutoGenerateEditButton="false" OnSelectedIndexChanged="gvMember_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowEditButton="False" ValidationGroup="UpdateValidation" />
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" Visible="False" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="LblMemberID" runat="server" Text='<%# Bind("MemberID") %>' Visible="true"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfFirstName" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter First Name" ForeColor="Red" Font-Bold="true" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfLastName" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Last Name" ForeColor="Red" Font-Bold="true" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email" ItemStyle-HorizontalAlign="Center" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfEmail" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Email" ForeColor="Red" Font-Bold="true" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                

                
            
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            
                <asp:CommandField ShowSelectButton="True" ValidationGroup="UpdateValidation" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle ForeColor="#330099" HorizontalAlign="Center" BackColor="#FFFFCC" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />

    </asp:GridView>
    <br />--%>
    <br />
    <br />
    <br />
    <asp:Label ID="lblMemberFirstName" runat="server" Text="First Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtMemberFirstName" runat="server" placeholder="Enter First Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqFirstName" runat="server" ControlToValidate="txtMemberFirstName" ErrorMessage="Enter First Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblMemberLastName" runat="server" Text="Last Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtMemberLastName" runat="server" placeholder="Enter Last Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqLastName" runat="server" ControlToValidate="txtMemberLastName" ErrorMessage="Enter Last Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblMemberEmail" runat="server" Text="Email:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtMemberEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqEmail" runat="server" ControlToValidate="txtMemberEmail" ErrorMessage="Enter Email" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />


    <asp:Button ID="btnAddRow" runat="server" Text="Add New Row" CssClass="btn btn-primary" OnClick="btnAddRow_Click" />


    <asp:SqlDataSource ID="MemberDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [MemberID] = @MemberID" InsertCommand="INSERT INTO [Member] ([FirstName], [LastName], [Email]) VALUES (@FirstName, @LastName, @Email)" SelectCommand="SELECT * FROM [Member] ORDER BY [MemberID]" UpdateCommand="UPDATE [Member] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email WHERE [MemberID] = @MemberID">
        <DeleteParameters>
            <asp:Parameter Name="MemberID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="MemberID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>
</asp:Content>
