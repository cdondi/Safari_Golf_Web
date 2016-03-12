
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
Imports System.Drawing
Imports System.Web.UI.DataVisualization
Imports System.Web.UI.DataVisualization.Charting
Partial Public Class Events_Calendar
    Inherits DevCowThemePage
    Protected IsAdmin As Boolean
    Private nextLocationID As Integer
    Private prevLocationID As Integer
    Const INVALIDID As Integer = -1

    Private Rating As Integer
    Private Slope As Integer
    Private Differential As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            GetMemberInfo()

        End If

    End Sub
    
    Private Sub GetMemberInfo()

        Dim sSQL As String

        sSQL = "select [address] ,[phone] ,[firstname] ,[lastname] ,[Tournamenthandicap] ,[Ghinhandicap] ,[memberid] ,[GhinID] ,[Gender]  FROM [MemberInfo] order by [lastname] asc, [firstname] asc"

        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim sdapair0 As New SqlDataAdapter(sSQL, con)
        Dim dtpair0 As New DataTable()
        sdapair0.Fill(dtpair0)

        con.Close()
        MemberInfoUpdates.DataSource = dtpair0
        MemberInfoUpdates.DataBind()
    End Sub

    Protected Sub MemberInfoUpdates_DataBound(sender As Object, e As EventArgs)
        'Starting from last Row Previous Row (if 12 rows in our grid)
        ' merging last row and last previous row if same value (take 12, 11 and merge if same year)
        ' Then last previous row with second last previous row (take 11, 10 and merge if same year)
        ' etc., till first row and second row merging
        For rowIndex As Integer = MemberInfoUpdates.Rows.Count - 2 To 0 Step -1
            Dim row As GridViewRow = MemberInfoUpdates.Rows(rowIndex)
            Dim previousRow As GridViewRow = MemberInfoUpdates.Rows(rowIndex + 1)
            If row.Cells(0).Text = previousRow.Cells(0).Text Then
                If previousRow.Cells(0).RowSpan < 2 Then
                    row.Cells(0).RowSpan = 2
                Else
                    row.Cells(0).RowSpan = previousRow.Cells(0).RowSpan + 1
                End If
                previousRow.Cells(0).Visible = False
            End If
            ' This is to just give header color, font style
            row.Cells(0).CssClass = "HeaderStyle"
        Next
    End Sub

    Protected Sub MemberInfoUpdates_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            'e.Row.Cells(0).Visible = False
            '' Invisibiling Year Header Cell
            'e.Row.Cells(1).Visible = False
            '' Invisibiling Period Header Cell
            '' Invisibiling Audited By Header Cell
            'e.Row.Cells(2).Visible = False
        End If
    End Sub


    Protected Sub MemberInfoUpdatesEdit(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        MemberInfoUpdates.EditIndex = e.NewEditIndex
        GetMemberInfo()
    End Sub
    Protected Sub MemberInfoUpdatesCancelEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        MemberInfoUpdates.EditIndex = -1
        GetMemberInfo()
    End Sub
    Protected Sub MemberInfoUpdatesUpdate(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)

        Dim lblMemberid As Label = MemberInfoUpdates.Rows(e.RowIndex).FindControl("txtmemberid")
        Dim lblGhin As TextBox = MemberInfoUpdates.Rows(e.RowIndex).FindControl("txtGhin")
        Dim lblFirsttName As TextBox = MemberInfoUpdates.Rows(e.RowIndex).FindControl("txtfirstName")
        Dim lblLastName As TextBox = MemberInfoUpdates.Rows(e.RowIndex).FindControl("txtLastName")
        Dim lblPhone As TextBox = MemberInfoUpdates.Rows(e.RowIndex).FindControl("txtPhone")
        Dim lblGender As DropDownList = MemberInfoUpdates.Rows(e.RowIndex).FindControl("txtGender")
        Dim lblAddress As Label = MemberInfoUpdates.Rows(e.RowIndex).FindControl("txtAddress")
        Dim lbltxtTournamentHCP As TextBox = MemberInfoUpdates.Rows(e.RowIndex).FindControl("txtTournamentHCP")
        Dim lbltxtGhinHCP As TextBox = MemberInfoUpdates.Rows(e.RowIndex).FindControl("txtGhinHCP")

        MemberUpdates(lblMemberid.Text, lblGhin.Text, lblFirsttName.Text, lblLastName.Text, lblPhone.Text, lblGender.Text, lblAddress.Text, lbltxtTournamentHCP.Text, lbltxtGhinHCP.Text)
        MemberInfoUpdates.EditIndex = -1
        GetMemberInfo()

    End Sub

    Private Sub MemberUpdates(ByVal lblMemberid As String, ByVal lblGhin As String, ByVal lblFirsttName As String, ByVal lblLastName As String, ByVal lblPhone As String, ByVal lblGender As String, ByVal lblAddress As String, ByVal lbltxtTournamentHCP As String, ByVal lbltxtGhinHCP As String)
        Dim i As Integer = 1

        Dim sSql As String = ""

        sSql += "UPDATE [MemberInfo]"
        sSql += " SET [address]  = '" & lblAddress & "'"
        sSql += " ,[phone]  = '" & lblPhone & "'"
        sSql += " ,[firstname]  = '" & lblFirsttName & "'"
        sSql += " ,[lastname]  = '" & lblLastName & "'"
        sSql += " ,[Tournamenthandicap]  = '" & lbltxtTournamentHCP & "'"
        sSql += " ,[Ghinhandicap]  = '" & lbltxtGhinHCP & "'"
        sSql += " ,[GhinID]  = '" & lblGhin & "'"
        sSql += " ,[Gender]  = '" & lblGender & "'" 
        sSql += " WHERE Memberid= '" & lblMemberid & "'"

        ExecuteSql(sSql)

    End Sub

    Public Sub ExecuteSql(ByVal sSql As String)

        Dim cn As New SqlConnection(GetConnectionString())
        cn.Open()
        Dim cm As New SqlCommand(sSql, cn)
        cm.ExecuteNonQuery()
        cn.Close()

    End Sub


    Public Function GetDataReader(ByVal sSql As String) As SqlDataReader
        Dim cn As New SqlConnection(GetConnectionString())
        cn.Open()
        Dim cm As New SqlCommand(sSql, cn)
        Return cm.ExecuteReader(CommandBehavior.CloseConnection)
    End Function

    Public Function GetConnectionString() As String

        Dim strconnector As String = ""

        strconnector = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString

        Return strconnector

    End Function

End Class

