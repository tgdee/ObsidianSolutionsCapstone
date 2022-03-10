<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InternshipInformation.aspx.cs" Inherits="Lab3.InternshipInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Table ID="Table1" runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>
                <asp:Label ID="lblHeader" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Literal ID="ltError" runat="server"></asp:Literal>
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DataList ID="dlMemberInfo" runat="server" RepeatDirection="Vertical" RepeatColumns="3" RepeatLayout="Flow" CellPadding="50" CellSpacing="40">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <%--<th style="width:300px" align="left">Username</th>--%>
                                <th style="width:300px" align="left">Company Name</th>
                                <th style="width:300px" align="left">Internship Type</th>
                                <th style="width:300px" align="left">Internship Start Date</th> 
                                <th style="width:300px" align="left">Internship City</th> 
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <%--<td style="width:300px" align="left"> <asp:Label ID="lblUsername" runat="server" ></asp:Label></td>--%>
                                <td style="width:300px" align="left"> <asp:Label ID="lblCompany" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CompanyName") %>' ></asp:Label> </td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InternshipType") %>' ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InternshipStartDate" ) %>' ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblCity" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InternshipCity" ) %>' ></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <br />
                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Company Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfCompany" runat="server" Enabled="true" ControlToValidate="txtCompanyName" ErrorMessage="Enter a Company Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtType" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Internship Type"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfType" runat="server" Enabled="true" ControlToValidate="txtType" ErrorMessage="Enter a Internship Type" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Internship Start Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfDate" runat="server" Enabled="true" ControlToValidate="txtDate" ErrorMessage="Enter a Internship Start Date" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Internship City"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Enabled="true" ControlToValidate="txtCity" ErrorMessage="Enter a Internship City" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <br />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ValidationGroup="UpdateValidation" OnClick="btnUpdate_Click" />
                <br />
                <br />
                <asp:Button ID="btnReturn" runat="server" Text="<- Previouse Page" ValidationGroup="ReturnValidation" OnClick="btnReturn_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
