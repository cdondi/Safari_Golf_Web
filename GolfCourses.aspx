<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="GolfCourses.aspx.vb" Inherits="Events_Calendar" %>
  
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>    
         
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server"> 
     
  
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
								<a href='<%# "GolfCourses.aspx?locationid=" + Convert.ToString(Eval("ID"))%>'>
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

    <asp:GridView ID="grdViewLocations" runat="server" AutoGenerateColumns="False" TabIndex="1"
    Width="400px"  
    CellPadding="4" ForeColor="Black"
    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
    OnRowDataBound="grdViewLocations_RowDataBound" 
   AllowPaging ="true"  ShowFooter = "false"  
 onrowediting="grdViewLocationsEditLocation"
onrowupdating="grdViewLocationsUpdate"  onrowcancelingedit="grdViewLocationsCancelEdit"
PageSize = "20" >
    <RowStyle BackColor="#F7F7DE" />
    <Columns>

        
        <asp:TemplateField ItemStyle-Width = "9px"   Visible="false" HeaderText = "LocationsID">
            <ItemTemplate>
                <asp:Label ID="lblLocationsID" runat="server" 
                Text='<%# Eval("LocationId")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtLocationsID" Width = "40px" 
                     runat="server" Text='<%# Eval("LocationId")%>'></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 
              
         
        <asp:TemplateField HeaderText="Hole" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlhole" runat="server" SelectedValue='<%# Eval("ordinal")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblhole" runat="server" Text='<%# Eval("ordinal")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblHoleNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
           
         
        <asp:TemplateField HeaderText="Yards" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlYards" runat="server" SelectedValue='<%# Eval("Yardage")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblYards" runat="server" Text='<%# Eval("Yardage")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblYardsNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
           
         
        <asp:TemplateField HeaderText="Par" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlPar" runat="server" SelectedValue='<%# Eval("Par")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblPar" runat="server" Text='<%# Eval("Par")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblParNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
         
        <asp:TemplateField HeaderText="HCP" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlHCP" runat="server" SelectedValue='<%# Eval("Handicap")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblHCP" runat="server" Text='<%# Eval("Handicap")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblHCPNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
               
        <asp:CommandField  ShowEditButton="True" /> 

    </Columns>
     
    <FooterStyle BackColor="#CCCC99" />
    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    <HeaderStyle CssClass="HeaderStyle" />
    <AlternatingRowStyle BackColor="White" />
     
</asp:GridView>
                 	
               <br />

          
      
			</div>
                
	       </div>
		<div class="clear2column">
		</div>

                          
            </ContentTemplate>
        </asp:UpdatePanel>        

         

   </div>       
</asp:Content>

