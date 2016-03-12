<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="PlayerPerformance2.aspx.vb" Inherits="Events_Calendar" %>
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
                		 		  
				
				<asp:SqlDataSource ID="SqlDataSourcePlayer" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="PlayerList" SelectCommandType="StoredProcedure">
					 
				</asp:SqlDataSource>
                 
				<div class="dashedline">
				</div>

                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourcePlayer" >
					        <ItemTemplate>
						        <div>  
							        <h3>
								        <a href='<%# "PlayerPerformance.aspx?Ghinid=" + Convert.ToString(Eval("Ghinid"))%>'>
									        <asp:Label ID="lblFirstName"  style="font-size: small" runat="server" Text='<%# Eval("FirstName")%>' />&nbsp;<asp:Label ID="lblLastName"  style="font-size: small" runat="server" Text='<%# Eval("LastName")%>' />
								        </a><br /><br />
							        </h3> 
						        </div>
					        </ItemTemplate>
				        </asp:Repeater> 
                
                
			</div> 
		   </div>
            
		  
        	<div id="columnright">
           <div class="rightblock">
        tttttttttttttttt
        	                	      
                 	  <asp:Chart ID="Chart1" runat="server" 
                               BackColor="#D3DFF0" Palette="BrightPastel"
                           ImageType="Png"  Width="505px" Height="370px"
                           borderlinestyle="Solid" backgradientendcolor="White" backgradienttype="TopBottom"
                          BorderlineWidth="2" BorderlineColor="26, 59, 105" OnClick="Chart1_Click">
							
                           <titles>
								        <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 14.25pt, style=Bold" ShadowOffset="3" Text="" Name="Title1" ForeColor="26, 59, 105"></asp:Title>
						   </titles>
                            
                            <legends>
								<asp:legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold"></asp:legend>
							</legends>
							<borderskin skinstyle="Emboss"></borderskin>
							<series>
								<asp:series ChartArea="ChartArea1" XValueType="DateTime" Name="Series1" CustomProperties="LabelsRadialLineSize=1, LabelStyle=outside" BorderColor="180, 26, 59, 105" Color="194, 65, 140, 240"></asp:series>
							</series>
							<chartareas>
								<asp:chartarea Name="ChartArea1" BorderColor="64, 64, 64, 64" BorderDashStyle="Solid" BackSecondaryColor="White" BackColor="OldLace" ShadowColor="Transparent" BackGradientStyle="TopBottom">
									<axisy2 enabled="False"></axisy2>
									<axisx2 enabled="False"></axisx2>
									<area3dstyle Rotation="10" perspective="10" Inclination="15" IsRightAngleAxes="False" wallwidth="0" IsClustered="False"></area3dstyle>
									<axisy linecolor="64, 64, 64, 64" IsLabelAutoFit="False" ArrowStyle="Triangle">
										<labelstyle font="Trebuchet MS, 8.25pt, style=Bold" />
										<majorgrid linecolor="64, 64, 64, 64" />
									</axisy>
									<axisx linecolor="64, 64, 64, 64" IsLabelAutoFit="False" ArrowStyle="Triangle">
										<labelstyle font="Trebuchet MS, 8.25pt, style=Bold" IsStaggered="True" />
										<majorgrid linecolor="64, 64, 64, 64" />
									</axisx>
								</asp:chartarea>
							</chartareas>
						</asp:Chart><br />
				
                                                <asp:Label ID="lblScore" runat="server"   Width="491px" Text="" style="text-align: center; font-weight: 700"></asp:Label>
                              
         	
			</div>
                
	       </div>
		<div class="clear2column">
		</div>
            
   </div>       
</asp:Content>

