<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="CurrentGames.aspx.vb" Inherits="Events_Calendar" %>
<%@ Register Src="controls\TabsControl.ascx" TagName="TabsControl" TagPrefix="tc" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>      
             
<%@ Register TagPrefix="Club" TagName="ScorecardControlctlNew" Src="ScorecardControlNew.ascx" %>   
    
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


    <script type="text/javascript">
        //This is the page specific on tab click function. You can manipulate page elements here.
        //For example, show some area and hide the others
        function OnTabClick(index) {
            switch (index) {
                case 0:
                    $("#TabDiv0").show();
                    $("#TabDiv1").hide();
                    $("#TabDiv2").hide();
                    $("#TabDiv3").hide(); 
                    break;
                case 1:
                    $("#TabDiv0").hide();
                    $("#TabDiv1").show();
                    $("#TabDiv2").hide();
                    $("#TabDiv3").hide(); 
                    break;
                case 2:
                    $("#TabDiv0").hide();
                    $("#TabDiv1").hide();
                    $("#TabDiv2").show();
                    $("#TabDiv3").hide(); 
                    break;
                case 3:
                    $("#TabDiv0").hide();
                    $("#TabDiv1").hide();
                    $("#TabDiv2").hide();
                    $("#TabDiv3").show(); 
                    break; 
            }
        }

        function OnTabScoreClick(index) {
            switch (index) {
                case 0:
                    $("#TeeGroup0").show();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").hide(); 
                    break;
                case 1:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").show();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").hide();
                    break;
                case 2:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").show();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").hide();
                    break;
                case 3:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").show();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").hide();
                    break;
                case 4:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").show();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").hide();
                    break;
                case 5:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").show();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").hide();
                    break;
                case 6:
                    $("#TeeGroup0").hide();
                        $("#TeeGroup1").hide();  
                        $("#TeeGroup2").hide();
                        $("#TeeGroup3").hide();
                        $("#TeeGroup4").hide();
                        $("#TeeGroup5").hide();
                        $("#TeeGroup6").show();
                        $("#TeeGroup7").hide();
                        $("#TeeGroup8").hide();
                        $("#TeeGroup9").hide();
                        $("#TeeGroup10").hide();
                        $("#TeeGroup11").hide();
                        break;
                case 7:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").show();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").hide();
                    break;
                case 8:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").show();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").hide();
                    break;
                case 9:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").show();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").hide();
                    break;
                case 10:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").show();
                    $("#TeeGroup11").hide();
                    break;
                case 11:
                    $("#TeeGroup0").hide();
                    $("#TeeGroup1").hide();
                    $("#TeeGroup2").hide();
                    $("#TeeGroup3").hide();
                    $("#TeeGroup4").hide();
                    $("#TeeGroup5").hide();
                    $("#TeeGroup6").hide();
                    $("#TeeGroup7").hide();
                    $("#TeeGroup8").hide();
                    $("#TeeGroup9").hide();
                    $("#TeeGroup10").hide();
                    $("#TeeGroup11").show();
                    break;
            }
        }

        /*
        //Example of the use of client object
        Tabs1.ClickTab(1); //raise a click on the tab on index 1
        Tabs1.ClickTabByText("Apple"); //raise a click on the tab with text "Apple"
        Tabs1.ShowTabArray(); //Show the whole tab control
        Tabs1.HideTabArray(); //Hide the whole tab control
        Tabs1.ShowTabByIndex(1); //Show the tab on index 1
        Tabs1.HideTabByIndex(1); //Hide the tab on index 1
        Tabs1.ShowTabByText("Apple"); //Show the tab with text "Apple"
        Tabs1.HideTabByText("Apple"); //Hide the tab with text "Apple"
        */
    </script>
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
 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="body">
	 

        <Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="fullwidth">
			<h2>Game Central- Active and Closed Games</h2> 
		</div>
      
        <tc:TabsControl ID="Tabs1" runat="server" />
             
        <div id="TabDiv0"  style="font-family: Verdana; font-size: x-small; font-weight: normal">
                                       
                            
                                         
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

			<h2>Course Information <asp:Label ID="coursename0" runat="server"></asp:Label> </h2>

            <div id="columnleft">            
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
		   
				  
				<h2>All Courses</h2>
                		 
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="PagedLocationsList" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
					<SelectParameters>
						<asp:ControlParameter Name="pageNum" ControlID="pn1" PropertyName="SelectedPage" />
						<asp:Parameter DefaultValue="100" Name="pageSize" Type="Int32" />
						<asp:Parameter Name="pageCount" Direction="ReturnValue" Type="Int32" />
					</SelectParameters>
				</asp:SqlDataSource>
				<div class="newscrumbs">
					
					<Club:PageNumberer ID="pn1" runat="server" DisplayedPages="7" CssClass="PageNumbers"
						OnSelectedPageChanged="pn1_SelectedPageChanged" />
				</div>
				<div class="dashedline">
				</div>
				<!-- begin news item -->
				<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
					<ItemTemplate>
						<div>  
							<h3>
								<a href='<%# "CurrentGames.aspx?locationid=" + Convert.ToString(Eval("ID"))%>'>
									<asp:Label ID="titleLabel"  style="font-size: small" runat="server" Text='<%# Eval("title") %>' />
								</a><br /><br />
							</h3> 
						</div>
					</ItemTemplate>
				</asp:Repeater> 
                
                </div> 
             
                </div> 
			
            <div id="columnright1">
			 
			<div class="rightblock" >
                			
                	                
                <table border="0" ><tr><td valign="top">  
                       
                            
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="top">


                     <table cellpadding="4" cellspacing="0" border="1" style="font-size: small">
                    <tr>     
                        <td colspan="4" align="center">
                        Course Hole Details
                     </td> 
                     </tr>
                                        
                    <tr>     
                        <td>Hole</td>
                        <td>Yards</td> 
                        <td>Par</td> 
                        <td>Handicap</td> 
                     </tr>
                    
                    <tr>     
                        <td><asp:label ID="txtHole1" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard1" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar1" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap1" runat="server" width="44px"></asp:textbox></td> 
                     </tr>
 
                    <tr>     
                        <td><asp:label ID="txtHole2" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard2" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar2" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap2" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole3" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard3" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar3" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap3" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole4" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard4" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar4" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap4" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole5" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard5" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar5" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap5" runat="server" width="44px"></asp:textbox></td> 
                     </tr>
                    <tr>     
                        <td><asp:label ID="txtHole6" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard6" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar6" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap6" runat="server" width="44px"></asp:textbox></td> 
                     </tr>
                    <tr>     
                        <td><asp:label ID="txtHole7" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard7" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar7" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap7" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole8" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard8" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar8" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap8" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole9" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard9" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar9" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap9" runat="server" width="44px"></asp:textbox></td> 
                     </tr>


                    <tr>     
                        <td><asp:label ID="txtHole10" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard10" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar10" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap10" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole11" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard11" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar11" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap11" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole12" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard12" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar12" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap12" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole13" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard13" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar13" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap13" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole14" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard14" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar14" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap14" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole15" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard15" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar15" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap15" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole16" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard16" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar16" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap16" runat="server" width="44px"></asp:textbox></td> 
                     </tr>

                    <tr>     
                        <td><asp:label ID="txtHole17" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard17" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar17" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap17" runat="server" width="44px"></asp:textbox></td> 
                     </tr>
                    <tr>     
                        <td><asp:label ID="txtHole18" runat="server" width="44px"></asp:label></td>
                        <td><asp:textbox ID="txtYard18" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="TxtPar18" runat="server" width="44px"></asp:textbox></td> 
                        <td><asp:textbox ID="txtHandicap18" runat="server" width="44px"></asp:textbox></td> 
                     </tr>


                    </table>  
                                
                                  
                          </td>  
                        </tr>
                      </table>                      
                    
                    </td>
                    <td valign="top">
                                                          
                 
                   <table cellpadding="4" cellspacing="0" border="1" style="font-size: medium">
                      <tr>     
                        <td colspan="2" align="center">Male Course<br />Rating</td> 
                     </tr>
                      <tr>     
                        <td>Rating</td>
                        <td>Slope</td> 
                     </tr>
                      <tr>     
                        <td><asp:textbox ID="MaleRating" runat="server" width="44px"></asp:textbox></td>
                        <td><asp:textbox ID="MaleSlope" runat="server" width="44px"></asp:textbox></td> 
                     </tr>
                   </table>

                      <br />
                      <br />
                      <br />

                   <table cellpadding="4" cellspacing="0" border="1" style="font-size: medium">
                      <tr>     
                        <td colspan="2" align="center">Female Course<br />Rating</td> 
                     </tr>
                      <tr>     
                        <td>Rating</td>
                        <td>Slope</td> 
                     </tr>
                      <tr>     
                        <td><asp:textbox ID="FemaleRating" runat="server" width="44px"></asp:textbox></td>
                        <td><asp:textbox ID="FemaleSlope" runat="server" width="44px"></asp:textbox></td> 
                     </tr>
                   </table>


                      </td>

                    </tr>
                    
                    <tr>     
                        <td colspan="6" align="center">
                         <asp:Button ID="SaveCourseDetails" Text='Save Course Details' runat="server"/> <br />
                          <asp:Label ID="lblSaveCourseDetails" Text="" runat="server"></asp:Label> 
                     </td> 
                     </tr>
                      
                           
                    </table>

                </div>
		     
            </div>   
                    
                    
            </ContentTemplate>
        </asp:UpdatePanel>               

        </div>
       
        <div id="TabDiv1"   style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
                                                                       
                                                           

            <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

			<h2>Current Game Tee Pairing<asp:Label ID="coursename1" runat="server"></asp:Label></h2>
            <div id="columnleft1">			 
			<div class="leftblock">
				 
				<h2>Players</h2>
                
                         <asp:GridView ID="gvAll" runat="server" 
                            AutoGenerateColumns = "False" Font-Names = "Arial" 
                            Font-Size = "11pt"   AllowPaging ="false"    showfooter="true"
                              EmptyDataText = "No Records Selected" EnableModelValidation="True"  GridLines="both"   width="300px"> 
                              
                            <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" runat="server" onclick = "checkAll(this);"  />
                                </HeaderTemplate> 
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk" runat="server" onclick = "Check_Click(this)"  />
                                </ItemTemplate>
                            </asp:TemplateField> 
                                                                    
                            <asp:BoundField DataField = "GhinID" HeaderText = "Ghin ID" HtmlEncode = "false" />
                            <asp:BoundField DataField = "firstname" HeaderText = "F. Name" HtmlEncode = "false" />
                            <asp:BoundField DataField = "lastname" HeaderText = "L. Name" HtmlEncode = "false" />
                            <asp:BoundField DataField = "Tournamenthandicap" HeaderText = "T. Cap" HtmlEncode = "false" />
                            <asp:BoundField DataField = "Ghinhandicap" HeaderText = "G. Cap" HtmlEncode = "false" />

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
            
		   <div id="columnright">
			<div class="rightblock">
                
				<h2>Tee Order for Course:</h2>
                     

                        <asp:Button ID="MoveStuff" runat="server"   Text=">>> MOVE SELECTION >>>" />
                           
				<div class="dashedline">
				</div>

                        <asp:RadioButton ID="RadioSelected1"   runat="server" Text="Tee Group 1" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected1" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear1" runat="server" Text="Clear Tee Group 1" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  
                                               
				                               
				<div class="dashedline">
				</div>

                        <asp:RadioButton ID="RadioSelected2"   runat="server" Text="Tee Group 2" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected2" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear2" runat="server" Text="Clear Tee Group 2" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  
                                               
				                                             
                
				<div class="dashedline">
				</div>
                                                            
                        <asp:RadioButton ID="RadioSelected3" runat="server" Text="Tee Group 3" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected3" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear3" runat="server" Text="Clear Tee Group 3" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  

                            
                
				<div class="dashedline">
				</div>
                             
                        <asp:RadioButton ID="RadioSelected4" runat="server" Text="Tee Group 4" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected4" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear4" runat="server" Text="Clear Tee Group 4" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  

                    
                    
                
				<div class="dashedline">
				</div> 

                        <asp:RadioButton ID="RadioSelected5" runat="server" Text="Tee Group 5" GroupName="TeeGroups" />  
                                                             
                        <asp:GridView ID="gvSelected5" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear5" runat="server" Text="Clear Tee Group 5" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  

                           
                
				<div class="dashedline">
				</div>


                        <asp:RadioButton ID="RadioSelected6" runat="server" Text="Tee Group 6" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected6" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear6" runat="server" Text="Clear Tee Group 6" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  
                                                               
                       
                            
                
				<div class="dashedline">
				</div>
                                                          
                        <asp:RadioButton ID="RadioSelected7" runat="server" Text="Tee Group 7" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected7" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear7" runat="server" Text="Clear Tee Group 7" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  

                       
        
                
				<div class="dashedline">
				</div>


                        <asp:RadioButton ID="RadioSelected8" runat="server" Text="Tee Group 8" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected8" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear8" runat="server" Text="Clear Tee Group 8" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  

                    
                
				<div class="dashedline">
				</div>


                        <asp:RadioButton ID="RadioSelected9" runat="server" Text="Tee Group 9" GroupName="TeeGroups" />  
                                                             
                        <asp:GridView ID="gvSelected9" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear9" runat="server" Text="Clear Tee Group 9" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  

                           
                
				<div class="dashedline">
				</div>
                     
                 

                        <asp:RadioButton ID="RadioSelected10" runat="server" Text="Tee Group 10" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected10" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear10" runat="server" Text="Clear Tee Group 10" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  
                                                              
                           
                
				<div class="dashedline">
				</div>
                                                            
                        <asp:RadioButton ID="RadioSelected11" runat="server" Text="Tee Group 11" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected11" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear11" runat="server" Text="Clear Tee Group 11" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  

                         
                             
                
				<div class="dashedline">
				</div>

                        <asp:RadioButton ID="RadioSelected12" runat="server" Text="Tee Group 12" GroupName="TeeGroups" />  


                        <asp:GridView ID="gvSelected12" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="firstname">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="lastname">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="Tournamenthandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="Ghinhandicap">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinhandicapLabel" runat="server" Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
                                        <asp:TextBox ID="Ghinhandicap" runat="server" Text='<%# Eval("Ghinhandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 


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
                
                                                                                                                        
                        <asp:RadioButton ID="Clear12" runat="server" Text="Clear Tee Group 12" GroupName="ClearTeeGroups"  AutoPostBack = "true"  OnCheckedChanged = "Clear_CheckChanged"  />  
                    
                
				<div class="dashedline">
				</div>
                 
                     <asp:Button ID="btnSavePairing" Text='Save Pairing' runat="server"></asp:Button> &nbsp;&nbsp; <asp:Button ID="SaveandCreateScorecards" Text='Save and Create Scorecards' runat="server"></asp:Button> &nbsp;&nbsp; <asp:Button ID="EmailPairing" Text='Send Email for Pairing' runat="server"></asp:Button>  
                <br />
                <asp:Label ID="StatusInfo" Text="" runat="server"></asp:Label> 
     
                      
			</div>
		   </div>
                 
            </ContentTemplate>
        </asp:UpdatePanel>             
                      
        </div>

       
        <div id="TabDiv2"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                                                          

				<h2>Current Game ScoreCards - Grouped by Tee Order <asp:Label ID="Coursename2" runat="server"></asp:Label> </h2>
                
                <tc:TabsControl ID="Tabs2" runat="server" />
                <div id="TeeGroup0"  style="font-family: Verdana; font-size: x-small; font-weight: normal"> 
                       Tee Group 1<br />
                    
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew1" runat="server" myIntValue="1"  />

                </div>
                <div id="TeeGroup1"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 2<br />
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew2" runat="server" myIntValue="2"  />
                     
                </div>
                <div id="TeeGroup2"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
                                             
                          Tee Group 3<br />
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew3" runat="server" myIntValue="3"  />
                      
                     
                </div>
                <div id="TeeGroup3"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
                  
                     Tee Group 4<br />
                      
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew4" runat="server" myIntValue="4"  />
              
                </div>
                <div id="TeeGroup4"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 5<br />
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew5" runat="server" myIntValue="5"  />
                     
                    
                </div>
                <div id="TeeGroup5"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 6<br />
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew6" runat="server" myIntValue="6"  />
                                              
                  
                </div>
                <div id="TeeGroup6"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 7<br />
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew7" runat="server" myIntValue="7"  />
                      
                </div>
                <div id="TeeGroup7"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 8<br />
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew8" runat="server" myIntValue="8"  />
                      
                 
                </div>
                <div id="TeeGroup8"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                    
                     Tee Group 9<br />
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew9" runat="server" myIntValue="9"  />
                                                                                                 
            
                </div>
                <div id="TeeGroup9"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 10<br />
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew10" runat="server" myIntValue="10"  />
                                 
                </div>
                <div id="TeeGroup10"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 11<br />
                   
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew11" runat="server" myIntValue="11"  />
                                        
                </div>
                <div id="TeeGroup11"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 12<br />
                   
                      
                     <Club:ScorecardControlctlNew ID="ScorecardControlctlNew12" runat="server" myIntValue="12"  />

                     
                </div> 
            
            
            
            
             
        </div>

        <div id="TabDiv3"   style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">   
                				                                                          
            
                    <h2>Current Open Game LeaderBoard<asp:Label ID="coursename3" runat="server"></asp:Label></h2>
                   
                                                                         
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
             

                                <table cellpadding="0" cellspacing="0"   border="1" style="width: 700px">  
 
                                        <tr> 
                                              <td valign="top">
 
                
                                                <asp:GridView ID="LeaderboardGrid" runat="server" 
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
                                        
                                        
                                                              <asp:BoundField DataField="PlayDate" HeaderText="Game Date" 
                                                                SortExpression="PlayDate" /> 
                                        
                                                                                   
                                                              <asp:BoundField DataField="tournamenthandicap" HeaderText="Tournament Handicap" 
                                                                SortExpression="tournamenthandicap" />   
                                                                                
                                                              <asp:BoundField DataField="ghinhandicap" HeaderText="Ghin Handicap" 
                                                                SortExpression="ghinhandicap" /> 
                                                                               
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
                                                      
                                              </td> &nbsp;&nbsp; 
                                             <td valign="middle"> &nbsp;&nbsp;<asp:Button ID="btnRefreshLeaderBoard" runat="server"   Text="REFRESH" /> &nbsp;&nbsp; <br />
                             
                                             &nbsp;&nbsp; <asp:Label ID="lblRefreshLeader" runat="server"   Text="" /> &nbsp;&nbsp; 

                                              </td>
                    
                                           
                                        </tr>


                               </table>
           

                            </ContentTemplate>
                        </asp:UpdatePanel>             
              
                                  
                  
        </div>  
         
   </div>       
</asp:Content>

