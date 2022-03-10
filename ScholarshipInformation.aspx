<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ScholarshipInformation.aspx.cs" Inherits="Lab3.ScholarshipInformation" %>
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
                                <th style="width:300px" align="left">Scholarship Name</th>
                                <th style="width:300px" align="left">Scholarship Amount</th>
                                <th style="width:300px" align="left">Scholarship Type</th> 
                                <th style="width:300px" align="left">Scholarship Condition</th> 
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <%--<td style="width:300px" align="left"> <asp:Label ID="lblUsername" runat="server" ></asp:Label></td>--%>
                                <td style="width:300px" align="left"> <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ScholarshipName") %>' ></asp:Label> </td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblAmount" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ScholarshipAmount") %>' ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ScholarshipType" ) %>' ></asp:Label></td>
                                <td style="width:300px" align="left"> <asp:Label ID="lblCondition" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Scholarshipcondition") %>' ></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <br />
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Scholarship Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfName" runat="server" Enabled="true" ControlToValidate="txtName" ErrorMessage="Enter a Scholarship Name" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Scholarship Amount"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfAmount" runat="server" Enabled="true" ControlToValidate="txtAmount" ErrorMessage="Enter a Amount" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtType" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Scholarship Type"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfType" runat="server" Enabled="true" ControlToValidate="txtType" ErrorMessage="Enter a Scholarship Type" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtCondition" runat="server" CssClass="form-control" ValidationGroup="UpdateValidation" placeholder="Enter a New Scholarship Condition"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfCondition" runat="server" Enabled="true" ControlToValidate="txtCondition" ErrorMessage="Enter a Scholarship Condition" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <br />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ValidationGroup="UpdateValidation" OnClick="btnUpdate_Click" />
                <br />
                <br />
                <asp:Button ID="btnReturn" runat="server" Text="<- Previouse Page" ValidationGroup="PreviousValidation" OnClick="btnReturn_Click"
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
