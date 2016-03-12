<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PreviousGamesControl.ascx.vb" Inherits="PlayerPerformanceControl" %>
     

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
        .controls {
            width: 233px;
            height: 334px;
        }
    </style>
         

                                             
                                                          
    <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

                  <table>
                      
                      <tr>
                      
                      <td>
				          
                             <asp:Label ID="DatePlayed1" runat="server"   Text="" /> <br />


                          
                            <asp:GridView ID="GridViewClosed1"  runat="server" 
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
                                                                                                                       
                                            <asp:BoundField DataField="grandtotal" HeaderText="Gross Score" 
                                            SortExpression="grandtotal" /> 
                                                                               

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
		                     
                       <td>    
				      
                             <asp:Label ID="DatePlayed2" runat="server"   Text="" /> <br />

                            <asp:GridView ID="GridViewClosed2"  runat="server" 
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
                                                                                                                       
                                            <asp:BoundField DataField="grandtotal" HeaderText="Gross Score" 
                                            SortExpression="grandtotal" /> 
                                                                               

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
                            
                      
                       <td>
                               
		
                       </tr>
                        <tr>                      
                       <td>    
				      
                             <asp:Label ID="DatePlayed3" runat="server"   Text="" /> <br />

                            <asp:GridView ID="GridViewClosed3"  runat="server" 
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
                                                                                                                       
                                            <asp:BoundField DataField="grandtotal" HeaderText="Gross Score" 
                                            SortExpression="grandtotal" /> 
                                                                               

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
                                           
                       <td>         
                
                      
                             <asp:Label ID="DatePlayed4" runat="server"   Text="" /> <br />

                            <asp:GridView ID="GridViewClosed4"  runat="server" 
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
                                                                                                                       
                                            <asp:BoundField DataField="grandtotal" HeaderText="Gross Score" 
                                            SortExpression="grandtotal" /> 
                                                                               

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
                      
                                 
                       <td>
                             
                       </tr>
                             
                      </table>      
            
             </ContentTemplate>
    </asp:UpdatePanel>             
              
   