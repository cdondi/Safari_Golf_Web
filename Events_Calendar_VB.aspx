﻿<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" codefile="Events_Calendar_VB.aspx.vb" Inherits="Events_Calendar" Title="Untitled Page" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="ec" Namespace="ControlSample" Assembly="EventCalendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="fullwidth">
			<h2>
				Events</h2>
			<br />
			Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
			euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
			minim veniam, quis nostrud exercitation ulliam corper.
			<div class="dashedline">
			</div>
			<a href="Events_list.aspx">List view</a> &nbsp; &nbsp; <a href="Locations_list.aspx">
				Golf Courses List</a>
		</div>
		<asp:Panel ID="panel1" runat="server" CssClass="fullwidth">
			<div class="actionbuttons">
				<Club:RolloverLink ID="Addbtn" runat="server" Text="Add New Event" NavigateURL="Events_edit.aspx?Action=New" />
			</div>
		</asp:Panel>
		<div class="eventmonth">
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
				SelectCommand="SELECT [id], [starttime], [title], [description] FROM [Events]"></asp:SqlDataSource>
			<ec:EventCalendar runat="server" ID="eventscalendar" DataSourceID="sqldatasource1"
				BorderWidth="0" DayField="starttime" ShowTitle="true" CssClass="eventmonthtable">
				<DayHeaderStyle CssClass="caldays" />
				<DayStyle CssClass="calcurrentmonth" />
				<TodayDayStyle CssClass="calcurrentday" />
				<WeekendDayStyle CssClass="calweekend" />
				<OtherMonthDayStyle CssClass="calothermonth" />
				<DayNumberStyle CssClass="dayNumber" />
				<HeaderTemplate>
					<table width="100%">
						<tr align="center">
							<td>
								<asp:LinkButton ID="PrevMonth" runat="server" Text='<%# Container.PrevMonth.ToString("MMMM yyyy") + " &raquo;" %>'
									CommandName="PrevMonth" />
							</td>
							<td>
								<h3>
									<asp:Label ID="label2" runat="server" Text='<%# Container.CurrentMonth.ToString("MMMM yyyy") %>' /></h3>
							</td>
							<td>
								<asp:LinkButton ID="NextMonth" runat="server" Text='<%# Container.NextMonth.ToString("MMMM yyyy") + " &raquo;" %>'
									CommandName="NextMonth" />
							</td>
						</tr>
					</table>
					<div class="dashedline">
					</div>
				</HeaderTemplate>
				<DayEventTemplate>
					<div style="padding: 3px;">
						<asp:HyperLink ID="HyperLink1" runat="server" Text='<%#Eval("title") %>' NavigateUrl='<%# "Events_view.aspx?Eventid=" + Convert.ToString(Eval("ID"))%>'
							ToolTip='<%# SharedRoutines.truncate(DirectCast(Eval("description"), String)) %>' /></div>
				</DayEventTemplate>
			</ec:EventCalendar>
		</div>
		<asp:Panel ID="panel2" runat="server" CssClass="fullwidth">
			<div class="actionbuttons">
				<Club:RolloverLink ID="GreenRolloverLink1" runat="server" Text="Add New Event" NavigateURL="Events_edit.aspx?Action=New" />
			</div>
		</asp:Panel>
	</div>
</asp:Content>
