<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Scorecard_LeaderBoardold.aspx.vb" Inherits="Events_Calendar"   Culture="auto" UICulture="auto"   %>
    

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

         			                                                          
            
                    <h2>LeaderBoard For: <asp:Label ID="coursename3" runat="server"></asp:Label></h2>
                   
                                                                         
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
          
</asp:Content>

