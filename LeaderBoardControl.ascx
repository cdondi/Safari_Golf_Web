<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LeaderBoardControl.ascx.vb" Inherits="LeaderBoardControl" %>
     

<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>                                                 
                                                          
    <style type="text/css">
        .auto-style1 {
            width: 3px;
        }
        .auto-style2 {
            width: 3px;
            background-color: #99CCFF;
        }
        .auto-style3 {
            background-color: #99CCFF;
        }
        .auto-style4 {
            width: 3px;
            background-color: #FF9966;
        }
        .auto-style5 {
            width: 3px;
            background-color: #66FF33;
        }
        .auto-style6 {
            width: 3px;
            background-color: #CC6699;
        }
    </style>
                                                      
                                                          
    <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

        <table border="0" style="width: 710px"  cellpadding="0" cellspacing="0">  
        <tr> 
         <td>


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
                                        
                                        
                                          <asp:BoundField DataField="Date" HeaderText="Game Date" 
                                            SortExpression="Date" /> 
                                        
                                                                                   
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
                         <td valign="middle"> &nbsp;&nbsp; 
                              
                        <asp:Button ID="btnRefreshLeaderBoard" runat="server"   Text="REFRESH" /><br />
                             
                        <asp:Label ID="lblRefreshLeader" runat="server"   Text="" />

                          </td>
                    
                                           
                    </tr>


           </table>
            
        </td>
          
        </tr>
      
            
        </table>

            </ContentTemplate>
        </asp:UpdatePanel>             
              
   