<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Account_Login"  UnobtrusiveValidationMode="None" %>

<%@ Register TagPrefix="uc" TagName="ucLoginDetails" Src="~/Account/ucLoginDetails.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 
<head runat="server">
    <title></title>
<%--<link href="css/materialize.css" rel="stylesheet" />
    <link href="css/global.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />--%>
    <style type="text/css"> 
        .centered
        {
            margin: 0 auto;
            float: none !important;
            display: table;
        }

        .Absolute-Center 
        {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-right: -50%;
            transform: translate(-50%, -50%) 
        }
 </style>
</head>

<body class="home page page-id-5 page-template-default">

    <form id="form1" runat="server" class="Absolute-Center">
  <asp:login id="Login1" style="width: 100%;" runat="server">
    <layouttemplate>          
      <div class="main-header">
          
            <div class="wrapper">

             <h2>Log In</h2>

                <dx:ASPxLabel ID="lblUserName" runat="server" AssociatedControlID="tbUserName" Text="User Name:" />
                <div class="form-field">
                    <dx:ASPxTextBox ID="UserName" runat="server"  placeholder="User Number" Width="200px" Text="rmurray">
                        <ValidationSettings ValidationGroup="Login1">
                            <RequiredField ErrorText="User Name is required." IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>

                <dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Password:" />
                <div class="form-field">
                    <dx:ASPxTextBox ID="Password" runat="server" placeholder="Password"  Password="true" Width="200px" Text="Password99">
                        <ValidationSettings ValidationGroup="Login1">
                            <RequiredField ErrorText="Password is required." IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>

                <br>

            <dx:ASPxButton ID="LoginButton" runat="server" Text="Log In" ValidationGroup="Login1" commandname="Login" OnClick="LoginButton_Click">
            </dx:ASPxButton>
            
                <br>
            <asp:literal id="FailureText" runat="server" enableviewstate="False"></asp:literal>
    </layouttemplate>
</asp:login>
        <div class="center-align" style="width: 25%;height:initial; margin-right: auto; margin-left:auto; padding:initial" >
           <uc:ucLoginDetails ID="LoginDetails1" runat="server" style="width: initial;height:initial; margin-right: initial; margin-left:initial; padding:initial"  Visible ="false"/>     
        </div>
    </form>
</body>
</html>
