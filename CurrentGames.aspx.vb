
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
    Protected IsAdmin As Boolean
    Private nextLocationID As Integer
    Private prevLocationID As Integer
    Const INVALIDID As Integer = -1

    Private Rating As Integer
    Private Slope As Integer
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
    Protected Sub Page_Load(sender As Object, e As EventArgs)

        Dim TabParam As New ArrayList(New Object() {New ArrayList(New Object() {True, "Golf Courses", "OnTabClick(0)", True}), New ArrayList(New Object() {False, "Game Pairing", "OnTabClick(1)", True}), New ArrayList(New Object() {False, "Game Scorecards", "OnTabClick(2)", True}), New ArrayList(New Object() {False, "LeaderBoard", "OnTabClick(3)", True})})
        Tabs1.TabParams = TabParam
         

        Dim ScoreParam As New ArrayList(New Object() {New ArrayList(New Object() {True, "Grp 1", "OnTabScoreClick(0)", True}), New ArrayList(New Object() {False, "Grp 2", "OnTabScoreClick(1)", True}), New ArrayList(New Object() {False, "Grp 3", "OnTabScoreClick(2)", True}), New ArrayList(New Object() {False, "Grp 4", "OnTabScoreClick(3)", True}), New ArrayList(New Object() {False, "Grp 5", "OnTabScoreClick(4)", True}), New ArrayList(New Object() {False, "Grp 6", "OnTabScoreClick(5)", True}), New ArrayList(New Object() {False, "Grp 7", "OnTabScoreClick(6)", True}), New ArrayList(New Object() {False, "Grp 8", "OnTabScoreClick(7)", True}), New ArrayList(New Object() {False, "Grp 9", "OnTabScoreClick(8)", True}), New ArrayList(New Object() {False, "Grp 10", "OnTabScoreClick(9)", True}), New ArrayList(New Object() {False, "Grp 11", "OnTabScoreClick(10)", True}), New ArrayList(New Object() {False, "Grp 12", "OnTabScoreClick(11)", True})})

        Tabs2.TabParams = ScoreParam
         
        Dim ssql2 As String = ""

        ssql2 = "SELECT [Locations].[title] as title from locations where id =" & LocationID
         

        Dim dr2 As SqlDataReader
        dr2 = GetDataReader(ssql2)
        While dr2.Read
            coursename0.Text = " - Golf Course: " & Trim(dr2.Item("title").ToString())
            coursename1.Text = " - Golf Course: " & Trim(dr2.Item("title").ToString())
            Coursename2.Text = " - Golf Course: " & Trim(dr2.Item("title").ToString())
            coursename3.Text = " - Golf Course: " & Trim(dr2.Item("title").ToString()) 
        End While
        dr2.Close() 

        If Not IsPostBack Then

            IsAdmin = User.IsInRole("Administrators")
            'panel1.Visible = IsAdmin;
            'SqlDataSource4.SelectParameters("locationid").DefaultValue = Convert.ToString(LocationID)
            'MaleGolfRating.SelectParameters("locationid").DefaultValue = Convert.ToString(LocationID)
            'FemaleGolfRating.SelectParameters("locationid").DefaultValue = Convert.ToString(LocationID)

            BindCourseGrid()
            BindRatingSlopeGrid()
            BindPrimaryGrid()
            BindSecondaryGrid()
            BindLeaderBoardGrid() 
        End If


        IsAdmin = User.IsInRole("Administrators")
        btnSavePairing.Enabled = IsAdmin
        EmailPairing.Enabled = IsAdmin
        SaveandCreateScorecards.Enabled = IsAdmin
        SaveCourseDetails.Enabled = IsAdmin

        If IsAdmin = False Then
            StatusInfo.Text = "You must be an administrator to create pairings"
        End If

    End Sub


    Private Sub BindCourseGrid()
        Dim i As Integer = 0
        Dim ssql As String = "SELECT [Holeid], [Ordinal],[Yardage],[Par],[Handicap]  FROM [tb_Hole] where [LocationId] = " & LocationID & " order by [ordinal] asc"
        Dim dr1 As SqlDataReader
        dr1 = GetDataReader(ssql)
        i = 1

        Dim scorecardsclosed As Boolean = False

        While dr1.Read
             
            If i = 1 Then
                txtHole1.Text = dr1.Item("Ordinal").ToString()
                txtYard1.Text = dr1.Item("Yardage").ToString()
                TxtPar1.Text = dr1.Item("Par").ToString()
                txtHandicap1.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 2 Then
                txtHole2.Text = dr1.Item("Ordinal").ToString()
                txtYard2.Text = dr1.Item("Yardage").ToString()
                TxtPar2.Text = dr1.Item("Par").ToString()
                txtHandicap2.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 3 Then
                txtHole3.Text = dr1.Item("Ordinal").ToString()
                txtYard3.Text = dr1.Item("Yardage").ToString()
                TxtPar3.Text = dr1.Item("Par").ToString()
                txtHandicap3.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 4 Then
                txtHole4.Text = dr1.Item("Ordinal").ToString()
                txtYard4.Text = dr1.Item("Yardage").ToString()
                TxtPar4.Text = dr1.Item("Par").ToString()
                txtHandicap4.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 5 Then
                txtHole5.Text = dr1.Item("Ordinal").ToString()
                txtYard5.Text = dr1.Item("Yardage").ToString()
                TxtPar5.Text = dr1.Item("Par").ToString()
                txtHandicap5.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 6 Then
                txtHole6.Text = dr1.Item("Ordinal").ToString()
                txtYard6.Text = dr1.Item("Yardage").ToString()
                TxtPar6.Text = dr1.Item("Par").ToString()
                txtHandicap6.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 7 Then
                txtHole7.Text = dr1.Item("Ordinal").ToString()
                txtYard7.Text = dr1.Item("Yardage").ToString()
                TxtPar7.Text = dr1.Item("Par").ToString()
                txtHandicap7.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 8 Then
                txtHole8.Text = dr1.Item("Ordinal").ToString()
                txtYard8.Text = dr1.Item("Yardage").ToString()
                TxtPar8.Text = dr1.Item("Par").ToString()
                txtHandicap8.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 9 Then
                txtHole9.Text = dr1.Item("Ordinal").ToString()
                txtYard9.Text = dr1.Item("Yardage").ToString()
                TxtPar9.Text = dr1.Item("Par").ToString()
                txtHandicap9.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 10 Then
                txtHole10.Text = dr1.Item("Ordinal").ToString()
                txtYard10.Text = dr1.Item("Yardage").ToString()
                TxtPar10.Text = dr1.Item("Par").ToString()
                txtHandicap10.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 11 Then
                txtHole11.Text = dr1.Item("Ordinal").ToString()
                txtYard11.Text = dr1.Item("Yardage").ToString()
                TxtPar11.Text = dr1.Item("Par").ToString()
                txtHandicap11.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 12 Then
                txtHole12.Text = dr1.Item("Ordinal").ToString()
                txtYard12.Text = dr1.Item("Yardage").ToString()
                TxtPar12.Text = dr1.Item("Par").ToString()
                txtHandicap12.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 13 Then
                txtHole13.Text = dr1.Item("Ordinal").ToString()
                txtYard13.Text = dr1.Item("Yardage").ToString()
                TxtPar13.Text = dr1.Item("Par").ToString()
                txtHandicap13.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 14 Then
                txtHole14.Text = dr1.Item("Ordinal").ToString()
                txtYard14.Text = dr1.Item("Yardage").ToString()
                TxtPar14.Text = dr1.Item("Par").ToString()
                txtHandicap14.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 15 Then
                txtHole15.Text = dr1.Item("Ordinal").ToString()
                txtYard15.Text = dr1.Item("Yardage").ToString()
                TxtPar15.Text = dr1.Item("Par").ToString()
                txtHandicap15.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 16 Then
                txtHole16.Text = dr1.Item("Ordinal").ToString()
                txtYard16.Text = dr1.Item("Yardage").ToString()
                TxtPar16.Text = dr1.Item("Par").ToString()
                txtHandicap16.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 17 Then
                txtHole17.Text = dr1.Item("Ordinal").ToString()
                txtYard17.Text = dr1.Item("Yardage").ToString()
                TxtPar17.Text = dr1.Item("Par").ToString()
                txtHandicap17.Text = dr1.Item("Handicap").ToString()
            End If
            If i = 18 Then
                txtHole18.Text = dr1.Item("Ordinal").ToString()
                txtYard18.Text = dr1.Item("Yardage").ToString()
                TxtPar18.Text = dr1.Item("Par").ToString()
                txtHandicap18.Text = dr1.Item("Handicap").ToString()
            End If
            i = i + 1
        End While
        dr1.Close()


        IsAdmin = User.IsInRole("Administrators")
         
        txtHole1.Enabled = IsAdmin
        txtYard1.Enabled = IsAdmin
        TxtPar1.Enabled = IsAdmin
        txtHole2.Enabled = IsAdmin
        txtYard2.Enabled = IsAdmin
        TxtPar2.Enabled = IsAdmin
        txtHole3.Enabled = IsAdmin
        txtYard3.Enabled = IsAdmin
        TxtPar3.Enabled = IsAdmin
        txtHole4.Enabled = IsAdmin
        txtYard4.Enabled = IsAdmin
        TxtPar4.Enabled = IsAdmin
        txtHole5.Enabled = IsAdmin
        txtYard5.Enabled = IsAdmin
        TxtPar5.Enabled = IsAdmin
        txtHole6.Enabled = IsAdmin
        txtYard6.Enabled = IsAdmin
        TxtPar6.Enabled = IsAdmin
        txtHole7.Enabled = IsAdmin
        txtYard7.Enabled = IsAdmin
        TxtPar7.Enabled = IsAdmin
        txtHole8.Enabled = IsAdmin
        txtYard8.Enabled = IsAdmin
        TxtPar8.Enabled = IsAdmin
        txtHole9.Enabled = IsAdmin
        txtYard9.Enabled = IsAdmin
        TxtPar9.Enabled = IsAdmin
        txtHole10.Enabled = IsAdmin
        txtYard10.Enabled = IsAdmin
        TxtPar10.Enabled = IsAdmin
        txtHole11.Enabled = IsAdmin
        txtYard11.Enabled = IsAdmin
        TxtPar11.Enabled = IsAdmin
        txtHole12.Enabled = IsAdmin
        txtYard12.Enabled = IsAdmin
        TxtPar12.Enabled = IsAdmin
        txtHole13.Enabled = IsAdmin
        txtYard13.Enabled = IsAdmin
        TxtPar13.Enabled = IsAdmin
        txtHole14.Enabled = IsAdmin
        txtYard14.Enabled = IsAdmin
        TxtPar14.Enabled = IsAdmin
        txtHole15.Enabled = IsAdmin
        txtYard15.Enabled = IsAdmin
        TxtPar15.Enabled = IsAdmin
        txtHole16.Enabled = IsAdmin
        txtYard16.Enabled = IsAdmin
        TxtPar16.Enabled = IsAdmin
        txtHole17.Enabled = IsAdmin
        txtYard17.Enabled = IsAdmin
        TxtPar17.Enabled = IsAdmin
        txtHole18.Enabled = IsAdmin
        txtYard18.Enabled = IsAdmin
        TxtPar18.Enabled = IsAdmin

    End Sub

    Private Sub BindRatingSlopeGrid()
        Dim ssql As String = "SELECT [RatingId],[LocationId],[MaleRating] as Rating ,[MaleSlope] as Slope  FROM [tb_CourseRating] where [LocationId] = " & LocationID & "  order by [RatingId]"
        Dim dr1 As SqlDataReader
        dr1 = GetDataReader(ssql)
        While dr1.Read
            MaleRating.Text = dr1.Item("Rating").ToString()
            MaleSlope.Text = dr1.Item("Slope").ToString()
        End While
        dr1.Close()

        Dim ssql11 As String = "SELECT [RatingId],[LocationId],[FemaleRating] as Rating ,[FemaleSlope] as Slope  FROM [tb_CourseRating] where [LocationId] = " & LocationID & "   order by [RatingId]"
        Dim dr11 As SqlDataReader
        dr11 = GetDataReader(ssql11)
        While dr11.Read
            FemaleRating.Text = dr11.Item("Rating").ToString()
            FemaleSlope.Text = dr11.Item("Slope").ToString()
        End While
        dr11.Close()


        IsAdmin = User.IsInRole("Administrators")

        MaleRating.Enabled = IsAdmin
        MaleSlope.Enabled = IsAdmin
        FemaleRating.Enabled = IsAdmin
        FemaleSlope.Enabled = IsAdmin

    End Sub
   
    Private Sub BindLeaderBoardGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)

        Dim Query As String = "SELECT  [tb_Scorecard].[GhinID] ,[MemberInfo].[firstname] ,[MemberInfo].[lastname] ,  (select CONVERT(VARCHAR(8),  [tb_Scorecard].[Date], 1) AS [MM/DD/YY]) as PlayDate    , [tb_Scorecard].[ScoreTotalout],[tb_Scorecard].[ScoreTotalin],[tb_Scorecard].[GrandTotal],[tb_Scorecard].[TournamentHandicap],[tb_Scorecard].[GhinHandicap],[tb_Scorecard].[NetScore] FROM [tb_Scorecard],[MemberInfo] where [MemberInfo].[GhinID]= [tb_Scorecard].[GhinID] and [tb_Scorecard].[ScorecardClosed] = 'False' and [tb_Scorecard].[locationid] =" & LocationID & " and [tb_Scorecard].[GrandTotal] > 0 order by [NetScore] asc"

        Dim sdapair1 As New SqlDataAdapter(Query, con)
        Dim dtpair1 As New DataTable()
        sdapair1.Fill(dtpair1)
        LeaderboardGrid.DataSource = dtpair1
        LeaderboardGrid.DataBind()

        con.Close()
    End Sub


    Protected Sub btnRefreshLeaderBoard_Click(sender As Object, e As System.EventArgs) Handles btnRefreshLeaderBoard.Click
        BindLeaderBoardGrid()
        lblRefreshLeader.Text = "Refreshed!"
    End Sub

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

        Dim ssqlr As String = "SELECT sum([Par]) as total FROM [tb_Hole] where [LocationId] = 1 and [Ordinal] IN (1, 2, 3,4,5,6,7,8,9) union SELECT sum([Par]) as total FROM [tb_Hole] where [LocationId] = " & LocationID & "  and [Ordinal] IN (10, 11,12, 13,14,15,16,17,18) union SELECT sum([Yardage]) as total FROM [tb_Hole] where [LocationId] = " & LocationID & "  and [Ordinal] IN (1, 2, 3,4,5,6,7,8,9) union SELECT sum([Yardage]) as total FROM [tb_Hole] where [LocationId] = " & LocationID & "  and [Ordinal] IN (10, 11,12, 13,14,15,16,17,18)  "
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

        Dim ssql As String = "Select  * from (SELECT [Ordinal],[Par] FROM [tb_Hole] where [LocationId] = " & LocationID & " ) as s PIVOT (max(Par) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt union Select  * from (SELECT [Ordinal],[Yardage] FROM [tb_Hole] where [LocationId] = " & LocationID & " ) as s PIVOT (max(Yardage) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt union Select * from (SELECT [Ordinal],[Handicap] FROM [tb_Hole] where [LocationId] = " & LocationID & "  ) as s PIVOT (max(Handicap) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt"
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

    Private Sub BindPrimaryGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim query As String = "SELECT   GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo] where firstname <> 'admin' order by lastname asc"
        Dim con As New SqlConnection(constr)
        Dim sda As New SqlDataAdapter(query, con)
        Dim dt As New DataTable()
        dt.Clear()

        sda.Fill(dt)
        gvAll.DataSource = dt
        gvAll.DataBind()


        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 1 and [LocationID] =" & LocationID & "  order by firstname asc"

        Dim sdapair1 As New SqlDataAdapter(query, con)
        Dim dtpair1 As New DataTable()
        sdapair1.Fill(dtpair1)
        gvSelected1.DataSource = dtpair1
        gvSelected1.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 2 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair2 As New SqlDataAdapter(query, con)
        Dim dtpair2 As New DataTable()
        sdapair2.Fill(dtpair2)
        gvSelected2.DataSource = dtpair2
        gvSelected2.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 3 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair3 As New SqlDataAdapter(query, con)
        Dim dtpair3 As New DataTable()
        sdapair3.Fill(dtpair3)
        gvSelected3.DataSource = dtpair3
        gvSelected3.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 4 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair4 As New SqlDataAdapter(query, con)
        Dim dtpair4 As New DataTable()
        sdapair4.Fill(dtpair4)
        gvSelected4.DataSource = dtpair4
        gvSelected4.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 5 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair5 As New SqlDataAdapter(query, con)
        Dim dtpair5 As New DataTable()
        sdapair5.Fill(dtpair5)
        gvSelected5.DataSource = dtpair5
        gvSelected5.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 6 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair6 As New SqlDataAdapter(query, con)
        Dim dtpair6 As New DataTable()
        sdapair6.Fill(dtpair6)
        gvSelected6.DataSource = dtpair6
        gvSelected6.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 7 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair7 As New SqlDataAdapter(query, con)
        Dim dtpair7 As New DataTable()
        sdapair7.Fill(dtpair7)
        gvSelected7.DataSource = dtpair7
        gvSelected7.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 8 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair8 As New SqlDataAdapter(query, con)
        Dim dtpair8 As New DataTable()
        sdapair8.Fill(dtpair8)
        gvSelected8.DataSource = dtpair8
        gvSelected8.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 9 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair9 As New SqlDataAdapter(query, con)
        Dim dtpair9 As New DataTable()
        sdapair9.Fill(dtpair9)
        gvSelected9.DataSource = dtpair9
        gvSelected9.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 10 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair10 As New SqlDataAdapter(query, con)
        Dim dtpair10 As New DataTable()
        sdapair10.Fill(dtpair10)
        gvSelected10.DataSource = dtpair10
        gvSelected10.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 11 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair11 As New SqlDataAdapter(query, con)
        Dim dtpair11 As New DataTable()
        sdapair11.Fill(dtpair11)
        gvSelected11.DataSource = dtpair11
        gvSelected11.DataBind()

        query = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 12 and [LocationID] = " & LocationID & "  order by firstname asc"

        Dim sdapair12 As New SqlDataAdapter(query, con)
        Dim dtpair12 As New DataTable()
        sdapair12.Fill(dtpair12)
        gvSelected12.DataSource = dtpair12
        gvSelected12.DataBind()

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
                    Dim dr As DataRow() = dt.[Select]("GhinID = '" & gvAll.Rows(i).Cells(1).Text & "'")
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

    Protected Sub MoveStuff_Click(sender As Object, e As System.EventArgs) Handles MoveStuff.Click
        GetData()
        SetData()
        BindSecondaryGrid()

        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub CheckBox_CheckChanged(ByVal sender As Object, ByVal e As EventArgs)
        GetData()
        SetData()
        BindSecondaryGrid()
    End Sub

    Private Sub BindSecondaryGrid()
        Dim dt As DataTable = DirectCast(ViewState("SelectedRecords"), DataTable)

        If RadioSelected1.Checked Then
            gvSelected1.DataSource = dt
            gvSelected1.DataBind()
        End If

        If RadioSelected2.Checked Then
            gvSelected2.DataSource = dt
            gvSelected2.DataBind()
        End If
        If RadioSelected3.Checked Then
            gvSelected3.DataSource = dt
            gvSelected3.DataBind()
        End If
        If RadioSelected4.Checked Then
            gvSelected4.DataSource = dt
            gvSelected4.DataBind()
        End If
        If RadioSelected5.Checked Then
            gvSelected5.DataSource = dt
            gvSelected5.DataBind()
        End If
        If RadioSelected6.Checked Then
            gvSelected6.DataSource = dt
            gvSelected6.DataBind()
        End If
        If RadioSelected7.Checked Then
            gvSelected7.DataSource = dt
            gvSelected7.DataBind()
        End If
        If RadioSelected8.Checked Then
            gvSelected8.DataSource = dt
            gvSelected8.DataBind()
        End If
        If RadioSelected9.Checked Then
            gvSelected9.DataSource = dt
            gvSelected9.DataBind()
        End If
        If RadioSelected10.Checked Then
            gvSelected10.DataSource = dt
            gvSelected10.DataBind()
        End If
        If RadioSelected11.Checked Then
            gvSelected11.DataSource = dt
            gvSelected11.DataBind()
        End If
        If RadioSelected12.Checked Then
            gvSelected12.DataSource = dt
            gvSelected12.DataBind()
        End If

    End Sub

    Protected Sub Clear_CheckChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim dt As DataTable = Nothing

        If Clear1.Checked Then
            gvSelected1.DataSource = dt
            gvSelected1.DataBind()
        End If

        If Clear2.Checked Then
            gvSelected2.DataSource = dt
            gvSelected2.DataBind()
        End If
        If Clear3.Checked Then
            gvSelected3.DataSource = dt
            gvSelected3.DataBind()
        End If
        If Clear4.Checked Then
            gvSelected4.DataSource = dt
            gvSelected4.DataBind()
        End If
        If Clear5.Checked Then
            gvSelected5.DataSource = dt
            gvSelected5.DataBind()
        End If
        If Clear6.Checked Then
            gvSelected6.DataSource = dt
            gvSelected6.DataBind()
        End If
        If Clear7.Checked Then
            gvSelected7.DataSource = dt
            gvSelected7.DataBind()
        End If
        If Clear8.Checked Then
            gvSelected8.DataSource = dt
            gvSelected8.DataBind()
        End If
        If Clear9.Checked Then
            gvSelected9.DataSource = dt
            gvSelected9.DataBind()
        End If
        If Clear10.Checked Then
            gvSelected10.DataSource = dt
            gvSelected10.DataBind()
        End If
        If Clear11.Checked Then
            gvSelected11.DataSource = dt
            gvSelected11.DataBind()
        End If
        If Clear12.Checked Then
            gvSelected12.DataSource = dt
            gvSelected12.DataBind()
        End If

    End Sub



    Protected Sub EmailPairing_Click(sender As Object, e As System.EventArgs) Handles EmailPairing.Click
        SendEmail()
        StatusInfo.Text = "Player's Emailed the pairings"
    End Sub

    Private Sub SendMail(ByVal from As String, ByVal body As String)

        Dim mailServerName As String = "relay-hosting.secureserver.net"
        Dim message As MailMessage = New MailMessage(from, "EMAIL ADDRESS REMOVED", "SUBJECT LINE REMOVED", body)
        Dim mailClient As SmtpClient = New SmtpClient

        mailClient.Host = mailServerName
        mailClient.Send(message)
        message.Dispose()

    End Sub


    Private Sub SendEmail()
        Dim pairlist As String = " Player Paring " & vbCr
        Dim dr1 As SqlDataReader
        pairlist = pairlist & "Ghin ID" & "  " & "First Name" & "  " & "Last Name" & "  " & "Tournament Handicap" & "  " & "Ghin Handicap" & vbCr
        Dim sSql As String = ""
        Dim countx As Integer = 0

        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 1 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 1" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()

        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 2 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 2" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 3 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 3" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 4 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 4" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 5 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 5" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 6 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 6" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 7 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 7" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 8 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 8" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 9 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 9" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 10 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 10" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 11 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 11" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  GhinID, firstname, lastname,Tournamenthandicap,Ghinhandicap  FROM [memberinfo],[tb_Pairing] where [memberinfo].[memberid] =  [tb_Pairing].[memberid] and [tb_Pairing].[SequenceId] = 12 and [LocationID] =" & LocationID & "  order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 12" & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCr & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()

        Dim message As New MailMessage()
        Dim smtp As New SmtpClient()

        'SELECT [UserId] ,[Email] FROM [aspnet_Membership]
        Dim from As String = "secretary@Safarigolftx.com"
        Dim subject As String = "Golf Pairing"
        Dim body As String = ""

        Dim emaillist As String = "gideonseroney@gmail.com" & ";"

        sSql = "SELECT [loweredEmail] FROM [aspnet_Membership]"

        Dim drx As SqlDataReader
        drx = GetDataReader(sSql)

        While drx.Read
            emaillist = emaillist & ";" & drx.Item("loweredEmail").ToString()
        End While

        'Get the message ready to send
        message.From = New MailAddress(from, "Golf Pairing")

        message.[To].Add(emaillist)

        message.IsBodyHtml = False
        message.Subject = subject
        message.Body = pairlist

        smtp.Host = "relay-hosting.secureserver.net"
        smtp.Port = 25
        smtp.Send(message)

    End Sub




    Protected Sub SaveCourseDetails_Click(sender As Object, e As System.EventArgs) Handles SaveCourseDetails.Click
        UpdateCourseDetails()
        lblSaveCourseDetails.Text = "Course Details saved"
    End Sub

    Private Sub UpdateCourseDetails()
        Dim ssql As String = ""

        ssql = "DELETE FROM [tb_Hole] where [LocationId] = " & LocationID

        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",1," & txtYard1.Text & "," & TxtPar1.Text & "," & txtHandicap1.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",2," & txtYard2.Text & "," & TxtPar2.Text & "," & txtHandicap2.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",3," & txtYard3.Text & "," & TxtPar3.Text & "," & txtHandicap3.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",4," & txtYard4.Text & "," & TxtPar4.Text & "," & txtHandicap4.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",5," & txtYard5.Text & "," & TxtPar5.Text & "," & txtHandicap5.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",6," & txtYard6.Text & "," & TxtPar6.Text & "," & txtHandicap6.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",7," & txtYard7.Text & "," & TxtPar7.Text & "," & txtHandicap7.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",8," & txtYard8.Text & "," & TxtPar8.Text & "," & txtHandicap8.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",9," & txtYard9.Text & "," & TxtPar9.Text & "," & txtHandicap9.Text & ")"
        ExecuteSql(ssql)


        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",10," & txtYard10.Text & "," & TxtPar10.Text & "," & txtHandicap10.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",11," & txtYard11.Text & "," & TxtPar11.Text & "," & txtHandicap11.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",12," & txtYard12.Text & "," & TxtPar12.Text & "," & txtHandicap12.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",13," & txtYard13.Text & "," & TxtPar13.Text & "," & txtHandicap13.Text & ")"
        ExecuteSql(ssql)


        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",14," & txtYard14.Text & "," & TxtPar14.Text & "," & txtHandicap14.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",15," & txtYard15.Text & "," & TxtPar15.Text & "," & txtHandicap15.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",16," & txtYard16.Text & "," & TxtPar16.Text & "," & txtHandicap16.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",17," & txtYard17.Text & "," & TxtPar17.Text & "," & txtHandicap17.Text & ")"
        ExecuteSql(ssql)

        ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",18," & txtYard18.Text & "," & TxtPar18.Text & "," & txtHandicap18.Text & ")"
        ExecuteSql(ssql)


    End Sub


    Protected Sub btnSavePairing_Click(sender As Object, e As System.EventArgs) Handles btnSavePairing.Click
        InsertPairing()
        StatusInfo.Text = "Player pairing saved"
    End Sub

    Private Sub InsertPairing()

        Dim sSql4 As String = "DELETE FROM [tb_Pairing] WHERE locationid = " & LocationID & " "
        ExecuteSql(sSql4)

        InsertGridPairing(gvSelected1, 1)
        InsertGridPairing(gvSelected2, 2)
        InsertGridPairing(gvSelected3, 3)
        InsertGridPairing(gvSelected4, 4)
        InsertGridPairing(gvSelected5, 5)
        InsertGridPairing(gvSelected6, 6)
        InsertGridPairing(gvSelected7, 7)
        InsertGridPairing(gvSelected8, 8)
        InsertGridPairing(gvSelected9, 9)
        InsertGridPairing(gvSelected10, 10)
        InsertGridPairing(gvSelected11, 11)
        InsertGridPairing(gvSelected12, 12)
    End Sub
    Private Sub InsertGridPairing(ByRef gvSelected As GridView, seq As Integer)
        Dim sSql As String = ""

        Dim gridrow As GridViewRow

        For Each gridrow In gvSelected.Rows
            Dim GhinIDgrid As Label = gridrow.FindControl("GhinIDLabel")
            Dim memberidgrid As String = ""

            If GhinIDgrid.Text IsNot Nothing Then

                sSql = "SELECT memberid from [memberinfo] where ghinid=" & GhinIDgrid.Text

                Dim drr As SqlDataReader
                drr = GetDataReader(sSql)

                If drr.Read Then
                    memberidgrid = drr.Item("memberid").ToString()

                    sSql = "INSERT INTO tb_Pairing (Locationid, memberid, sequenceid)"
                    sSql += " VALUES ("
                    sSql += "" & LocationID
                    sSql += ",'" & memberidgrid & "'"
                    sSql += "," & seq
                    sSql += ")"
                    ExecuteSql(sSql)
                End If
                drr.Close()
            End If
        Next





    End Sub

    Public Sub ExecuteSql(ByVal sSql As String)

        Dim cn As New SqlConnection(GetConnectionString())
        cn.Open()
        Dim cm As New SqlCommand(sSql, cn)
        cm.ExecuteNonQuery()
        cn.Close()

    End Sub


    Protected Sub SaveandCreateScorecards_Click(sender As Object, e As System.EventArgs) Handles SaveandCreateScorecards.Click
        InsertPairing()
        InsertScorecards()
        StatusInfo.Text = "Player pairing saved and Scorecards created"
    End Sub

    Private Sub InsertScorecards()

        InsertGridScorecard(gvSelected1, 1)
        InsertGridScorecard(gvSelected2, 2)
        InsertGridScorecard(gvSelected3, 3)
        InsertGridScorecard(gvSelected4, 4)
        InsertGridScorecard(gvSelected5, 5)
        InsertGridScorecard(gvSelected6, 6)
        InsertGridScorecard(gvSelected7, 7)
        InsertGridScorecard(gvSelected8, 8)
        InsertGridScorecard(gvSelected9, 9)
        InsertGridScorecard(gvSelected10, 10)
        InsertGridScorecard(gvSelected11, 11)
        InsertGridScorecard(gvSelected12, 12)
    End Sub
    Private Sub InsertGridScorecard(ByRef gvSelected As GridView, seq As Integer)
        Dim sSql As String = ""
        Dim memberidgrid As String = ""
        Dim Gender As String = ""


        Dim Thandicap As Integer
        Dim Ghandicap As Integer

        Dim date1 As Date = Now
        Dim sqldate As String = "'" & date1.ToString("MM/dd/yyyy") & "'"

        Dim gridrow As GridViewRow

        For Each gridrow In gvSelected.Rows
            Dim GhinIDgrid As Label = gridrow.FindControl("GhinIDLabel")

            If GhinIDgrid.Text <> "" Then

                sSql = "SELECT memberid,Gender,Tournamenthandicap,Ghinhandicap from [memberinfo] where ghinid=" & GhinIDgrid.Text

                Dim drr1 As SqlDataReader
                drr1 = GetDataReader(sSql)

                If drr1.Read Then
                    memberidgrid = drr1.Item("memberid").ToString()
                    Thandicap = CInt(drr1.Item("Tournamenthandicap").ToString())
                    Ghandicap = CInt(drr1.Item("Ghinhandicap").ToString())

                    Gender = drr1.Item("Gender").ToString()

                    getrating(Gender)

                    Dim sSql4 As String = "Select * FROM [tb_Scorecard] WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID & "  and Scorecardclosed = 'False'"
                    Dim drr4 As SqlDataReader
                    drr4 = GetDataReader(sSql4)

                    sSql = ""

                    If drr4.Read Then
                        sSql += "UPDATE [tb_Scorecard]"
                        sSql += " SET [GhinID] = '" & GhinIDgrid.Text & "'"
                        sSql += " ,[LocationID] =  " & LocationID
                        sSql += " ,[PairingID] =  " & seq
                        sSql += " ,[Date] = " & sqldate
                        sSql += " ,[memberid] = '" & memberidgrid & "'"
                        sSql += " ,[TournamentHandicap] =" & Thandicap
                        sSql += " ,[GhinHandicap] = " & Ghandicap
                        sSql += " ,[Rating] =" & Rating
                        sSql += " ,[Slope] =" & Slope
                        sSql += " ,[Differential]=" & Differential
                        sSql += " WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID & "  and Scorecardclosed = 'False'"
                    Else
                        sSql = "INSERT INTO [tb_Scorecard]([GhinID],[LocationID],[PairingID],[Date],[memberid] ,[Score1],[Score2],[Score3],[Score4],[Score5],[Score6],[Score7],[Score8],[Score9],[ScoreTotalout],[Score10],[Score11],[Score12],[Score13],[Score14],[Score15],[Score16],[Score17],[Score18],[ScoreTotalin],[GrandTotal],[TournamentHandicap] ,[GhinHandicap],[NetScore],[Rating],[Slope],[Differential],[ScorecardClosed])"
                        sSql += " VALUES ("
                        sSql += "'" & GhinIDgrid.Text & "'"
                        sSql += "," & LocationID
                        sSql += "," & seq
                        sSql += "," & sqldate
                        sSql += ",'" & memberidgrid & "'"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += ",0"
                        sSql += "," & Thandicap
                        sSql += "," & Ghandicap
                        sSql += ",0"
                        sSql += "," & Rating
                        sSql += "," & Slope
                        sSql += "," & Differential
                        sSql += ",'False'"
                        sSql += ")"

                    End If

                    ExecuteSql(sSql)

                    drr4.Close()

                End If
                    drr1.Close()
                End If
        Next
    End Sub

    Private Sub getrating(gnd As String)
        Dim sSql As String
        If gnd = "Female" Then
            sSql = "SELECT [FemaleRating] as Rating ,[FemaleSlope] as Slope  FROM [tb_CourseRating] where [LocationId] =" & LocationID & "  order by [RatingId]"
        Else
            sSql = "SELECT [MaleRating] as Rating ,[MaleSlope] as Slope  FROM [tb_CourseRating] where [LocationId] = " & LocationID & "   order by [RatingId]"
        End If

        Dim drx As SqlDataReader
        drx = GetDataReader(sSql)

        If drx.Read Then
            Rating = CInt(drx.Item("Rating").ToString())
            Slope = CInt(drx.Item("Slope").ToString())
        End If

    End Sub
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

