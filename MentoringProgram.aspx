<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MentoringProgram.aspx.cs" Inherits="Lab3.MentoringProgram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <h1>Mentoring Program Assignment Page</h1>
    <h4><asp:Label ID="lblError" runat="server"></asp:Label></h4>
    <h4>Using the emails of Students and Members not currently assigned a mentorship, please assign a Member as Mentor to a Student</h4>
    <br />
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStudent" runat="server" Text="Student Email:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                &nbsp
                <asp:DropDownList ID="ddlStudent" runat="server" Width="200px" DataSourceID="StudentTableDataSource" DataTextField="Email" OnSelectedIndexChanged="btnAssign_Click"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblMember" runat="server" Text="Member Email:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                &nbsp
                <asp:DropDownList ID="ddlMember" runat="server" Width="200px" DataSourceID="MemberSource" DataTextField="Email" OnSelectedIndexChanged="btnAssign_Click"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Button ID="btnAssign" runat="server" Text="Assign ->" OnClick="btnAssign_Click" />

    <asp:SqlDataSource
        ID="MemberSource"
        SelectCommand="SELECT Member.Email FROM DBO.Member FULL OUTER JOIN Mentorship ON Member.MemberID=Mentorship.MemberID WHERE Member.MemberID != ALL (SELECT Mentorship.MemberID FROM Mentorship)"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource
        ID="StudentTableDataSource"
        SelectCommand="SELECT Student.Email FROM DBO.Student FULL OUTER JOIN Mentorship ON Student.StudentID=Mentorship.StudentID WHERE Student.StudentID != ALL (SELECT Mentorship.StudentID FROM Mentorship)"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        runat="server"></asp:SqlDataSource>
</asp:Content>
