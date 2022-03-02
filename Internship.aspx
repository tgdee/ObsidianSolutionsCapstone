<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Internship.aspx.cs" Inherits="Lab3.Internship" MasterPageFile="~/Site.Master" %>

   <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <br />
       <br />
       <h1>Internship Information Page</h1>
       <h4>
           <asp:Literal ID="ltError" runat="server"></asp:Literal>
       </h4>
       <asp:GridView ID="gvInternship" runat="server" AutoGenerateColumns="False" DataSourceID="InternshipDataSource" DataKeyNames="InternshipID" Width="1000px">
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
       </asp:GridView>
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
       <asp:Label ID="lblInternshipCity" runat="server" Text="City:" ></asp:Label>
       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
       <asp:TextBox ID="txtInternshipCity" runat="server" placeholder="Enter Internship City" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="rqfCity" runat="server" Enabled="true" ControlToValidate="txtInternshipCity" ErrorMessage="Enter City" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>


       <br />
       <br />
       <asp:Button ID="btnAddRow" runat="server" Text="Add New Row" CssClass="btn btn-primary" OnClick="btnAddRow_Click" />
       <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="btnClear_Click" />
       
       <asp:SqlDataSource ID="InternshipDataSource"
           SelectCommand="SELECT * FROM [Internship] ORDER BY [InternshipID]"
           UpdateCommand ="UPDATE [Internship] SET [CompanyName] = @CompanyName, [InternshipType] = @InternshipType, [InternshipStartDate] = @InternshipStartDate, [InternshipCity] = @InternshipCity WHERE [InternshipID] = @InternshipID"
           ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>"
           runat="server" DeleteCommand="DELETE FROM [Internship] WHERE [InternshipID] = @InternshipID" InsertCommand="INSERT INTO [Internship] ([CompanyName], [InternshipType], [InternshipStartDate], [InternshipCity]) VALUES (@CompanyName, @InternshipType, @InternshipStartDate, @InternshipCity)">
           <DeleteParameters>
               <asp:Parameter Name="InternshipID" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="CompanyName" Type="String" />
               <asp:Parameter Name="InternshipType" Type="String" />
               <asp:Parameter DbType="Date" Name="InternshipStartDate" />
               <asp:Parameter Name="InternshipCity" Type="String" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="CompanyName" Type="String" />
               <asp:Parameter Name="InternshipType" Type="String" />
               <asp:Parameter DbType="Date" Name="InternshipStartDate" />
               <asp:Parameter Name="InternshipCity" Type="String" />
               <asp:Parameter Name="InternshipID" Type="Int32" />
           </UpdateParameters>
       </asp:SqlDataSource>
</asp:Content>
 
