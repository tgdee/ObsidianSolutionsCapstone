<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MentoringProgram.aspx.cs" Inherits="Lab3.MentoringProgram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <h1>Mentoring Program Assignment Page</h1>
    <h4><asp:Label ID="lblError" runat="server"></asp:Label></h4>
    <h4>Using the emails of Students and Members not currently assigned a mentorship, please assign a Member as Mentor to a Student</h4>
    <h5>Also check out the over the top sql I used to get these emails on the MentoringProgram page. And they say its rare to use Full Outer Join maybe it could
        have been done in a different way but it wouldn't have been as funny.
    </h5>
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
    <br />
    <br />
    Students&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alumni
    <asp:GridView ID="gvActiveMentors" runat="server" OnSelectedIndexChanged="gvActiveMentors_SelectedIndexChanged" Width="500px" AutoGenerateColumns="False" DataSourceID="MentorshipRelationshipSource">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="FirstName1" HeaderText="FirstName1" SortExpression="FirstName1" />
            <asp:BoundField DataField="LastName1" HeaderText="LastName1" SortExpression="LastName1" />
        </Columns>
    </asp:GridView>

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
    <asp:SqlDataSource
        ID="MentorshipRelationshipSource"
        SelectCommand="SELECT Student.FirstName, Student.LastName, Member.FirstName, Member.LastName FROM Student CROSS JOIN Member INNER JOIN Mentorship ON Student.StudentID=Mentorship.StudentID AND Member.MemberID=Mentorship.MemberID"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        runat="server"></asp:SqlDataSource>
    <%--I think we might redesign some things orr maybe hide it in stored procedures joking--%>
</asp:Content>
