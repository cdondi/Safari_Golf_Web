<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="MemberUpdates.aspx.vb" Inherits="Events_Calendar" %>

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
			<h2>Player Information Update</h2> 
		</div>
       	
              <div class="fullwidth">
		
                    <asp:GridView ID="MemberInfoUpdates"  runat="server" 
                                              Width="600px"  
                                    CellPadding="4" ForeColor="Black"
                                    BackColor="White" BorderColor="#DEDFDE"  BorderStyle="Solid" BorderWidth="2px"
                                    OnRowDataBound="MemberInfoUpdates_RowDataBound" 
                                   AllowPaging ="false"  
                                 onrowediting="MemberInfoUpdatesEdit"
                                onrowupdating="MemberInfoUpdatesUpdate"  onrowcancelingedit="MemberInfoUpdatesCancelEdit"
                                  AutoGenerateColumns="False"  >

                            <AlternatingRowStyle BackColor="White" />
     
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                                                                
                                            <asp:TemplateField HeaderText="memberid" visible="false" >
                                                <EditItemTemplate>
                                                    <asp:Label ID="txtmemberid" runat="server" Text='<%#Eval("memberid")%>' Width = "1px" ></asp:Label>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                <asp:Label ID="txtmemberid1" runat="server" Text='<%#Eval("memberid")%>' Width = "1px" ></asp:Label>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmemberid" runat="server"  Text='<%#Eval("memberid")%>' Width = "1px" ></asp:Label>
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                
                                        
                                            <asp:TemplateField HeaderText="Ghin id">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtGhin" runat="server" Text='<%#Eval("Ghinid")%>' Width = "60px" ></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                <asp:TextBox ID="txtGhin1" runat="server" Text='<%#Eval("Ghinid")%>' Width = "60px" ></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGhin" runat="server"  Text='<%#Eval("Ghinid")%>' Width = "60px" ></asp:Label>
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                
                                            <asp:TemplateField HeaderText="First Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%#Eval("FirstName")%>' Width = "60px" ></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                <asp:TextBox ID="txtFirstName1" runat="server" Text='<%#Eval("FirstName")%>' Width = "60px" ></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFirstName" runat="server"  Text='<%#Eval("FirstName")%>' Width = "60px" ></asp:Label>
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                
                                        
                                            <asp:TemplateField HeaderText="Last Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtLastName" runat="server" Text='<%#Eval("LastName")%>' Width = "60px" ></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                <asp:TextBox ID="txtLastName1" runat="server" Text='<%#Eval("LastName")%>' Width = "60px" ></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLastName" runat="server"  Text='<%#Eval("LastName")%>' Width = "60px" ></asp:Label>
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                
                                        
                                            <asp:TemplateField HeaderText="Phone">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtPhone" runat="server" Text='<%#Eval("Phone")%>' Width = "60px" ></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                <asp:TextBox ID="txtPhone1" runat="server" Text='<%#Eval("Phone")%>' Width = "60px" ></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPhone" runat="server"  Text='<%#Eval("Phone")%>' Width = "60px" ></asp:Label>
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                
                                            <asp:TemplateField HeaderText="Address" visible="false"  >
                                                <EditItemTemplate>
                                                    <asp:Label ID="txtAddress" runat="server" Text='<%#Eval("Address")%>' Width = "1px" ></asp:Label>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                <asp:Label ID="txtAddress1" runat="server" Text='<%#Eval("Address")%>' Width = "1px" ></asp:Label>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAddress" runat="server"  Text='<%#Eval("Address")%>' Width = "1px" ></asp:Label>
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                                                        
                                            <asp:TemplateField HeaderText="Gender" HeaderStyle-HorizontalAlign="Left"> 
                                                <EditItemTemplate> 
                                                    <asp:DropDownList ID="txtGender" runat="server" SelectedValue='<%# Eval("Gender")%>' Width="60px">                      
                                                        <asp:ListItem Value="Male" Text="Male"></asp:ListItem> 
                                                        <asp:ListItem Value="Female" Text="Female"></asp:ListItem>  
                                                    </asp:DropDownList> 
                                                </EditItemTemplate> 
                                                <ItemTemplate> 
                                                    <asp:Label ID="txtGender1" runat="server" Text='<%# Eval("Gender")%>'></asp:Label> 
                                                </ItemTemplate> 
                                                <FooterTemplate> 
                                                    <asp:DropDownList ID="lblGender" runat="server"  Width="12">                        
                                                        <asp:ListItem Value="Male" Text="Male"></asp:ListItem> 
                                                        <asp:ListItem Value="Female" Text="Female"></asp:ListItem>  
                                                    </asp:DropDownList> 
                                                </FooterTemplate> 
                                            </asp:TemplateField> 
               

                                            <asp:TemplateField HeaderText="Tournament HCP">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtTournamentHCP" runat="server" Text='<%#Eval("Tournamenthandicap")%>' Width = "40px" ></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                <asp:TextBox ID="txtTournamentHCP1" runat="server" Text='<%#Eval("Tournamenthandicap")%>' Width = "40px" ></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTournamentHCP" runat="server"  Text='<%#Eval("Tournamenthandicap")%>' Width = "40px" ></asp:Label>
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                
                                            <asp:TemplateField HeaderText="Ghin HCP">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtGhinHCP" runat="server" Text='<%#Eval("Ghinhandicap")%>' Width = "40px" ></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                <asp:TextBox ID="txtGhinHCP1" runat="server" Text='<%#Eval("Ghinhandicap")%>' Width = "40px" ></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGhinHCP" runat="server"  Text='<%#Eval("Ghinhandicap")%>' Width = "40px" ></asp:Label>
                                                </ItemTemplate> 
                                            </asp:TemplateField>
                                                                                                   
                                                  
                                            <asp:CommandField  ShowEditButton="True" /> 

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
</asp:Content>

