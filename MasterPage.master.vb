Imports System
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.WebControls
Imports System.Web

Partial Public Class MasterPage
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs)


        If HttpContext.Current.User.Identity.IsAuthenticated Then
            For Each wpdmDisplayMode As WebPartDisplayMode In WebPartManager1.SupportedDisplayModes
                If wpdmDisplayMode.IsEnabled(WebPartManager1) Then
                    drpDisplayModes.Items.Add(New ListItem(wpdmDisplayMode.Name, wpdmDisplayMode.Name))
                End If
            Next
        Else
            drpDisplayModes.Visible = False
        End If
    End Sub
    Protected Sub drpDisplayModes_SelectedIndexChanged(sender As Object, e As EventArgs)
        WebPartManager1.DisplayMode = WebPartManager1.SupportedDisplayModes(drpDisplayModes.SelectedValue.ToString())
    End Sub
End Class


