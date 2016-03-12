<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Scorecard_Edit.aspx.vb" Inherits="Events_Calendar"   Culture="auto" UICulture="auto"   %>
   
<%@ Register src="ScorecardControlNew.ascx" tagname="ScorecardControlctl" tagprefix="uc1" %> 


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
 
		<h2>My Scorecard for: <asp:Label ID="Coursename2" runat="server"></asp:Label> </h2>
                
                        
                <div id="TeeGroup0"  style="font-family: Verdana; font-size: x-small; font-weight: normal"> 
                       My Tee Group<br />
                    
                     
                    <asp:UpdatePanel ID="up1" runat="server">
                        <ContentTemplate>
            
                           <uc1:ScorecardControlctl ID="ScorecardControlctl1" runat="server" myIntValue="1"  />
                  
                        </ContentTemplate>        
                    </asp:UpdatePanel>

                </div>
                 
                                  
                  
        </div>  
         

</asp:Content>

