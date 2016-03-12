Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Collections

Partial Public Class VB
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindPrimaryGrid()
            BindSecondaryGrid()
        End If
    End Sub

    Private Sub BindPrimaryGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("conString").ConnectionString
        Dim query As String = "select CustomerID, ContactName, City from customers"
        Dim con As New SqlConnection(constr)
        Dim sda As New SqlDataAdapter(query, con)
        Dim dt As New DataTable()
        sda.Fill(dt)
        gvAll.DataSource = dt
        gvAll.DataBind()
    End Sub

    Protected Sub OnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GetData()
        gvAll.PageIndex = e.NewPageIndex
        BindPrimaryGrid()
        SetData()
    End Sub

    Private Sub GetData()
        Dim dt As DataTable
        If ViewState("SelectedRecords") IsNot Nothing Then
            dt = DirectCast(ViewState("SelectedRecords"), DataTable)
        Else
            dt = CreateDataTable()
        End If
        Dim chkAll As CheckBox = DirectCast(gvAll.HeaderRow _
                            .Cells(0).FindControl("chkAll"), CheckBox)
        For i As Integer = 0 To gvAll.Rows.Count - 1
            If chkAll.Checked Then
                dt = AddRow(gvAll.Rows(i), dt)
            Else
                Dim chk As CheckBox = DirectCast(gvAll.Rows(i) _
                                .Cells(0).FindControl("chk"), CheckBox)
                If chk.Checked Then
                    dt = AddRow(gvAll.Rows(i), dt)
                Else
                    dt = RemoveRow(gvAll.Rows(i), dt)
                End If
            End If
        Next
        ViewState("SelectedRecords") = dt
    End Sub

    Private Sub SetData()
        Dim chkAll As CheckBox = DirectCast(gvAll.HeaderRow.Cells(0).FindControl("chkAll"), CheckBox)
        chkAll.Checked = True
        If ViewState("SelectedRecords") IsNot Nothing Then
            Dim dt As DataTable = DirectCast(ViewState("SelectedRecords"), DataTable)
            For i As Integer = 0 To gvAll.Rows.Count - 1
                Dim chk As CheckBox = DirectCast(gvAll.Rows(i).Cells(0).FindControl("chk"), CheckBox)
                If chk IsNot Nothing Then
                    Dim dr As DataRow() = dt.[Select]("CustomerID = '" & gvAll.Rows(i).Cells(1).Text & "'")
                    chk.Checked = dr.Length > 0
                    If Not chk.Checked Then
                        chkAll.Checked = False
                    End If
                End If
            Next
        End If
    End Sub

    Private Function CreateDataTable() As DataTable
        Dim dt As New DataTable()
        dt.Columns.Add("CustomerID")
        dt.Columns.Add("ContactName")
        dt.Columns.Add("City")
        dt.AcceptChanges()
        Return dt
    End Function

    Private Function AddRow(ByVal gvRow As GridViewRow, ByVal dt As DataTable) As DataTable
        Dim dr As DataRow() = dt.Select("CustomerID = '" _
                                    & gvRow.Cells(1).Text & "'")
        If dr.Length <= 0 Then
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("CustomerID") = gvRow.Cells(1).Text
            dt.Rows(dt.Rows.Count - 1)("ContactName") = gvRow.Cells(2).Text
            dt.Rows(dt.Rows.Count - 1)("City") = gvRow.Cells(3).Text
            dt.AcceptChanges()
        End If
        Return dt
    End Function

    Private Function RemoveRow(ByVal gvRow As GridViewRow, ByVal dt As DataTable) As DataTable
        Dim dr As DataRow() = dt.Select("CustomerID = '" _
                                    & gvRow.Cells(1).Text & "'")
        If dr.Length > 0 Then
            dt.Rows.Remove(dr(0))
            dt.AcceptChanges()
        End If
        Return dt
    End Function

    Protected Sub CheckBox_CheckChanged(ByVal sender As Object, ByVal e As EventArgs)
        GetData()
        SetData()
        BindSecondaryGrid()
    End Sub

    Private Sub BindSecondaryGrid()
        Dim dt As DataTable = DirectCast(ViewState("SelectedRecords"), DataTable)
        gvSelected.DataSource = dt
        gvSelected.DataBind()
    End Sub
End Class