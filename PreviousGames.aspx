<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="PreviousGames.aspx.vb" Inherits="Events_Calendar" %>
<%@ Register Src="controls\TabsControl.ascx" TagName="TabsControl" TagPrefix="tc" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>    
         
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server"> 
    <link href="css/TabsControl.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
	        font-family: Arial, Helvetica, sans-serif;
	        font-size: 12px;
	        color: #404040;
	        background-color: #FFF;
        }

        :focus {
	        -moz-outline-style: none;
        }
        
        div.huge
        {
            font-weight: bolder;
            font-family: Arial;
            font-size:50px;
            padding: 10px;
            margin: 5px;
            border: 1px solid black;
        }
        
        span.leftIndent
        {
            padding-left: 15px;
        }
        
        #microsoftDiv
        {            
            color: blue;
        }
        
        #facebookDiv
        {            
            color: green;
        }
        
        #appleDiv
        {            
            color: red;
        }
        
        span.codeExample
        {
            color: Blue;
        }
        .auto-style1 {
            color: #FF3300;
            height: 32px;
        }
    </style>
 


    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
   
 <style type="text"css">
.block {
display: block;
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
		   
				<h2>Game Date and Location</h2>
                		 		 
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="GameList" SelectCommandType="StoredProcedure">					
				</asp:SqlDataSource>
				
				<div class="dashedline">
				</div>
				<!-- begin news item -->
				<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
					<ItemTemplate>
						<div>  
							<h3>
								<a href='<%# "Previousgames.aspx?Dateid=" + Convert.ToString(Eval("Dateid")) & "&locationid=" + Convert.ToString(Eval("locationid"))%>'>
									<asp:Label ID="titleLabel"  style="font-size: small" runat="server" Text='<%# Eval("Dateid")%>' />-<asp:Label ID="Label1"  style="font-size: small" runat="server" Text='<%# Eval("locationname")%>' />
								</a><br /><br />
							</h3> 
						</div>
					</ItemTemplate>
				</asp:Repeater> 
			
                
			</div> 
		   </div>
            
		  
        	<div id="columnright">
           <div class="rightblock">
                   
               
				<h2><asp:Label ID="DatePlayed1" runat="server"   Text="" /> <asp:Label ID="LocationPlayed" runat="server"   Text="" /></h2>


                            <asp:GridView ID="GridViewClosed1"  runat="server" 
                                    AutoGenerateColumns="False" CellPadding="4"  
                                    ForeColor="#333333"   GridLines="Both" ShowFooter="True">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                        
                                            <asp:BoundField DataField="GhinID" HeaderText="Ghin ID" 
                                            SortExpression="GhinID" /> 

                                            <asp:BoundField DataField="firstname" HeaderText="First Name" 
                                            SortExpression="firstname" /> 
                                            <asp:BoundField DataField="lastname" HeaderText="Last Name" 
                                            SortExpression="lastname" />  
                                        
                                        
                                            <asp:BoundField DataField="Playdate" HeaderText="Game Date" 
                                            SortExpression="Playdate" /> 
                                                                                                                       
                                            <asp:BoundField DataField="grandtotal" HeaderText="Gross Score" 
                                            SortExpression="grandtotal" /> 
                                                                                                                                         
                                            <asp:BoundField DataField="netscore" HeaderText="Net Score" 
                                            SortExpression="netscore" /> 
                                                                               
 

                                    </Columns>
                                   
                            <HeaderStyle CssClass="headerStyle" ForeColor="White" BackColor="#5D7B9D" 
                                    Font-Bold="True" />
                            <RowStyle CssClass="rowStyle" BackColor="#F7F6F3" ForeColor="#333333" />
                            <AlternatingRowStyle CssClass="alternatingRowStyle" BackColor="White" 
                                    ForeColor="#284775" />
                                <EditRowStyle BackColor="#999999" />
                            <FooterStyle CssClass="footerStyle" BackColor="#5D7B9D" Font-Bold="True" 
                                    ForeColor="White" />
                            <PagerStyle CssClass="pagerStyle" ForeColor="White" BackColor="#284775" 
                                    HorizontalAlign="Center" />    
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
         	              

			</div>
                
	       </div>
		<div class="clear2column">
		</div>
            
   </div>       
</asp:Content>

