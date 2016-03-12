<%@ Page Language="vb" MasterPageFile="~/Default.master" AutoEventWireup="true" codefile="GolfGroupedvb.aspx.vb"
	Inherits="Events_Calendar" Title="Untitled Page" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="ec" Namespace="ControlSample" Assembly="EventCalendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="fullwidth">
			<h2>
				Golf Data Grouped</h2>			 
			<div class="dashedline">
			</div>
			<a href="Events_list.aspx">List view</a> &nbsp; &nbsp; <a href="Locations_list.aspx">
				Golf Courses List</a>
		</div>
		<asp:Panel ID="panel1" runat="server" CssClass="fullwidth">
			gggggggggggggggggggggggggg
		</asp:Panel> 
	</div>
</asp:Content>
