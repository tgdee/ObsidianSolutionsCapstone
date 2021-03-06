<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="Lab3.Company" MasterPageFile="~/Site.Master"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <h1>Company Information Page</h1>
    <h4>
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </h4>
    <asp:GridView ID="gvCompany" runat="server" OnSelectedIndexChanged="gvCompany_SelectedIndexChanged" Width="1000px" EmptyDataText="Company Record Not Found" >
        <Columns>
            <asp:CommandField ShowSelectButton="true" />
        </Columns>

    </asp:GridView>
    <%--<asp:GridView ID="gvInternship" runat="server" AutoGenerateColumns="False" DataSourceID="CompanyDataSource" DataKeyNames="EmployerID"  Width="1000px">
        <Columns>
            <asp:CommandField ShowEditButton="True" ValidationGroup="UpdateValidation" />
            <asp:BoundField DataField="EmployerID" HeaderText="EmployerID" InsertVisible="False" ReadOnly="True" SortExpression="EmployerID" Visible="False" />
            <asp:TemplateField HeaderText="Meeting Time" SortExpression="MeetingTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MeetingTime") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfMeetingTime" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Meeting Time" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MeetingTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Company Name" SortExpression="CompanyName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqCompanyName" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Company Name" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfEmail" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Email" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfFirstName" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter First Name" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfLastName" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter Last Name" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" SortExpression="MemberID" Visible="False" />


        </Columns>
    </asp:GridView>--%>
    <br />
    <asp:Label ID="lblMeetingTime" runat="server" Text="Meeting Time:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtMeetingTime" runat="server" ValidationGroup="1" placeholder="MM/DD/YYYY"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfMeeting" runat="server" ValidationGroup="1" ControlToValidate="txtMeetingTime" ErrorMessage="Enter Meeting Time" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblCompanyName" runat="server" Text="Company Name:"></asp:Label>
    &nbsp&nbsp
    <asp:TextBox ID="txtCompanyName" runat="server" ValidationGroup="1" placeholder="Enter Company Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfCompany" runat="server" ValidationGroup="1" ControlToValidate="txtCompanyName" ErrorMessage="Enter Company Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="1" placeholder="Enter Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqEmail" runat="server" ValidationGroup="1" ControlToValidate="txtEmail" ErrorMessage="Enter Email" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="1" placeholder="Enter First Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqFirstName" runat="server" ValidationGroup="1" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="1" placeholder="Enter Last Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqLastName" runat="server" ValidationGroup="1" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>




    <br />
    <br />
    <asp:Button ID="btnAddRow" runat="server" ValidationGroup="1" Text="Add New Row" CssClass="btn btn-primary" OnClick="btnAddRow_Click" />

    <br />
    <h3>Current Student Job Applications</h3>
    <asp:GridView ID="gvCurrentJobApplication" runat="server" AutoGenerateColumns="False" DataSourceID="JobApplications" OnSelectedIndexChanged="gvCurrentJobApplication_SelectedIndexChanged" DataKeyNames="ApplicationNumber">
        <Columns>
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" SortExpression="ApplicationDate" />
            <asp:BoundField DataField="PositionTitle" HeaderText="PositionTitle" SortExpression="PositionTitle" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Awarded" HeaderText="Awarded" SortExpression="Awarded" />
            <asp:BoundField DataField="ApplicationNumber" HeaderText="ApplicationNumber" InsertVisible="False" ReadOnly="True" SortExpression="ApplicationNumber" Visible="false" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>

    <br />
    <asp:Label ID="lblSelectedStudent" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="btnApprove" runat="server" Text="Award" ValidationGroup="2" OnClick="btnApprove_Click" Visible="false" />

    <asp:SqlDataSource ID="JobApplications" 
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT JobApplication.CompanyName, JobApplication.ApplicationDate, JobApplication.PositionTitle, JobApplication.Email, Student.FirstName, Student.LastName, JobApplication.Awarded, JobApplication.ApplicationNumber
                        FROM JobApplication
                        INNER JOIN Student ON JobApplication.StudentID=Student.StudentID;"
        ></asp:SqlDataSource>
</asp:Content>


