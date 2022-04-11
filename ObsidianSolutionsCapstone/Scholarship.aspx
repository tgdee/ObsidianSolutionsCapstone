<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Scholarship.aspx.cs" Inherits="Lab3.Scholarship" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1>Scholarship Information Page</h1>
    <h4>
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </h4>
    <asp:GridView ID="gvScholarship" runat="server" OnSelectedIndexChanged="gvScholarship_SelectedIndexChanged" Width="500px" EmptyDataText ="Scholarship Record Not Found">
        <Columns>
            <asp:CommandField ShowSelectButton="true" />
        </Columns>
    </asp:GridView>
    <%--<asp:GridView ID="gvScholarship" runat="server" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="ScholarshipDataSource" Width="734px">
        <Columns>
            <asp:CommandField ShowEditButton="True" ValidationGroup="UpdateValidation" />
            <asp:BoundField DataField="ScholarshipID" HeaderText="ScholarshipID" InsertVisible="False" ReadOnly="True" SortExpression="ScholarshipID" Visible="False" />
            <asp:TemplateField HeaderText="Scholarship Name" SortExpression="ScholarshipName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ScholarshipName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqName" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Name" ForeColor="Red" Font-Bold="true" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ScholarshipName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Scholarship Amount" SortExpression="ScholarshipAmount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ScholarshipAmount") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqAmount" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Amount" ForeColor="Red" Font-Bold="true" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ScholarshipAmount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Scholarship Type" SortExpression="ScholarshipType">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ScholarshipType") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqType" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Type" ForeColor="Red" Font-Bold="true" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ScholarshipType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Scholarship Condition" SortExpression="ScholarshipCondition">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ScholarshipCondition") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqCondition" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter Condition" ForeColor="Red" Font-Bold="true" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ScholarshipCondition") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>--%>
    <br />

    <asp:Label ID="lblScholarshipName" runat="server" Text="Scholarship Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtScholarshipName" runat="server" ValidationGroup="1" placeholder="Enter Scholarship Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfName" runat="server" ValidationGroup="1" ControlToValidate="txtScholarshipName" ErrorMessage="Enter Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblScholarshipAmount" runat="server" Text="Scholarship Amount:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtScholarshipAmount" runat="server" ValidationGroup="1" placeholder="Enter Scholarship Amount"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfAmount" runat="server" ValidationGroup="1" ControlToValidate="txtScholarshipAmount" ErrorMessage="Enter Amount" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblScholarshipType" runat="server" Text="Scholarship Type:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtScholarshipType" runat="server" ValidationGroup="1" placeholder="Academic/Athletic" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfType" runat="server" ValidationGroup="1" ControlToValidate="txtScholarshipAmount" ErrorMessage="Enter Type" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblScholarshipCondition" runat="server" Text="Scholarship Condition:"></asp:Label>
    &nbsp&nbsp
    <asp:TextBox ID="txtScholarshipCondition" runat="server" ValidationGroup="1" placeholder="GPA Requirement"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqCondition" runat="server" ValidationGroup="1" ControlToValidate="txtScholarshipCondition" ErrorMessage="Enter Condition" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Button ID="btnAddRow" runat="server" ValidationGroup="1" Text="Add New Row" CssClass="btn btn-primary" OnClick="btnAddRow_Click" />

    <br />
    <h3>Current Scholarship Applications</h3>
    <asp:GridView ID="gvScholarshipApplications" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplicationNumber" DataSourceID="ScholarshipApplications" OnSelectedIndexChanged="gvScholarshipApplications_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="ScholarshipName" HeaderText="ScholarshipName" SortExpression="ScholarshipName" />
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
    <asp:Button ID="btnAward" runat="server" Text="Award" ValidationGroup="2" OnClick="btnAward_Click" Visible="false" />

    <asp:SqlDataSource ID="ScholarshipApplications" 
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT ScholarshipApplication.ApplicationNumber, ScholarshipApplication.Date, ScholarshipApplication.ScholarshipName, ScholarshipApplication.Email, Student.FirstName, Student.LastName, ScholarshipApplication.Awarded
                        FROM ScholarshipApplication
                        INNER JOIN Student ON ScholarshipApplication.StudentID=Student.StudentID;"
        ></asp:SqlDataSource>
</asp:Content>
