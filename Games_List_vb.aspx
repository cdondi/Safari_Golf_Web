<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Games_List_vb.aspx.vb" Inherits="Events_Calendar" %>

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
					Golf Course - Locations</h2>
                			 
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="PagedLocationsList" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
					<SelectParameters>
						<asp:ControlParameter Name="pageNum" ControlID="pn1" PropertyName="SelectedPage" />
						<asp:Parameter DefaultValue="20" Name="pageSize" Type="Int32" />
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
							<h3>
								<a href='<%# "games_list.aspx?locationid=" + Convert.ToString( Eval("ID"))%>'>
									<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
								</a>
							</h3> 
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
		<!--
        
        Right column
        
        -->
		<div id="columnright">
			 
			<div class="rightblock">
					<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
		                SelectCommand="SELECT [dbo].[Locations].[id] as id, [dbo].[Locations].[title] as title, [dbo].[memberinfo].[firstname] as firstname, [dbo].[memberinfo].[lastname] as lastname, [dbo].[tb_scorecard].[scorecardid] as scorecardid , [dbo].[tb_hole].[ordinal] as holenumber, [dbo].[tb_hole].[yardage] as yardage, [dbo].[tb_hole].[par] as par , [dbo].[tb_score].[strokes] as strokes FROM [GolfDB].[dbo].[Locations],   [GolfDB].[dbo].[memberinfo],  [GolfDB].[dbo].[tb_scorecard],  [GolfDB].[dbo].[tb_hole], [GolfDB].[dbo].[tb_score] where [dbo].[Locations].[id] = [dbo].[tb_scorecard].[locationid] and [dbo].[tb_scorecard].[memberid] =[dbo].[memberinfo].[memberid] and [dbo].[tb_score].[scorecardid]=[dbo].[tb_scorecard].[scorecardid] and [dbo].[memberinfo].[memberid]=[dbo].[tb_scorecard].[memberid] and [dbo].[tb_hole].[locationid]=[dbo].[Locations].[id] and [dbo].[Locations].[id] = @id order by  [dbo].[memberinfo].[firstname], [dbo].[memberinfo].[lastname] , [dbo].[tb_hole].[ordinal]">
		                <SelectParameters>
			                <asp:Parameter Type="Int32" DefaultValue="1" Name="id"></asp:Parameter>
		                </SelectParameters>
	                </asp:SqlDataSource>
                 
                	<div class="rightblock">
				<a href="Locations_list.aspx">Games List</a></div>
			<div class="rightblock">
				<div class="nextlink">
					<asp:LinkButton ID="LinkButton1" runat="server" OnClick="nextButton_Click">Next Golf Course &raquo;</asp:LinkButton>
				</div>
				<asp:LinkButton ID="LinkButton2" runat="server" OnClick="prevButton_Click">&laquo; Previous Golf Course</asp:LinkButton>
				<div class="dashedline">
				</div>
 				<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="id"
					Width="444px">
					<ItemTemplate>
						<h2>
							<asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" />
						</h2>
						<%--<p>
							<asp:Label Text='<%# Eval("firstname") %>' runat="server" ID="firstnamelabel" /> 
							<asp:Label Text='<%# Eval("lastname") %>' runat="server" ID="lastnamelabel" /> 
							<asp:Label Text='<%# Eval("scorecardid") %>' runat="server" ID="scorecardid" /> 
							<asp:Label Text='<%# Eval("holenumber") %>' runat="server" ID="holenumberlabel" /> 
							<asp:Label Text='<%# Eval("yardage") %>' runat="server" ID="yardagelabel" /> 
							<asp:Label Text='<%# Eval("par") %>' runat="server" ID="parlabel" /> 
							<asp:Label Text='<%# Eval("strokes") %>' runat="server" ID="strokeslabel" />
                             

						</p> --%>

						<asp:Panel runat="server" ID="panel1" CssClass="actionbuttons" Visible='<%# User.IsInRole("Administrators") %>'>
							<Club:RolloverLink ID="editbtn" runat="server" Text="Edit Location" NavigateURL='<%# "games_list.aspx?LocationID=" + Convert.ToString(LocationID)%>' />
						</asp:Panel>
					</ItemTemplate>
				</asp:FormView>
                <br />

                
                            <asp:GridView ID="GridView1" runat="server" 
                                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
                                    ForeColor="#333333"  GridLines="Both">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                          <asp:BoundField DataField="firstname" HeaderText="firstname" 
                                            SortExpression="firstname" /> 
                                          <asp:BoundField DataField="lastname" HeaderText="lastname" 
                                            SortExpression="lastname" /> 
                                          <asp:BoundField DataField="scorecardid" HeaderText="scorecardid" 
                                            SortExpression="scorecardid" /> 
                                          <asp:BoundField DataField="holenumber" HeaderText="holenumber" 
                                            SortExpression="holenumber" /> 
                                          <asp:BoundField DataField="yardage" HeaderText="yardage" 
                                            SortExpression="yardage" /> 
                                          <asp:BoundField DataField="par" HeaderText="par" 
                                            SortExpression="par" /> 
                                          <asp:BoundField DataField="strokes" HeaderText="strokes" 
                                            SortExpression="strokes" /> 
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" /> 
                                </asp:GridView>
				<div class="dashedline">
				</div>
				<div class="nextlink">
					<asp:LinkButton ID="LinkButton3" runat="server" OnClick="nextButton_Click">Next Golf Course &raquo;</asp:LinkButton>
				</div>
				<asp:LinkButton ID="LinkButton4" runat="server" OnClick="prevButton_Click">&laquo; Previous Golf Course</asp:LinkButton>
			</div>
                
                 
			</div>
	 
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>

