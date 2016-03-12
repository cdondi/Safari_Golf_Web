<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" codefile="Member_List.aspx.cs"
	Inherits="Member_List" Title="Members" %>

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
					Members List</h2>
				<p>
				 Listing of members currently active in our club</p>
			</div>
		</div>
		<!--
        
        Right column
        
        -->
		<div id="columnright">
			<div class="rightblock">
				<div class="newscrumbs">
					<asp:LinkButton ID="showall" runat="server" Text="Show All" OnClick="showall_Click" />
					<asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>" ID="SqlDataSource1"
						runat="server" SelectCommand="MemberCountByLetter" SelectCommandType="StoredProcedure" />
					<asp:Repeater DataSourceID="SqlDataSource1" ID="Repeater1" runat="server">
						<ItemTemplate>
							<asp:LinkButton ID="hp1" runat="server" Text='<%#Eval("letter")%>' Visible='<%# Convert.ToInt32(Eval("num"))>0 %>'
								OnClick="hp1_Click" CssClass='<%# linkClass((string)Eval("letter"))%>' />
							<asp:Label ID="LinkButton1" runat="server" Text='<%#Eval("letter")%>' Visible='<%# Convert.ToInt32(Eval("num"))==0 %>' />
						</ItemTemplate>
					</asp:Repeater>
				</div>
				<div class="dashedline">
					&nbsp;</div>
				<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMembers"
					TypeName="MemberDetails">
					<SelectParameters>
						<asp:Parameter DefaultValue="" Name="filter" Type="String" />
					</SelectParameters>
				</asp:ObjectDataSource>
				<asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" RepeatColumns="2"
					RepeatDirection="Horizontal">
					<ItemTemplate>
						<div class="membercard">
							<div style="float: left; padding: 0 5px 0 0;">
								<asp:Image ID="ImageThumbnail1" runat="server" ImageUrl='<%# Eval("PhotoURL") %>' />
							</div>
							<h3>
								<asp:Label ID="titleLabel" runat="server" Text='<%# (string)Eval("FirstName") + " " +  (string)Eval("LastName")  %>' />
							</h3>
							<p>
								<asp:HyperLink ID="emailLink" runat="server" NavigateUrl='<%# "mailto:" + (string)Eval("Email")%>'
									Text='<%# Eval("Email") %>' />
							</p>
							<p>
								<asp:Label ID="addressLabel" runat="server" Text='<%# PreFormat((string)Eval("Address")) %>' />
							</p>
							<p>
								Phone:
								<asp:Label ID="phonelabel" runat="server" Text='<%# Eval("Phone")%>' />
							</p>
							<div class="clearcard">
							</div>
						</div>
					</ItemTemplate>
				</asp:DataList>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
