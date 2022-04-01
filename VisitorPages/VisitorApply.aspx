<%@ Page Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="VisitorApply.aspx.cs" Inherits="Lab3.VisitorPages.VisitorApply" %>



<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


        <div class="container-lg justify-content-center"  >
        <div class="bg-image" style="background-color:#ffb6c1 ">
            <div>
                <asp:Panel runat="server" HorizontalAlign="Center">     
                    <h1> Ole School Alumni Group Application Process</h1>
                    <asp:Image ID="Image1" runat="server" Height="500" Width="800px" ImageUrl="/images/JMU_Campus.jpg"/>
                    <br />
                    <br />       
                <div class="row">
                    <div class="col-12" style="text-align:center"><h2>Information Needed To Apply: </h2>
                        <p>
                           In order to recieve the full benefits that Ole School Alumni Group offers, each applicatant will be required to provide their full first and last name, a 500 word essay, an uploaded resume, and transcript.
                        </p>
                    </div>                                        
                    </div>
                    <br />                    
                <div class="row">
                    <div class="col-12" style="text-align:center">
                        <h2>Benefits of Applying With Ole School: </h2>
                        <p>
                            Ole School offers mentoring and counsel to current students through our various services. We provide scholarship, internship, and job opportunities through our affiliated parteners in the business community. Additionally, we keep students updated on current events and opportunites so that they can take full advantage of their time in higher education.
                        </p>
                    </div>
                </div>
                    <br />
                <div class="row">
                    <div class="col-12" style="text-align:center">
                        <h2>Ready to Apply Today?</h2>
                    </div>
                </div>
                    <br />
                <div class="row">
                    <div class="col-12" style="align-content:center">
                    <asp:Button ID="btnApply" runat="server" Text="Apply Now!" OnClick="btnApply_Click" class="customPurpleButton" />
                    </div>
                </div>   
                    <br />              
                </asp:Panel>
                </div>
            </div>
            </div>
    <script src="Scripts/jquery-3.6.0.slim.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>    
    
</asp:Content>
