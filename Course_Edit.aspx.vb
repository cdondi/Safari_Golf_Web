
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
Imports calendarVB.Helper

Imports System.Net.Mail
Partial Public Class Events_Calendar
    Inherits DevCowThemePage
    Protected IsAdmin As Boolean
    Private nextLocationID As Integer
    Private prevLocationID As Integer
    Const INVALIDID As Integer = -1
    Private tmpCategoryName As String = ""
    Private MaleRating As Integer
    Private MaleSlope As Integer
    Private FemaleRating As Integer
    Private FemaleSlope As Integer

    Private Differential As Integer

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
                    m_LocationID = getlocationid()
                End If
                ViewState("LocationID") = m_LocationID
            End If
            Return m_LocationID
        End Get
        Set(value As Integer)
            ViewState("LocationID") = value
        End Set
    End Property

    Protected Property DateID() As Date
        Get
            Dim m_DateID As Date

            ID = Request.QueryString("DateID")

            If ID IsNot Nothing Then
                m_DateID = Convert.ToDateTime(ID)
            Else
                m_DateID = getdateid()
            End If

            m_DateID = m_DateID.ToString("d")

            Return m_DateID

        End Get
        Set(value As Date)
            ViewState("DateID") = value
        End Set
    End Property
    Private Function getlocationid() As Integer
        Dim ssql As String = "SELECT top 1 Events.location frOM Events wHERE (Events.starttime > getdate() OR(Events.starttime = getdate())) ORDER BY Events.starttime asc, Events.id asc "
     
        Dim loc As Integer = 0


        Dim oHelper As New calendarVB.Helper

        Dim drr As SqlDataReader = oHelper.GetDataReader(ssql)


        If drr.Read Then
            loc = CInt(drr.Item("location").ToString()) 
        End If
        drr.Close()

        Return loc

    End Function

    Private Function getdateid() As Date

        Dim ssql As String = "SELECT top 1 Events.starttime frOM Events wHERE (Events.starttime > getdate() OR(Events.starttime = getdate())) ORDER BY Events.starttime asc, Events.id asc "
        Dim drr As SqlDataReader

        Dim date1 As Date = DateTime.Now


        Dim oHelper As New calendarVB.Helper

        drr = oHelper.GetDataReader(ssql)


        If drr.Read Then
            date1 = CDate(drr.Item("starttime").ToString())
        End If
        drr.Close()

        Return date1

    End Function
    Protected Sub Page_Load(sender As Object, e As EventArgs)
 
        If Not IsPostBack Then

            bindalldata()
        End If

    End Sub

    'Protected Sub CourseList1_SelectedIndexChanged(sender As Object, e As System.EventArgs)
    '    bindalldata()

    'End Sub

    Private Sub bindalldata()
        Dim ssql As String = "" 
     
        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim query As String = "SELECT [memberinfo].[memberid] as memberid,  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap, RSVP, Guests FROM [memberinfo], [MemberEvite]  where [MemberEvite].[memberid]= [memberinfo].[memberid] and  [MemberEvite].[locationid] = " & LocationID & " and firstname <> 'admin' order by RSVP desc,  lastname asc"
        Dim con As New SqlConnection(constr)
        Dim sda As New SqlDataAdapter(query, con)
        Dim dt As New DataTable()
        dt.Clear()

        sda.Fill(dt)

        con.Close()

        grdViewLocationsBindData() 
         

        gridMaleRatingBindData()
        gridFemaleRatingBindData()


        Dim ssql2 As String = "SELECT [Locations].[title] as title from locations where id =" & LocationID()


        Dim dr2 As SqlDataReader
        dr2 = GetDataReader(ssql2)
        While dr2.Read
            coursename0.Text = Trim(dr2.Item("title").ToString()) 
        End While
        dr2.Close()

    End Sub

    'Protected Sub gvAll_DataBound(sender As Object, e As EventArgs)
    '    For rowIndex As Integer = gvAll.column.Count - 1
    '        Dim row As GridViewRow = gvAll.Rows(rowIndex)
    '        row.Cells(5).Visible = False
    '        row.Cells(6).Visible = False
    '        row.Cells(7).Visible = False
    '    Next
    'End Sub

  
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

        Dim ssqlr As String = "SELECT * from tb_maleCourseRating"
        ssqlr += " WHERE locationid = '" & LocationID & "'"
        Dim drr As SqlDataReader
    
        Dim oHelper As New calendarVB.Helper

        drr = oHelper.GetDataReader(ssqlr)
        If Not drr.Read Then

            Dim ssql As String = "INSERT [tb_MaleCourseRating] ([LocationId],[FrontRating] ,[FrontSlope] ,[MiddleRating] ,[MiddleSlope] ,[BackRating] ,[BackSlope]) VALUES ('" & LocationID & "',70.2 ,111 ,71.2 ,112 ,72.1 ,113)"

            ExecuteSql(ssql)

        End If
        drr.Close()

        'Dim strQuery As String = "SELECT  [tb_Scorecard].[ScorecardClosed] as scorecardsclosed, [tb_Scorecard].[ScorecardId] as ScorecardId, [tb_Scorecard].[GhinID] as [GhinID],[tb_Scorecard].[memberid] as memberid,concat([memberinfo].[firstname], ' ' ,[memberinfo].[lastname]) as playername,[Score1] ,[Score2] ,[Score3] ,[Score4] ,[Score5]   ,[Score6]  ,[Score7] ,[Score8]  ,[Score9]  ,[ScoreTotalout] FROM  [tb_Scorecard], [memberinfo] where [tb_Scorecard].[memberid] =[memberinfo].[memberid] and [PairingID] =" & ScorecardPairID & " and [LocationID]  = " & LocationID & " order by [tb_Scorecard].[GhinID]"
        Dim strQuery As String = "SELECT [RatingId]  ,[LocationId], [title] ,[FrontRating] ,[FrontSlope] ,[MiddleRating] ,[MiddleSlope] ,[BackRating] ,[BackSlope]  FROM locations, [tb_maleCourseRating] where locations.id = [tb_maleCourseRating].locationid and [tb_maleCourseRating].locationid = " & LocationID & " order by title asc"

        Dim cmd As New SqlCommand(strQuery)
        gridMaleRating.DataSource = GetData(cmd)
        gridMaleRating.DataBind()


        ssqlr = "SELECT * from tb_maleCourseRating"
        ssqlr += " WHERE locationid = '" & LocationID & "'"

        drr = GetDataReader(ssqlr)

        If drr.Read Then
 

        End If
        drr.Close()

    End Sub

    Private Sub gridFemaleRatingBindData()

        Dim ssqlr As String = "SELECT * from tb_FemaleCourseRating"
        ssqlr += " WHERE locationid = '" & LocationID & "'"
        Dim drr As SqlDataReader
        drr = GetDataReader(ssqlr)

        If Not drr.Read Then

            Dim ssql As String = "INSERT [tb_FemaleCourseRating] ([LocationId],[FrontRating] ,[FrontSlope] ,[MiddleRating] ,[MiddleSlope] ,[BackRating] ,[BackSlope]) VALUES ('" & LocationID & "',70.2 ,111 ,71.2 ,112 ,72.1 ,113)"

            ExecuteSql(ssql)

        End If
        drr.Close()
        'Dim strQuery As String = "SELECT  [tb_Scorecard].[ScorecardClosed] as scorecardsclosed, [tb_Scorecard].[ScorecardId] as ScorecardId, [tb_Scorecard].[GhinID] as [GhinID],[tb_Scorecard].[memberid] as memberid,concat([memberinfo].[firstname], ' ' ,[memberinfo].[lastname]) as playername ,[Score10],[Score11] ,[Score12]  ,[Score13],[Score14]   ,[Score15]    ,[Score16] ,[Score17]  ,[Score18] ,[ScoreTotalin] ,[GrandTotal],[memberinfo].[TournamentHandicap]  ,[memberinfo].[GhinHandicap]  ,[NetScore] FROM  [tb_Scorecard], [memberinfo] where [tb_Scorecard].[memberid] =[memberinfo].[memberid] and [PairingID] =" & ScorecardPairID & " and [LocationID]  = " & LocationID & " order by [tb_Scorecard].[GhinID]"
        Dim strQuery As String = "SELECT [RatingId]  ,[LocationId], [title] ,[FrontRating] ,[FrontSlope] ,[MiddleRating] ,[MiddleSlope] ,[BackRating] ,[BackSlope]  FROM locations, [tb_FemaleCourseRating] where locations.id = [tb_FemaleCourseRating].locationid  and [tb_femaleCourseRating].locationid = " & LocationID & " order by title asc"

        Dim cmd As New SqlCommand(strQuery)
        gridFemaleRating.DataSource = GetData(cmd)
        gridFemaleRating.DataBind()


        ssqlr = "SELECT * from tb_femaleCourseRating"
        ssqlr += " WHERE locationid = '" & LocationID & "'"

        drr = GetDataReader(ssqlr)

        If drr.Read Then

          
        End If
        drr.Close()

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

        Dim lbllocationid As Label = grdViewLocations.Rows(e.RowIndex).FindControl("lblLocationsID")
        Dim lblfrontRating As TextBox = gridMaleRating.Rows(e.RowIndex).FindControl("txtfrontRating")
        Dim lblfrontSlope As TextBox = gridMaleRating.Rows(e.RowIndex).FindControl("txtfrontSlope")
        Dim lblmiddleRating As TextBox = gridMaleRating.Rows(e.RowIndex).FindControl("txtmiddleRating")
        Dim lblmiddleSlope As TextBox = gridMaleRating.Rows(e.RowIndex).FindControl("txtmiddleSlope")
        Dim lblbackRating As TextBox = gridMaleRating.Rows(e.RowIndex).FindControl("txtbackRating")
        Dim lblbackSlope As TextBox = gridMaleRating.Rows(e.RowIndex).FindControl("txtbackSlope")

        Dim ssql As String = ""

        ssql = "UPDATE [tb_MaleCourseRating]"
        ssql += " Set [FrontRating] =" & CDec(lblfrontRating.Text)
        ssql += " ,[FrontSlope] = " & CDec(lblfrontSlope.Text)
        ssql += " ,[MiddleRating] = " & CDec(lblmiddleRating.Text)
        ssql += " ,[MiddleSlope] = " & CDec(lblmiddleSlope.Text)
        ssql += " ,[BackRating] =" & CDec(lblbackRating.Text)
        ssql += " ,[BackSlope] = " & CDec(lblbackSlope.Text)
        ssql += " WHERE locationid = '" & lbllocationid.Text & "'"

        ExecuteSql(ssql)

        gridMaleRating.EditIndex = -1
        gridMaleRatingBindData()

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
        
        Dim lbllocationid As Label = grdViewLocations.Rows(e.RowIndex).FindControl("lblLocationsID")
        Dim lblfrontRating As TextBox = gridFemaleRating.Rows(e.RowIndex).FindControl("txtfrontRating")
        Dim lblfrontSlope As TextBox = gridFemaleRating.Rows(e.RowIndex).FindControl("txtfrontSlope")
        Dim lblmiddleRating As TextBox = gridFemaleRating.Rows(e.RowIndex).FindControl("txtmiddleRating")
        Dim lblmiddleSlope As TextBox = gridFemaleRating.Rows(e.RowIndex).FindControl("txtmiddleSlope")
        Dim lblbackRating As TextBox = gridFemaleRating.Rows(e.RowIndex).FindControl("txtbackRating")
        Dim lblbackSlope As TextBox = gridFemaleRating.Rows(e.RowIndex).FindControl("txtbackSlope")

        Dim ssql As String = ""

        ssql = "UPDATE [tb_FemaleCourseRating]"
        ssql += " Set [FrontRating] =" & CDec(lblfrontRating.Text)
        ssql += " ,[FrontSlope] = " & CDec(lblfrontSlope.Text)
        ssql += " ,[MiddleRating] = " & CDec(lblmiddleRating.Text)
        ssql += " ,[MiddleSlope] = " & CDec(lblmiddleSlope.Text)
        ssql += " ,[BackRating] =" & CDec(lblbackRating.Text)
        ssql += " ,[BackSlope] = " & CDec(lblbackSlope.Text)
        ssql += " WHERE locationid = '" & lbllocationid.Text & "'"

        ExecuteSql(ssql)

        gridFemaleRating.EditIndex = -1
        gridFemaleRatingBindData()

    End Sub



    'Private Function LocationID() As Integer

    '    Dim id As Integer = CourseList1.SelectedItem.Value

    '    Return id

    'End Function



    Protected Sub grdViewLocationsEditLocation(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        grdViewLocations.EditIndex = e.NewEditIndex
        grdViewLocationsBindData()
    End Sub
    Protected Sub grdViewLocationsCancelEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        grdViewLocations.EditIndex = -1
        grdViewLocationsBindData()
    End Sub
    Protected Sub grdViewLocationsUpdate(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)

        Dim lblhole1 As Label = grdViewLocations.Rows(e.RowIndex).FindControl("txtHole")
        Dim lblYards1 As TextBox = grdViewLocations.Rows(e.RowIndex).FindControl("txtYardage")
        Dim lblPar1 As TextBox = grdViewLocations.Rows(e.RowIndex).FindControl("txtPar")
        Dim lblHCP1 As TextBox = grdViewLocations.Rows(e.RowIndex).FindControl("txtHandicap")

        updateHoles(lblhole1.Text, lblYards1.Text, lblPar1.Text, lblHCP1.Text)
        grdViewLocations.EditIndex = -1

        grdViewLocationsBindData()

    End Sub

    Private Sub updateHoles(ByVal lblhole1 As String, ByVal lblYards1 As String, ByVal lblPar1 As String, ByVal hcp2 As String)
        Dim i As Integer = 1

        Dim sSql As String = ""

        sSql += "UPDATE [tb_hole]"
        sSql += " SET [Yardage] = " & lblYards1
        sSql += " ,[Par] = " & lblPar1
        sSql += " ,[Handicap] = " & hcp2
        sSql += " WHERE locationid = " & LocationID
        sSql += " and ordinal = " & lblhole1

        ExecuteSql(sSql)

    End Sub

    Protected Sub grdViewLocations_DataBound(sender As Object, e As EventArgs)
        'Starting from last Row Previous Row (if 12 rows in our grid)
        ' merging last row and last previous row if same value (take 12, 11 and merge if same year)
        ' Then last previous row with second last previous row (take 11, 10 and merge if same year)
        ' etc., till first row and second row merging
        For rowIndex As Integer = grdViewLocations.Rows.Count - 2 To 0 Step -1
            Dim row As GridViewRow = grdViewLocations.Rows(rowIndex)
            Dim previousRow As GridViewRow = grdViewLocations.Rows(rowIndex + 1)
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

    Protected Sub grdViewLocations_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            'e.Row.Cells(0).Visible = False
            '' Invisibiling Year Header Cell
            'e.Row.Cells(1).Visible = False
            '' Invisibiling Period Header Cell
            '' Invisibiling Audited By Header Cell
            'e.Row.Cells(2).Visible = False
        End If
    End Sub

    Private Sub grdViewLocationsBindData()

        Dim strQuery As String = "SELECT [HoleId],[LocationId] ,[Ordinal],[Yardage],[Par],[Handicap] from [tb_Hole] where [LocationId] = " & LocationID & " order by [Ordinal]"

        Dim cmd As New SqlCommand(strQuery)
        grdViewLocations.DataSource = GetData(cmd)
        grdViewLocations.DataBind()
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


    Protected Sub grdViewLocationsOnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        grdViewLocationsBindData()
        grdViewLocations.PageIndex = e.NewPageIndex
        grdViewLocations.DataBind()
    End Sub


    'Private Sub BindCourseGrid()

    '    Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
    '    Dim query As String = "SELECT   GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo] where firstname <> 'admin' order by lastname asc"
    '    Dim con As New SqlConnection(constr)
    '    Dim sda As New SqlDataAdapter(query, con)
    '    Dim dt As New DataTable()
    '    dt.Clear()

    '    sda.Fill(dt)
    '    gvAll.DataSource = dt
    '    gvAll.DataBind()

    '    'Dim strQuery As String = "SELECT  [tb_Scorecard].[ScorecardClosed] as scorecardsclosed, [tb_Scorecard].[ScorecardId] as ScorecardId, [tb_Scorecard].[GhinID] as [GhinID],[tb_Scorecard].[memberid] as memberid,concat([memberinfo].[firstname], ' ' ,[memberinfo].[lastname]) as playername,[Score1] ,[Score2] ,[Score3] ,[Score4] ,[Score5]   ,[Score6]  ,[Score7] ,[Score8]  ,[Score9]  ,[ScoreTotalout] FROM  [tb_Scorecard], [memberinfo] where [tb_Scorecard].[memberid] =[memberinfo].[memberid] and [PairingID] =" & ScorecardPairID & " and [LocationID]  = " & LocationID & " order by [tb_Scorecard].[GhinID]"

    '    'Dim ssql As String = "SELECT [LocationId] , [Holeid], [Ordinal] as Hole,[Yardage] as yards ,[Par],[Handicap] as hcp  FROM [tb_Hole] where [LocationId] = " & LocationID & " order by [ordinal] asc"

    '    'Dim cmd As New SqlCommand(ssql)
    '    'grdViewLocations.DataSource = GetData(cmd)
    '    'grdViewLocations.DataBind()
    '    CourseList1.Items.Clear()

    '    'lblScorecardSave.Text = "Can be updated by:" & lblUserNameScore1.Text & " " & lblUserNameScore2.Text & " " & lblUserNameScore3.Text & " " & lblUserNameScore4.Text & " " & lblUserNameScore5.Text
    '    Dim ii As Integer = 0
    '    Dim locount As Integer = 0

    '    Dim ssqlr As String = "SELECT count(*) as locount FROM Events LEFT OUTER JOIN Locations ON Events.location = Locations.id WHERE (Events.starttime > GETDATE() OR Events.starttime = GETDATE())"
    '    Dim drr As SqlDataReader
    '    drr = GetDataReader(ssqlr)

    '    If drr.Read Then

    '        locount = CInt(drr.Item("locount").ToString())

    '    End If

    '    drr.Close()

    '    If locount > 0 Then
    '        ssqlr = "SELECT Events.id, Events.starttime as starttime, Events.title, Events.description, Locations.id as id, locations.title AS locationname	FROM Events LEFT OUTER JOIN Locations ON Events.location = Locations.id WHERE (Events.starttime > GETDATE() OR Events.starttime = GETDATE()) ORDER BY Events.starttime asc, Events.id asc"

    '        drr = GetDataReader(ssqlr)

    '        Dim items(locount - 1) As ListItem

    '        While drr.Read

    '            items(ii) = New ListItem(drr.Item("starttime").ToString() & "-" & drr.Item("locationname").ToString(), drr.Item("id").ToString())
    '            ii = ii + 1

    '        End While

    '        drr.Close()

    '        CourseList1.Items.AddRange(items)

    '        CourseList1.DataBind()

    '    End If
    'End Sub


   
    Protected Sub pn1_SelectedPageChanged(sender As Object, e As EventArgs)

    End Sub
    Protected Sub Pn2_SelectedPageChanged(sender As Object, e As EventArgs)

    End Sub
    Protected Sub HolesScoreGrid_RowDataBound(sender As Object, e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then

        End If
    End Sub
    Protected Sub PlayerScoreGrid_RowDataBound(sender As Object, e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then

        End If
    End Sub

    Private Function CreateScoreCardDataTable() As DataTable
        Dim dt As New DataTable()
        dt.Columns.Add("description")
        dt.Columns.Add("Hole1")
        dt.Columns.Add("Hole2")
        dt.Columns.Add("Hole3")
        dt.Columns.Add("Hole4")
        dt.Columns.Add("Hole5")
        dt.Columns.Add("Hole6")
        dt.Columns.Add("Hole7")
        dt.Columns.Add("Hole8")
        dt.Columns.Add("Hole9")
        dt.Columns.Add("TotalOUT")
        dt.Columns.Add("Hole10")
        dt.Columns.Add("Hole11")
        dt.Columns.Add("Hole12")
        dt.Columns.Add("Hole13")
        dt.Columns.Add("Hole14")
        dt.Columns.Add("Hole15")
        dt.Columns.Add("Hole16")
        dt.Columns.Add("Hole17")
        dt.Columns.Add("Hole18")
        dt.Columns.Add("TotalIN")
        dt.Columns.Add("GrandTotal")
        dt.Columns.Add("Handicap1")
        dt.Columns.Add("Handicap2")
        dt.Columns.Add("Net")
        dt.AcceptChanges()

        '1.Holes, 1-9, 'out', 10-18, 'in', 'grandtotal', 'hcp1', 'hcp2', 'net' 
        '2.Yards, 1-9, out, 10-18, in, grandtotal, Blank,Blank,,Blank   
        '3.HCP, 1-9, Blank, 10-18, Blank, Blank, Blank,Blank   
        '4.Player1, 1-9, out, 10-18,in, grandtotal, ,hcp1, hcp2, net       
        '5.Player2, 1-9, out, 10-18,in, grandtotal,hcp, hcp2, net  
        '6.Player3, 1-9, out, 10-18,in, grandtotal, hcp1, hcp2, net      
        '7.Player4, 1-9, out, 10-18,in, grandtotal, hcp1, hcp2, net 
        '8.Par, 1-9, out, 10-18, in, Blank, Blank,Blank   
        Dim partotalout As Integer = 0
        Dim partotalin As Integer = 0
        Dim yardagetotalout As Integer = 0
        Dim yardagetotalin As Integer = 0
        Dim grandpartotal As Integer = 0
        Dim grandyardagetotal As Integer = 0

        Dim i As Integer = 1

        Dim ssqlr As String = "SELECT sum([Par]) as total FROM [tb_Hole] where [LocationId] = 1 and [Ordinal] IN (1, 2, 3,4,5,6,7,8,9) union SELECT sum([Par]) as total FROM [tb_Hole] where [LocationId] = " & LocationID() & "  and [Ordinal] IN (10, 11,12, 13,14,15,16,17,18) union SELECT sum([Yardage]) as total FROM [tb_Hole] where [LocationId] = " & LocationID() & "  and [Ordinal] IN (1, 2, 3,4,5,6,7,8,9) union SELECT sum([Yardage]) as total FROM [tb_Hole] where [LocationId] = " & LocationID() & "  and [Ordinal] IN (10, 11,12, 13,14,15,16,17,18)  "
        Dim drr As SqlDataReader
        drr = GetDataReader(ssqlr)

        While drr.Read

            Dim drow As DataRow = dt.NewRow()
            If i = 1 Then
                partotalout = drr.Item("total").ToString()
            End If
            If i = 2 Then
                partotalin = drr.Item("total").ToString()
            End If
            If i = 3 Then
                yardagetotalout = drr.Item("total").ToString()
            End If
            If i = 4 Then
                yardagetotalin = drr.Item("total").ToString()
            End If

            i = i + 1
        End While
        drr.Close()

        grandpartotal = partotalout + partotalin
        grandyardagetotal = yardagetotalout + yardagetotalin

        i = 1
        Dim blank As String = ""

        Dim ssql As String = "Select  * from (SELECT [Ordinal],[Par] FROM [tb_Hole] where [LocationId] = " & LocationID() & " ) as s PIVOT (max(Par) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt union Select  * from (SELECT [Ordinal],[Yardage] FROM [tb_Hole] where [LocationId] = " & LocationID() & " ) as s PIVOT (max(Yardage) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt union Select * from (SELECT [Ordinal],[Handicap] FROM [tb_Hole] where [LocationId] = " & LocationID() & "  ) as s PIVOT (max(Handicap) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt"
        Dim dr As SqlDataReader
        dr = GetDataReader(ssql)

        Dim drowx As DataRow = dt.NewRow()
        dt.Rows.Add(New Object() {"Hole", "1", "2", "3", "4", "5", "6", "7", "8", "9", "ToTalOut", "10", "11", "12", "13", "14", "15", "16", "17", "18", "ToTalIn", "GrandToTal", "TournamentHCP", "GhinHCP", "NetScore"})

        While dr.Read

            Dim drow As DataRow = dt.NewRow()
            If i = 1 Then
                dt.Rows.Add(New Object() {"Par", dr.Item("1").ToString(), dr.Item("2").ToString(), dr.Item("3").ToString(), dr.Item("4").ToString(), dr.Item("5").ToString(), dr.Item("6").ToString(), dr.Item("7").ToString(), dr.Item("8").ToString(), dr.Item("9").ToString(), yardagetotalout, dr.Item("10").ToString(), dr.Item("11").ToString(), dr.Item("12").ToString(), dr.Item("13").ToString(), dr.Item("14").ToString(), dr.Item("15").ToString(), dr.Item("16").ToString(), dr.Item("17").ToString(), dr.Item("18").ToString(), yardagetotalin, grandyardagetotal, blank, blank, blank})
            End If
            If i = 2 Then
                dt.Rows.Add(New Object() {"HCP", dr.Item("1").ToString(), dr.Item("2").ToString(), dr.Item("3").ToString(), dr.Item("4").ToString(), dr.Item("5").ToString(), dr.Item("6").ToString(), dr.Item("7").ToString(), dr.Item("8").ToString(), dr.Item("9").ToString(), yardagetotalout, dr.Item("10").ToString(), dr.Item("11").ToString(), dr.Item("12").ToString(), dr.Item("13").ToString(), dr.Item("14").ToString(), dr.Item("15").ToString(), dr.Item("16").ToString(), dr.Item("17").ToString(), dr.Item("18").ToString(), blank, blank, blank, blank, blank})
            End If
            If i = 3 Then
                dt.Rows.Add(New Object() {"Yards", dr.Item("1").ToString(), dr.Item("2").ToString(), dr.Item("3").ToString(), dr.Item("4").ToString(), dr.Item("5").ToString(), dr.Item("6").ToString(), dr.Item("7").ToString(), dr.Item("8").ToString(), dr.Item("9").ToString(), yardagetotalout, dr.Item("10").ToString(), dr.Item("11").ToString(), dr.Item("12").ToString(), dr.Item("13").ToString(), dr.Item("14").ToString(), dr.Item("15").ToString(), dr.Item("16").ToString(), dr.Item("17").ToString(), dr.Item("18").ToString(), partotalin, grandpartotal, blank, blank, blank})
            End If

            i = i + 1
        End While
        dr.Close()

        'Dim ssql2 As String = "SELECT [Locations].[id] as id, [Locations].[title] as title, [memberinfo].[firstname] as firstname,[memberinfo].[lastname] as lastname,[tb_scorecard].[scorecardid] as scorecardid , [memberinfo].[Tournamenthandicap],[memberinfo].[ghinhandicap],[tb_Pairing].[SequenceId],   sum([tb_score].[strokes]) as totalscore,CASE WHEN [memberinfo].[Tournamenthandicap] > [memberinfo].[ghinhandicap] THEN sum([tb_score].[strokes]) - [memberinfo].[ghinhandicap] ELSE sum([tb_score].[strokes]) - [memberinfo].[Tournamenthandicap] END as Netscore  FROM [Locations], [memberinfo],  [tb_scorecard],  [tb_hole],[tb_score], [tb_Pairing] where [Locations].[id] = [tb_scorecard].[locationid] and [tb_scorecard].[memberid] =[memberinfo].[memberid] and [tb_score].[scorecardid]=[tb_scorecard].[scorecardid] and [memberinfo].[memberid]=[tb_scorecard].[memberid] and [tb_hole].[locationid]=[Locations].[id] and [Locations].[id] = 1 and [tb_Pairing].[locationid]=[Locations].[id] and [tb_Pairing].[memberid]=[memberinfo].[memberid]  and [tb_Pairing].[SequenceId] = 1 group by [Locations].[id], [Locations].[title], [memberinfo].[firstname], [memberinfo].[lastname],[tb_scorecard].[scorecardid],[memberinfo].[Tournamenthandicap] , [memberinfo].[Ghinhandicap],[tb_Pairing].[SequenceId]"
        'Dim dr2 As SqlDataReader
        'dr2 = GetDataReader(ssql2)
        'While dr2.Read
        '    '4.Player1, 1-9, out, 10-18 ,"ToTalIn", "GrandToTal", "TournamentHCP", "GhinHCP", "NetScore"       
        '    Dim drow As DataRow = dt.NewRow()
        '    dt.Rows.Add(New Object() {dr2.Item("firstname").ToString() & " " & dr2.Item("lastname").ToString(), blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, dr2.Item("Totalscore").ToString(), dr2.Item("tournamenthandicap").ToString(), dr2.Item("Ghinhandicap").ToString(), dr2.Item("Netscore").ToString()})

        'End While
        'dr2.Close()
        'Dim strDetail As String = ""
        'For Each row As DataRow In dt.Rows
        '    strDetail = strDetail & "|" & row("description")
        '    strDetail = strDetail & "|" & strDetail & "|" & row("Hole1")
        '    strDetail = strDetail & "|" & row("Hole2")
        '    strDetail = strDetail & "|" & row("Hole3")
        '    strDetail = strDetail & "|" & row("Hole4")
        '    strDetail = strDetail & "|" & row("Hole5")
        '    strDetail = strDetail & "|" & row("Hole6")
        '    strDetail = strDetail & "|" & row("Hole7")
        '    strDetail = strDetail & "|" & row("Hole8")
        '    strDetail = strDetail & "|" & row("Hole9")
        '    strDetail = strDetail & "|" & row("TotalOUT")
        '    strDetail = strDetail & "|" & row("Hole10")
        '    strDetail = strDetail & "|" & row("Hole11")
        '    strDetail = strDetail & "|" & row("Hole12")
        '    strDetail = strDetail & "|" & row("Hole13")
        '    strDetail = strDetail & "|" & row("Hole14")
        '    strDetail = strDetail & "|" & row("Hole15")
        '    strDetail = strDetail & "|" & row("Hole16")
        '    strDetail = strDetail & "|" & row("Hole17")
        '    strDetail = strDetail & "|" & row("Hole18")
        '    strDetail = strDetail & "|" & row("TotalIN")
        '    strDetail = strDetail & "|" & row("GrandTotal")
        '    strDetail = strDetail & "|" & row("Handicap1")
        '    strDetail = strDetail & "|" & row("Handicap2")
        '    strDetail = strDetail & "|" & row("Net")

        '    'Response.Write(strDetail & "<br>")
        'Next row

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

    'Private Sub BindPrimaryGrid()
    '    Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
    '    Dim query As String = "SELECT   GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo] where firstname <> 'admin' order by lastname asc"
    '    Dim con As New SqlConnection(constr)
    '    Dim sda As New SqlDataAdapter(query, con)
    '    Dim dt As New DataTable()
    '    dt.Clear()

    '    sda.Fill(dt)
    '    gvAll.DataSource = dt
    '    gvAll.DataBind()


    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 1 and [LocationID] =" & LocationID & "  order by firstname asc"

    '    Dim sdapair1 As New SqlDataAdapter(query, con)
    '    Dim dtpair1 As New DataTable()
    '    sdapair1.Fill(dtpair1)
    '    gvSelected1.DataSource = dtpair1
    '    gvSelected1.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 2 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair2 As New SqlDataAdapter(query, con)
    '    Dim dtpair2 As New DataTable()
    '    sdapair2.Fill(dtpair2)
    '    gvSelected2.DataSource = dtpair2
    '    gvSelected2.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 3 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair3 As New SqlDataAdapter(query, con)
    '    Dim dtpair3 As New DataTable()
    '    sdapair3.Fill(dtpair3)
    '    gvSelected3.DataSource = dtpair3
    '    gvSelected3.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 4 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair4 As New SqlDataAdapter(query, con)
    '    Dim dtpair4 As New DataTable()
    '    sdapair4.Fill(dtpair4)
    '    gvSelected4.DataSource = dtpair4
    '    gvSelected4.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 5 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair5 As New SqlDataAdapter(query, con)
    '    Dim dtpair5 As New DataTable()
    '    sdapair5.Fill(dtpair5)
    '    gvSelected5.DataSource = dtpair5
    '    gvSelected5.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 6 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair6 As New SqlDataAdapter(query, con)
    '    Dim dtpair6 As New DataTable()
    '    sdapair6.Fill(dtpair6)
    '    gvSelected6.DataSource = dtpair6
    '    gvSelected6.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 7 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair7 As New SqlDataAdapter(query, con)
    '    Dim dtpair7 As New DataTable()
    '    sdapair7.Fill(dtpair7)
    '    gvSelected7.DataSource = dtpair7
    '    gvSelected7.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 8 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair8 As New SqlDataAdapter(query, con)
    '    Dim dtpair8 As New DataTable()
    '    sdapair8.Fill(dtpair8)
    '    gvSelected8.DataSource = dtpair8
    '    gvSelected8.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 9 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair9 As New SqlDataAdapter(query, con)
    '    Dim dtpair9 As New DataTable()
    '    sdapair9.Fill(dtpair9)
    '    gvSelected9.DataSource = dtpair9
    '    gvSelected9.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 10 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair10 As New SqlDataAdapter(query, con)
    '    Dim dtpair10 As New DataTable()
    '    sdapair10.Fill(dtpair10)
    '    gvSelected10.DataSource = dtpair10
    '    gvSelected10.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 11 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair11 As New SqlDataAdapter(query, con)
    '    Dim dtpair11 As New DataTable()
    '    sdapair11.Fill(dtpair11)
    '    gvSelected11.DataSource = dtpair11
    '    gvSelected11.DataBind()

    '    query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 12 and [LocationID] = " & LocationID & "  order by firstname asc"

    '    Dim sdapair12 As New SqlDataAdapter(query, con)
    '    Dim dtpair12 As New DataTable()
    '    sdapair12.Fill(dtpair12)
    '    gvSelected12.DataSource = dtpair12
    '    gvSelected12.DataBind()

    'End Sub
    Private Function CreateDataTable() As DataTable
        Dim dt As New DataTable()
        dt.Columns.Add("GhinID")
        dt.Columns.Add("firstname")
        dt.Columns.Add("lastname")
        dt.Columns.Add("Tournamenthandicap")
        dt.Columns.Add("Ghinhandicap")
        dt.AcceptChanges()
        Return dt
    End Function

    Private Function AddRow(ByVal gvRow As GridViewRow, ByVal dt As DataTable) As DataTable
        Dim dr As DataRow() = dt.Select("GhinID = '" _
                                    & gvRow.Cells(1).Text & "'")
        If dr.Length <= 0 Then
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("GhinID") = gvRow.Cells(1).Text
            dt.Rows(dt.Rows.Count - 1)("firstname") = gvRow.Cells(2).Text
            dt.Rows(dt.Rows.Count - 1)("lastname") = gvRow.Cells(3).Text
            dt.Rows(dt.Rows.Count - 1)("Tournamenthandicap") = gvRow.Cells(4).Text
            dt.Rows(dt.Rows.Count - 1)("Ghinhandicap") = gvRow.Cells(5).Text
            dt.AcceptChanges()
        End If
        Return dt

    End Function

    Private Function RemoveRow(ByVal gvRow As GridViewRow, ByVal dt As DataTable) As DataTable
        Dim dr As DataRow() = dt.Select("GhinID = '" _
                                    & gvRow.Cells(1).Text & "'")
        If dr.Length > 0 Then
            dt.Rows.Remove(dr(0))
            dt.AcceptChanges()
        End If
        Return dt
    End Function
     


    Public Sub ExecuteSql(ByVal sSql As String)

        Dim cn As New SqlConnection(GetConnectionString())
        cn.Open()
        Dim cm As New SqlCommand(sSql, cn)
        cm.ExecuteNonQuery()
        cn.Close()

    End Sub


    Private Function getevid(llc As Integer) As Integer
        Dim ssql As String = "SELECT top 1 Events.id frOM Events wHERE location =" & llc & " and (Events.starttime > getdate() OR(Events.starttime = getdate())) ORDER BY Events.starttime asc, Events.id asc "
     
        Dim e1 As Integer = 0

        Dim oHelper As New calendarVB.Helper

        Dim drr As SqlDataReader = oHelper.GetDataReader(ssql)

        If drr.Read Then
            e1 = CInt(drr.Item("id").ToString())
        End If
        drr.Close()

        Return e1

    End Function
    Protected Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs)
        'Dim pages As Integer
        'pages = System.Convert.ToInt32(e.Command.Parameters("@pageCount").Value)

    End Sub

    'Protected Sub nextButton_Click(sender As Object, e As EventArgs)
    '    InitValsFromSql(LocationID)
    '    If nextLocationID <> INVALIDID Then
    '        prevLocationID = LocationID
    '        LocationID = nextLocationID
    '        SqlDataSource2.SelectParameters("id").DefaultValue = Convert.ToString(nextLocationID)
    '    End If
    '    ToggleLinks()
    'End Sub
    'Protected Sub prevButton_Click(sender As Object, e As System.EventArgs)
    '    InitValsFromSql(LocationID)
    '    If prevLocationID <> INVALIDID Then
    '        nextLocationID = LocationID
    '        LocationID = prevLocationID
    '        SqlDataSource2.SelectParameters("id").DefaultValue = Convert.ToString(prevLocationID)
    '    End If
    '    ToggleLinks()
    'End Sub
    Protected Sub ToggleLinks()
        'LinkButton1.Enabled = (nextLocationID <> INVALIDID)
        'LinkButton3.Enabled = (nextLocationID <> INVALIDID)
        'LinkButton2.Enabled = (prevLocationID <> INVALIDID)
        'LinkButton4.Enabled = (prevLocationID <> INVALIDID)
    End Sub
    Protected Sub InitValsFromSql(LocationID As Integer)
        Try
            Dim connection As New SqlConnection(ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString)
            Dim command As New SqlCommand("dbo.NextPrevLocation", connection)

            Dim param0 As New SqlParameter("@id", LocationID)
            Dim param1 As New SqlParameter("@previd", INVALIDID)
            Dim param2 As New SqlParameter("@nextid", INVALIDID)

            param1.Direction = ParameterDirection.InputOutput
            param2.Direction = ParameterDirection.InputOutput

            command.Parameters.Add(param0)
            command.Parameters.Add(param1)
            command.Parameters.Add(param2)

            command.CommandType = CommandType.StoredProcedure
            connection.Open()
            command.ExecuteNonQuery()

            If param1.Value IsNot Nothing Then
                prevLocationID = Convert.ToInt32(param1.Value)
            Else
                prevLocationID = INVALIDID
            End If
            If param2.Value IsNot Nothing Then
                nextLocationID = Convert.ToInt32(param2.Value)
            Else
                nextLocationID = INVALIDID
            End If
            connection.Close()
        Catch
            prevLocationID = INVALIDID
            nextLocationID = INVALIDID
        End Try
    End Sub
 
End Class

