<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Lab3._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <h1>Student Information Page</h1>
    <h4>
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </h4>
    

    <asp:Label ID="Label8" runat="server" Text="First Name"></asp:Label>
    &nbsp
    <asp:TextBox ID="txtFirstNameSearch" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label9" runat="server" Text="Last Name"></asp:Label>
    &nbsp
    <asp:TextBox ID="txtLastNameSearch" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label14" runat="server" Text="Username"></asp:Label>
    &nbsp
    <asp:TextBox ID="txtUserNameSearch" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label10" runat="server" Text="Email"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtEmailSearch" runat="server" ValidationGroup="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label11" runat="server" Text="Account State:"></asp:Label>
    &nbsp
    <asp:DropDownList ID="ddlAccountState" runat="server">
        <asp:ListItem Text="Approved" Value="1"></asp:ListItem>
        <asp:ListItem Text="Unapproved" Value="2"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" />
    <br />
    <br />

    <asp:GridView ID="gvSearch" runat="server" EmptyDataText="Student Record Not Found" OnRowCreated="gvSearch_RowCreated"></asp:GridView>




    



    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="gvStudent" CssClass="table table-striped student-table" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvStudent_SelectedIndexChanged" DataKeyNames="StudentID" DataSourceID="StudentDataSource">
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" Visible="False" />
            <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqFirstName" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter First Name" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqLastName" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Last Name" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Grade" SortExpression="Grade">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Grade") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqGrade" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Grade" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GraduationYear" SortExpression="GraduationYear">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("GraduationYear") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqGraduationYear" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter Grad Year" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("GraduationYear") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Major" SortExpression="Major">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Major") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqMajor" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter Major" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Major") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PhoneNumber" SortExpression="PhoneNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqPhoneNumber" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter Phone Number" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqEmail" runat="server" ControlToValidate="TextBox7" ErrorMessage="Enter Email" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ValidationGroup="UpdateValidation" />
            

        </Columns>
    </asp:GridView>
    <br />

    <asp:Label ID="LblFirstName" runat="server" Text="First Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtFirstName" runat="server" placeholder="Enter First Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfFirst" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="LblLastName" runat="server" Text="Last Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtLastName" runat="server" placeholder="Enter Last Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfLast" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblGrade" runat="server" Text="Grade"></asp:Label>
    <br />
    <asp:TextBox ID="txtGradeBox" runat="server" placeholder="Grade"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfGrade" runat="server" ControlToValidate="txtGradeBox" ErrorMessage="Enter Grade" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="LblGradYear" runat="server" Text="Graduation Year"></asp:Label>
    <br />
    <asp:TextBox ID="txtGradYear" runat="server" placeholder="Enter Graduation Year"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfGraduationYear" runat="server" ControlToValidate="txtGradYear" ErrorMessage="Enter Grad Year" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblMajor" runat="server" Text="Major"></asp:Label>
    <br />
    <asp:TextBox ID="txtMajorBox" runat="server" placeholder="Enter Major"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfMajor" runat="server" ControlToValidate="txtMajorBox" ErrorMessage="Enter Grade" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblNumber" runat="server" Text="Phone Number"></asp:Label>
    <br />
    <asp:TextBox ID="txtPNumber" runat="server" placeholder="Enter Phone Number"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfPNumber" runat="server" ControlToValidate="txtPNumber" ErrorMessage="Enter Number" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
    <br />
    <asp:TextBox ID="txtEmailBox" runat="server" placeholder="Enter Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfEmail" runat="server" ControlToValidate="txtEmailBox" ErrorMessage="Enter Email" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
     <asp:Button ID="btnAddRow" runat="server" Text="Add New Row" CssClass="btn btn-primary" OnClick="btnAddRow_Click" />
       
       
    <asp:SqlDataSource ID="StudentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" DeleteCommand="DELETE FROM [Student] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO [Student] ([FirstName], [LastName], [Grade], [GraduationYear], [Major], [PhoneNumber], [Email]) VALUES (@FirstName, @LastName, @Grade, @GraduationYear, @Major, @PhoneNumber, @Email)" SelectCommand="SELECT * FROM [Student] ORDER BY [StudentID]" UpdateCommand="UPDATE [Student] SET [FirstName] = @FirstName, [LastName] = @LastName, [Grade] = @Grade, [GraduationYear] = @GraduationYear, [Major] = @Major, [PhoneNumber] = @PhoneNumber, [Email] = @Email WHERE [StudentID] = @StudentID">
        <DeleteParameters>
            <asp:Parameter Name="StudentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Grade" Type="String" />
            <asp:Parameter Name="GraduationYear" Type="Int32" />
            <asp:Parameter Name="Major" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Grade" Type="String" />
            <asp:Parameter Name="GraduationYear" Type="Int32" />
            <asp:Parameter Name="Major" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="StudentID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
