<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" codefile="Default.aspx.cs"
	Inherits="_Default" Title="My User Group" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>

<%@ Register Src="WebPartControls/Welcome.ascx" TagName="Welcome" TagPrefix="uc1" %>
 
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		
       
		
		<div class="fullwidth">
			<h2>
				Welcome</h2>
			<br />
			
             <p>
        <img alt="welcome" class="auto-style1" width="1296px" src="App_Themes/Club/images/MonteRei8.jpg" /></p>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
