<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" codefile="Links.aspx.cs"
	Inherits="Links" Title="Clubsite Links" %>

<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="fullwidth">
			<h2>
				Links to Cool stuff</h2>

            <p><a href="http://www.txga.org/txga_clubs.cml?cmd=view&cid=1868a295c98eca0d9fa43d5e80efb5bb">Texas Golf Association</a></p>

			<p><a href="http://www.usga.org/rules.aspx?id=7788">USGA Rules</a></p>
		
			<p><a href="http://www.pga.com/golf-instruction/instruction-feature/fundamentals/golf-beginners-golf-etiquette-rules-and-glossary">PGA Rules for beginners</a></p>
		</div> 
    </div>
</asp:Content>
