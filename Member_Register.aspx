<%@ Page Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" codefile="Member_Register.aspx.cs"
	Inherits="Member_Register" Title="New Member Registration" %>

<%@ Register Src="Photos_formpicker.ascx" TagName="Photos_formpicker" TagPrefix="Club" %>
<%@ Register TagPrefix="Club" Namespace="ClubSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div id="body">
		<!--Start of left column-->
		<div id="columnleft">
			<a name="content_start" id="content_start"></a>
			<div class="leftblock">
				<h2>
					New Member Registration</h2>
				<p>
					Please register as soon as you can since we will be using this roster to signup for our golf games.</p>
			</div>
		</div>
		<!--end columnleft-->
		<!--Start of right column-->
		<div id="columnright">
			<div class="rightblock">
				<h2>
					New user registration
				</h2>
				<div class="dashedline">
				</div>
				<asp:CreateUserWizard ID="CreateUserWizard1" runat="server" DisableCreatedUser="True"
					OnFinishButtonClick="CreateUserFinished" FinishDestinationPageUrl="Default.aspx">
					<WizardSteps>
						<asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
							<ContentTemplate>
								<p>
									Sign Up for Your Membership to the club.
								</p>
								<table border="0">
									<tr>
										<td class="formlabel">
											<label for="UserName">
												User Name:</label></td>
										<td>
											<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
												ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="Password">
												Password:</label></td>
										<td>
											<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
											<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
												ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="ConfirmPassword">
												Confirm Password:</label></td>
										<td>
											<asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
											<asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
												ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
												ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="Email">
												E-mail:</label></td>
										<td>
											<asp:TextBox ID="Email" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
												ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="Question">
												Security Question:</label></td>
										<td>
											<asp:TextBox ID="Question" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
												ErrorMessage="Security question is required." ToolTip="Security question is required."
												ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td class="formlabel">
											<label for="Answer">
												Security Answer:</label></td>
										<td>
											<asp:TextBox ID="Answer" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
												ErrorMessage="Security answer is required." ToolTip="Security answer is required."
												ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="2">
											<asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
												ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
												ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="2" style="color: red">
											<asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
										</td>
									</tr>
								</table>
							</ContentTemplate>
							<CustomNavigationTemplate>
								<Club:RolloverButton ID="cu" runat="server" CommandName="MoveNext" Text="Create User" />
							</CustomNavigationTemplate>
						</asp:CreateUserWizardStep>
						<asp:WizardStep ID="WizardStep1" runat="server" Title="Contact details">
							<table>
								<tr>
									<td class="formlabel">
										<label for="fname">
											First Name:</label>
									</td>
									<td class="formvalue">
										<asp:TextBox runat="server" ID="fname" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="fname" ErrorMessage="First Name is required."
											ID="RequiredFieldValidator1" runat="server" ToolTip="First Name is required."
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
									</td>
								</tr>
								<tr>
									<td class="formlabel">
										<label for="lname">
											Last Name:</label>
									</td>
									<td class="formvalue">
										<asp:TextBox runat="server" ID="lname" CssClass="txtfield" />
										<asp:RequiredFieldValidator ControlToValidate="lname" ErrorMessage="Last Name is required."
											ID="RequiredFieldValidator2" runat="server" ToolTip="Last Name is required."
											ValidationGroup="CreateUserForm">*</asp:RequiredFieldValidator>
									</td>
								</tr>
								<tr>
									<td class="formlabel">
										<label for="Addr">
											Address:</label>
									</td>
									<td class="formvalue">
										<asp:TextBox runat="server" ID="Addr" Rows="3" TextMode="MultiLine" CssClass="txtblock" />
									</td>
								</tr>
								<tr>
									<td class="formlabel">
										<label for="Phone">
											Phone:</label>
									</td>
									<td class="formvalue">
										<asp:TextBox runat="server" ID="Phone" CssClass="txtfield" />
									</td>
								</tr>
							</table>
						</asp:WizardStep>
						<asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
							<ContentTemplate>
								<p>
									Your account has been successfully created.
								</p>
								<Club:RolloverButton ID="ContinueButton" runat="server" CommandName="Continue" Text="Continue" />
							</ContentTemplate>
						</asp:CompleteWizardStep>
					</WizardSteps>
					<StepNavigationTemplate>
						<Club:RolloverButton ID="StepPreviousButton" runat="server" CausesValidation="False"
							CommandName="MovePrevious" Text="Previous" />
						<Club:RolloverButton ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Next" />
					</StepNavigationTemplate>
				</asp:CreateUserWizard>
			</div>
		</div>
		<div class="clear2column">
		</div>
	</div>
</asp:Content>
