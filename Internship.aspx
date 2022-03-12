<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Internship.aspx.cs" Inherits="Lab3.Internship" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1>Internship Information Page</h1>
    <h4>
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </h4>
    <asp:GridView ID="gvInternship" runat="server" Width=" 700px" OnSelectedIndexChanged="gvInternship_SelectedIndexChanged" EmptyDataText="Internship record not found">
        <Columns>
            <asp:CommandField ShowSelectButton="true" />
        </Columns>
    </asp:GridView>
    <%--<asp:GridView ID="gvInternship" runat="server" AutoGenerateColumns="False" DataSourceID="InternshipDataSource" DataKeyNames="InternshipID" Width="1000px">
           <Columns>
               <asp:BoundField DataField="InternshipID" HeaderText="InternshipID" InsertVisible="False" ReadOnly="True" SortExpression="InternshipID" Visible="False" />
               <asp:TemplateField HeaderText="Company Name" SortExpression="CompanyName">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rqfCompnayName" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Company Name" ForeColor="Red" ValidationGroup="UpdateValidation" Font-Bold="true"></asp:RequiredFieldValidator>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Internship Type" SortExpression="InternshipType">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("InternshipType") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rqfInternshipType" runat="server" Enabled="true" ControlToValidate="TextBox2" ErrorMessage="Enter Type" ValidationGroup="UpdateValidation" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label2" runat="server" Text='<%# Bind("InternshipType") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Internship Start Date" SortExpression="InternshipStartDate">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("InternshipStartDate") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rqfStartDate" runat="server" Enabled="true" ControlToValidate="TextBox3" ErrorMessage="Enter Date" ValidationGroup="UpdateValidation" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label3" runat="server" Text='<%# Bind("InternshipStartDate") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Internship City" SortExpression="InternshipCity">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("InternshipCity") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rqfCity" runat="server" Enabled="true" ControlToValidate="TextBox4" ErrorMessage="Enter City" ValidationGroup="UpdateValidation" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label4" runat="server" Text='<%# Bind("InternshipCity") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>

               <asp:CommandField ShowEditButton="True" ValidationGroup="UpdateValidation" />

           </Columns>
       </asp:GridView>--%>
    <br />

    <asp:Label ID="lblCompanyName" runat="server" Text="Company Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp
       <asp:TextBox ID="txtCompanyName" runat="server" placeholder="Enter Company Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfCompanyName" runat="server" Enabled="true" ControlToValidate="txtCompanyName" ErrorMessage="Enter Company Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblInternshipType" runat="server" Text="Type:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
       <asp:TextBox ID="txtInternshipType" runat="server" placeholder="Enter Internship Type"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfInternType" runat="server" Enabled="true" ControlToValidate="txtInternshipType" ErrorMessage="Enter Type" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblInternshipStartDate" runat="server" Text="Start Date:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
       <asp:TextBox ID="txtInternshipStartDate" runat="server" placeholder="MM/DD/YYYY"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfStartDate" runat="server" Enabled="true" ControlToValidate="txtInternshipStartDate" ErrorMessage="Enter Start Date" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblInternshipCity" runat="server" Text="City:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
       <asp:TextBox ID="txtInternshipCity" runat="server" placeholder="Enter Internship City"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfCity" runat="server" Enabled="true" ControlToValidate="txtInternshipCity" ErrorMessage="Enter City" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>


    <br />
    <br />
    <asp:Button ID="btnAddRow" runat="server" Text="Add New Row" CssClass="btn btn-primary" OnClick="btnAddRow_Click" />
    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="btnClear_Click" />

    <br />

    <h3>Current Student Internship Applications</h3>
    <asp:GridView ID="gvInternshipApplications" runat="server" AutoGenerateColumns="False" DataSourceID="InternshipApplications" OnSelectedIndexChanged="gvInternshipApplications_SelectedIndexChanged" DataKeyNames="InternshipNumber">
        <Columns>
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="InternshipDate" HeaderText="InternshipDate" SortExpression="InternshipDate" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Awarded" HeaderText="Awarded" SortExpression="Awarded" />
            <asp:BoundField DataField="InternshipNumber" HeaderText="InternshipNumber" SortExpression="InternshipNumber" InsertVisible="False" ReadOnly="True" Visible="false" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>

    <br />
    <asp:Label ID="lblSelectedStudent" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="btnAward" runat="server" Text="Award" ValidationGroup="2" OnClick="btnAward_Click" Visible="false" />

    <asp:SqlDataSource ID="InternshipApplications" 
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT InternshipApplication.InternshipNumber, InternshipApplication.CompanyName, InternshipApplication.InternshipDate, InternshipApplication.Email,  Student.FirstName, Student.LastName, InternshipApplication.Awarded
                        FROM InternshipApplication
                        INNER JOIN Student ON InternshipApplication.StudentID=Student.StudentID;"
        ></asp:SqlDataSource>


</asp:Content>

