<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="MemberCreate.aspx.vb" Inherits="Events_Calendar" %>
 
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>      
               
    
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server"> 
    <link href="css/TabsControl.css" rel="stylesheet" type="text/css" />
   
      <style type="text/css">
        body {
	        font-family: Arial, Helvetica, sans-serif;
	        font-size: 12px;
	        color: #404040;
	        background-color: #FFF;
        }

        :focus {
	        -moz-outline-style: none;
        }
        
        div.huge
        {
            font-weight: bolder;
            font-family: Arial;
            font-size:50px;
            padding: 10px;
            margin: 5px;
            border: 1px solid black;
        }
        
        span.leftIndent
        {
            padding-left: 15px;
        }
        
        #microsoftDiv
        {            
            color: blue;
        }
        
        #facebookDiv
        {            
            color: green;
        }
        
        #appleDiv
        {            
            color: red;
        }
        
        span.codeExample
        {
            color: Blue;
        }
        .auto-style1 {
            color: #FF3300;
            height: 32px;
        }
    </style>
 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="body">
	 

        <Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="fullwidth">
			<h2>Admin Member Create</h2> 
		</div>
      <div class="fullwidth">
              	            
		   <table>
			<tr valign="top" >
			<td>Enter Userid: </td> <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </td> 
                  </tr>
               
               <tr valign="top" >

    <td>Enter Password: </td> <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> </td>
  </tr>


			<tr valign="top" >
			<td>First Name: </td> <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> </td> 
                  </tr>
               
               <tr valign="top" >

    <td>Last Name: </td> <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox> </td>
  </tr>


               <tr valign="top" >
     <td> </td> <td><asp:Button ID="Button1" runat="server" Text="Create" style="text-align: center" Width="165px" /> </td>
                </tr><tr valign="top" >
                 <td>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </td>
	       </tr>
		</table>

         
      </div>       

        
      </div> 
</asp:Content>

