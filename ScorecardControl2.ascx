<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ScorecardControl2.ascx.vb" Inherits="ScorecardControl" %>
     

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
                      <td  class="auto-style2">Hole</td><td class="auto-style3">1</td><td  class="auto-style2">2</td><td  class="auto-style2">3</td><td  class="auto-style2">4</td><td  class="auto-style2">5</td><td  class="auto-style2">6</td><td  class="auto-style2">7</td><td  class="auto-style2">8</td><td  class="auto-style2">9</td><td  class="auto-style2">Total Out</td><td  class="auto-style2">10</td><td  class="auto-style2">11</td><td  class="auto-style2">12</td><td  class="auto-style2">13</td><td  class="auto-style2">14</td><td  class="auto-style2">15</td><td  class="auto-style2">16</td><td  class="auto-style2">17</td><td  class="auto-style2">18</td><td  class="auto-style2">ToTal In</td><td  class="auto-style2">Grand ToTal</td><td  class="auto-style2">T. HCP</td><td  class="auto-style2">Ghin HCP</td><td  class="auto-style2">Net Score</td>
                    </tr>
                    <tr>                    
               
                            <td  class="auto-style1">Yard</td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD1" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD2" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD3" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD4" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD5" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD6" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD7" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD8" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD9" runat="server"></asp:Label></td>

                            <td  class="auto-style1"><asp:Label ID="lblYardDTotalOut" runat="server"></asp:Label></td>
                        
                            <td  class="auto-style1"><asp:Label ID="lblYardD10" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD11" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD12" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD13" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD14" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD15" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD16" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD17" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardD18" runat="server"></asp:Label></td>

                            <td  class="auto-style1"><asp:Label ID="lblYardDTotalin" runat="server"></asp:Label></td>
                            <td  class="auto-style1"><asp:Label ID="lblYardDGrandTotal" runat="server"></asp:Label></td>

                            <td  class="auto-style1"></td>
                            <td  class="auto-style1"></td>
                            <td  class="auto-style1"></td>
                                           
                    </tr>

                    <tr>                    
              
                        
                        <td  class="auto-style4">HCP</td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD1" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD2" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD3" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD4" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD5" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD6" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD7" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD8" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD9" runat="server"></asp:Label></td>
                        <td  class="auto-style4"> </td>                                               
                        <td  class="auto-style4"><asp:Label ID="lblHCPD10" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD11" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD12" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD13" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD14" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD15" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD16" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD17" runat="server"></asp:Label></td>
                        <td  class="auto-style4"><asp:Label ID="lblHCPD18" runat="server"></asp:Label></td>
                         
                        <td  class="auto-style4"></td>
                        <td  class="auto-style4"></td>
                        <td  class="auto-style4"></td>
                        <td  class="auto-style4"></td>
                        
                        <td  class="auto-style4"></td>
                        
                   </tr>
                   
                    <tr>                    
               
                        <td  class="auto-style5">Par</td>
                        <td class="auto-style5"><asp:Label ID="lblParD1" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD2" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD3" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD4" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD5" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD6" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD7" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD8" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD9" runat="server"></asp:Label></td>

                        <td  class="auto-style5"><asp:Label ID="lblParDTotalOut" runat="server"></asp:Label></td>
                                                
                        <td  class="auto-style5"><asp:Label ID="lblParD10" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD11" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD12" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD13" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD14" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD15" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD16" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD17" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParD18" runat="server"></asp:Label></td>

                        <td  class="auto-style5"><asp:Label ID="lblParDTotalin" runat="server"></asp:Label></td>
                        <td  class="auto-style5"><asp:Label ID="lblParDGrandTotal" runat="server"></asp:Label></td>

                        <td  class="auto-style5"></td>
                        <td  class="auto-style5"></td>
                        <td  class="auto-style5"></td>
                  </tr>
                    
        
                    <tr>                    
               
                         <asp:Label ID="lblGhin1" runat="server" Visible="false" ></asp:Label>
                         <asp:Label ID="lblScorecardID1" runat="server" Visible="false" ></asp:Label>
                         <asp:Label ID="lblmemberid1" runat="server" Visible="false" ></asp:Label> 
                        <td  class="auto-style1"><asp:Label ID="lblUserNameScore1" runat="server"></asp:Label></td>                    <td><asp:DropDownList ID="txtScore1_1" runat="server"  SelectedValue='<%# Eval("Score1")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore1_2" runat="server"  SelectedValue='<%# Eval("Score2")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_3" runat="server"  SelectedValue='<%# Eval("Score3")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_4" runat="server"  SelectedValue='<%# Eval("Score4")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_5" runat="server"  SelectedValue='<%# Eval("Score5")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_6" runat="server"  SelectedValue='<%# Eval("Score6")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_7" runat="server"  SelectedValue='<%# Eval("Score7")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_8" runat="server" SelectedValue='<%# Eval("Score8")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore1_9" runat="server"  SelectedValue='<%# Eval("Score9")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td ><asp:Label ID="txtScore1_TotalOut" runat="server"></asp:Label></td>
                                                
                  <td ><asp:DropDownList ID="txtScore1_10" runat="server"  SelectedValue='<%# Eval("Score10")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_11" runat="server"  SelectedValue='<%# Eval("Score11")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_12" runat="server"  SelectedValue='<%# Eval("Score12")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_13" runat="server"  SelectedValue='<%# Eval("Score13")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_14" runat="server"  SelectedValue='<%# Eval("Score14")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_15" runat="server"  SelectedValue='<%# Eval("Score15")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_16" runat="server"  SelectedValue='<%# Eval("Score16")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_17" runat="server"  SelectedValue='<%# Eval("Score17")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore1_18" runat="server"  SelectedValue='<%# Eval("Score18")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td  class="auto-style1"><asp:Label ID="txtScore1_Totalin" runat="server"></asp:Label></td>

                        <td  class="auto-style1"><asp:Label ID="txtScore1_GrandTotal" runat="server"></asp:Label></td>

                        <td  class="auto-style1"><asp:Label ID="txtScore1_Tournamenthandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore1_Ghinhandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore1_NetScore" runat="server"></asp:Label></td>


                        
                             </tr>
                 
                    <tr>                    
               
                         <asp:Label ID="lblGhin2" runat="server" Visible="false" ></asp:Label> 
                         <asp:Label ID="lblScorecardID2" runat="server" Visible="false" ></asp:Label> 
                         <asp:Label ID="lblmemberid2" runat="server" Visible="false" ></asp:Label> 
                        <td  class="auto-style1"><asp:Label ID="lblUserNameScore2" runat="server"></asp:Label></td>
                                           <td><asp:DropDownList ID="txtScore2_1" runat="server"  SelectedValue='<%# Eval("Score1")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore2_2" runat="server"  SelectedValue='<%# Eval("Score2")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_3" runat="server"  SelectedValue='<%# Eval("Score3")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_4" runat="server"  SelectedValue='<%# Eval("Score4")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_5" runat="server"  SelectedValue='<%# Eval("Score5")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_6" runat="server"  SelectedValue='<%# Eval("Score6")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_7" runat="server"  SelectedValue='<%# Eval("Score7")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_8" runat="server" SelectedValue='<%# Eval("Score8")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore2_9" runat="server"  SelectedValue='<%# Eval("Score9")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td ><asp:Label ID="txtScore2_TotalOut" runat="server"></asp:Label></td>
                                                
                  <td ><asp:DropDownList ID="txtScore2_10" runat="server"  SelectedValue='<%# Eval("Score10")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_11" runat="server"  SelectedValue='<%# Eval("Score11")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_12" runat="server"  SelectedValue='<%# Eval("Score12")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_13" runat="server"  SelectedValue='<%# Eval("Score13")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_14" runat="server"  SelectedValue='<%# Eval("Score14")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_15" runat="server"  SelectedValue='<%# Eval("Score15")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_16" runat="server"  SelectedValue='<%# Eval("Score16")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_17" runat="server"  SelectedValue='<%# Eval("Score17")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore2_18" runat="server"  SelectedValue='<%# Eval("Score18")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td  class="auto-style1"><asp:Label ID="txtScore2_Totalin" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore2_GrandTotal" runat="server"></asp:Label></td>
                        
                        <td  class="auto-style1"><asp:Label ID="txtScore2_Tournamenthandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore2_Ghinhandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore2_NetScore" runat="server"></asp:Label></td>

                        
                             </tr>

                
                    <tr>                    
               
                         <asp:Label ID="lblGhin3" runat="server" Visible="false" ></asp:Label>
                         <asp:Label ID="lblScorecardID3" runat="server" Visible="false" ></asp:Label>
                         <asp:Label ID="lblmemberid3" runat="server" Visible="false" ></asp:Label> 
                        <td  class="auto-style1"><asp:Label ID="lblUserNameScore3" runat="server"></asp:Label></td>
                                            <td><asp:DropDownList ID="txtScore3_1" runat="server"  SelectedValue='<%# Eval("Score1")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore3_2" runat="server"  SelectedValue='<%# Eval("Score2")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_3" runat="server"  SelectedValue='<%# Eval("Score3")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_4" runat="server"  SelectedValue='<%# Eval("Score4")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_5" runat="server"  SelectedValue='<%# Eval("Score5")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_6" runat="server"  SelectedValue='<%# Eval("Score6")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_7" runat="server"  SelectedValue='<%# Eval("Score7")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_8" runat="server" SelectedValue='<%# Eval("Score8")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore3_9" runat="server"  SelectedValue='<%# Eval("Score9")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td ><asp:Label ID="txtScore3_TotalOut" runat="server"></asp:Label></td>
                                                
                  <td ><asp:DropDownList ID="txtScore3_10" runat="server"  SelectedValue='<%# Eval("Score10")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_11" runat="server"  SelectedValue='<%# Eval("Score11")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_12" runat="server"  SelectedValue='<%# Eval("Score12")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_13" runat="server"  SelectedValue='<%# Eval("Score13")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_14" runat="server"  SelectedValue='<%# Eval("Score14")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_15" runat="server"  SelectedValue='<%# Eval("Score15")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_16" runat="server"  SelectedValue='<%# Eval("Score16")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_17" runat="server"  SelectedValue='<%# Eval("Score17")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore3_18" runat="server"  SelectedValue='<%# Eval("Score18")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td  class="auto-style1"><asp:Label ID="txtScore3_Totalin" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore3_GrandTotal" runat="server"></asp:Label></td>
                        
                        <td  class="auto-style1"><asp:Label ID="txtScore3_Tournamenthandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore3_Ghinhandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore3_NetScore" runat="server"></asp:Label></td>
                        
                             </tr>
                
                    <tr>                    
               
                         <asp:Label ID="lblGhin4" runat="server" Visible="false" ></asp:Label> 
                         <asp:Label ID="lblScorecardID4" runat="server" Visible="false" ></asp:Label>
                         <asp:Label ID="lblmemberid4" runat="server" Visible="false" ></asp:Label> 
                        <td  class="auto-style1"><asp:Label ID="lblUserNameScore4" runat="server"></asp:Label></td>
                                            <td><asp:DropDownList ID="txtScore4_1" runat="server"  SelectedValue='<%# Eval("Score1")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore4_2" runat="server"  SelectedValue='<%# Eval("Score2")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_3" runat="server"  SelectedValue='<%# Eval("Score3")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_4" runat="server"  SelectedValue='<%# Eval("Score4")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_5" runat="server"  SelectedValue='<%# Eval("Score5")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_6" runat="server"  SelectedValue='<%# Eval("Score6")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_7" runat="server"  SelectedValue='<%# Eval("Score7")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_8" runat="server" SelectedValue='<%# Eval("Score8")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore4_9" runat="server"  SelectedValue='<%# Eval("Score9")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td ><asp:Label ID="txtScore4_TotalOut" runat="server"></asp:Label></td>
                                                
                  <td ><asp:DropDownList ID="txtScore4_10" runat="server"  SelectedValue='<%# Eval("Score10")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_11" runat="server"  SelectedValue='<%# Eval("Score11")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_12" runat="server"  SelectedValue='<%# Eval("Score12")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_13" runat="server"  SelectedValue='<%# Eval("Score13")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_14" runat="server"  SelectedValue='<%# Eval("Score14")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_15" runat="server"  SelectedValue='<%# Eval("Score15")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_16" runat="server"  SelectedValue='<%# Eval("Score16")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_17" runat="server"  SelectedValue='<%# Eval("Score17")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore4_18" runat="server"  SelectedValue='<%# Eval("Score18")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td  class="auto-style1"><asp:Label ID="txtScore4_Totalin" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore4_GrandTotal" runat="server"></asp:Label></td>
                        
                        <td  class="auto-style1"><asp:Label ID="txtScore4_Tournamenthandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore4_Ghinhandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore4_NetScore" runat="server"></asp:Label></td>
                        
                             </tr>
                
                    <tr>                    
                         <asp:Label ID="lblGhin5" runat="server" Visible="false" ></asp:Label> 
                         <asp:Label ID="lblScorecardID5" runat="server" Visible="false" ></asp:Label> 
                         <asp:Label ID="lblmemberid5" runat="server" Visible="false" ></asp:Label> 
                        <td  class="auto-style1"><asp:Label ID="lblUserNameScore5" runat="server"></asp:Label></td>
                                            <td><asp:DropDownList ID="txtScore5_1" runat="server"  SelectedValue='<%# Eval("Score1")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore5_2" runat="server"  SelectedValue='<%# Eval("Score2")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_3" runat="server"  SelectedValue='<%# Eval("Score3")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_4" runat="server"  SelectedValue='<%# Eval("Score4")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_5" runat="server"  SelectedValue='<%# Eval("Score5")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_6" runat="server"  SelectedValue='<%# Eval("Score6")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_7" runat="server"  SelectedValue='<%# Eval("Score7")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_8" runat="server" SelectedValue='<%# Eval("Score8")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                <td ><asp:DropDownList ID="txtScore5_9" runat="server"  SelectedValue='<%# Eval("Score9")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td ><asp:Label ID="txtScore5_TotalOut" runat="server"></asp:Label></td>
                                                
                  <td ><asp:DropDownList ID="txtScore5_10" runat="server"  SelectedValue='<%# Eval("Score10")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_11" runat="server"  SelectedValue='<%# Eval("Score11")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_12" runat="server"  SelectedValue='<%# Eval("Score12")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_13" runat="server"  SelectedValue='<%# Eval("Score13")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_14" runat="server"  SelectedValue='<%# Eval("Score14")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_15" runat="server"  SelectedValue='<%# Eval("Score15")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_16" runat="server"  SelectedValue='<%# Eval("Score16")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_17" runat="server"  SelectedValue='<%# Eval("Score17")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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
                 <td ><asp:DropDownList ID="txtScore5_18" runat="server"  SelectedValue='<%# Eval("Score18")%>'  Width="36">                         
                    <asp:ListItem Value="0" Text="0"></asp:ListItem> 
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

                        <td  class="auto-style1"><asp:Label ID="txtScore5_Totalin" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore5_GrandTotal" runat="server"></asp:Label></td>
                        
                        <td  class="auto-style1"><asp:Label ID="txtScore5_Tournamenthandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore5_Ghinhandicap" runat="server"></asp:Label></td>
                        <td  class="auto-style1"><asp:Label ID="txtScore5_NetScore" runat="server"></asp:Label></td>

                        
                             </tr>


           </table>
            
        </td>
          
        </tr>
        <tr> 
         <td>
          
          <asp:Button ID="Save1" runat="server" height="40px" Text="Save Changes" /> &nbsp;&nbsp;<asp:Button ID="Close1" runat="server" height="40px" Text="Close ScoreCard" />
                  
          <asp:Label ID="lblScorecardSave" runat="server"   Text="" />
                     
        </td>
        </tr>
 
            
            
        </table>

            </ContentTemplate>
        </asp:UpdatePanel>             
              
   