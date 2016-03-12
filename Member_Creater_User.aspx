<%@ Page Title="" Language="VB" MasterPageFile="~/Default.master" AutoEventWireup="false" CodeFile="Member_Creater_User.aspx.vb" Inherits="Events_Calendar"%>

<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<%@ Register TagPrefix="Club" TagName="ImageThumbnail" Src="ImageThumbnail.ascx" %>      
         

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
      <div id="body">	 

        <Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="fullwidth">
			<h2>Create User Manually</h2> 
		</div>
        <div class="fullwidth">
		            
		   <table>
			<tr valign="top" >
			<td>Enter Userid: </td> <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </td> 
                  </tr><tr valign="top" >

    <td>Enter Password: </td> <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> </td>
  </tr><tr valign="top" >
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


