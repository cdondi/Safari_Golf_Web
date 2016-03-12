﻿<%@ Control Language="VB"  AutoEventWireup="true"  clientIDMode="AutoID" CodeFile="ScorecardControlNew.ascx.vb"   Inherits="WebUserControl" %>

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

             

    <span class="auto-style1">FRONT 9 HOLES</span>


    <asp:GridView ID="grdViewScorecard1" runat="server" AutoGenerateColumns="False" TabIndex="1"
    Width="400px"  
    CellPadding="4" ForeColor="Black"
    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
    OnRowDataBound="grdViewScorecard1_RowDataBound" 
    onrowcreated="grdViewScorecard1_RowCreated"  AllowPaging ="true"  ShowFooter = "false"  
OnPageIndexChanging = "grdViewScorecard1OnPaging" onrowediting="grdViewScorecard1EditScore"
onrowupdating="grdViewScorecard1UpdateScore"  onrowcancelingedit="grdViewScorecard1CancelEdit"
PageSize = "10" >
    <RowStyle BackColor="#F7F7DE" />
    <Columns>

        
        <asp:TemplateField ItemStyle-Width = "9px"   Visible="false" HeaderText = "GhinID">
            <ItemTemplate>
                <asp:Label ID="lblGhinID" runat="server" 
                Text='<%# Eval("GhinID")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtGhinID" Width = "40px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 

                
        <asp:TemplateField ItemStyle-Width = "9px"   Visible="false" HeaderText = "ScorecardID">
            <ItemTemplate>
                <asp:Label ID="lblScorecardID" runat="server" 
                Text='<%# Eval("ScorecardID")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtScorecardID" Width = "40px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 
                  
        <asp:BoundField DataField="memberid" HeaderText="memberid" Visible="false"  ItemStyle-HorizontalAlign="Left" />  
             
            
        <asp:TemplateField ItemStyle-Width = "90px"  HeaderText = "Hole">
            <ItemTemplate>
                <asp:Label ID="lblplayername" runat="server" 
                Text='<%# Eval("playername")%>'  Width = "90px" ></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtplayername"  Width = "90px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 
             
         
        <asp:TemplateField HeaderText="1" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl1" runat="server" SelectedValue='<%# Eval("Score1")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>  
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl1" runat="server" Text='<%# Eval("Score1")%>' Width="36"></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew1" runat="server"  Width="36">                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>  
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         
        <asp:TemplateField HeaderText="2" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl2" runat="server" SelectedValue='<%# Eval("Score2")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>  
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl2" runat="server" Text='<%# Eval("Score2")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew2" runat="server" Width="36" >                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         
        <asp:TemplateField HeaderText="3" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl3" runat="server" SelectedValue='<%# Eval("Score3")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>  
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl3" runat="server" Text='<%# Eval("Score3")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew3" runat="server"  Width="36">                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         
        <asp:TemplateField HeaderText="4" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl4" runat="server" SelectedValue='<%# Eval("Score4")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl4" runat="server" Text='<%# Eval("Score4")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew4" runat="server"  Width="36">                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         

        <asp:TemplateField HeaderText="5" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl5" runat="server" SelectedValue='<%# Eval("Score5")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>  
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl5" runat="server" Text='<%# Eval("Score5")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew5" runat="server"  Width="36">                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         

        <asp:TemplateField HeaderText="6" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl6" runat="server" SelectedValue='<%# Eval("Score6")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>  
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl6" runat="server" Text='<%# Eval("Score6")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew6" runat="server"  Width="36">                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>  
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         


        <asp:TemplateField HeaderText="7" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl7" runat="server" SelectedValue='<%# Eval("Score7")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl7" runat="server" Text='<%# Eval("Score7")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew7" runat="server"  Width="36">                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>  
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         


        <asp:TemplateField HeaderText="8" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl8" runat="server" SelectedValue='<%# Eval("Score8")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl8" runat="server" Text='<%# Eval("Score8")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew8" runat="server" Width="36" >                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         

        <asp:TemplateField HeaderText="9" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl9" runat="server" SelectedValue='<%# Eval("Score9")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>  
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem>  
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl9" runat="server" Text='<%# Eval("Score9")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew9" runat="server" Width="36" >                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>   
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
          
            
        <asp:TemplateField ItemStyle-Width = "9px"  HeaderText = "OUT">
            <ItemTemplate>
                <asp:Label ID="lblScoreTotalOut" runat="server" 
                Text='<%# Eval("ScoreTotalOut")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtScoreTotalOut" Width = "10px" 
                     runat="server"></asp:TextBox>
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

    
    <br /><br />
     <span class="auto-style1">BACK 9 HOLES</span>

    <asp:GridView ID="grdViewScorecard2" runat="server" AutoGenerateColumns="False" TabIndex="1"
    Width="400px"  
    CellPadding="4" ForeColor="Black"
    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
    OnRowDataBound="grdViewScorecard2_RowDataBound" 
    onrowcreated="grdViewScorecard2_RowCreated"  AllowPaging ="true"  ShowFooter = "false"  
OnPageIndexChanging = "grdViewScorecard2OnPaging" onrowediting="grdViewScorecard2EditScore"
onrowupdating="grdViewScorecard2UpdateScore"  onrowcancelingedit="grdViewScorecard2CancelEdit"
PageSize = "10" >
    <RowStyle BackColor="#F7F7DE" />
    <Columns>

        
        <asp:TemplateField ItemStyle-Width = "9px"   Visible="false" HeaderText = "GhinID">
            <ItemTemplate>
                <asp:Label ID="lblGhinID" runat="server" 
                Text='<%# Eval("GhinID")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtGhinID" Width = "40px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 

                
        <asp:TemplateField ItemStyle-Width = "9px"   Visible="false" HeaderText = "ScorecardID">
            <ItemTemplate>
                <asp:Label ID="lblScorecardID" runat="server" 
                Text='<%# Eval("ScorecardID")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtScorecardID" Width = "40px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 
                  
        <asp:BoundField DataField="memberid" HeaderText="memberid" Visible="false"  ItemStyle-HorizontalAlign="Left" />  
             
            
        <asp:TemplateField ItemStyle-Width = "90px"  HeaderText = "Hole">
            <ItemTemplate>
                <asp:Label ID="lblplayername" runat="server" 
                Text='<%# Eval("playername")%>'  Width = "90px" ></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtplayername" Width = "90px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 
             
                  

        <asp:TemplateField HeaderText="10" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl10" runat="server" SelectedValue='<%# Eval("Score10")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl10" runat="server" Text='<%# Eval("Score10")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew10" runat="server"  Width="36">                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         
        <asp:TemplateField HeaderText="11" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl11" runat="server" SelectedValue='<%# Eval("Score11")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl11" runat="server" Text='<%# Eval("Score11")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew11" runat="server" Width="36" >                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         
        <asp:TemplateField HeaderText="12" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl12" runat="server" SelectedValue='<%# Eval("Score12")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl12" runat="server" Text='<%# Eval("Score12")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew12" runat="server"  Width="36">                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         
        <asp:TemplateField HeaderText="13" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl13" runat="server" SelectedValue='<%# Eval("Score13")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl13" runat="server" Text='<%# Eval("Score13")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew13" runat="server" Width="36" >                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         
        <asp:TemplateField HeaderText="14" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl14" runat="server" SelectedValue='<%# Eval("Score14")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl14" runat="server" Text='<%# Eval("Score14")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew14" runat="server" Width="36" >                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         

        <asp:TemplateField HeaderText="15" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl15" runat="server" SelectedValue='<%# Eval("Score15")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl15" runat="server" Text='<%# Eval("Score15")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew15" runat="server" Width="36" >                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         

        <asp:TemplateField HeaderText="16" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl16" runat="server" SelectedValue='<%# Eval("Score16")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl16" runat="server" Text='<%# Eval("Score16")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew16" runat="server" Width="36" >                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         


        <asp:TemplateField HeaderText="17" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl17" runat="server" SelectedValue='<%# Eval("Score17")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl17" runat="server" Text='<%# Eval("Score17")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew17" runat="server" Width="36" >                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
               
         
        
        <asp:TemplateField HeaderText="18" HeaderStyle-HorizontalAlign="Left"> 
            <EditItemTemplate> 
                <asp:DropDownList ID="ddl18" runat="server" SelectedValue='<%# Eval("Score18")%>' Width="36">                         
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="lbl18" runat="server" Text='<%# Eval("Score18")%>'></asp:Label> 
            </ItemTemplate> 
            <FooterTemplate> 
                <asp:DropDownList ID="ddlNew18" runat="server"  Width="36">                        
                    <asp:ListItem Value="0" Text=" "></asp:ListItem> 
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem> 
                    <asp:ListItem Value="11" Text="11"></asp:ListItem> 
                    <asp:ListItem Value="12" Text="12"></asp:ListItem> 
                </asp:DropDownList> 
            </FooterTemplate> 
        </asp:TemplateField> 
         
        
            
        <asp:TemplateField ItemStyle-Width = "9px"  HeaderText = "IN">
            <ItemTemplate>
                <asp:Label ID="lblScoreTotalin" runat="server" 
                Text='<%# Eval("ScoreTotalin")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtScoreTotalin" Width = "10px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 
                        
            
        <asp:TemplateField ItemStyle-Width = "9px"  HeaderText = "Total">
            <ItemTemplate>
                <asp:Label ID="lblGrandTotal" runat="server" 
                Text='<%# Eval("GrandTotal")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtGrandTotal" Width = "10px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 
              
        <asp:TemplateField ItemStyle-Width = "9px"  HeaderText = "T HCP">
            <ItemTemplate>
                <asp:Label ID="lblTournamenthandicap" runat="server" 
                Text='<%# Eval("Tournamenthandicap")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtTournamenthandicap" Width = "10px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 
         
        <asp:TemplateField ItemStyle-Width = "9px"  HeaderText = "G HCP">
            <ItemTemplate>
                <asp:Label ID="lblGhinhandicap" runat="server" 
                Text='<%# Eval("Ghinhandicap")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtGhinhandicap" Width = "10px" 
                     runat="server"></asp:TextBox>
            </FooterTemplate> 
        </asp:TemplateField> 
         
        <asp:TemplateField ItemStyle-Width = "9px"  HeaderText = "Net">
            <ItemTemplate>
                <asp:Label ID="lblNetScore" runat="server" 
                Text='<%# Eval("NetScore")%>'></asp:Label>
            </ItemTemplate> 
            <FooterTemplate>
                <asp:TextBox ID="txtNetScore" Width = "10px" 
                     runat="server"></asp:TextBox>
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

      <br /><br /> 
     <table border="0" style="width: 410px"  cellpadding="0" cellspacing="0">  
        <tr> 
         <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnScoreCard" runat="server"   Text="Refresh"  height="20px" />&nbsp;&nbsp;<asp:Button ID="Close1" runat="server" height="20px" Text="Close ScoreCard" /> &nbsp;&nbsp;<asp:Button ID="Open1" runat="server" height="20px" Text="Open ScoreCard" />
                  
          <asp:Label ID="lblScorecardSave" runat="server"   Text="" />
                     
        </td>
        </tr>
         
        </table>
    
          
</ContentTemplate> 
<Triggers>
<asp:AsyncPostBackTrigger ControlID = "grdViewScorecard1" /> 
<asp:AsyncPostBackTrigger ControlID = "grdViewScorecard2" /> 
</Triggers> 
</asp:UpdatePanel> 
      