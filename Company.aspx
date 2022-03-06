<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="Lab3.Company" MasterPageFile="~/Site.Master"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <h1>Company Information Page</h1>
    <h4>
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </h4>
    <%--Create the user input boxes for all of the user input--%>
    <asp:GridView ID="gvInternship" runat="server" AutoGenerateColumns="False" DataSourceID="CompanyDataSource" DataKeyNames="EmployerID"  Width="1000px">
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
    </asp:GridView>
    <br />
    <%--Creates all the boxes for new information to be added--%>
    <asp:Label ID="lblMeetingTime" runat="server" Text="Meeting Time:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtMeetingTime" runat="server" placeholder="MM/DD/YYYY"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfMeeting" runat="server" ControlToValidate="txtMeetingTime" ErrorMessage="Enter Meeting Time" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblCompanyName" runat="server" Text="Company Name:"></asp:Label>
    &nbsp&nbsp
    <asp:TextBox ID="txtCompanyName" runat="server" placeholder="Enter Company Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfCompany" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="Enter Company Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Email" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

    <br />
    <br />
    <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtFirstName" runat="server" placeholder="Enter First Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Enter First Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtLastName" runat="server" placeholder="Enter Last Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter Last Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>




    <br />
    <br />
    <asp:Button ID="btnAddRow" runat="server" Text="Add New Row" CssClass="btn btn-primary" OnClick="btnAddRow_Click" />
    <%--retrieves data from the specified data sources--%>
    <asp:SqlDataSource ID="CompanyDataSource"
        SelectCommand="SELECT * FROM [Company] ORDER BY [EmployerID]"
        UpdateCommand="UPDATE [Company] SET [MeetingTime] = @MeetingTime, [CompanyName] = @CompanyName, [Email] = @Email, [FirstName] = @FirstName, [LastName] = @LastName, [MemberID] = @MemberID WHERE [EmployerID] = @EmployerID"
        ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>"
        runat="server" DeleteCommand="DELETE FROM [Company] WHERE [EmployerID] = @EmployerID" InsertCommand="INSERT INTO [Company] ([MeetingTime], [CompanyName], [Email], [FirstName], [LastName], [MemberID]) VALUES (@MeetingTime, @CompanyName, @Email, @FirstName, @LastName, @MemberID)">
        <DeleteParameters>
            <asp:Parameter Name="EmployerID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MeetingTime" Type="DateTime" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="MemberID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Type="DateTime" Name="MeetingTime" />
            <asp:Parameter Type="String" Name="CompanyName" />
            <asp:Parameter Type="String" Name="Email" />
            <asp:Parameter Type="String" Name="FirstName" />
            <asp:Parameter Type="String" Name="LastName" />

            <asp:Parameter Name="MemberID" Type="Int32" />
            <asp:Parameter Name="EmployerID" Type="Int32" />

        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>


