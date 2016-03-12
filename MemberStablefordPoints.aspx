<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="MemberStablefordPoints.aspx.vb" Inherits="Events_Calendar" %>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>   


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server"> 
  
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
			<h2>StableFord Points</h2> 
		</div>
       	
        <div class="fullwidth">
		            
		   <table>
			<tr valign="top" >
			<td>
		          
		
                    <asp:GridView ID="MemberInfoUpdates"  runat="server" horizontalalign="Right"
                                              Width="600px"  
                                    CellPadding="4" 
                                    BackColor="White" BorderColor="#DEDFDE" ForeColor="#333333"   GridLines="Both" ShowFooter="True"
                                   
                                PageSize = "50" AutoGenerateColumns="true"  >

                            <AlternatingRowStyle BackColor="White" />
     
                                   
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
                 
    </div>
</asp:Content>

