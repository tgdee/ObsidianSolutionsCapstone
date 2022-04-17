<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="StudentInbox1.aspx.cs" Inherits="Lab3.StudentInbox1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
        <br />
        <br />
        <br />
        <table align="center" width="60%">

            <tr>
                <td>TO</td>
                <td>
                    <asp:DropDownList ID="ddlTo" runat="server">
                        <asp:ListItem Text="Hayes Eagen" Value="eagenhayes@gmail.com"></asp:ListItem>
                        <asp:ListItem Text="Charles May" Value="thecage2@aol.com"></asp:ListItem>
                        <asp:ListItem Text="Malcolm Taylor" Value="mt1tr2@comcast.net"></asp:ListItem>
                        <asp:ListItem Text="Nora Crouch" Value="sndcrouch@yahoo.com"></asp:ListItem>
                        <asp:ListItem Text="Lesa Moore" Value="mooregems@aol.com"></asp:ListItem>
                        <asp:ListItem Text="Adrena May" Value="adrenam90@gmail.com"></asp:ListItem>
                        <asp:ListItem Text="Angela Russell" Value="ajrussell01@cox.net"></asp:ListItem>
                        <asp:ListItem Text="Derek Steele" Value="mrcoachsteele@gmail.com"></asp:ListItem>
                        <asp:ListItem Text="Marvin Stith" Value="marv_s_osasg@currently.com"></asp:ListItem>
                        <asp:ListItem Text="Devena McLaurine" Value="mackpack4@verizon.net"></asp:ListItem>
                        <asp:ListItem Text="Kimberly Hundley" Value="kimberleyhundley1962@gmail.com"></asp:ListItem>
                        <asp:ListItem Text="Vonda Sparks" Value="vlsdls@aol.com"></asp:ListItem>
                        <asp:ListItem Text="George Harris" Value="gwhlll3@hotmail.com"></asp:ListItem>

                    </asp:DropDownList>
                    <br />
                <asp:TextBox ID="txtTo" runat="server" Width="99%"></asp:TextBox></td>
            </tr>
            <tr>
                
            </tr>
            <tr>
                <td>FROM</td>
                <td><asp:TextBox ID="txtFrom" runat="server" Width="99%"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Subject</td>
                <td><asp:TextBox ID="txtSubject" runat="server" Width="99%"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Message Body</td>
                <td><asp:TextBox ID="txtBody" runat="server" Width="99%" Height="150px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="btnSend" OnClick="btnSend_Click" runat="server" Text="Send" /></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Label ID="lblStatus" runat="server" /></td>
            </tr>
        </table>
   








</asp:Content>
