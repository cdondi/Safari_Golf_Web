<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" codefile="Locations_List.aspx.cs"
	Inherits="Locations_List" Title="News Articles" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<!--
        
        Left column
        
        -->
		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
				<h2>
					Course Locations - Listing</h2>
				<p>
					Here we will list all the golf course we plan to play this year.</p>
			</div>
		</div>
		<!--
        
        Right column
        
        -->
		<div id="columnright">
			<div class="rightblock">
				<asp:Panel ID="panel1" runat="server" CssClass="actionbuttons">
					<Club:RolloverLink ID="AddBtn" runat="server" Text="Add new location" NavigateURL="Locations_Edit.aspx?Action=New" />
				</asp:Panel>
				<a href="Events_calendar.aspx">Events Month view</a> &nbsp; &nbsp; <a href="Events_list.aspx">
					Golf Events List view</a>
			</div>
			<div class="rightblock">
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="PagedLocationsList" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
					<SelectParameters>
						<asp:ControlParameter Name="pageNum" ControlID="pn1" PropertyName="SelectedPage" />
						<asp:Parameter DefaultValue="100" Name="pageSize" Type="Int32" />
						<asp:Parameter Name="pageCount" Direction="ReturnValue" Type="Int32" />
					</SelectParameters>
				</asp:SqlDataSource>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn1" runat="server" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn1_SelectedPageChanged" />
				</div>
				<div class="dashedline">
				</div>
				<!-- begin news item -->
				<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
					<ItemTemplate>
						<div>
							<div class="thumbnail">
								<a href='<%# "Locations_View.aspx?Locationid=" + Convert.ToString( Eval("ID"))%>'>
									<Club:ImageThumbnail ID="ImageThumbnail1" runat="server" PhotoID='<%# Eval("photo") %>'
										NoPhotoImg="images/map.jpg" />
								</a>
							</div>
							<asp:Panel ID="panel1" runat="server" CssClass="editbuttons" Visible='<%#IsAdmin %>'>
								<Club:RolloverLink ID="EditBtn" runat="server" Text="Edit" NavigateURL='<%# "Locations_Edit.aspx?Action=Edit&LocationID=" + Convert.ToString(Eval("ID")) %>' />
								<Club:RolloverLink ID="RemoveBtn" runat="server" Text="Remove" NavigateURL='<%# "Locations_Edit.aspx?Action=Remove&LocationID=" + Convert.ToString(Eval("ID")) %>' />
							</asp:Panel>
							<h3>
								<a href='<%# "locations_view.aspx?locationid=" + Convert.ToString( Eval("ID"))%>'>
									<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
								</a>
							</h3>
							<p>
								<asp:Label ID="descriptionLabel" runat="server" Text='<%# SharedRoutines.truncate(Convert.ToString(Eval("description"))) %>' />
								<a href='<%# "locations_view.aspx?locationid=" + Convert.ToString( Eval("ID"))%>'>read
									more &raquo;</a></p>
						</div>
					</ItemTemplate>
				</asp:Repeater>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn2" runat="server" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn1_SelectedPageChanged" />
				</div>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
