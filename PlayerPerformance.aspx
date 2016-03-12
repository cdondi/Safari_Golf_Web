<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="PlayerPerformance.aspx.vb" Inherits="Events_Calendar" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>   


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server"> 
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
        .sampleTable {
            width: 454px;
        }
        .auto-style7 {
            text-align: center;
        }
    </style>
 

      <script type = "text/javascript">
<!--
    function Check_Click(objRef) {
        //Get the Row based on checkbox
        var row = objRef.parentNode.parentNode;

        //Get the reference of GridView
        var GridView = row.parentNode;

        //Get all input elements in Gridview
        var inputList = GridView.getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            //The First element is the Header Checkbox
            var headerCheckBox = inputList[0];

            //Based on all or none checkboxes
            //are checked check/uncheck Header Checkbox
            var checked = true;
            if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                if (!inputList[i].checked) {
                    checked = false;
                    break;
                }
            }
        }
        headerCheckBox.checked = checked;

    }
    function checkAll(objRef) {
        var GridView = objRef.parentNode.parentNode.parentNode;
        var inputList = GridView.getElementsByTagName("input");
        for (var i = 0; i < inputList.length; i++) {
            var row = inputList[i].parentNode.parentNode;
            if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                if (objRef.checked) {
                    inputList[i].checked = true;
                }
                else {
                    if (row.rowIndex % 2 == 0) {
                        row.style.backgroundColor = "#C2D69B";
                    }
                    else {
                        row.style.backgroundColor = "white";
                    }
                    inputList[i].checked = false;
                }
            }
        }
    }

    //-->
</script>

    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script type = "text/javascript">
<!--

    function expandcollapse(obj, row) {
        var div = document.getElementById(obj);
        var img = document.getElementById('img' + obj);

        if (div.style.display == "none") {
            div.style.display = "block";
            if (row == 'alt') {
                img.src = "minus.gif";
            }
            else {
                img.src = "minus.gif";
            }
            img.alt = "Close to view other Players";
        }
        else {
            div.style.display = "none";
            if (row == 'alt') {
                img.src = "plus.gif";
            }
            else {
                img.src = "plus.gif";
            }
            img.alt = "Expand to show Holes";
        }
    }

    //-->
</script>
 <style type="text"css">
.block {
display: block;
}
</style>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="body">
	

        <Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="fullwidth">
			<h2>Player Performance and Compare</h2> 
		</div>
       	 
        <div class="fullwidth">
		                                  
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
         
		   <table>
			<tr valign="top" >
			<td rowspan="4">                           
           
				                        	 		 
				<asp:SqlDataSource ID="SqlDataSourcePlayer" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="PlayerList" SelectCommandType="StoredProcedure">
					 
				</asp:SqlDataSource>
                 
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourcePlayer" >
					        <ItemTemplate>
                                <asp:HiddenField ID="lblghinid" runat="server" Value ='<%#Eval("Ghinid")%>'/> 
						        <div>  
							       
                                    <h3>
                                    <asp:CheckBox ID="chkplayer" runat="server"/>
                                     
								        <a href='<%# "PlayerPerformance.aspx?Ghinid=" + Convert.ToString(Eval("Ghinid"))%>'>
									        <asp:Label ID="lblFirstName"  style="font-size: small" runat="server" Text='<%# Eval("FirstName")%>' />  <asp:Label ID="lblLastName"  style="font-size: small" runat="server" Text='<%# Eval("LastName")%>' />
								        </a>
                                        
                                        
                                        <br /><br />
							        </h3> 
						        </div>
					        </ItemTemplate>
				        </asp:Repeater> 
                
          
			</td> 
		   
		  
        	<td> 
                <table><tr><td class="auto-style7"  >

                     	  <asp:Chart ID="Chart1" runat="server" 
                               BackColor="#D3DFF0" Palette="BrightPastel"
                           ImageType="Png"  Width="674px" Height="370px"
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
				
                                                <asp:Label ID="lblScore" runat="server"   Width="401px" Text="" style="text-align: center; font-weight: 700"></asp:Label>
                              
			</td>
            </tr>
            </table>

                <table><tr>
                    
                    <td valign="top"  class="auto-style7"  >

									
                            <asp:GridView ID="DataGrid1"  runat="server"  Caption="all games" 
                                    AutoGenerateColumns="False" CellPadding="4"  
                                    ForeColor="#333333"   GridLines="Both" ShowFooter="True" Width="300px">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                            <asp:BoundField DataField="PlayDate" HeaderText="Date" 
                                            SortExpression="PlayDate" />  
                                                
                                            <asp:BoundField DataField="locationname" HeaderText="Course" 
                                            SortExpression="locationname" />  
                                                                                                    
                                            <asp:BoundField DataField="score" HeaderText="Gross" 
                                            SortExpression="Score" /> 
                                                                                                     
                                            <asp:BoundField DataField="NetScore" HeaderText="Net" 
                                            SortExpression="NetScore" /> 
                                                                               

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

                    </td>
                    
                    <td valign="top"  class="auto-style7"  >

                                <asp:GridView ID="GridViewScores" runat="server" Caption="Details" 
                                    AutoGenerateColumns="False" CellPadding="4"  
                                    ForeColor="#333333"   GridLines="Both" ShowFooter="True" Width="100px">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />

                                    <Columns>
                                        <asp:BoundField DataField="Hole" HeaderStyle-HorizontalAlign="Left" HeaderText="Hole">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Score" HeaderText="Score" ItemStyle-HorizontalAlign="Right">
                                        <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
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

                     </td>
                         </tr>
                     
              	</table>
              
               
                <table><tr>
                    
                    <td valign="top"  >
                   
                <table><tr>
                    
                    <td valign="top" class="auto-style7"  >
   <asp:Button ID="Compare1" Text='Compare selected players' runat="server" Width="329px" style="text-align: center"></asp:Button> 
                        
                        <br />
                          
                        <asp:chart id="Chart2" runat="server" 
                               BackColor="#D3DFF0" Palette="BrightPastel"
                           ImageType="Png"  Width="674px" Height="370px"
                           borderlinestyle="Solid" backgradientendcolor="White" backgradienttype="TopBottom"
                          BorderlineWidth="2" BorderlineColor="26, 59, 105" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)">
							
                           <titles>
								        <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 14.25pt, style=Bold" ShadowOffset="3" Text="" Name="Title1" ForeColor="26, 59, 105"></asp:Title>
						   </titles>
                        <chartareas>
								<asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BorderDashStyle="Solid" BackSecondaryColor="White" BackColor="Gainsboro" ShadowColor="Transparent" BackGradientStyle="TopBottom">
									<axisy LineColor="64, 64, 64, 64" IsLabelAutoFit="False">
										<MajorGrid LineColor="64, 64, 64, 64" />
										<LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
									</axisy>
									<axisx LineColor="64, 64, 64, 64">
										<MajorGrid Interval="Auto" IntervalType="Auto" LineColor="64, 64, 64, 64" />
										<MajorTickMark IntervalType="Auto" />
										<LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" IntervalType="Auto" />
									</axisx>
									<area3dstyle Rotation="10" Perspective="10" Inclination="15" IsRightAngleAxes="False" WallWidth="0" />
								</asp:ChartArea>
							</chartareas>
							<legends>
								<asp:Legend IsTextAutoFit="False" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold"></asp:Legend>
							</legends>
							<borderskin SkinStyle="Emboss"></borderskin>
						</asp:chart>
              	 </td>

              	     </tr>
                    
                    <tr> 
                         
                         <td class="auto-style7">
                                                                        		
                            <asp:GridView ID="GridView1"  runat="server"  Caption="Player Comparison Scores" 
                                    AutoGenerateColumns="False" CellPadding="4"  
                                    ForeColor="#333333"   GridLines="Both" ShowFooter="True" Width="300px">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                        
                                            <asp:BoundField DataField="lastname" HeaderText="Last Name" 
                                            SortExpression="lastname" />  
                                                
                                            <asp:BoundField DataField="PlayDate" HeaderText="Date" 
                                            SortExpression="PlayDate" />  
                                                
                                            <asp:BoundField DataField="locationname" HeaderText="Course" 
                                            SortExpression="locationname" />  
                                                                                                    
                                            <asp:BoundField DataField="score" HeaderText="Gross" 
                                            SortExpression="Score" /> 
                                                                                                     
                                            <asp:BoundField DataField="NetScore" HeaderText="Net" 
                                            SortExpression="NetScore" /> 
                                                                               

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

                        </td>
                </tr>
               
              </table>
                            
           </div>
                
                  </td>
                         </tr>
                     
              	</table>
 
           </td></tr></table>   	        
            </ContentTemplate>
        </asp:UpdatePanel>               
            
      
    </div>
      
    </div>
</asp:Content>

