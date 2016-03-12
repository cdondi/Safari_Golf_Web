<%@ Control Language="VB"  AutoEventWireup="true"  clientIDMode="AutoID" CodeFile="ScorecardControlAllEdit.ascx.vb"   Inherits="WebUserControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

     <style type="text/css">

    .HeaderStyle 
    {
    border:solid 1px White;
    background-color:#81BEF7;
    font-weight:bold;
    text-align:center;
    }
         .auto-style2 {
             width: 387px;
         }
         .auto-style3 {
             text-align: center;
         }
         .auto-style5 {
             border: 3px solid black;
             background-color: #FFFFFF;
             padding-top: 10px;
             padding-left: 10px;
             width: 400px;
             height: 440px;
             text-align: center;
         }
         </style>

   <link href="CSS/CSS.css" rel="stylesheet" type="text/css" /> 
    <script src="scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.blockUI.js" type="text/javascript"></script>
<script type = "text/javascript">
    function BlockUI(elementID) {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function () {
            $("#" + elementID).block({
                message: '<table align = "center"><tr><td>' +
         '<img src="images/loadingAnim.gif"/></td></tr></table>',
                css: {},
                overlayCSS: {
                    backgroundColor: '#000000', opacity: 0.6
                }
            });
        });
        prm.add_endRequest(function () {
            $("#" + elementID).unblock();
        });
    }
    $(document).ready(function () {

        BlockUI("<%=pnlAddEdit.ClientID %>");
        $.blockUI.defaults.css = {};
    });
        function Hidepopup() {
            $find("popup").hide();
            return false;
        }
</script> 
                                         
    <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
             


    <asp:GridView ID="grdViewScorecardpopup" runat="server" AutoGenerateColumns="False" TabIndex="1"
        Width="400px"  onrowcreated="grdViewScorecardpopup_RowCreated" 
        CellPadding="4" ForeColor="Black"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
         AllowPaging ="true"  ShowFooter = "false"  
        PageSize = "10" >
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
                
       <asp:BoundField DataField = "GhinID" HeaderText = "GhinID" Visible="false" HtmlEncode = "true" />
       <asp:BoundField DataField = "ScorecardID" HeaderText = "ScorecardID"  Visible="false" HtmlEncode = "true" />
        <asp:BoundField DataField="memberid" HeaderText="memberid" Visible="false"  HtmlEncode = "true" />
         
       <asp:BoundField DataField = "playername" HeaderText = "Hole"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score1" HeaderText = "1"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score2" HeaderText = "2"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score3" HeaderText = "3"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score4" HeaderText = "4"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score5" HeaderText = "5"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score6" HeaderText = "6"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score7" HeaderText = "7"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score8" HeaderText = "8"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score9" HeaderText = "9"     HtmlEncode = "true" />   
                 
       <asp:BoundField DataField = "ScoreTotalOut" HeaderText = "OUT"     HtmlEncode = "true" />

       <asp:BoundField DataField = "Score10" HeaderText = "10"     HtmlEncode = "true" />        
       <asp:BoundField DataField = "Score11" HeaderText = "11"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score12" HeaderText = "12"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score13" HeaderText = "13"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score14" HeaderText = "14"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score15" HeaderText = "15"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score16" HeaderText = "16"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score17" HeaderText = "17"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Score18" HeaderText = "18"     HtmlEncode = "true" />

       <asp:BoundField DataField = "ScoreTotalin" HeaderText = "IN"     HtmlEncode = "true" />
        
       <asp:BoundField DataField = "GrandTotal" HeaderText = "Gross"    HtmlEncode = "true" />
       <asp:BoundField DataField = "Tournamenthandicap" HeaderText = "T HCP"     HtmlEncode = "true" />
       <asp:BoundField DataField = "Ghinhandicap" HeaderText = "G HCP"     HtmlEncode = "true" />
       <asp:BoundField DataField = "NetScore" HeaderText = "Net"     HtmlEncode = "true" />
           
       <asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "Edit">
           <ItemTemplate>
               <asp:LinkButton ID="lnkEdit" runat="server" Text = "Edit" OnClick = "Edit"></asp:LinkButton>
           </ItemTemplate>
       </asp:TemplateField>
           
    </Columns>
     
    <FooterStyle BackColor="#CCCC99" />
    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    <HeaderStyle CssClass="HeaderStyle" />
    <AlternatingRowStyle BackColor="White" />
     
</asp:GridView>

    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
     
            <asp:Label ID="Label4" runat="server" Font-Bold="true" Text="Scorecard Details"></asp:Label>
            <br />
            <asp:Label ID="txtGhinID" runat="server" Text="" visible="false"></asp:Label>
            <asp:Label ID="memberid" runat="server" Text="" visible="false"></asp:Label>
            <asp:Label ID="txtScorecardID" runat="server" Text="" visible="false"></asp:Label>
    
    <table style="height: 315px; width: 353px">
    <tr>
    <td colspan="4" class="auto-style3">
    <asp:Label ID = "Label2" runat = "server" Text = "Player Name" ></asp:Label>
     
    <asp:label ID="txtplayername" runat="server"></asp:label>    
    </td>
    </tr>

    <tr>
    <td> <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore1" runat="server" Text="Score1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore1" runat="server" SelectedValue='<%# Eval("Score1")%>' Width="65px">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore2" runat="server" Text="score2"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore2" runat="server" SelectedValue='<%# Eval("score2")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore3" runat="server" Text="score3"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore3" runat="server" SelectedValue='<%# Eval("score3")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore4" runat="server" Text="score4"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore4" runat="server" SelectedValue='<%# Eval("score4")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore5" runat="server" Text="score5"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore5" runat="server" SelectedValue='<%# Eval("score5")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore6" runat="server" Text="score6"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore6" runat="server" SelectedValue='<%# Eval("score6")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore7" runat="server" Text="score7"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore7" runat="server" SelectedValue='<%# Eval("score7")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore8" runat="server" Text="score8"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore8" runat="server" SelectedValue='<%# Eval("score8")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore9" runat="server" Text="score9"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore9" runat="server" SelectedValue='<%# Eval("score9")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>

             </table>
        </td>
         <td>
              <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore10" runat="server" Text="score10"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore10" runat="server" SelectedValue='<%# Eval("score10")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore11" runat="server" Text="score11"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore11" runat="server" SelectedValue='<%# Eval("score11")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore12" runat="server" Text="score12"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore12" runat="server" SelectedValue='<%# Eval("score12")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore13" runat="server" Text="score13"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore13" runat="server" SelectedValue='<%# Eval("score13")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore14" runat="server" Text="score14"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore14" runat="server" SelectedValue='<%# Eval("score14")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore15" runat="server" Text="score15"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore15" runat="server" SelectedValue='<%# Eval("score15")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore16" runat="server" Text="score16"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore16" runat="server" SelectedValue='<%# Eval("score16")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore17" runat="server" Text="score17"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore17" runat="server" SelectedValue='<%# Eval("score17")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblscore18" runat="server" Text="score18"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlscore18" runat="server" SelectedValue='<%# Eval("score18")%>' Width="65">
                                    <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>                  
             </table>

          </td>
                
        </tr>
    </table>
 
        <div class="auto-style3">
            </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="4">
                    <asp:Button ID="btnSave" runat="server" OnClick="Save" Text="Save" />
                    <asp:Button ID="btnCancel" runat="server" OnClientClick="return Hidepopup()" Text="Cancel" />
                </td>
            </tr>
            </table>
        </div>

    </asp:Panel>
            <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
     <cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false"
     PopupControlID="pnlAddEdit" TargetControlID = "lnkFake"
    BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    </ContentTemplate> 
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID = "grdViewScorecardpopup" />
        <asp:AsyncPostBackTrigger ControlID = "btnSave" />
    </Triggers> 
    </asp:UpdatePanel> 

         

      <br /><br /> 
     <table border="0" style="width: 410px"  cellpadding="0" cellspacing="0">  
        <tr> 
         <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnScoreCard" runat="server"   Text="Refresh"  height="20px" />&nbsp;&nbsp;<asp:Button ID="Close1" runat="server" height="20px" Text="Close ScoreCard" /> &nbsp;&nbsp;<asp:Button ID="Open1" runat="server" height="20px" Text="Open ScoreCard" />
                  
          <asp:Label ID="lblScorecardSave" runat="server"   Text="" />
                     
        </td>
        </tr>
         
        </table>
    
      
