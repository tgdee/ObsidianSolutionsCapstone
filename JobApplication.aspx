﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobApplication.aspx.cs" Inherits="Lab3.JobApplication" MasterPageFile="~/StudentMaster.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1>Job Application Page </h1>
    <h4>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </h4>
    <div>
        <asp:Table runat="server" Height="200px" Width="500px">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCompany" runat="server" Text="Company Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlCompanyNames" runat="server" DataSourceID="sdsCompanyNames" ValidationGroup="1" DataTextField="CorpName" DataValueField="CorpName" AppendDataBoundItems="true">
                        <asp:ListItem Text="Please Select" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" ControlToValidate="ddlCompanyNames" InitialValue="0" ValidationGroup="1" ErrorMessage="Company Name Not Selected" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPosition" runat="server" Text="Position Title:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPosition" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqFieldValidatorPosition" Enabled="true" ValidationGroup="1" runat="server" ControlToValidate="txtPosition" ErrorMessage="Enter Position Title" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblStudentEmail" runat="server" Text="Student Email:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtStudentEmail" runat="server" placeholder="Enter Email Used to Apply"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStudentEmail" Enabled="true" runat="server" ValidationGroup="1" ControlToValidate="txtStudentEmail" ErrorMessage="Enter Email" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <asp:Button ID="btnApply" runat="server" Text="Apply" ValidationGroup="1" OnClick="btnApply_Click" />
    </div>
    <h4 class="display-6 ">Search Jobs</h4>
        <div class="row p-1">
            <div class="col">
                <label for="txtTitleSearch">Title</label>
            </div>
            <div class="col">
                <label for="txtTypeSearch">Type</label>
            </div>
            <div class="col">
                <label for="txtCitySearch">City</label>
            </div>
            <div class="col">
                <label for="txtStateSearch">State</label>
            </div>
            <div class="col">
                <label for="txtIndustrySearch">Industry</label>
            </div>
            <div class="col">
                <label for="txtCorpNameSearch">Corporate Sponsor</label>
            </div>
        </div>
    <div class="row p-1">
        <div class="col">
            <asp:TextBox ID="txtTitleSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtTypeSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtCitySearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtStateSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtIndustrySearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        <div class="col">
            <asp:TextBox ID="txtCorpNameSearch" class="form-control" runat="server" ValidationGroup="1"></asp:TextBox>
        </div>
        
    </div>
    <div class="row p-1 pt-2">
            <div class="col">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="1" class="btn btn-success"/>
            </div>
        </div>    
    <div = class="container my-auto">
            <table class="table caption-top">
                <asp:GridView ID="gvOpportunity" runat="server" 
                    class="table table-hover table table-bordered table-condensed" 
                    Width="1085px" EmptyDataText="Job Record Not Found">

                </asp:GridView>
            </table>
            <div class="p-3"></div>
            <asp:Label ID="lblMessage" runat="server" class="form-label"></asp:Label>
        </div>
    <asp:SqlDataSource ID="sdsCompanyNames" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Lab3ConnectionString %>" 
        SelectCommand="SELECT CorpName FROM Opportunity ORDER BY CorpName"></asp:SqlDataSource>
</asp:Content>
