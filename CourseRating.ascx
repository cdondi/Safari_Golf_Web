<%@ Control Language="VB" AutoEventWireup="false" CodeFile="CourseRating.ascx.vb" Inherits="CourseRating" %>

    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

     <style type="text/css">

    .HeaderStyle 
    {
    border:solid 1px White;
    background-color:#81BEF7;
    font-weight:bold;
    text-align:center;
    }
         .auto-style1 {
             color: #FF0000;
         }
         </style>

                                         
    <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

    <table><tr>
        <td valign="top">

    <h2>Male Course Rating</h2>

        <asp:GridView ID="gridMaleRating" runat="server" AutoGenerateColumns="False" TabIndex="1"
    Width="400px"  
    CellPadding="4" ForeColor="Black"
    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
    OnRowDataBound="gridMaleRating_RowDataBound" 
   AllowPaging ="true"  ShowFooter = "false"  
 onrowediting="gridMaleRatingEdit"
onrowupdating="gridMaleRatingUpdate"  onrowcancelingedit="gridMaleRatingCancelEdit"
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
        
        <asp:BoundField DataField = "title" HeaderText = "Location Name" HtmlEncode = "false" />     
         
        <asp:TemplateField HeaderText="Front Rating" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlFrontRating" runat="server" SelectedValue='<%# Eval("FrontRating")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblFrontRating" runat="server" Text='<%# Eval("FrontRating")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblFrontRatingNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
           
        
         
        <asp:TemplateField HeaderText="Front Slope" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlFrontSlope" runat="server" SelectedValue='<%# Eval("FrontSlope")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblFrontSlope" runat="server" Text='<%# Eval("FrontSlope")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblFrontSlopeNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
           

         
        <asp:TemplateField HeaderText="Middle Rating" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlMiddleRating" runat="server" SelectedValue='<%# Eval("MiddleRating")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblMiddleRating" runat="server" Text='<%# Eval("MiddleRating")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblMiddleRatingNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
        
        
         
        <asp:TemplateField HeaderText="Middle Slope" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlMiddleSlope" runat="server" SelectedValue='<%# Eval("MiddleSlope")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblMiddleSlope" runat="server" Text='<%# Eval("MiddleSlope")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblMiddleSlopeNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
        
         
        <asp:TemplateField HeaderText="Back Rating" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlBackRating" runat="server" SelectedValue='<%# Eval("BackRating")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblBackRating" runat="server" Text='<%# Eval("BackRating")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblBackRatingNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
            
        <asp:TemplateField HeaderText="Back Slope" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlBackSlope" runat="server" SelectedValue='<%# Eval("BackSlope")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblBackSlope" runat="server" Text='<%# Eval("BackSlope")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblBackSlopeNew" runat="server"  Width="36">  
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
   
    
    </td>
     <td valign="top">
     <h2>Female Course Rating</h2>

     
                        <asp:GridView ID="gridFemaleRating" runat="server" AutoGenerateColumns="False" TabIndex="1"
    Width="400px"  
    CellPadding="4" ForeColor="Black"
    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
    OnRowDataBound="gridFemaleRating_RowDataBound" 
   AllowPaging ="true"  ShowFooter = "false"  
 onrowediting="gridFemaleRatingEdit"
onrowupdating="gridFemaleRatingUpdate"  onrowcancelingedit="gridFemaleRatingCancelEdit"
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
              
         
        <asp:TemplateField HeaderText="Front Rating" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlFrontRating" runat="server" SelectedValue='<%# Eval("FrontRating")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblFrontRating" runat="server" Text='<%# Eval("FrontRating")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblFrontRatingNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
           
        
         
        <asp:TemplateField HeaderText="Front Slope" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlFrontSlope" runat="server" SelectedValue='<%# Eval("FrontSlope")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblFrontSlope" runat="server" Text='<%# Eval("FrontSlope")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblFrontSlopeNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
           

         
        <asp:TemplateField HeaderText="Middle Rating" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlMiddleRating" runat="server" SelectedValue='<%# Eval("MiddleRating")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblMiddleRating" runat="server" Text='<%# Eval("MiddleRating")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblMiddleRatingNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
        
        
         
        <asp:TemplateField HeaderText="Middle Slope" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlMiddleSlope" runat="server" SelectedValue='<%# Eval("MiddleSlope")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblMiddleSlope" runat="server" Text='<%# Eval("MiddleSlope")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblMiddleSlopeNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
        
         
        <asp:TemplateField HeaderText="Back Rating" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlBackRating" runat="server" SelectedValue='<%# Eval("BackRating")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblBackRating" runat="server" Text='<%# Eval("BackRating")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblBackRatingNew" runat="server"  Width="36">  
                </asp:textbox> 
            </FooterTemplate> 
        </asp:TemplateField> 
            
        <asp:TemplateField HeaderText="Back Slope" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:label ID="ddlBackSlope" runat="server" SelectedValue='<%# Eval("BackSlope")%>'  Width="36">        
                </asp:label> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lblBackSlope" runat="server" Text='<%# Eval("BackSlope")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:textbox ID="lblBackSlopeNew" runat="server"  Width="36">  
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
   
     
    </td>
    
    </tr></table>         
     
</ContentTemplate> 
<Triggers>
<asp:AsyncPostBackTrigger ControlID = "gridMaleRating" /> 
<asp:AsyncPostBackTrigger ControlID = "gridFeMaleRating" /> 
</Triggers> 
</asp:UpdatePanel> 
      
