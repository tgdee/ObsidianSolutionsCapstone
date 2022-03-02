<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Scholarship.aspx.cs" Inherits="Lab3.Scholarship" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1>Scholarship Information Page</h1>
    <h4>
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </h4>
    <asp:GridView ID="gvScholarship" runat="server" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="ScholarshipDataSource" Width="734px">
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
    </asp:GridView>
    <br />

    <asp:Label ID="lblScholarshipName" runat="server" Text="Scholarship Name:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtScholarshipName" runat="server" placeholder="Enter Scholarship Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfName" runat="server" ControlToValidate="txtScholarshipName" ErrorMessage="Enter Name" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblScholarshipAmount" runat="server" Text="Scholarship Amount:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtScholarshipAmount" runat="server" placeholder="Enter Scholarship Amount"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfAmount" runat="server" ControlToValidate="txtScholarshipAmount" ErrorMessage="Enter Amount" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblScholarshipType" runat="server" Text="Scholarship Type:"></asp:Label>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="txtScholarshipType" runat="server" placeholder="Academic/Athletic" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqfType" runat="server" ControlToValidate="txtScholarshipAmount" ErrorMessage="Enter Type" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblScholarshipCondition" runat="server" Text="Scholarship Condition:"></asp:Label>
    &nbsp&nbsp
    <asp:TextBox ID="txtScholarshipCondition" runat="server" placeholder="GPA Requirement"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqCondition" runat="server" ControlToValidate="txtScholarshipCondition" ErrorMessage="Enter Condition" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Button ID="btnAddRow" runat="server" Text="Add New Row" CssClass="btn btn-primary" OnClick="btnAddRow_Click" />

    <asp:SqlDataSource ID="ScholarshipDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" DeleteCommand="DELETE FROM [Scholarship] WHERE [ScholarshipID] = @ScholarshipID" InsertCommand="INSERT INTO [Scholarship] ([ScholarshipName], [ScholarshipAmount], [ScholarshipType], [ScholarshipCondition]) VALUES (@ScholarshipName, @ScholarshipAmount, @ScholarshipType, @ScholarshipCondition)" SelectCommand="SELECT * FROM [Scholarship] ORDER BY [ScholarshipID]" UpdateCommand="UPDATE [Scholarship] SET [ScholarshipName] = @ScholarshipName, [ScholarshipAmount] = @ScholarshipAmount, [ScholarshipType] = @ScholarshipType, [ScholarshipCondition] = @ScholarshipCondition WHERE [ScholarshipID] = @ScholarshipID">
        <DeleteParameters>
            <asp:Parameter Name="ScholarshipID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ScholarshipName" Type="String" />
            <asp:Parameter Name="ScholarshipAmount" Type="Int32" />
            <asp:Parameter Name="ScholarshipType" Type="String" />
            <asp:Parameter Name="ScholarshipCondition" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ScholarshipName" Type="String" />
            <asp:Parameter Name="ScholarshipAmount" Type="Int32" />
            <asp:Parameter Name="ScholarshipType" Type="String" />
            <asp:Parameter Name="ScholarshipCondition" Type="String" />
            <asp:Parameter Name="ScholarshipID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
