<%@ Page Title="" Language="C#" CodeBehind="VisitorAbout.aspx.cs" Inherits="Lab3.VisitorAbout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="CustomButtons.css" rel="stylesheet" type="text/css" />
</head>
<body class="bg-image" style="background-image: url(/images/zigzags%20background.jpg); margin-top: 0px; background-size: cover">
    <form id="form1" runat="server">
        <div>
            <div class="bg-image" style="background-image:url(images/faded%20background.png);margin-top:0px;background-size:cover">
            <asp:Panel runat="server" HorizontalAlign="Center">
                    <br />
                    <br />
                    <h1>About Us</h1>
                    <asp:Image ID="Image1" runat="server" Height="500" Width="700" ImageUrl="~/images/ole-school-alumni-group.png" />
                    <br />
                    <br />
                    <h2>Our History</h2>
                    <p>
                        The Ole School Alumni Group is a grass roots, non-profit organization envisioned by three African American James Madison University (JMU) alumni that graduated in the 1980’s.
                    They recalled priceless memories and experiences; recognized the value of retaining old & new traditions; saw the need for reconnecting, networking and most importantly, providing scholarships.
                    Along with numerous other former alumni, they founded the official Ole School Scholarship Fund, Inc. in 2005.
                    </p>
                    <p>
                        The group of alumni and friends committed themselves to giving back to JMU specifically in support of African American recruitment and retention efforts.
                    The effort was initiated to stimulate and increase the growth and development of the JMU African American students.
                    </p>
                    <br />
                    <br />
                    <h2>What We Do</h2>
                    <p>
                        The Ole School Scholarship Fund, LLC (“Ole School Alumni Group”) is a 501(c)(3) organization.  
                It is comprised of James Madison University (“JMU”) African American alumni spanning over 40 years and numbering in upwards of 100+ in membership.  
                The Ole School Group is focused on African American support to JMU and is also active in the community both individually and collectively as leaders and advocates for African American higher education and professional success.  
                A contribution to the endowment of the Ole School Alumni Group helps to guarantee continuing support to African Americans at JMU for many years to come, which in turn,
                helps to open doors of opportunity to many underrepresented students who would otherwise be unable to pursue education at a top tier University.  
                The Ole School Alumni Group prides itself on being a
                VISIONARY,
                LEADER,
                ADVOCATE
                and CATALYST!
                    </p>
                    <br />
                    <br />
                    <h2>Meet The Team</h2>

            </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
