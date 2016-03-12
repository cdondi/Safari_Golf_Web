<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" codefile="Contact.aspx.cs"
	Inherits="Contact" Title="Untitled Page" %>

<%@ Register TagPrefix="Club" TagName="LoginBanner" Src="LoginBanner.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<Club:LoginBanner ID="LoginBanner1" runat="server" />
		<div class="fullwidth">
			<h2>
				Contact Information</h2>
			<p>
				Feel free to contact any of our members or officials through phone or emails.</p>
		</div>
		<div class="fullwidth">
			The club officials contact information<br />
            <table>
		<tr>
			<th>Offical </th>
			<th>Name</th>
			<th>Phone</th>
			<th>Email</th>
		</tr>
		<tr>
			<td>
				Chairman</td>
			<td> </td>
			<td>111.222.3333</td>
			<td>chairman@safari.com</td>
		</tr>
		<tr>
			<td>
				Assist Chairman</td>
			<td> </td>
			<td>111.222.3333</td>
			<td>assistant@safari.com</td>
		</tr>
		<tr>
			<td>
				Secretary</td>
			<td> </td>
			<td>111.222.3333</td>
			<td>scretary@safari.com</td>
		</tr>
		 
		<tr>
			<td>Web Administrator</td>
			<td>Gideon Seroney</td>
			<td>111.222.3333</td>
			<td>gseroney@safari.com</td>
		</tr>
	</table>
		</div>
	</div>
</asp:Content>
