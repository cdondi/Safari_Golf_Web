<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Scorecard_Pairing.aspx.vb" Inherits="Events_Calendar"   Culture="auto" UICulture="auto"   %>
  
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

                                                 
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>                       
                       
		  <div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
		   
			                 		 
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="[PagedUpcommingGolfList]" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
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
                
               <h2>Select Course</h2>
				<div class="dashedline">
				</div>
				<!-- begin news item -->

         		<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
					<ItemTemplate>
						<div>  
							<h3>
								<a href='<%# "Scorecard_Pairing.aspx?LocationID=" + Convert.ToString(Eval("LocationID")) + "&DateID=" + Convert.ToString(Eval("starttime"))%>'/>
									<asp:Label ID="titleLabel"  style="font-size: small" runat="server" Text='<%# Eval("title") %>' />
								</a><br /><br />
							</h3> 
						</div>
					</ItemTemplate>
				</asp:Repeater> 
                
               <h2>Select Players to Pair</h2>
				<div class="dashedline">
				</div>
				 
            

                               <asp:GridView ID="gvAll" runat="server" OnRowDataBound="gvAll_RowDataBound" 
                            AutoGenerateColumns = "False"   AllowPaging ="false"    showfooter="true"  BorderStyle="Solid" BorderWidth="1px"
                              EmptyDataText = "No Records" EnableModelValidation="True"  GridLines="both"   width="300px"> 
                              
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
                            <asp:BoundField DataField = "RSVP" HeaderText = "RSVP"     HtmlEncode = "false" />
                            <asp:BoundField DataField = "Guests" HeaderText = "Guests"     HtmlEncode = "false" />                                
                            <asp:BoundField DataField = "memberid" HeaderText = "memberid"   HtmlEncode = "false" /> 

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
		  
                    
            </ContentTemplate>
        </asp:UpdatePanel> 

        	<div id="columnright">
           <div class="rightblock">
                                
			<h2><asp:Label ID="coursename0" runat="server"></asp:Label> </h2>
               
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate> 
       
                    
                 <br />
                <table><tr><td>
                Select Male Tee Boxes:
                </td><td>     
                <asp:RadioButton ID="rdoMaleTeeFront"   runat="server" Text="Front" GroupName="MaleTeeBoxGroups" /> 
                </td><td>      
                <asp:RadioButton ID="rdoMaleTeeMiddle"   runat="server" Text="Middle" GroupName="MaleTeeBoxGroups" /> 
                </td><td>     
                <asp:RadioButton ID="rdoMaleTeeBack"   runat="server" Text="Back" GroupName="MaleTeeBoxGroups" /> 
               
                </td>
<td rowspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnScoreCardUpdate" runat="server"   Text="Score Card Update"  height="20px" />
    
                
  
				</td>


                       </tr>   
                
                 <tr><td>
                Select Female Tee Boxes: 
                </td><td>     
                <asp:RadioButton ID="rdoFeMaleTeeFront"   runat="server" Text="Front" GroupName="FeMaleTeeBoxGroups" /> 
                </td><td>      
                <asp:RadioButton ID="rdoFeMaleTeeMiddle"   runat="server" Text="Middle" GroupName="FeMaleTeeBoxGroups" /> 
                </td><td>     
                <asp:RadioButton ID="rdoFeMaleTeeBack"   runat="server" Text="Back" GroupName="FeMaleTeeBoxGroups" /> 
                     
				</td></tr>
  
                </table>
                <asp:Label ID="StatusInfo2" Text="" runat="server"></asp:Label> 
                <br />
                     <div class="dashedline">
				</div>                      
                 
                
				<b>Tee Order for Course</b>
				 

                     <table><tr><td>
                        <asp:Button ID="MoveTee1" runat="server"   Text=">> ADD TO Tee 1 >>" /><br />
                         
                        <asp:Button ID="RemoveTee1" runat="server"   Text="<< Remove Tee 1 <<" /><br />

                       
                       </td>
                        <td rowspan="2">

                        <asp:GridView ID="gvSelected1" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee2" runat="server"   Text=">> ADD TO Tee 2 >>" /><br />
                         
                        <asp:Button ID="RemoveTee2" runat="server"   Text="<< Remove Tee 2 <<" /><br />

                       
                       </td>
                        <td rowspan="2">

                        <asp:GridView ID="gvSelected2" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                  
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee3" runat="server"   Text=">> ADD TO Tee 3 >>" /><br />
                         
                        <asp:Button ID="RemoveTee3" runat="server"   Text="<< Remove Tee 3 <<" /><br />

                       
                       </td>
                        <td rowspan="2">

                        <asp:GridView ID="gvSelected3" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                  
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee4" runat="server"   Text=">> ADD TO Tee 4 >>" /><br />
                         
                        <asp:Button ID="RemoveTee4" runat="server"   Text="<< Remove Tee 4 <<" /><br />

                       
                       </td>
                        <td rowspan="2">

                        <asp:GridView ID="gvSelected4" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                   
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee5" runat="server"   Text=">> ADD TO Tee 5 >>" /><br />
                         
                        <asp:Button ID="RemoveTee5" runat="server"   Text="<< Remove Tee 5 <<" /><br />

                       
                       </td>
                        <td rowspan="2">

                        <asp:GridView ID="gvSelected5" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                    
                                               
				         </td></tr></table>

                <div class="dashedline">
				</div>

                                          

                     <table><tr><td>
                        <asp:Button ID="MoveTee6" runat="server"   Text=">> ADD TO Tee 6 >>" /><br />
                         
                        <asp:Button ID="RemoveTee6" runat="server"   Text="<< Remove Tee 6 <<" /><br />

                       
                       </td>
                        <td rowspan="2"> 


                        <asp:GridView ID="gvSelected6" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                    
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee7" runat="server"   Text=">> ADD TO Tee 7 >>" /><br />
                         
                        <asp:Button ID="RemoveTee7" runat="server"   Text="<< Remove Tee 7 <<" /><br />

                       
                       </td>
                        <td rowspan="2">


                        <asp:GridView ID="gvSelected7" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                    
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee8" runat="server"   Text=">> ADD TO Tee 8 >>" /><br />
                         
                        <asp:Button ID="RemoveTee8" runat="server"   Text="<< Remove Tee 8 <<" /><br />

                       
                       </td>
                        <td rowspan="2">


                        <asp:GridView ID="gvSelected8" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                    
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee9" runat="server"   Text=">> ADD TO Tee 9 >>" /><br />
                         
                        <asp:Button ID="RemoveTee9" runat="server"   Text="<< Remove Tee 9 <<" /><br />

                       
                       </td>
                        <td rowspan="2"> 
                                                             
                        <asp:GridView ID="gvSelected9" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                    
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee10" runat="server"   Text=">> ADD TO Tee 10 >>" /><br />
                         
                        <asp:Button ID="RemoveTee10" runat="server"   Text="<< Remove Tee 10 <<" /><br />

                       
                       </td>
                        <td rowspan="2">


                        <asp:GridView ID="gvSelected10" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                   
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee11" runat="server"   Text=">> ADD TO Tee 11 >>" /><br />
                         
                        <asp:Button ID="RemoveTee11" runat="server"   Text="<< Remove Tee 11 <<" /><br />

                       
                       </td>
                        <td rowspan="2">


                        <asp:GridView ID="gvSelected11" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                                                                                                   
                                               
				         </td></tr></table>
                                      
				<div class="dashedline">
				</div>

                       

                     <table><tr><td>
                        <asp:Button ID="MoveTee12" runat="server"   Text=">> ADD TO Tee 12 >>" /><br />
                         
                        <asp:Button ID="RemoveTee12" runat="server"   Text="<< Remove Tee 12 <<" /><br />

                       
                       </td>
                        <td rowspan="2"> 


                        <asp:GridView ID="gvSelected12" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="Both" ShowFooter="True" width="300px">
       
                            <Columns>   
              
                                <asp:TemplateField HeaderText="Ghin ID">
                                    <ItemTemplate>
                                        <asp:Label ID="GhinIDLabel" runat="server" Text='<%# Eval("GhinID") %>'></asp:Label>
                                        <asp:TextBox ID="GhinIDgrid" runat="server" Text='<%# Eval("GhinID") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:TextBox ID="firstname" runat="server" Text='<%# Eval("firstname") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname")%>'></asp:Label>
                                        <asp:TextBox ID="lastname" runat="server" Text='<%# Eval("lastname")%>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>  

                                <asp:TemplateField HeaderText="T. HCP">
                                    <ItemTemplate>
                                        <asp:Label ID="TournamenthandicapLabel" runat="server" Text='<%# Eval("Tournamenthandicap") %>'></asp:Label>
                                        <asp:TextBox ID="Tournamenthandicap" runat="server" Text='<%# Eval("Tournamenthandicap") %>' width="175px" visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField> 
 

                                <asp:TemplateField HeaderText="G. HCP">
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
                
                                                                                                                        
                                               
				         </td></tr></table>
                
				<div class="dashedline">
				</div>
                 <asp:Button ID="SaveandCreateScorecards" Text='Create Scorecards' runat="server"></asp:Button> &nbsp;&nbsp; <asp:Button ID="EmailPairing" Text='Send Email for Pairing' runat="server"></asp:Button>  
                <br />
                <asp:Label ID="StatusInfo" Text="" runat="server"></asp:Label> 
     
            </ContentTemplate>
        </asp:UpdatePanel> 
               </div> 
       </div> 

        <div class="clear2column">
		</div>

   </div> 
</asp:Content>

