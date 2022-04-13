<%@ Page Title="" Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="VisitorAbout.aspx.cs" Inherits="Lab3.VisitorAbout" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-lg justify-content-center">
        <div class="bg-image" style="background-color: mediumpurple">
            <asp:Panel runat="server" HorizontalAlign="Center">

                <br />
                <br />
                <h1>About Us</h1>
                <br />
                <br />
                <h2>Meet The Team</h2>
                <br />
                <asp:Image ID="Image2" runat="server" Height="350" Width="350" BorderStyle="Solid" BorderColor="Goldenrod" ImageUrl="~/images/derek_Steele.png" />
                <h3>Derek Steele</h3>
                <p>
                    Master of Education, Educational Administration and Supervision; Virginia Polytechnic Institute and State University, May 2011, Bachelor of Science; 
                        Psychology (Major) Business Administration (Minor) James Madison University, May 1984.
                </p>
                <p>
                    Proven leadership and capacity-building skills, Programmatic implementation and management skills, knowledgeable about research-based instructional best practices, 
                        Oral presentation and written communication skills, Interpersonal and human relations skills. Currently serves as Assistant Principal at Mount Vernon HS, 
                        Fairfax County Public Schools, former AVID District Director within FCPS,
                </p>
                <br />
                <asp:Image ID="Image3" runat="server" Height="350" Width="350" BorderStyle="Solid" BorderColor="Goldenrod" ImageUrl="~/images/malcom_taylor.jpeg"/>
                <h3>Malcolm Taylor</h3>
                <p>
                    Bachelor of Science in Social Work, with a focus in Criminal Justice, JMU, 1982.
                </p>
                <p>
                    Retired CEO of Virginia Correctional Enterprises, the manufacturing division of the Virginia Department of Corrections. 
                        Previously selected as first Regional Operations Chief for the Central Region of the Virginia Department of Corrections. 
                        Over 30 years service in a myriad of operations leadership roles: Acting Deputy Director of Community Corrections, 
                        Eastern Regional Director, Chief Probation & Parole Officer of the 11th Judicial Circuit of Virginia.
                </p>
                <p>
                    Taylor has also served as Western Regional Manager, Western Region Transition Specialist (Senior Probation Officer), and one of the first Senior Probation Officers created by the Virginia General Assembly in 1991. 
                        He is a Guest Lecturer at several Virginia colleges and universities over the past 15 years.  His interests include sharing field experiences with students matriculating at JMU in Justice Services, Sociology, or Psychology.
                </p>
                <br />
                <asp:Image ID="Image4" runat="server" Height="350" Width="350" BorderStyle="Solid" BorderColor="Goldenrod" ImageUrl="~/images/charles_may.jpeg" />
                <h3>Charles May</h3>
                <p>
                    Bachelor of Science in Communication, James Madison University, 1983; Master of Arts, in Organizational Leadership, American Military University 2007.
                </p>
                <p>
                    Currently Retired (May 2018 NCIS; 2013 US Army Reserves) and currently serves as President and CEO of C&M Enterprises which is a family owned property management LLC providing affordable housing and services within the Park Place community in Norfolk VA since 1974.  
                        As an NCIS agent Charles served within the Senior Executive Service (SES) ranks as the Executive Assistant Director for Atlantic Operations, for the Naval Criminal Investigative Service (EADLANT-NCIS) providing federal Law Enforcement support and oversight to Africa, 
                        Europe, Middle East, South America, Canada, the Caribbean, and everything east of the Mississippi River in full support of the Department of the Navy (DON) criminal investigations, counter intelligence, counter terrorism and cyber programs. 
                        Additionally, Charles served as Chairman of the NCIS Directors' Committee for Diversity and Inclusion Program (DCDI), and created NCIS’ first diversity office. I served NCIS for 35 years and 31 years as a senior level Army Signal Corps officer in the US Army Reserves. 
                        His support interests are mentorship, "leadership," and service.
                </p>
                <br />
                <asp:Image ID="Image5" runat="server" Height="350" Width="350" BorderStyle="Solid" BorderColor="Goldenrod" ImageUrl="~/images/Angela_Russell.jpeg" />
                <h3>Angela J. Russell</h3>
                <p>
                    Currently serves as Director of Managed Care for Bon Secours Health System (Virginia Division).  In this capacity, I negotiate contracts with insurance companies and manage patient revenues in excess of $2B annually for our hospitals (8), ancillary sites (including nursing homes, 
                        home health agencies, hospice centers, Urgent and FastCare centers, and approx. 24 therapy centers), and physician practices (approx. 400 physicians).  She has served in healthcare management for approximately 31 years.
                </p>
                <br />
                <h3>George Harris III</h3>
                <p>
                    Harris currently manages the Bankruptcy Division of Legal Department for Multistate Corporation. Harris designs, implements and analyzes all operational bankruptcy business to include but not limited to:
                        Development of policy, procedures and compliance practice with upper level management of the Corporation.  Oversees and manages activities of all in house staff and outside attorneys. 
                        Reviews and approves credit applications for individual customers.
                </p>
                <p>
                    Harris represent the company, in court, tribunals, and in meetings with legal representatives.
                </p>
                <br />
                <asp:Image ID="Image6" runat="server" Height="350" Width="350" BorderStyle="Solid" BorderColor="Goldenrod" ImageUrl="~/images/russell-angela.jpeg" />
                <h3>Angela L. Russell</h3>
                <p>
                    Bachelor of Science, Living Sciences, James Madison University, 1985.
                </p>
                <p>
                    Russell has served for Over 27 years in the mental health and social service field in various positions (Career/Academic Counselor, Resident Counselor, Employment Specialist, Program Coordinator, Psychotherapist); President and CEO of two companies: In Search of Peace (Mental Health Private Practice) and Unplug with Angela (Life Coach & Retreat Leader);
                </p>
                <p>
                    Russell also has spent the last 14 years serving as a psychotherapist specializing in the areas of depression, anxiety, grief and loss, ADHD,  and impaired relationships.  She has assisted more than 150 clients (including teens, adults, families and couples) to a place where they can successfully manage their lives on their own.  As a Life Coach and Retreat Leader, Russell encourages wo(men) to give themselves permission to slow down from the “busyness” of life by providing custom retreats in the Washington Metropolitan area and abroad; Family Team Meeting Supervisor with DC Child and Family Services Agency for the past 10 years.  Her team has been instrumental in preventing hundreds of children from being placed in the foster care system on an annual basis in addition to finding permanency for those children who are in care.
                </p>
                <br />
                <asp:Image ID="Image7" runat="server" Height="350" Width="350" BorderStyle="Solid" BorderColor="Goldenrod" ImageUrl="~/images/marvin-stith.jpeg" />
                <h3>Marvin Stith</h3>
                <p>
                    Bachelor of Business Administration, Accounting, James Madison University, 1983.
                </p>
                <p>
                    Stith has over 25 years of Federal civilian service as an auditor for the Department of Defense, United States Postal Service and the National Credit Union Administration (NCUA).  He currently serves as a Senior Auditor for the NCUA Office of Inspector General. 
                </p>
                <p>
                    Stith plans, manages and conducts audits of cybersecurity related and other information technology-related NCUA programs.  Also conducted audits of credit union Mortgage Backed Security investment programs, credit union home loan programs etc. associated with credit union failures and losses to the NCUA Share Insurance Fund.
                </p>
                <p>
                    Stith also served from 1983 through 1993 as an officer in the US Army (via the JMU Army ROTC program) with the Corp of Engineers and Finance Corps.  He served tours of duty in Operations Desert Shield and Desert Storm.
                </p>
                <br />
                <asp:Image ID="Image8" runat="server" Height="350" Width="350" BorderStyle="Solid" BorderColor="Goldenrod" ImageUrl="~/images/kimberely-hundley.jpeg" />
                <h3>Kimberly Hundley</h3>
                <p>
                    Bachelor of Science, Early Childhood, James Madison University, 1984.
                </p>
                <p>
                    Hundley recently retired after teaching kindergarten for 34 years.  She spent 26 years teaching in Williamsburg James City County Public Schools.  Distinguishing Qualities include, Nationally Board Certified in 2010; Cooperating Teacher for student teachers at JMU and William & Mary; Minority Engagement Advocate for Williamsburg Public Schools (Duties include conducting Diversity Training for staff); Staff Development Trainer for Williamsburg Public Schools (Duties include conducting staff development on Building Relationships in the classroom and community) 
                </p>
                <p>
                    Hundley is currently the President of the Teachers Association.  She serves on the executive Board for Stonehouse Presbyterian Church Preschool and is a Church Leader for Sunday School Youth ages 5-12 at Jamestown Christian Fellowship.
                </p>
                <br />
                <h3>Devena Mclaurine</h3>
                <p>
                    Bachelor of Science, Psychology, 1986.
                </p>
                <p>
                    McLaurine serves as Executive Director, Fredericksburg Savings Charitable Foundation since 1998.  She coordinates the approval and distribution of $1-2M in annual grant funds to local nonprofits with primary focus on education, health and community service.  Prior to joining the Foundation, McLaurine served as a development associate with the science fund raising team of The Nature Conservancy for ten years. Her interest is in sharing experiences related to philanthropy and community service.
                </p>
                <br />
                <asp:Image ID="Image9" runat="server" Height="350" Width="350" BorderStyle="Solid" BorderColor="Goldenrod" ImageUrl="~/images/0b6b9a_ddf81f4627a042389483cd52af7c90ba_mv2.png" />
                <h3>Lesa Diggs</h3>
                <p>
                    James Madison University, Office Administration
                </p>
                <p>
                    Diggs is a Legal Assistant and CEO of LJM Enterprises, LLC which instills the importance of health, wellness and financial security.  She is currently in the process of adding day trading to her business portfolio.  She is a Board member of the Vickie Belk Scholarship Foundation at Oakland Baptist Church in Alexandria, VA and guest/motivational speaker for women's organizations in DC, Maryland and Virginia.  Her interests are in helping people focus in on their passion.
                </p>
                <br />
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
            </asp:Panel>
        </div>
    </div>
</asp:Content>
