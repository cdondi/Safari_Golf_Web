<%@ Control Language="VB"  AutoEventWireup="true"  clientIDMode="AutoID" CodeFile="Scorecard_List.ascx.vb"   Inherits="WebUserControl" %>
 
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
                                         
    <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
             
            
			<h2><asp:Label ID="coursename0" runat="server"></asp:Label> </h2>

    <asp:GridView ID="grdViewScorecardpopup" runat="server" AutoGenerateColumns="False" TabIndex="1"
        Width="400px"  onrowcreated="grdViewScorecardpopup_RowCreated" 
        CellPadding="4" ForeColor="Black"
        BackColor="White" BorderColor="#DEDFDE"  gridlines="Both" BorderStyle="Solid" BorderWidth="2px"
         AllowPaging ="false"  ShowFooter = "false" >
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
           
           
    </Columns>
     
    <FooterStyle BackColor="#CCCC99" />
    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    <HeaderStyle CssClass="HeaderStyle" />
    <AlternatingRowStyle BackColor="White" />
     
</asp:GridView>
    
      


                            </ContentTemplate>
                        </asp:UpdatePanel>             
              
                                  