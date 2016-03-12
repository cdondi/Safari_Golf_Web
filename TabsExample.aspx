<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TabsExample.aspx.cs" Inherits="Default" %>
<%@ Register Src="controls\TabsControl.ascx" TagName="TabsControl" TagPrefix="tc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/TabsControl.css" rel="stylesheet" type="text/css" />
    <style>
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
    </style>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
        //This is the page specific on tab click function. You can manipulate page elements here.
        //For example, show some area and hide the others
        function OnTabClick(index) {
            switch (index) {
                case 0:
                    $("#microsoftDiv").show();
                    $("#facebookDiv").hide();
                    $("#appleDiv").hide();
                    break;
                case 1:
                    $("#microsoftDiv").hide();
                    $("#facebookDiv").show();
                    $("#appleDiv").hide();
                    break;
                case 2:
                    $("#microsoftDiv").hide();
                    $("#facebookDiv").hide();
                    $("#appleDiv").show();
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
</head>
<body>
    <form id="form1" runat="server">
        <tc:TabsControl ID="Tabs1" runat="server" />
        <div id="microsoftDiv" class="huge">
            Microsoft welcomes you!
        </div>
        <div id="facebookDiv" class="huge" style="display: none">
            Facebook welcomes you!
        </div>
        <div id="appleDiv" class="huge" style="display: none">
            Apple welcomes you!
        </div>
        <br /><br />
        <h3>The demo usage of tab control client side object</h3>
        (The client side tab object has same id as the one you assign to the user control, in this demo it is <span class="codeExample"><b>"Tabs1"</b></span>. You can use the methods of this object to manage the tabs control on client side easily.)<br />
        <p>
        1. Click tab by Index (exmaple code: <span class="codeExample">Tabs1.ClickTab(1);</span>)<br />
        <span class="leftIndent">Tab Index;</span>
        <select id="tabIndexList1">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
        </select>&nbsp&nbsp
        <input type="button" onclick="Tabs1.ClickTab($('#tabIndexList1').val())" value="Click by Tab Index"/><br />
        </p>
        <p>
        2. Click tab by tab text (exmaple code: <span class="codeExample">Tabs1.ClickTabByText("Apple");</span>)<br />
        <span class="leftIndent">Tab Text:</span>
        <select id="tabTextList1">
            <option value="Microsoft">Microsoft</option>
            <option value="Facebook">Facebook</option>
            <option value="Apple">Apple</option>
        </select>&nbsp&nbsp
        <input type="button" onclick="Tabs1.ClickTabByText($('#tabTextList1').val())" value="Click by Tab Text"/>
        </p>
        <p>
        3. Show or hide the whole tab control (exmaple code: <span class="codeExample">Tabs1.ShowTabArray();Tabs1.HideTabArray();</span>)<br />
        <span class="leftIndent"><input type="button" onclick="Tabs1.ShowTabArray()" value="Show Tabs"/></span>
        <span class="leftIndent"><input type="button" onclick="Tabs1.HideTabArray()" value="Hide Tabs"/></span>
        </p>
        <p>
        4. Show or hide a single tab by index (exmaple code: <span class="codeExample">Tabs1.ShowTabByIndex(1);Tabs1.HideTabByIndex(1);</span>)<br />
        <span class="leftIndent">Tab Index:<span class="leftIndent">
        <select id="tabIndexList2">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
        </select>&nbsp&nbsp
        <input type="button" onclick="Tabs1.ShowTabByIndex($('#tabIndexList2').val())" value="Show Single Tab"/>&nbsp&nbsp
        <input type="button" onclick="Tabs1.HideTabByIndex($('#tabIndexList2').val())" value="Hide Single Tab"/>
        </p>
        <p>
        5. Show or hide a single tab by Text (exmaple code: <span class="codeExample">Tabs1.ShowTabByText("Apple");Tabs1.ShowTabByText("Apple");</span>)<br />
        <span class="leftIndent">Tab Text:</span>
        <select id="tabTextList2">
            <option value="Microsoft">Microsoft</option>
            <option value="Facebook">Facebook</option>
            <option value="Apple">Apple</option>
        </select>&nbsp&nbsp
        <input type="button" onclick="Tabs1.ShowTabByText($('#tabTextList2').val())" value="Show Single Tab"/>&nbsp&nbsp
        <input type="button" onclick="Tabs1.HideTabByText($('#tabTextList2').val())" value="Hide Single Tab"/>
        </p>
    </form>
</body>
</html>
