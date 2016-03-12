
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
Imports System.Security.Principal.PrincipalPolicy
Imports System.Drawing
Imports System.Globalization

Imports System.Net.Mail
Partial Public Class Events_Calendar
    Inherits DevCowThemePage
 
 
    Protected Sub Page_Load(sender As Object, e As EventArgs)

        Dim ScoreParam As New ArrayList(New Object() {New ArrayList(New Object() {True, "Grp 1", "OnTabScoreClick(0)", True}), New ArrayList(New Object() {False, "Grp 2", "OnTabScoreClick(1)", True}), New ArrayList(New Object() {False, "Grp 3", "OnTabScoreClick(2)", True}), New ArrayList(New Object() {False, "Grp 4", "OnTabScoreClick(3)", True}), New ArrayList(New Object() {False, "Grp 5", "OnTabScoreClick(4)", True}), New ArrayList(New Object() {False, "Grp 6", "OnTabScoreClick(5)", True}), New ArrayList(New Object() {False, "Grp 7", "OnTabScoreClick(6)", True}), New ArrayList(New Object() {False, "Grp 8", "OnTabScoreClick(7)", True}), New ArrayList(New Object() {False, "Grp 9", "OnTabScoreClick(8)", True}), New ArrayList(New Object() {False, "Grp 10", "OnTabScoreClick(9)", True}), New ArrayList(New Object() {False, "Grp 11", "OnTabScoreClick(10)", True}), New ArrayList(New Object() {False, "Grp 12", "OnTabScoreClick(11)", True}), New ArrayList(New Object() {False, "No Group", "OnTabScoreClick(12)", True})})

        Tabs2.TabParams = ScoreParam
 

    End Sub
     
End Class

