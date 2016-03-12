﻿Imports System.Data.SqlClient
Imports System.Data
Imports System.Data.SqlDbType
Imports System
Imports System.Web.UI.WebControls
Imports System.Configuration 
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

Partial Class Events_Calendar
    Inherits DevCowThemePage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'CustomaddUsers()
        'CustomGetAllUsers()
    End Sub

    Protected Sub CustomaddUsers()

        CreateAccoutnuser("JMaina")
        CreateAccoutnuser("KYabann")
        CreateAccoutnuser("GKiiru")
        CreateAccoutnuser("JNgunjiri")
        CreateAccoutnuser("PGesora")
        CreateAccoutnuser("SAdagi")
        CreateAccoutnuser("MAdagi")
        CreateAccoutnuser("JNjeru")
        CreateAccoutnuser("MJejelowo")
        CreateAccoutnuser("RAnanda")
        CreateAccoutnuser("JKihara")
        CreateAccoutnuser("LWaweru")
        CreateAccoutnuser("CDondi")
        CreateAccoutnuser("FNdungu")
        CreateAccoutnuser("FMathenge")
        CreateAccoutnuser("EGichanga")
        CreateAccoutnuser("WKinyua")
        CreateAccoutnuser("BKitur")
        CreateAccoutnuser("GSeroney")
        CreateAccoutnuser("KNjuguna")
        CreateAccoutnuser("MGachunga")
        CreateAccoutnuser("MMburu")
        CreateAccoutnuser("NKarume")
        CreateAccoutnuser("PMahinda")
        CreateAccoutnuser("SGaitho")
        CreateAccoutnuser("TKagiri")
        CreateAccoutnuser("WRurangirwa")
        CreateAccoutnuser("JMahinda")
        CreateAccoutnuser("Guest1")
        CreateAccoutnuser("Guest2")
        CreateAccoutnuser("Guest3")
        CreateAccoutnuser("Guest4")
        CreateAccoutnuser("OMacakiage")
        CreateAccoutnuser("JKarenju")
        CreateAccoutnuser("JDame")

    End Sub

    Protected Sub CreateAccoutnuser(ByVal Username As String)
        Dim errormsg As String = ""
        Dim password As String = Username & "1!"
        Dim email As String = Username & "@safarigolftx.com"
        Dim passwordQuestion As String = "Captains First Name?"
        Dim SecurityAnswer As String = "John"
        Dim createStatus As MembershipCreateStatus
        Dim newUser As MembershipUser = _
        Membership.CreateUser(Username, password, email, passwordQuestion, SecurityAnswer, True, createStatus)
        Select Case createStatus
            Case MembershipCreateStatus.Success
                errormsg = "The user account was successfully created!"
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
    End Sub


    Public Function CustomGetAllUsers() As DataSet
        Dim ds As New DataSet()
        Dim dt As New DataTable()
        dt = ds.Tables.Add("Users")
        Dim userlist As String = ""
        Dim muc As MembershipUserCollection
        muc = Membership.GetAllUsers()

        dt.Columns.Add("UserName", Type.[GetType]("System.String"))
        dt.Columns.Add("Email", Type.[GetType]("System.String"))
        dt.Columns.Add("CreationDate", Type.[GetType]("System.DateTime"))

        ' Here is the list of columns returned of the Membership.GetAllUsers() method
        '         * UserName, Email, PasswordQuestion, Comment, IsApproved
        '         * IsLockedOut, LastLockoutDate, CreationDate, LastLoginDate
        '         * LastActivityDate, LastPasswordChangedDate, IsOnline, ProviderName
        '         
        Dim id As String = ""

        For Each mu As MembershipUser In muc
            'Dim dr As DataRow
            'dr = dt.NewRow()
            'dr("UserName") = mu.UserName
            'dr("Email") = mu.Email 
            'dr("CreationDate") = mu.CreationDate
            'dt.Rows.Add(dr)
            id = mu.ProviderUserKey.ToString
            userlist = userlist & "insert into memberinfo(firstname,lastname,memberid) values ('" & Mid(mu.UserName, 1, 1) & "','" & Mid(mu.UserName, 2, Len(mu.UserName)) & "','" & id & "')"
        Next
        Return ds
    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text <> "" And TextBox2.Text <> "" Then

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
End Class