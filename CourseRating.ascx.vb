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
Partial Class CourseRating
    Inherits System.Web.UI.UserControl


    Private partotalout As Integer = 0
    Private partotalin As Integer = 0
    Private yardagetotalout As Integer = 0
    Private yardagetotalin As Integer = 0
    Private grandpartotal As Integer = 0
    Private grandyardagetotal As Integer = 0

    Private gamesplayed As Integer = 0
    Private ScoreTotalOut As Integer = 0
    Private ScoreTotalin As Integer = 0
    Private GrandTotal As Integer = 0
    Private NetScore As Integer = 0
    Private Thandicap As Integer = 0
    Private Ghandicap As Integer = 0


    Private Rating As Integer
    Private Slope As Integer
    Private Differential As Integer
    Protected IsAdmin As Boolean
    Private nextLocationID As Integer
    Private prevLocationID As Integer
    Const INVALIDID As Integer = -1

    Private ScorecardPairID As Integer = 0

    Public Property myIntValue() As Integer
        Get
            Return m_myIntValue
        End Get
        Set(value As Integer)
            m_myIntValue = value
        End Set
    End Property

    Private m_myIntValue As Integer

    Protected Property LocationID() As Integer
        Get
            Dim m_LocationID As Integer
            Dim id As Object = ViewState("LocationID")
            If id IsNot Nothing Then
                m_LocationID = CInt(id)
            Else
                id = Request.QueryString("LocationID")
                If id IsNot Nothing Then
                    m_LocationID = Convert.ToInt32(id)
                Else
                    m_LocationID = 0
                End If
                ViewState("LocationID") = m_LocationID
            End If
            Return m_LocationID
        End Get
        Set(value As Integer)
            ViewState("LocationID") = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        ScorecardPairID = myIntValue

        If Not IsPostBack Then
            loaddata()
        End If
    End Sub

    Private Sub loaddata()
        gridMaleRatingBindData()
        gridFemaleRatingBindData()
    End Sub


    Protected Sub gridMaleRating_DataBound(sender As Object, e As EventArgs)
        'Starting from last Row Previous Row (if 12 rows in our grid)
        ' merging last row and last previous row if same value (take 12, 11 and merge if same year)
        ' Then last previous row with second last previous row (take 11, 10 and merge if same year)
        ' etc., till first row and second row merging
        For rowIndex As Integer = gridMaleRating.Rows.Count - 2 To 0 Step -1
            Dim row As GridViewRow = gridMaleRating.Rows(rowIndex)
            Dim previousRow As GridViewRow = gridMaleRating.Rows(rowIndex + 1)
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

    Protected Sub gridMaleRating_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            'e.Row.Cells(0).Visible = False
            '' Invisibiling Year Header Cell
            'e.Row.Cells(1).Visible = False
            '' Invisibiling Period Header Cell
            '' Invisibiling Audited By Header Cell
            'e.Row.Cells(2).Visible = False
        End If
    End Sub
  
    Protected Sub gridFemaleRating_DataBound(sender As Object, e As EventArgs)
        'Starting from last Row Previous Row (if 12 rows in our grid)
        ' merging last row and last previous row if same value (take 12, 11 and merge if same year)
        ' Then last previous row with second last previous row (take 11, 10 and merge if same year)
        ' etc., till first row and second row merging
        For rowIndex As Integer = gridFemaleRating.Rows.Count - 2 To 0 Step -1
            Dim row As GridViewRow = gridFemaleRating.Rows(rowIndex)
            Dim previousRow As GridViewRow = gridFemaleRating.Rows(rowIndex + 1)
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

    Protected Sub gridFemaleRating_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            'e.Row.Cells(0).Visible = False
            '' Invisibiling Year Header Cell
            'e.Row.Cells(1).Visible = False
            '' Invisibiling Period Header Cell
            '' Invisibiling Audited By Header Cell
            'e.Row.Cells(2).Visible = False
        End If
    End Sub
 

    Private Sub gridMaleRatingBindData()
        'Dim strQuery As String = "SELECT  [tb_Scorecard].[ScorecardClosed] as scorecardsclosed, [tb_Scorecard].[ScorecardId] as ScorecardId, [tb_Scorecard].[GhinID] as [GhinID],[tb_Scorecard].[memberid] as memberid,concat([memberinfo].[firstname], ' ' ,[memberinfo].[lastname]) as playername,[Score1] ,[Score2] ,[Score3] ,[Score4] ,[Score5]   ,[Score6]  ,[Score7] ,[Score8]  ,[Score9]  ,[ScoreTotalout] FROM  [tb_Scorecard], [memberinfo] where [tb_Scorecard].[memberid] =[memberinfo].[memberid] and [PairingID] =" & ScorecardPairID & " and [LocationID]  = " & LocationID & " order by [tb_Scorecard].[GhinID]"
        Dim strQuery As String = "SELECT [RatingId]  ,[LocationId], [title] ,[FrontRating] ,[FrontSlope] ,[MiddleRating] ,[MiddleSlope] ,[BackRating] ,[BackSlope]  FROM locations, [tb_maleCourseRating] where locations.id = [tb_maleCourseRating].locationid order by title asc"

        Dim cmd As New SqlCommand(strQuery)
        gridMaleRating.DataSource = GetData(cmd)
        gridMaleRating.DataBind()

        cmd = Nothing

    End Sub

    Private Sub gridFemaleRatingBindData()
        'Dim strQuery As String = "SELECT  [tb_Scorecard].[ScorecardClosed] as scorecardsclosed, [tb_Scorecard].[ScorecardId] as ScorecardId, [tb_Scorecard].[GhinID] as [GhinID],[tb_Scorecard].[memberid] as memberid,concat([memberinfo].[firstname], ' ' ,[memberinfo].[lastname]) as playername ,[Score10],[Score11] ,[Score12]  ,[Score13],[Score14]   ,[Score15]    ,[Score16] ,[Score17]  ,[Score18] ,[ScoreTotalin] ,[GrandTotal],[memberinfo].[TournamentHandicap]  ,[memberinfo].[GhinHandicap]  ,[NetScore] FROM  [tb_Scorecard], [memberinfo] where [tb_Scorecard].[memberid] =[memberinfo].[memberid] and [PairingID] =" & ScorecardPairID & " and [LocationID]  = " & LocationID & " order by [tb_Scorecard].[GhinID]"
        Dim strQuery As String = "SELECT [RatingId]  ,[LocationId], [title] ,[FrontRating] ,[FrontSlope] ,[MiddleRating] ,[MiddleSlope] ,[BackRating] ,[BackSlope]  FROM locations, [tb_FemaleCourseRating] where locations.id = [tb_FemaleCourseRating].locationid order by title asc"

        Dim cmd As New SqlCommand(strQuery)
        gridFemaleRating.DataSource = GetData(cmd)
        gridFemaleRating.DataBind()

        cmd = Nothing

    End Sub

    Private Function GetData(ByVal cmd As SqlCommand) As DataTable

        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString

        Dim dt As New DataTable()
        Dim con As New SqlConnection(constr)
        Dim sda As New SqlDataAdapter()
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        con.Open()
        sda.SelectCommand = cmd
        sda.Fill(dt)

        con.Close()
        Return dt
    End Function


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
 
   
    Private Function getgamesplayed(mbr As String) As Integer
        Dim games As Integer = 0
        Dim drx As SqlDataReader
        drx = GetDataReader("Select count(*)  as gamesplayed  FROM [tb_Scorecard] WHERE  [tb_Scorecard].[memberid] ='" & mbr & "'")

        If drx.Read Then
            games = CInt(drx.Item("gamesplayed").ToString())
        End If

        Return games
    End Function
    Public Sub ExecuteSql(ByVal sSql As String)

        Dim cn As New SqlConnection(GetConnectionString())
        cn.Open()
        Dim cm As New SqlCommand(sSql, cn)
        cm.ExecuteNonQuery()

        cm = Nothing
        cn.Close()

    End Sub

    Protected Sub gridMaleRatingOnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gridMaleRatingBindData()
        gridMaleRating.PageIndex = e.NewPageIndex
        gridMaleRating.DataBind()
    End Sub

    Protected Sub gridMaleRatingEdit(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        gridMaleRating.EditIndex = e.NewEditIndex
        gridMaleRatingBindData()
    End Sub
    Protected Sub gridMaleRatingCancelEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        gridMaleRating.EditIndex = -1
        gridMaleRatingBindData()
    End Sub
    Protected Sub gridMaleRatingUpdate(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)

        Dim lbllocationid As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lbllocationid"), Label).Text
        Dim lblfrontRating As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblfronRating"), Label).Text
        Dim lblfrontSlope As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblfrontSlope"), Label).Text
        Dim lblmiddleRating As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblmiddleRating"), Label).Text
        Dim lblmiddleSlope As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblmiddleSlope"), Label).Text
        Dim lblbackRating As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblbackRating"), Label).Text
        Dim lblbackSlope As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblbackSlope"), Label).Text

        Dim ssql As String = "SELECT * FROM   [tb_maleCourseRating] where locationid = '" & lbllocationid & "'"

        Dim drr As SqlDataReader
        drr = GetDataReader(ssql)

        If drr.Read Then
            ssql = "UPDATE [tb_MaleCourseRating]"
            ssql += " Set [FrontRating] =" & CInt(lblfrontRating)
            ssql += " ,[FrontSlope] = " & CInt(lblfrontSlope)
            ssql += " ,[MiddleRating] = " & CInt(lblmiddleRating)
            ssql += " ,[MiddleSlope] = " & CInt(lblmiddleSlope)
            ssql += " ,[BackRating] =" & CInt(lblbackRating)
            ssql += " ,[BackSlope] = " & CInt(lblbackSlope)
            ssql += " WHERE locationid = '" & lbllocationid & "'"

        Else

            ssql = "INSERT INTO  [tb_MaleCourseRating]"
            ssql += " ([LocationId]"
            ssql += " ,[FrontRating]"
            ssql += " ,[FrontSlope]"
            ssql += " ,[MiddleRating]"
            ssql += " ,[MiddleSlope]"
            ssql += " ,[BackRating]"
            ssql += " ,[BackSlope])"
            ssql += " VALUES( "
            ssql += lbllocationid
            ssql += "," & CInt(lblfrontRating)
            ssql += "," & CInt(lblfrontSlope)
            ssql += "," & CInt(lblmiddleRating)
            ssql += "," & CInt(lblmiddleSlope)
            ssql += "," & CInt(lblbackRating)
            ssql += "," & CInt(lblbackSlope)
            ssql += " )"
        End If

        ExecuteSql(ssql)

        drr.Close()

        gridMaleRating.EditIndex = -1

        loaddata()

    End Sub



    Protected Sub gridFemaleRatingOnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        gridFemaleRatingBindData()
        gridFemaleRating.PageIndex = e.NewPageIndex
        gridFemaleRating.DataBind()
    End Sub

    Protected Sub gridFemaleRatingEdit(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        gridFemaleRating.EditIndex = e.NewEditIndex
        gridFemaleRatingBindData()
    End Sub
    Protected Sub gridFemaleRatingCancelEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        gridFemaleRating.EditIndex = -1
        gridFemaleRatingBindData()
    End Sub
    Protected Sub gridFemaleRatingUpdate(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)

        Dim lbllocationid As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lbllocationid"), Label).Text
        Dim lblfrontRating As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblfronRating"), Label).Text
        Dim lblfrontSlope As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblfrontSlope"), Label).Text
        Dim lblmiddleRating As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblmiddleRating"), Label).Text
        Dim lblmiddleSlope As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblmiddleSlope"), Label).Text
        Dim lblbackRating As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblbackRating"), Label).Text
        Dim lblbackSlope As String = DirectCast(gridFemaleRating.Rows(e.RowIndex).FindControl("lblbackSlope"), Label).Text

        Dim ssql As String = "SELECT * FROM   [tb_FeMaleCourseRating] where locationid = '" & lbllocationid & "'"

        Dim drr As SqlDataReader
        drr = GetDataReader(ssql)

        If drr.Read Then
            ssql = "UPDATE [tb_FeMaleCourseRating]"
            ssql += " Set [FrontRating] =" & CInt(lblfrontRating)
            ssql += " ,[FrontSlope] = " & CInt(lblfrontSlope)
            ssql += " ,[MiddleRating] = " & CInt(lblmiddleRating)
            ssql += " ,[MiddleSlope] = " & CInt(lblmiddleSlope)
            ssql += " ,[BackRating] =" & CInt(lblbackRating)
            ssql += " ,[BackSlope] = " & CInt(lblbackSlope)
            ssql += " WHERE locationid = '" & lbllocationid & "'"

        Else

            ssql = "INSERT INTO  [tb_FeMaleCourseRating]"
            ssql += " ([LocationId]"
            ssql += " ,[FrontRating]"
            ssql += " ,[FrontSlope]"
            ssql += " ,[MiddleRating]"
            ssql += " ,[MiddleSlope]"
            ssql += " ,[BackRating]"
            ssql += " ,[BackSlope])"
            ssql += " VALUES( "
            ssql += lbllocationid
            ssql += "," & CInt(lblfrontRating)
            ssql += "," & CInt(lblfrontSlope)
            ssql += "," & CInt(lblmiddleRating)
            ssql += "," & CInt(lblmiddleSlope)
            ssql += "," & CInt(lblbackRating)
            ssql += "," & CInt(lblbackSlope)
            ssql += " )"
        End If

        ExecuteSql(ssql)

        drr.Close()

        gridFemaleRating.EditIndex = -1

        loaddata()

    End Sub




End Class
