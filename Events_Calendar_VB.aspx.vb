Imports System
Imports DevCow.Web.UI

Partial Public Class Events_Calendar
    Inherits DevCowThemePage

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Dim isAdmin As Boolean = User.IsInRole("Administrators")
        panel1.Visible = isAdmin
        panel2.Visible = isAdmin
    End Sub
End Class

