
Imports System
Imports System.Web.UI.WebControls
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports DevCow.Web.UI
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI 
Imports System.Collections 
Imports System.Web.Security 
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Text
Imports System.Net.Mail
Imports System.Net.Mime 
Imports System.Net

Partial Public Class Events_Calendar
    Inherits DevCowThemePage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        
    End Sub
 
   
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text <> "" And TextBox2.Text <> "" And TextBox3.Text <> "" And TextBox4.Text <> "" Then

            Try

                Dim username As String = TextBox1.Text
                Dim errormsg As String = ""
                Dim password As String = TextBox2.Text
                Dim email As String = TextBox1.Text & "@safarigolftx.com"
                Dim passwordQuestion As String = "Captains First Name?"
                Dim SecurityAnswer As String = "John"
                Dim createStatus As MembershipCreateStatus
                Dim newUser As MembershipUser = _
                Membership.CreateUser(username, password, email, passwordQuestion, SecurityAnswer, True, createStatus)
                Select Case createStatus
                    Case MembershipCreateStatus.Success
                        errormsg = "The user account was successfully created!"
                        updateuserdetails()
                    Case MembershipCreateStatus.DuplicateUserName
                        errormsg = "There already exists a user with this username."
                    Case MembershipCreateStatus.DuplicateEmail
                        errormsg = "There already exists a user with this email address."
                    Case MembershipCreateStatus.InvalidEmail
                        errormsg = "There email address you provided in invalid."
                    Case MembershipCreateStatus.InvalidAnswer
                        errormsg = "There security answer was invalid."
                    Case MembershipCreateStatus.InvalidPassword
                        errormsg = "The password you provided is invalid. It must be seven characters long and have at least one non-alphanumeric character."
                    Case Else
                        errormsg = "There was an unknown error; the user account was NOT created."
                End Select
                Label1.Text = errormsg
            Catch ex As Exception
                Label1.Text = "Error: " & ex.Message
            End Try
        Else
            Label1.Text = "Error: Username and password must be entered."
        End If


    End Sub
    Private Sub updateuserdetails()
        Dim ssql As String = ""
        Dim usr As String = ""

        Dim rng As New Random
        Dim number As Integer = rng.Next(1, 1000000)
        Dim digits As String = number.ToString("0000000")

        Dim u As MembershipUser
        u = Membership.GetUser(TextBox1.Text)
        usr = u.ProviderUserKey.ToString
        ssql = "INSERT into [MemberInfo]"
        ssql += "([address]"
        ssql += ", [phone]"
        ssql += ", [firstname]"
        ssql += ", [lastname]"
        ssql += ", [Tournamenthandicap]"
        ssql += ", [Ghinhandicap]"
        ssql += ", [memberid]"
        ssql += ", [GhinID]"
        ssql += ", [Gender])"
        ssql += " VALUES "
        ssql += " (N'1234 Main Street'"
        ssql += ", N'8321112222'"
        ssql += ", N'" & TextBox3.Text & "'"
        ssql += ", N'" & TextBox4.Text & "'"
        ssql += ", CAST(28.0 AS Decimal(18, 1)) "
        ssql += ", CAST(28.0 AS Decimal(18, 1))"
        ssql += ", N'" & usr & "'"
        ssql += ", N'" & digits & "'"
        ssql += ", N'Male')"

        ExecuteSql(ssql)

    End Sub


    Public Sub ExecuteSql(ByVal sSql As String)

        Dim cn As New SqlConnection(GetConnectionString())
        cn.Open()
        Dim cm As New SqlCommand(sSql, cn)
        cm.ExecuteNonQuery()
        cn.Close()

    End Sub

    Public Function GetConnectionString() As String

        Dim strconnector As String = ""

        strconnector = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString

        Return strconnector

    End Function
End Class

