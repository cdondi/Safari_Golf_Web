<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" codefile="DefaultOld.aspx.cs"
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
		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
				<h2>
					Welcome</h2>
				<p>
					This site is where Safari Golf Club of Texas manages Golf Club golf games and other events. You must be a registered user to see games and member game information.</p>
			
            <h2> Members</h2>
                <p>
                     Glad to see you again. Please check our past and current golf games and assigned tee times. During the game you can enter your scores and view real time leaderboard. You must have RSVPed your attendance when you select the event to be included on the Tee times.</p>

   
                <p>
					Please login to enjoy the ability to update your profile as well as upload pictures. For your convenience we have created your login credentials. Use this format:</p>
                <p>
					If your name is <span class="auto-style1"><strong>John Doe</strong></span>&nbsp; then your username is<span class="auto-style1"><strong> jdoe</strong></span> and password is <span class="auto-style1"><strong>JDoe!</strong></span> </p>
                <p>
					Note the upper case in password and the exclamation at the end.</p>
                          
            
            
            </div> 
			<%--<div class="leftblock">
				<h2>
					Login</h2>
				<div class="dashedline">
				</div>
				<h3 class="none">
					Members? Please Login to access member pages</h3>
				<asp:Login ID="Login1" runat="server">
					<LayoutTemplate>
						<fieldset>
							<legend class="none">Login</legend>
							<asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
							<table>
								<tr>
									<td>
										<asp:Label runat="server" AssociatedControlID="UserName" ID="UserNameLabel">User name:</asp:Label></td>
									<td>
										<asp:TextBox runat="server" ID="UserName"></asp:TextBox>
										<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ValidationGroup="Login1"
											ErrorMessage="User Name is required." ToolTip="User Name is required." ID="UserNameRequired">*</asp:RequiredFieldValidator>
									</td>
								</tr>
								<tr>
									<td>
										<asp:Label runat="server" AssociatedControlID="Password" ID="PasswordLabel">Password:</asp:Label></td>
									<td>
										<asp:TextBox runat="server" TextMode="Password" ID="Password"></asp:TextBox>
										<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ValidationGroup="Login1"
											ErrorMessage="Password is required." ToolTip="Password is required." ID="PasswordRequired">*</asp:RequiredFieldValidator>
									</td>
								</tr>
								<tr>
									<td>
									</td>
									<td>
										<asp:CheckBox runat="server" ID="RememberMe" Text="Remember me next time." /></td>
								</tr>
							</table>
							<Club:RolloverButton ID="LoginButton" runat="server" Text="Login" CommandName="Login" />
						</fieldset>
					</LayoutTemplate>
				</asp:Login>
			</div>
			<div class="leftblock">
				<h2>
					Forgot Username or Password
				</h2>
				<div class="dashedline">
				</div>
				<asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
					<UserNameTemplate>
						Forgot your password? Enter your username to recover your password.
						<asp:Literal EnableViewState="False" ID="FailureText" runat="server"></asp:Literal>
						<table border="0" cellpadding="0">
							<tr>
								<td align="right">
									<asp:Label AssociatedControlID="UserName" ID="UserNameLabel" runat="server">User Name:</asp:Label></td>
								<td>
									<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ControlToValidate="UserName" ErrorMessage="User Name is required."
										ID="UserNameRequired" runat="server" ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
								</td>
							</tr>
						</table>
						<Club:RolloverButton CommandName="Submit" ID="SubmitButton" runat="server" Text="Submit"
							ValidationGroup="PasswordRecovery1" />
					</UserNameTemplate>
				</asp:PasswordRecovery>
			</div>--%>
			<div class="leftblock">
				<h2>
					New member registration</h2>
				<div class="dashedline">
				</div>
				<p>
					Do not have a Login? Use the <a href="Member_Register.aspx">registration</a> page
					to join the club.</p>
			</div>
		</div>
		<!--
        
        Right column
        
        -->
		<div id="columnright">
			<div class="rightblock">
				<asp:Panel ID="panel1" runat="server" CssClass="actionbuttons">
					<Club:RolloverLink ID="AddBtn" runat="server" Text="Add new event" NavigateURL="Events_Edit.aspx?Action=New" />
				</asp:Panel>
				<a href="Events_calendar.aspx">Month view</a> &nbsp; &nbsp; <a href="Locations_list.aspx">
					Golf Courses List</a>
			</div>
			<div class="rightblock">
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="PagedUpcommingEventList" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
					<SelectParameters>
						<asp:ControlParameter Name="pageNum" ControlID="pn1" PropertyName="SelectedPage" />
						<asp:Parameter DefaultValue="5" Name="pageSize" Type="Int32" />
						<asp:Parameter Name="pageCount" Direction="ReturnValue" Type="Int32" />
					</SelectParameters>
				</asp:SqlDataSource>
				<h2>
					Upcomming events</h2>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn1" runat="server" SelectedPage="1" DisplayedPages="7" OnSelectedPageChanged="pn1_SelectedPageChanged"
						CssClass="PageNumbers" />
				</div>
				<div class="dashedline">
				</div>
				<!-- begin news item -->
				<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
					<ItemTemplate>
						<div class="listitem">
							<div class="thumbnail">
								<a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString(Eval("ID"))%>'>
									<Club:ImageThumbnail ID="ImageThumbnail1" runat="server" PhotoID='<%# Eval("photo") %>'
										NoPhotoImg="images/calendar.jpg" />
								</a>
							</div>
							<asp:Panel ID="panel2" runat="server" CssClass="editbuttons" Visible='<%#IsAdmin %>'>
								<Club:RolloverLink ID="EditBtn" runat="server" Text="Edit" NavigateURL='<%# "Events_Edit.aspx?Action=Edit&id=" + Convert.ToString(Eval("id")) %>' />
								<Club:RolloverLink ID="RemoveBtn" runat="server" Text="Remove" NavigateURL='<%# "Events_Edit.aspx?Action=Remove&id=" + Convert.ToString(Eval("id")) %>' />
							</asp:Panel>
							<h3>
								<asp:Label ID="itemdateLabel" runat="server" Text='<%# Eval("starttime","{0:d}") %>' />
								&nbsp;&nbsp;&nbsp;&nbsp; <a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>
									<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
								</a>
							</h3>
							<p>
								<asp:Label ID="descriptionLabel" runat="server" Text='<%# SharedRoutines.truncate((string)Eval("description")) %>' />
								<a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>read more
									&raquo;</a></p>
							<div class="clearlist">
							</div>
						</div>
					</ItemTemplate>
				</asp:Repeater>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn2" runat="server" SelectedPage="1" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn2_SelectedPageChanged" />
				</div>
			</div>
			<div class="rightblock">
				<h2>
					Recent events</h2>
				<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="PagedRecentEventList" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource2_Selected">
					<SelectParameters>
						<asp:ControlParameter Name="pageNum" ControlID="pn3" PropertyName="SelectedPage" />
						<asp:Parameter DefaultValue="5" Name="pageSize" Type="Int32" />
						<asp:Parameter Name="pageCount" Direction="ReturnValue" Type="Int32" />
					</SelectParameters>
				</asp:SqlDataSource>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn3" runat="server" SelectedPage="1" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn3_SelectedPageChanged" />
				</div>
				<div class="dashedline">
				</div>
				<!-- begin news item -->
				<asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
					<ItemTemplate>
						<div class="listitem">
							<div class="thumbnail">
								<a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>
									<Club:ImageThumbnail ID="ImageThumbnail1" runat="server" PhotoID='<%# Eval("photo")%>'
										NoPhotoImg="images/calendar.jpg" />
								</a>
							</div>
							<asp:Panel ID="panel1" runat="server" CssClass="editbuttons" Visible='<%#IsAdmin %>'>
								<Club:RolloverLink ID="EditBtn" runat="server" Text="Edit" NavigateURL='<%# "Events_Edit.aspx?Action=Edit&id=" + Convert.ToString(Eval("id")) %>' />
								<Club:RolloverLink ID="RemoveBtn" runat="server" Text="Remove" NavigateURL='<%# "Events_Edit.aspx?Action=Remove&id=" + Convert.ToString(Eval("id")) %>' />
							</asp:Panel>
							<h3>
								<asp:Label ID="itemdateLabel" runat="server" Text='<%# Eval("starttime","{0:d}") %>' />
								&nbsp;&nbsp;&nbsp;&nbsp; <a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>
									<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
								</a>
							</h3>
							<p>
								<asp:Label ID="descriptionLabel" runat="server" Text='<%# SharedRoutines.truncate((string)Eval("description")) %>' />
								<a href='<%# "Events_view.aspx?Eventid=" + Convert.ToString( Eval("ID"))%>'>read more
									&raquo;</a></p>
							<div class="clearlist">
							</div>
						</div>
					</ItemTemplate>
				</asp:Repeater>
				<div class="dashedline">
				</div>
				<div class="newscrumbs">
					Page:
					<Club:PageNumberer ID="pn4" runat="server" SelectedPage="1" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn4_SelectedPageChanged" />
				</div>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
