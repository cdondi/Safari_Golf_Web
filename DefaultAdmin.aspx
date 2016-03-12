<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" codefile="DefaultAdmin.aspx.cs"
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
		<!--
        
        Left column
        
        -->
	
	</div>
</asp:Content>
