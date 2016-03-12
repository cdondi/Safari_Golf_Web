<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Scorecard_List.aspx.vb" Inherits="Events_Calendar"   Culture="auto" UICulture="auto"   %>
<%@ Register Src="controls\TabsControl.ascx" TagName="TabsControl" TagPrefix="tc" %>
  
<%@ Register src="Scorecard_List.ascx" tagname="ScorecardControlctl" tagprefix="uc1" %> 

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
    .rightblock {
        text-align: center;
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
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
                    $("#TeeGroupOther").hide();
                    break;
                case 12:
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
                    $("#TeeGroup11").hide();
                    $("#TeeGroupOther").show();
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
<%-- 
 <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=TextBox1.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m,  %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
    </script>--%>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<!--
        
        Left column
        
        -->

        

        
        <tc:TabsControl ID="Tabs1" runat="server" />
      
        <div id="TabDiv0"  style="font-family: Verdana; font-size: x-small; font-weight: normal">
                           

				<h2>Current Game ScoreCards - Grouped by Tee Order <asp:Label ID="Coursename2" runat="server"></asp:Label> </h2>
                
                <tc:TabsControl ID="Tabs2" runat="server" />
                      
                <div id="TeeGroup0"  style="font-family: Verdana; font-size: x-small; font-weight: normal"> 
                       Tee Group 1<br />
                    
                     
                    <asp:UpdatePanel ID="up1" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl1" runat="server" myIntValue="1"  />
                  
                        </ContentTemplate>        
                    </asp:UpdatePanel>

                </div>
   
            
                <div id="TeeGroup1"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 2<br />
                   
                    
                     
                    <asp:UpdatePanel ID="up2" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl2" runat="server" myIntValue="2"  />
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>
                     
                </div>
          
                <div id="TeeGroup2"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
                                             
                          Tee Group 3<br />
                   
                    
                     
                    <asp:UpdatePanel ID="up3" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl3" runat="server" myIntValue="3"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>
                      
                     
                </div>
                <div id="TeeGroup3"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
                  
                     Tee Group 4<br />
                      
                   
                     
                     
                    <asp:UpdatePanel ID="up4" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl4" runat="server" myIntValue="4"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>
              
                </div>
                 
        
               <div id="TeeGroup4"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 5<br />
                   
                    
                     
                     
                    <asp:UpdatePanel ID="up5" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl5" runat="server" myIntValue="5"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>
                    
                </div>
           <div id="TeeGroup5"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 6<br />
                   
                    
                     
                     
                    <asp:UpdatePanel ID="up6" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl6" runat="server" myIntValue="6"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>                         
                  
                </div>
                <div id="TeeGroup6"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 7<br />
                   
                     
                     
                    <asp:UpdatePanel ID="up7" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl7" runat="server" myIntValue="7"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>
                </div>
                <div id="TeeGroup7"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 8<br />
                   
                     
                     
                    <asp:UpdatePanel ID="up8" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl8" runat="server" myIntValue="8"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>
                 
                </div>
                <div id="TeeGroup8"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                    
                     Tee Group 9<br />
                   
                     
                     
                     
                    <asp:UpdatePanel ID="up9" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl12" runat="server" myIntValue="9"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>
                                                                                                 
            
                </div>
                <div id="TeeGroup9"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 10<br />
                   
                     
                     
                    <asp:UpdatePanel ID="up10" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl9" runat="server" myIntValue="10"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>       
                </div>
                <div id="TeeGroup10"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 11<br />
                   
                     
                     
                    <asp:UpdatePanel ID="up11" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl10" runat="server" myIntValue="11"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>                  
                </div>
                <div id="TeeGroup11"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Tee Group 12<br />
                   
                     
                     
                    <asp:UpdatePanel ID="up12" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl11" runat="server" myIntValue="12"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>
                     
                </div> 
         
                <div id="TeeGroupOther"  style="font-family: Verdana; font-size: x-small; font-weight: normal; display: none">
            
                     Non Grouped members<br />
                   
                     
                     
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl13" runat="server" myIntValue="0"  />
                 
            
                        </ContentTemplate>        
                    </asp:UpdatePanel>
                     
                </div>
             
        </div>
       
         

   </div>  
</asp:Content>

