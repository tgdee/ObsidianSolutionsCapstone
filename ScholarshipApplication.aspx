<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScholarshipApplication.aspx.cs" Inherits="Lab3.ScholarshipApplication" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <br />
    <br />
    <h1>Scholarship Application Page</h1>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>

    <div>
        <%--create the input boxes for information--%>
        <asp:Table runat="server" Height="200px" Width="500px">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDate" runat="server" Text="Date:"></asp:Label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:TextBox ID="txtDate" runat="server" Text="" placeholder="YYYY-MM-DD"></asp:TextBox>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:RequiredFieldValidator ID="reqFieldValidatorCompany" runat="server" Enabled="true" ControlToValidate="txtDate" ErrorMessage="Enter Date" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblStudentEmail" runat="server" Text="Student Email: "></asp:Label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:DropDownList ID="ddlStudent" runat="server" Width="200px" DataSourceID="StudentTableDataSource" DataTextField="Email" OnSelectedIndexChanged="btnApply_Click"></asp:DropDownList>
                </asp:TableCell>
             </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblScholarshipName" runat="server" Text="Potential Scholarships:"></asp:Label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:DropDownList ID="ddlScholarshipName" runat="server" Width="200px" DataSourceID="ScholarshipSource" DataTextField="ScholarshipName" OnSelectedIndexChanged="btnApply_Click"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="lblStudentFirstName" runat="server" Text=""></asp:Label>


        <br />
        <br />
        <asp:Button ID="btnApply" runat="server" Text="Apply ->" OnClick="btnApply_Click" />
    </div>
   <%-- reference the data tables to be retrieved from--%>
     <asp:SqlDataSource
         ID="StudentTableDataSource"
         SelectCommand="SELECT * FROM [Company]"
         ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>"
         runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource
        ID="ScholarshipSource"
        SelectCommand="SELECT ScholarshipName FROM DBO.Scholarship"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        runat="server"></asp:SqlDataSource>

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="EmployerID" DataSourceID="StudentTableDataSource">
        <ItemTemplate>
            EmployerID:
            <asp:Label ID="EmployerIDLabel" runat="server" Text='<%# Eval("EmployerID") %>' />
            Works in the 
            <br />
            MeetingTime:
            <asp:Label ID="MeetingTimeLabel" runat="server" Text='<%# Bind("MeetingTime") %>' />
            <br />
            CompanyName:
            <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Bind("CompanyName") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            FirstName:
            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
            <br />
            LastName:
            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
            <br />
            MemberID:
            <asp:Label ID="MemberIDLabel" runat="server" Text='<%# Bind("MemberID") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>


</asp:Content>
