<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ClosedGames.ascx.vb" Inherits="ClosedGamesControl" %>
     

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

                <h2>Closed Game - Play Date grouping</h2>
              
                
                            
                
				            <div class="dashedline">
				            </div>
           
                             <asp:Label ID="DatePlayed1" runat="server"   Text="" /> <br />

                            <asp:GridView ID="GridViewClosed1" runat="server" 
                                    AutoGenerateColumns="False" CellPadding="4"   
                                    ForeColor="#333333"   GridLines="Both" ShowFooter="True">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                          <asp:BoundField DataField="firstname" HeaderText="firstname" 
                                            SortExpression="firstname" /> 
                                          <asp:BoundField DataField="lastname" HeaderText="lastname" 
                                            SortExpression="lastname" />
                                                                                  
                                          <asp:BoundField DataField="tournamenthandicap" HeaderText="Tournament Handicap" 
                                            SortExpression="tournamenthandicap" />   
                                                                                
                                          <asp:BoundField DataField="ghinhandicap" HeaderText="Ghin Handicap" 
                                            SortExpression="ghinhandicap" /> 
                                                                               
                                          <asp:BoundField DataField="totalscore" HeaderText="Total Score" 
                                            SortExpression="totalscore " /> 
                                                                               
                                          <asp:BoundField DataField="netscore" HeaderText="Net Score" 
                                            SortExpression="netscore " /> 

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
                              
                            
                
				            <div class="dashedline">
				            </div>
                      
                             <asp:Label ID="DatePlayed2" runat="server"   Text="" /> <br />

                            <asp:GridView ID="GridViewClosed2" runat="server" 
                                    AutoGenerateColumns="False" CellPadding="4"  
                                    ForeColor="#333333"   GridLines="Both" ShowFooter="True">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                          <asp:BoundField DataField="firstname" HeaderText="firstname" 
                                            SortExpression="firstname" /> 
                                          <asp:BoundField DataField="lastname" HeaderText="lastname" 
                                            SortExpression="lastname" />                                            
                                          <asp:BoundField DataField="tournamenthandicap" HeaderText="Tournament Handicap" 
                                            SortExpression="tournamenthandicap" />   
                                                                                
                                          <asp:BoundField DataField="ghinhandicap" HeaderText="Ghin Handicap" 
                                            SortExpression="ghinhandicap" /> 
                                                                               
                                          <asp:BoundField DataField="totalscore" HeaderText="Total Score" 
                                            SortExpression="totalscore " /> 
                                                                               
                                          <asp:BoundField DataField="netscore" HeaderText="Net Score" 
                                            SortExpression="netscore " /> 

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
                              
                            
                
				            <div class="dashedline">
				            </div>
                      
                             <asp:Label ID="DatePlayed3" runat="server"   Text="" /> <br />

                            <asp:GridView ID="GridViewClosed3" runat="server" 
                                    AutoGenerateColumns="False" CellPadding="4"  
                                    ForeColor="#333333"   GridLines="Both" ShowFooter="True">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                          <asp:BoundField DataField="firstname" HeaderText="firstname" 
                                            SortExpression="firstname" /> 
                                          <asp:BoundField DataField="lastname" HeaderText="lastname" 
                                            SortExpression="lastname" />                                             
                                          <asp:BoundField DataField="tournamenthandicap" HeaderText="Tournament Handicap" 
                                            SortExpression="tournamenthandicap" />   
                                                                                
                                          <asp:BoundField DataField="ghinhandicap" HeaderText="Ghin Handicap" 
                                            SortExpression="ghinhandicap" /> 
                                                                               
                                          <asp:BoundField DataField="totalscore" HeaderText="Total Score" 
                                            SortExpression="totalscore " /> 
                                                                               
                                          <asp:BoundField DataField="netscore" HeaderText="Net Score" 
                                            SortExpression="netscore " /> 

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
                              
                            
                
				            <div class="dashedline">
				            </div>
                      
                             <asp:Label ID="DatePlayed4" runat="server"   Text="" /> <br />

                            <asp:GridView ID="GridViewClosed4" runat="server" 
                                    AutoGenerateColumns="False" CellPadding="4"  
                                    ForeColor="#333333"   GridLines="Both" ShowFooter="True">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                          <asp:BoundField DataField="firstname" HeaderText="firstname" 
                                            SortExpression="firstname" /> 
                                          <asp:BoundField DataField="lastname" HeaderText="lastname" 
                                            SortExpression="lastname" />                                            
                                          <asp:BoundField DataField="tournamenthandicap" HeaderText="Tournament Handicap" 
                                            SortExpression="tournamenthandicap" />   
                                                                                
                                          <asp:BoundField DataField="ghinhandicap" HeaderText="Ghin Handicap" 
                                            SortExpression="ghinhandicap" /> 
                                                                               
                                          <asp:BoundField DataField="totalscore" HeaderText="Total Score" 
                                            SortExpression="totalscore " /> 
                                                                               
                                          <asp:BoundField DataField="netscore" HeaderText="Net Score" 
                                            SortExpression="netscore " /> 

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
                              
                            
            
        </td>
          
        </tr>
      
            
        </table>

            </ContentTemplate>
        </asp:UpdatePanel>             
              
   