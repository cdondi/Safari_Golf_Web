<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Course_Edit.aspx.vb" Inherits="Events_Calendar"   Culture="auto" UICulture="auto"   %>
  
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
                     
                                         
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>                       
                       
		   <div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
		   			                 		 
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClubSiteDB %>"
					SelectCommand="[PagedGolfList]" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
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

                
			<h2>Courses - Click to Edit</h2>
				<div class="dashedline">
				</div>
				<!-- begin news item -->

         		<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
					<ItemTemplate>
						<div>  
							<h3>
								<a href='<%# "Course_Edit.aspx?LocationID=" + Convert.ToString(Eval("LocationID"))%>'/>
									<asp:Label ID="titleLabel"  style="font-size: small" runat="server" Text='<%# Eval("title") %>' />
								</a><br /><br />
							</h3> 
						</div>
					</ItemTemplate>
				</asp:Repeater> 
                 
			</div> 
		   </div>
            
		  
        	<div id="columnright">
           <div class="rightblock">
                                
			<h2><asp:Label ID="coursename0" runat="server"></asp:Label> </h2>
               
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
          
    <asp:GridView ID="grdViewLocations" runat="server" AutoGenerateColumns="False" TabIndex="1"
            Width="400px"  
            CellPadding="4" ForeColor="#333333"
            OnRowDataBound="grdViewLocations_RowDataBound" 
           AllowPaging ="false"    gridlines="Both" BorderStyle="Solid" BorderWidth="1px"
         onrowediting="grdViewLocationsEditLocation"
        onrowupdating="grdViewLocationsUpdate"  onrowcancelingedit="grdViewLocationsCancelEdit"
         >

            <AlternatingRowStyle BackColor="White" />

    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
     
            <Columns>

        
        <asp:TemplateField ItemStyle-Width = "9px"   Visible="false" HeaderText = "LocationsID">
            <ItemTemplate>
                <asp:Label ID="lblLocationsID" runat="server" 
                Text='<%# Eval("LocationId")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtLocationsID" Width = "20px" 
                     runat="server" Text='<%# Eval("LocationId")%>'></asp:TextBox>
            </FooterTemplate> 
            <ItemStyle Width="9px" />
        </asp:TemplateField> 
           
        
                <asp:TemplateField HeaderText="Hole">
                    <EditItemTemplate>
                        <asp:Label ID="txtHole" runat="server" Text='<%#Eval("ordinal")%>' Width = "20px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:Label ID="txtHole1" runat="server" Text='<%#Eval("ordinal")%>' Width = "20px" ></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblHole" runat="server"  Text='<%#Eval("ordinal")%>' Width = "20px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>

                
        
                <asp:TemplateField HeaderText="Yardage">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtYardage" runat="server" Text='<%#Eval("Yardage")%>' Width = "20px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtYardage1" runat="server" Text='<%#Eval("Yardage")%>' Width = "20px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblYardage" runat="server"  Text='<%#Eval("Yardage")%>' Width = "20px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
                
                
                <asp:TemplateField HeaderText="Par">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPar" runat="server" Text='<%#Eval("Par")%>' Width = "20px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtPar1" runat="server" Text='<%#Eval("Par")%>' Width = "20px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPar" runat="server"  Text='<%#Eval("Par")%>' Width = "20px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>

         
        
                <asp:TemplateField HeaderText="Handicap">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtHandicap" runat="server" Text='<%#Eval("Handicap")%>' Width = "20px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtHandicap1" runat="server" Text='<%#Eval("Handicap")%>' Width = "20px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblHandicap" runat="server"  Text='<%#Eval("Handicap")%>' Width = "20px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>

               
        <asp:CommandField  ShowEditButton="True" /> 

    </Columns>
     
        <EditRowStyle BackColor="#999999" />
     
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle CssClass="HeaderStyle" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
     
        <sortedascendingcellstyle backcolor="#E9E7E2" />
        <sortedascendingheaderstyle backcolor="#506C8C" />
        <sorteddescendingcellstyle backcolor="#FFFDF8" />
        <sorteddescendingheaderstyle backcolor="#6F8DAE" />
     
</asp:GridView>
   
				<div class="dashedline">
				</div>
<br /><br />
    <h2>Male Course Rating</h2>

        <asp:GridView ID="gridMaleRating" runat="server" AutoGenerateColumns="False" TabIndex="1"
    Width="400px"  
    CellPadding="4" ForeColor="#333333"
    OnRowDataBound="gridMaleRating_RowDataBound" 
   AllowPaging ="false"  gridlines="Both" BorderStyle="Solid" BorderWidth="1px"
 onrowediting="gridMaleRatingEdit"
onrowupdating="gridMaleRatingUpdate"  onrowcancelingedit="gridMaleRatingCancelEdit"
 >
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>

        
        
        <asp:TemplateField ItemStyle-Width = "9px"   Visible="false" HeaderText = "LocationsID">
            <ItemTemplate>
                <asp:Label ID="lblLocationsID" runat="server" 
                Text='<%# Eval("LocationId")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtLocationsID" Width = "20px" 
                     runat="server" Text='<%# Eval("LocationId")%>'></asp:TextBox>
            </FooterTemplate> 
            <ItemStyle Width="9px" />
        </asp:TemplateField> 
           
         
                <asp:TemplateField HeaderText="Front Rating">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFrontRating" runat="server" Text='<%#Eval("FrontRating")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtFrontRating1" runat="server" Text='<%#Eval("FrontRating")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFrontRating" runat="server"  Text='<%#Eval("FrontRating")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>

                    
         
                <asp:TemplateField HeaderText="Front Slope">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFrontSlope" runat="server" Text='<%#Eval("FrontSlope")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtFrontSlope1" runat="server" Text='<%#Eval("FrontSlope")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFrontSlope" runat="server"  Text='<%#Eval("FrontSlope")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
        
                <asp:TemplateField HeaderText="middle Rating">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtmiddleRating" runat="server" Text='<%#Eval("middleRating")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtmiddleRating1" runat="server" Text='<%#Eval("middleRating")%>' Width = "20px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblmiddleRating" runat="server"  Text='<%#Eval("middleRating")%>' Width = "20px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
        
         
                <asp:TemplateField HeaderText="middle Slope">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtmiddleSlope" runat="server" Text='<%#Eval("middleSlope")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtmiddleSlope1" runat="server" Text='<%#Eval("middleSlope")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblmiddleSlope" runat="server"  Text='<%#Eval("middleSlope")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
         
                <asp:TemplateField HeaderText="Back Rating">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBackRating" runat="server" Text='<%#Eval("BackRating")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtBackRating1" runat="server" Text='<%#Eval("BackRating")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBackRating" runat="server"  Text='<%#Eval("BackRating")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Back Slope">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBackSlope" runat="server" Text='<%#Eval("BackSlope")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtBackSlope1" runat="server" Text='<%#Eval("BackSlope")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBackSlope" runat="server"  Text='<%#Eval("BackSlope")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>

        <asp:CommandField  ShowEditButton="True" /> 

    </Columns>
     
            <EditRowStyle BackColor="#999999" />
     
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle CssClass="HeaderStyle" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
     
            <sortedascendingcellstyle backcolor="#E9E7E2" />
            <sortedascendingheaderstyle backcolor="#506C8C" />
            <sorteddescendingcellstyle backcolor="#FFFDF8" />
            <sorteddescendingheaderstyle backcolor="#6F8DAE" />
     
</asp:GridView>
   
   
				<div class="dashedline">
				</div>
<br /><br />
     <h2>Female Course Rating</h2>

     
   <asp:GridView ID="gridFemaleRating" runat="server" AutoGenerateColumns="False" TabIndex="1"
    Width="400px"  
    CellPadding="4" ForeColor="#333333"
    OnRowDataBound="gridFemaleRating_RowDataBound" 
    AllowPaging ="false"  gridlines="Both" BorderStyle="Solid" BorderWidth="1px"
 onrowediting="gridFemaleRatingEdit"
onrowupdating="gridFemaleRatingUpdate"  onrowcancelingedit="gridFemaleRatingCancelEdit"
 >
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>

        
        
        <asp:TemplateField ItemStyle-Width = "9px"   Visible="false" HeaderText = "LocationsID">
            <ItemTemplate>
                <asp:Label ID="lblLocationsID" runat="server" 
                Text='<%# Eval("LocationId")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtLocationsID" Width = "20px" 
                     runat="server" Text='<%# Eval("LocationId")%>'></asp:TextBox>
            </FooterTemplate> 
            <ItemStyle Width="9px" />
        </asp:TemplateField> 
           
         
                <asp:TemplateField HeaderText="Front Rating">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFrontRating" runat="server" Text='<%#Eval("FrontRating")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtFrontRating1" runat="server" Text='<%#Eval("FrontRating")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFrontRating" runat="server"  Text='<%#Eval("FrontRating")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>

                    
         
                <asp:TemplateField HeaderText="Front Slope">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFrontSlope" runat="server" Text='<%#Eval("FrontSlope")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtFrontSlope1" runat="server" Text='<%#Eval("FrontSlope")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFrontSlope" runat="server"  Text='<%#Eval("FrontSlope")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
        
                <asp:TemplateField HeaderText="middle Rating">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtmiddleRating" runat="server" Text='<%#Eval("middleRating")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtmiddleRating1" runat="server" Text='<%#Eval("middleRating")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblmiddleRating" runat="server"  Text='<%#Eval("middleRating")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
        
         
                <asp:TemplateField HeaderText="middle Slope">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtmiddleSlope" runat="server" Text='<%#Eval("middleSlope")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtmiddleSlope1" runat="server" Text='<%#Eval("middleSlope")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblmiddleSlope" runat="server"  Text='<%#Eval("middleSlope")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
         
                <asp:TemplateField HeaderText="Back Rating">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBackRating" runat="server" Text='<%#Eval("BackRating")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtBackRating1" runat="server" Text='<%#Eval("BackRating")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBackRating" runat="server"  Text='<%#Eval("BackRating")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Back Slope">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBackSlope" runat="server" Text='<%#Eval("BackSlope")%>' Width = "40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtBackSlope1" runat="server" Text='<%#Eval("BackSlope")%>' Width = "40px" ></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBackSlope" runat="server"  Text='<%#Eval("BackSlope")%>' Width = "40px" ></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>


        <asp:CommandField  ShowEditButton="True" /> 

    </Columns>
     
       <EditRowStyle BackColor="#999999" />
     
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle CssClass="HeaderStyle" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
     
       <sortedascendingcellstyle backcolor="#E9E7E2" />
       <sortedascendingheaderstyle backcolor="#506C8C" />
       <sorteddescendingcellstyle backcolor="#FFFDF8" />
       <sorteddescendingheaderstyle backcolor="#6F8DAE" />
     
</asp:GridView>
            
            </ContentTemplate>
        </asp:UpdatePanel>      
      
			</div>
                
	       </div>
		<div class="clear2column">
		</div> 
            </ContentTemplate>
        </asp:UpdatePanel>      
         

   </div> 
</asp:Content>

