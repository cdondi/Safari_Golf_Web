
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
        Dim drr As SqlDataReader

        Dim loc As Integer = 0

        drr = GetDataReader(ssql)

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

        drr = GetDataReader(ssql)

        If drr.Read Then
            date1 = CDate(drr.Item("starttime").ToString())
        End If
        drr.Close()

        Return date1

    End Function
    Protected Sub Page_Load(sender As Object, e As EventArgs)
 
        If Not IsPostBack Then

            checkandinsertRSVP()

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


        Dim drNewRow As DataRow = dt.NewRow
        dt.Rows.InsertAt(drNewRow, 0)
        dt.AcceptChanges()


        'dt = AddRow(gvAll.Rows(0), dt)

        gvAll.DataSource = dt
        gvAll.DataBind()
          


        BindSecondaryGrid(0)
        BindPrimaryGrid()

        rdoMaleTeeBack.Checked = True
        rdoFeMaleTeeBack.Checked = True


        Dim ssql2 As String = "SELECT [Locations].[title] as title from locations where id =" & LocationID()


        Dim dr2 As SqlDataReader
        dr2 = GetDataReader(ssql2)
        While dr2.Read
            coursename0.Text = Trim(dr2.Item("title").ToString())
        End While
        dr2.Close()


        IsAdmin = True 'User.IsInRole("Administrators")

        EmailPairing.Enabled = IsAdmin
        SaveandCreateScorecards.Enabled = IsAdmin

        If IsAdmin = False Then
            StatusInfo.Text = "You must be an administrator to create pairings"
        End If


    End Sub

    'Protected Sub gvAll_DataBound(sender As Object, e As EventArgs)
    '    For rowIndex As Integer = gvAll.column.Count - 1
    '        Dim row As GridViewRow = gvAll.Rows(rowIndex)
    '        row.Cells(5).Visible = False
    '        row.Cells(6).Visible = False
    '        row.Cells(7).Visible = False
    '    Next
    'End Sub

    Protected Sub gvAll_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        Dim xx As String = ""


        ' If the current row is a DataRow (and not a Header or Footer row), then do stuff.
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim drv As DataRowView = DirectCast(e.Row.DataItem, DataRowView)
             

            xx = drv("RSVP").ToString()

            If xx = "" Then xx = "Not replied"

            If tmpCategoryName <> xx Then

                tmpCategoryName = xx

                ' Get a reference to the current row's Parent, which is the Gridview (which happens to be a table)
                Dim tbl As Table = TryCast(e.Row.Parent, Table)

                If tbl IsNot Nothing Then
                    Dim row As New GridViewRow(-1, -1, DataControlRowType.DataRow, DataControlRowState.Normal)

                    Dim cell As New TableCell()

                    ' Span the row across all of the columns in the Gridview
                    cell.ColumnSpan = Me.gvAll.Columns.Count

                    cell.Width = Unit.Percentage(100)
                    cell.Style.Add("font-weight", "bold")
                    cell.Style.Add("background-color", "#c0c0c0")
                    cell.Style.Add("color", "white")


                    Dim span As New HtmlGenericControl("span")

                    If tmpCategoryName = "" Then
                        tmpCategoryName = "Not replied"
                    End If

                    span.InnerHtml = "Attending: " & tmpCategoryName

                    cell.Controls.Add(span)

                    row.Cells.Add(cell)

                    tbl.Rows.AddAt(tbl.Rows.Count - 1, row)
                End If
            End If
        End If

        gvAll.Columns(6).Visible = False
        gvAll.Columns(7).Visible = False
        gvAll.Columns(8).Visible = False

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
        Return dt
    End Function


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

    Private Sub BindPrimaryGrid()
        ClearTeeBox(1)
        ClearTeeBox(2)
        ClearTeeBox(3)
        ClearTeeBox(4)
        ClearTeeBox(5)
        ClearTeeBox(6)
        ClearTeeBox(7)
        ClearTeeBox(8)
        ClearTeeBox(9)
        ClearTeeBox(10)
        ClearTeeBox(11)
        ClearTeeBox(12)

        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim query As String = ""
        Dim con As New SqlConnection(constr)

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 1 and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair1 As New SqlDataAdapter(query, con)
        Dim dtpair1 As New DataTable()
        sdapair1.Fill(dtpair1)
        gvSelected1.DataSource = dtpair1
        gvSelected1.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 2  and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair2 As New SqlDataAdapter(query, con)
        Dim dtpair2 As New DataTable()
        sdapair2.Fill(dtpair2)
        gvSelected2.DataSource = dtpair2
        gvSelected2.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 3  and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair3 As New SqlDataAdapter(query, con)
        Dim dtpair3 As New DataTable()
        sdapair3.Fill(dtpair3)
        gvSelected3.DataSource = dtpair3
        gvSelected3.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 4  and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair4 As New SqlDataAdapter(query, con)
        Dim dtpair4 As New DataTable()
        sdapair4.Fill(dtpair4)
        gvSelected4.DataSource = dtpair4
        gvSelected4.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 5 and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair5 As New SqlDataAdapter(query, con)
        Dim dtpair5 As New DataTable()
        sdapair5.Fill(dtpair5)
        gvSelected5.DataSource = dtpair5
        gvSelected5.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 6  and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair6 As New SqlDataAdapter(query, con)
        Dim dtpair6 As New DataTable()
        sdapair6.Fill(dtpair6)
        gvSelected6.DataSource = dtpair6
        gvSelected6.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 7  and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair7 As New SqlDataAdapter(query, con)
        Dim dtpair7 As New DataTable()
        sdapair7.Fill(dtpair7)
        gvSelected7.DataSource = dtpair7
        gvSelected7.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 8  and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair8 As New SqlDataAdapter(query, con)
        Dim dtpair8 As New DataTable()
        sdapair8.Fill(dtpair8)
        gvSelected8.DataSource = dtpair8
        gvSelected8.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 9  and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair9 As New SqlDataAdapter(query, con)
        Dim dtpair9 As New DataTable()
        sdapair9.Fill(dtpair9)
        gvSelected9.DataSource = dtpair9
        gvSelected9.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 10  and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair10 As New SqlDataAdapter(query, con)
        Dim dtpair10 As New DataTable()
        sdapair10.Fill(dtpair10)
        gvSelected10.DataSource = dtpair10
        gvSelected10.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 11  and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair11 As New SqlDataAdapter(query, con)
        Dim dtpair11 As New DataTable()
        sdapair11.Fill(dtpair11)
        gvSelected11.DataSource = dtpair11
        gvSelected11.DataBind()

        query = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 12 and [LocationID] =" & LocationID() & " and [Date] = '" & DateID() & "'  order by firstname asc"

        Dim sdapair12 As New SqlDataAdapter(query, con)
        Dim dtpair12 As New DataTable()
        sdapair12.Fill(dtpair12)
        gvSelected12.DataSource = dtpair12
        gvSelected12.DataBind()
         

    End Sub

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
     

    Protected Sub MoveTee1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee1.Click
        GetData()
        SetData()
        BindSecondaryGrid(1)

        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee2.Click
        GetData()
        SetData()
        BindSecondaryGrid(2)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee3.Click
        GetData()
        SetData()
        BindSecondaryGrid(3)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee4.Click
        GetData()
        SetData()
        BindSecondaryGrid(4)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee5_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee5.Click
        GetData()
        SetData()
        BindSecondaryGrid(5)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee6_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee6.Click
        GetData()
        SetData()
        BindSecondaryGrid(6)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee7_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee7.Click
        GetData()
        SetData()
        BindSecondaryGrid(7)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee8_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee8.Click
        GetData()
        SetData()
        BindSecondaryGrid(8)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee9_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee9.Click
        GetData()
        SetData()
        BindSecondaryGrid(9)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee10_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee10.Click
        GetData()
        SetData()
        BindSecondaryGrid(10)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee11_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee11.Click
        GetData()
        SetData()
        BindSecondaryGrid(11)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub
    Protected Sub MoveTee12_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MoveTee12.Click
        GetData()
        SetData()
        BindSecondaryGrid(12)
        'Dim ChkBoxHeader As CheckBox = DirectCast(gvAll.HeaderRow.FindControl("chk"), CheckBox)
        For Each row As GridViewRow In gvAll.Rows
            Dim ChkBoxRows As CheckBox = DirectCast(row.FindControl("chk"), CheckBox)
            ChkBoxRows.Checked = False
        Next

    End Sub

    Private Sub BindSecondaryGrid(ByVal t As Integer)
        Dim dt As DataTable = DirectCast(ViewState("SelectedRecords"), DataTable)

        If t = 1 Then
            gvSelected1.DataSource = dt
            gvSelected1.DataBind()
        End If

        If t = 2 Then
            gvSelected2.DataSource = dt
            gvSelected2.DataBind()
        End If
        If t = 3 Then
            gvSelected3.DataSource = dt
            gvSelected3.DataBind()
        End If
        If t = 4 Then
            gvSelected4.DataSource = dt
            gvSelected4.DataBind()
        End If
        If t = 5 Then
            gvSelected5.DataSource = dt
            gvSelected5.DataBind()
        End If
        If t = 6 Then
            gvSelected6.DataSource = dt
            gvSelected6.DataBind()
        End If
        If t = 7 Then
            gvSelected7.DataSource = dt
            gvSelected7.DataBind()
        End If
        If t = 8 Then
            gvSelected8.DataSource = dt
            gvSelected8.DataBind()
        End If
        If t = 9 Then
            gvSelected9.DataSource = dt
            gvSelected9.DataBind()
        End If
        If t = 10 Then
            gvSelected10.DataSource = dt
            gvSelected10.DataBind()
        End If
        If t = 11 Then
            gvSelected11.DataSource = dt
            gvSelected11.DataBind()
        End If
        If t = 12 Then
            gvSelected12.DataSource = dt
            gvSelected12.DataBind()
        End If

    End Sub

    Protected Sub RemoveTee1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee1.Click
        ClearTeeBox(1)
    End Sub
    Protected Sub RemoveTee2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee2.Click
        ClearTeeBox(2)
    End Sub
    Protected Sub RemoveTee3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee3.Click
        ClearTeeBox(3)
    End Sub
    Protected Sub RemoveTee4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee4.Click
        ClearTeeBox(4)
    End Sub
    Protected Sub RemoveTee5_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee5.Click
        ClearTeeBox(5)
    End Sub
    Protected Sub RemoveTee6_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee6.Click
        ClearTeeBox(6)
    End Sub
    Protected Sub RemoveTee7_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee7.Click
        ClearTeeBox(7)
    End Sub
    Protected Sub RemoveTee8_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee8.Click
        ClearTeeBox(8)
    End Sub
    Protected Sub RemoveTee9_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee9.Click
        ClearTeeBox(9)
    End Sub
    Protected Sub RemoveTee10_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee10.Click
        ClearTeeBox(10)
    End Sub
    Protected Sub RemoveTee11_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee11.Click
        ClearTeeBox(11)
    End Sub
    Protected Sub RemoveTee12_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveTee12.Click
        ClearTeeBox(12)
    End Sub

    Private Sub ClearTeeBox(ByVal T As Integer)

        Dim dt As DataTable = Nothing

        If T = 1 Then
            gvSelected1.DataSource = dt
            gvSelected1.DataBind()
        End If

        If T = 2 Then
            gvSelected2.DataSource = dt
            gvSelected2.DataBind()
        End If
        If T = 3 Then
            gvSelected3.DataSource = dt
            gvSelected3.DataBind()
        End If
        If T = 4 Then
            gvSelected4.DataSource = dt
            gvSelected4.DataBind()
        End If
        If T = 5 Then
            gvSelected5.DataSource = dt
            gvSelected5.DataBind()
        End If
        If T = 6 Then
            gvSelected6.DataSource = dt
            gvSelected6.DataBind()
        End If
        If T = 7 Then
            gvSelected7.DataSource = dt
            gvSelected7.DataBind()
        End If
        If T = 8 Then
            gvSelected8.DataSource = dt
            gvSelected8.DataBind()
        End If
        If T = 9 Then
            gvSelected9.DataSource = dt
            gvSelected9.DataBind()
        End If
        If T = 10 Then
            gvSelected10.DataSource = dt
            gvSelected10.DataBind()
        End If
        If T = 11 Then
            gvSelected11.DataSource = dt
            gvSelected11.DataBind()
        End If
        If T = 12 Then
            gvSelected12.DataSource = dt
            gvSelected12.DataBind()
        End If

    End Sub



    Protected Sub EmailPairing_Click(sender As Object, e As System.EventArgs) Handles EmailPairing.Click
        'SendEmail()
        sendemailtest()
    End Sub

    Private Sub SendMail(ByVal from As String, ByVal body As String)

        Dim mailServerName As String = "relay-hosting.secureserver.net"
        Dim message As MailMessage = New MailMessage(from, "EMAIL ADDRESS REMOVED", "SUBJECT LINE REMOVED", body)
        Dim mailClient As SmtpClient = New SmtpClient

        mailClient.Host = mailServerName
        mailClient.Send(message)
        message.Dispose()

    End Sub
    Private Sub sendemailtest()


        Dim pairlist As String = "Safari Golf Pairing for " & coursename0.Text & " on " & DateID & vbCr
        Dim dr1 As SqlDataReader
        pairlist = pairlist & "Ghin ID" & "  " & "First Name" & "  " & "Last Name" & "  " & "Tournament Handicap" & "  " & "Ghin Handicap" & vbCrLf & vbCr
        Dim sSql As String = ""
        Dim countx As Integer = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 1 and [LocationID] =" & LocationID() & "   order by firstname asc"

        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 1" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()

        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 2 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 2" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 3 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 3" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 4 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 4" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 5 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 5" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 6 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 6" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 7 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 7" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 8 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 8" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 9 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 9" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 10 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 10" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 11 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 11" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
                countx = 1
            Else
                pairlist = pairlist & dr1.Item("GhinID").ToString() & "  " & dr1.Item("firstname").ToString() & "  " & dr1.Item("lastname").ToString() & "  " & dr1.Item("Tournamenthandicap").ToString() & "  " & dr1.Item("Ghinhandicap").ToString() & vbCr
            End If
        End While
        dr1.Close()


        countx = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 12 and [LocationID] =" & LocationID() & "   order by firstname asc"
        dr1 = GetDataReader(sSql)
        While dr1.Read
            If countx = 0 Then
                pairlist = pairlist & "Group 12" & vbCrLf & vbCr
                pairlist = pairlist & "-------------------------------------------------------" & vbCrLf & vbCrLf & vbCr
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
        Dim subject As String = "Safari Golf Pairing for " & coursename0.Text & " on " & DateID
        Dim body As String = ""

        Dim emaillist As String = ""

        Try

            Dim email_Subject As String = "Safari Golf Pairing for " & coursename0.Text & " on " & DateID
            Dim email_body As String = pairlist
            Dim email_to As String = ""
            Dim email_from As String = "gideonseroney@yahoo.com"
            Dim emailserver As String = ""

            ' Instantiate a new instance of MailMessage
            Dim mMailMessage As New MailMessage()

            sSql = "SELECT [loweredEmail] FROM [aspnet_Membership]"

            Dim drx As SqlDataReader
            drx = GetDataReader(sSql)

            While drx.Read
                mMailMessage.To.Add(New MailAddress(Trim(drx.Item("loweredEmail").ToString())))
            End While

            drx.Close()

            ' Set the sender address of the mail message
            mMailMessage.From = New MailAddress(email_from)
            ' Set the recepient address of the mail message

            ' Set the subject of the mail message
            mMailMessage.Subject = email_Subject
            ' Set the body of the mail message

            mMailMessage.Body = email_body

            ' Set the format of the mail message body as HTML
            mMailMessage.IsBodyHtml = False

            mMailMessage.IsBodyHtml = True
            ' Set the priority of the mail message to normal
            mMailMessage.Priority = MailPriority.Normal

            ' Instantiate a new instance of SmtpClient
            Dim mSmtpClient As New SmtpClient()

            'mSmtpClient.Host = emailserver
            'mSmtpClient.Port = 25

            ' Send the mail message
            'mSmtpClient.Send(mMailMessage)

            Dim SmtpEmailFrom As String = ConfigurationManager.AppSettings("SmtpEmailFrom").ToString()
            Dim SmtpEmailClient As String = ConfigurationManager.AppSettings("SmtpEmailClient").ToString()
            Dim SmtpEmailUser As String = ConfigurationManager.AppSettings("SmtpEmailUser").ToString()
            Dim SmtpEmailPassword As String = ConfigurationManager.AppSettings("SmtpEmailPassword").ToString()
            Dim SmtpEmailEnableSsl As String = ConfigurationManager.AppSettings("SmtpEmailEnableSsl").ToString()

            Dim ss As New SmtpClient(SmtpEmailClient)
            ss.Credentials = New System.Net.NetworkCredential(SmtpEmailUser, SmtpEmailPassword)
            ss.EnableSsl = Convert.ToBoolean(SmtpEmailEnableSsl)
            ss.Send(mMailMessage)

            StatusInfo.Text = "Players pairings emailed successfully."
             

        Catch ex As Exception
            StatusInfo.Text = "Error trying to send Player's Emailed the pairings."
            StatusInfo.Text = StatusInfo.Text & vbCr & ex.Message
        End Try

    End Sub

    Private Sub SendEmail()
        Dim pairlist As String = "Safari Golf Pairing for " & coursename0.Text & " on " & DateID & vbCr
        Dim dr1 As SqlDataReader
        pairlist = pairlist & "Ghin ID" & "  " & "First Name" & "  " & "Last Name" & "  " & "Tournament Handicap" & "  " & "Ghin Handicap" & vbCr
        Dim sSql As String = ""
        Dim countx As Integer = 0
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 1 and [LocationID] =" & LocationID() & "   order by firstname asc"

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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 2 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 3 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 4 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 5 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 6 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 7 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 8 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 9 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 10 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 11 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        sSql = "SELECT  [tb_Scorecard].GhinID, firstname, lastname,[memberinfo].Tournamenthandicap,[memberinfo].Ghinhandicap  FROM [memberinfo],[tb_Scorecard] where [memberinfo].[memberid] =  [tb_Scorecard].[memberid] and [tb_Scorecard].[pairingid] = 12 and [LocationID] =" & LocationID() & "   order by firstname asc"
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
        Dim subject As String = "Safari Golf Pairing for " & coursename0.Text & " on " & DateID
        Dim body As String = ""

        Dim emaillist As String = ""

        Try

            sSql = "SELECT [loweredEmail] FROM [aspnet_Membership]"

            Dim drx As SqlDataReader
            drx = GetDataReader(sSql)

            While drx.Read
                emaillist = emaillist & Trim(drx.Item("loweredEmail").ToString()) & ";"
                message.To.Add(Trim(drx.Item("loweredEmail").ToString()))
            End While

            If Len(emaillist) > 0 Then
                emaillist = Mid(emaillist, 1, Len(emaillist) - 1)
                'Get the message ready to send
                message.From = New MailAddress(from, "Golf Pairing")

                message.IsBodyHtml = False
                message.Subject = subject
                message.Body = pairlist

                smtp.Host = "relay-hosting.secureserver.net"
                smtp.Port = 25
                smtp.Send(message)
                StatusInfo.Text = "Players pairings emailed successfully."
            Else

                StatusInfo.Text = "No Players pairings to email."
            End If

        Catch ex As Exception
            StatusInfo.Text = "Error trying to send Player's Emailed the pairings."
            StatusInfo.Text = StatusInfo.Text & vbCr & ex.Message
        End Try
    End Sub

    'Private Sub UpdateCourseDetails()
    '    Dim ssql As String = ""

    '    ssql = "DELETE FROM [tb_Hole] where [LocationId] = " & LocationID

    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",1," & txtYard1.Text & "," & TxtPar1.Text & "," & txtHandicap1.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",2," & txtYard2.Text & "," & TxtPar2.Text & "," & txtHandicap2.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",3," & txtYard3.Text & "," & TxtPar3.Text & "," & txtHandicap3.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",4," & txtYard4.Text & "," & TxtPar4.Text & "," & txtHandicap4.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",5," & txtYard5.Text & "," & TxtPar5.Text & "," & txtHandicap5.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",6," & txtYard6.Text & "," & TxtPar6.Text & "," & txtHandicap6.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",7," & txtYard7.Text & "," & TxtPar7.Text & "," & txtHandicap7.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",8," & txtYard8.Text & "," & TxtPar8.Text & "," & txtHandicap8.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",9," & txtYard9.Text & "," & TxtPar9.Text & "," & txtHandicap9.Text & ")"
    '    ExecuteSql(ssql)


    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",10," & txtYard10.Text & "," & TxtPar10.Text & "," & txtHandicap10.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",11," & txtYard11.Text & "," & TxtPar11.Text & "," & txtHandicap11.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",12," & txtYard12.Text & "," & TxtPar12.Text & "," & txtHandicap12.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",13," & txtYard13.Text & "," & TxtPar13.Text & "," & txtHandicap13.Text & ")"
    '    ExecuteSql(ssql)


    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",14," & txtYard14.Text & "," & TxtPar14.Text & "," & txtHandicap14.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",15," & txtYard15.Text & "," & TxtPar15.Text & "," & txtHandicap15.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",16," & txtYard16.Text & "," & TxtPar16.Text & "," & txtHandicap16.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",17," & txtYard17.Text & "," & TxtPar17.Text & "," & txtHandicap17.Text & ")"
    '    ExecuteSql(ssql)

    '    ssql = "INSERT INTO [tb_Hole]  ([LocationId] ,[Ordinal]   ,[Yardage] ,[Par]  ,[Handicap])  VALUES (" & LocationID & ",18," & txtYard18.Text & "," & TxtPar18.Text & "," & txtHandicap18.Text & ")"
    '    ExecuteSql(ssql)


    'End Sub


    'Protected Sub btnSavePairing_Click(sender As Object, e As System.EventArgs) Handles btnSavePairing.Click
    '    InsertPairing()
    '    StatusInfo.Text = "Player pairing saved"
    'End Sub

    'Private Sub InsertPairing()

    '    Dim sSql4 As String = "DELETE FROM [tb_Pairing] WHERE locationid = " & LocationID & " "
    '    ExecuteSql(sSql4)

    '    InsertGridPairing(gvSelected1, 1)
    '    InsertGridPairing(gvSelected2, 2)
    '    InsertGridPairing(gvSelected3, 3)
    '    InsertGridPairing(gvSelected4, 4)
    '    InsertGridPairing(gvSelected5, 5)
    '    InsertGridPairing(gvSelected6, 6)
    '    InsertGridPairing(gvSelected7, 7)
    '    InsertGridPairing(gvSelected8, 8)
    '    InsertGridPairing(gvSelected9, 9)
    '    InsertGridPairing(gvSelected10, 10)
    '    InsertGridPairing(gvSelected11, 11)
    '    InsertGridPairing(gvSelected12, 12)
    'End Sub
    'Private Sub InsertGridPairing(ByRef gvSelected As GridView, seq As Integer)
    '    Dim sSql As String = ""

    '    Dim gridrow As GridViewRow

    '    For Each gridrow In gvSelected.Rows
    '        Dim GhinIDgrid As Label = gridrow.FindControl("GhinIDLabel")
    '        Dim memberidgrid As String = ""

    '        If GhinIDgrid.Text IsNot Nothing Then

    '            sSql = "SELECT memberid from [memberinfo] where ghinid=" & GhinIDgrid.Text

    '            Dim drr As SqlDataReader
    '            drr = GetDataReader(sSql)

    '            If drr.Read Then
    '                memberidgrid = drr.Item("memberid").ToString()

    '                sSql = "INSERT INTO tb_Pairing (Locationid, memberid, sequenceid)"
    '                sSql += " VALUES ("
    '                sSql += "" & LocationID
    '                sSql += ",'" & memberidgrid & "'"
    '                sSql += "," & seq
    '                sSql += ")"
    '                ExecuteSql(sSql)
    '            End If
    '            drr.Close()
    '        End If
    '    Next





    'End Sub

    Public Sub ExecuteSql(ByVal sSql As String)

        Dim cn As New SqlConnection(GetConnectionString())
        cn.Open()
        Dim cm As New SqlCommand(sSql, cn)
        cm.ExecuteNonQuery()
        cn.Close()

    End Sub


    Protected Sub btnScoreCardUpdate_Click(sender As Object, e As System.EventArgs) Handles btnScoreCardUpdate.Click

        Dim rating As Integer
        Dim slope As Integer
          
        Dim sSql As String = ""
        Dim memberidgrid As String = ""
        Dim ghinid As String = ""
        Dim Gender As String = ""
        Dim sSqlr As String = ""
        Dim sqldate As DateTime = DateID()

        Dim Thandicap As Integer
        Dim Ghandicap As Integer

        Dim memberlist As String = ""
        Dim drr As SqlDataReader
        Dim sSql1 As String = "SELECT Ghinid, memberid,Gender,Tournamenthandicap,Ghinhandicap from [memberinfo]"
        Dim drr1 As SqlDataReader
        drr1 = GetDataReader(sSql1)
        While drr1.Read

            ghinid = drr1.Item("ghinid").ToString()
            memberidgrid = drr1.Item("memberid").ToString()
            Thandicap = CInt(drr1.Item("Tournamenthandicap").ToString())
            Ghandicap = CInt(drr1.Item("Ghinhandicap").ToString())

            Gender = drr1.Item("Gender").ToString()

            If Gender = "Male" Then

                If rdoMaleTeeFront.Checked Then

                    sSqlr = "SELECT frontrating,  frontslope from tb_maleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("frontrating").ToString())
                        slope = Trim(drr.Item("frontslope").ToString())
                    End If
                    drr.Close()

                End If
                If rdoMaleTeeMiddle.Checked Then
                    sSqlr = "SELECT  middlerating, middleslope from tb_maleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("middlerating").ToString())
                        slope = Trim(drr.Item("middleslope").ToString())
                    End If
                    drr.Close()
                End If
                If rdoMaleTeeBack.Checked Then
                    sSqlr = "SELECT backrating,backslope from tb_maleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("backrating").ToString())
                        slope = Trim(drr.Item("backslope").ToString())
                    End If
                    drr.Close()
                End If
            End If

            If Gender = "FeMale" Then

                If rdoFeMaleTeeFront.Checked Then
                    sSqlr = "SELECT frontrating, frontslope from tb_FemaleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("frontrating").ToString())
                        slope = Trim(drr.Item("frontslope").ToString())
                    End If
                    drr.Close()

                End If
                If rdoFeMaleTeeMiddle.Checked Then
                    sSqlr = "SELECT middlerating,middleslope from tb_FemaleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("middlerating").ToString())
                        slope = Trim(drr.Item("middleslope").ToString())
                    End If
                    drr.Close()
                End If
                If rdoFeMaleTeeBack.Checked Then
                    sSqlr = "SELECT backrating,backslope from tb_FemaleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("backrating").ToString())
                        slope = Trim(drr.Item("backslope").ToString())
                    End If
                    drr.Close()
                End If
            End If

            Dim sSql4 As String = "Select * FROM [tb_Scorecard] WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID() & "  and [Date] = '" & DateID() & "'"
            Dim drr4 As SqlDataReader
            drr4 = GetDataReader(sSql4)

            sSql = ""

            If drr4.Read Then
                sSql = "UPDATE [tb_Scorecard]"
                sSql += " SET [TournamentHandicap] =" & Thandicap
                sSql += " ,[GhinHandicap] = " & Ghandicap
                sSql += " ,[Rating] =" & rating
                sSql += " ,[Slope] =" & slope
                sSql += " ,[Differential]=" & Differential
                sSql += " WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID() & " and [Date] = '" & DateID() & "'"

                ExecuteSql(sSql)
            End If
            drr4.Close()

        End While
        drr1.Close()

        StatusInfo2.Text = "Scorecards have updates with new ratings and slope!"
    End Sub

    Protected Sub SaveandCreateScorecards_Click(sender As Object, e As System.EventArgs) Handles SaveandCreateScorecards.Click

        'InsertPairing()
        InsertScorecards()
    End Sub

    Private Sub InsertScorecards()

        'Dim sqldate As DateTime = DateID

        'Dim sSql1 As String = "Select * FROM [tb_Scorecard] WHERE locationid = " & LocationID() & "  and [Date] = '" & sqldate & "'  and [ScorecardClosed] = 'False'"
        'Dim drr1 As SqlDataReader
        'drr1 = GetDataReader(sSql1)
        'If drr1.Read Then

        '    StatusInfo.Text = "Request denied. There are open score cards for this location for:" & sqldate

        '    Exit Sub

        'End If

        Dim sSql As String = "delete FROM [tb_Scorecard] WHERE locationid = " & LocationID() & "  and [Date] = '" & DateID() & "'"
        ExecuteSql(sSql)

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
        InsertOthers()

        StatusInfo.Text = "Player pairing saved and Scorecards created"

    End Sub

    Private Sub InsertOthers()
        Dim sSql As String = ""
        Dim memberidgrid As String = ""
        Dim Gender As String = ""
        Dim sSqlr As String = ""
        Dim sqldate As DateTime = DateID()

        Dim Thandicap As Integer
        Dim Ghandicap As Integer


        Dim rating As Integer
        Dim slope As Integer

        Dim memberlist As String = ""

        Dim sSql1 As String = "Select Ghinid FROM [tb_Scorecard] WHERE locationid = " & LocationID() & "  and [Date] = '" & sqldate & "'"
        Dim drr1 As SqlDataReader
        drr1 = GetDataReader(sSql1)
        While drr1.Read

            memberlist = memberlist & "'" & Trim(drr1.Item("ghinid").ToString()) & "',"

        End While
        drr1.Close()

        Dim ghinidx As String = ""

        If Len(memberlist) > 0 Then
            memberlist = Mid(memberlist, 1, Len(memberlist) - 1)
            sSql = "SELECT Ghinid, memberid,Gender,Tournamenthandicap,Ghinhandicap from [memberinfo] where ghinid not in (" & memberlist & ")"
        Else
            sSql = "SELECT Ghinid, memberid,Gender,Tournamenthandicap,Ghinhandicap from [memberinfo]"
        End If

        Dim drr As SqlDataReader

        drr1 = GetDataReader(sSql)
        Dim sqlslope As String = "'"
        While drr1.Read

            ghinidx = drr1.Item("ghinid").ToString()
            memberidgrid = drr1.Item("memberid").ToString()
            Thandicap = CInt(drr1.Item("Tournamenthandicap").ToString())
            Ghandicap = CInt(drr1.Item("Ghinhandicap").ToString())

            Gender = drr1.Item("Gender").ToString()


            If Gender = "Male" Then

                If rdoMaleTeeFront.Checked Then

                    sSqlr = "SELECT frontrating,  frontslope from tb_maleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("frontrating").ToString())
                        slope = Trim(drr.Item("frontslope").ToString())
                    End If
                    drr.Close()

                End If
                If rdoMaleTeeMiddle.Checked Then
                    sSqlr = "SELECT  middlerating, middleslope from tb_maleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("middlerating").ToString())
                        slope = Trim(drr.Item("middleslope").ToString())
                    End If
                    drr.Close()
                End If
                If rdoMaleTeeBack.Checked Then
                    sSqlr = "SELECT backrating,backslope from tb_maleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("backrating").ToString())
                        slope = Trim(drr.Item("backslope").ToString())
                    End If
                    drr.Close()
                End If
            End If

            If Gender = "FeMale" Then

                If rdoFeMaleTeeFront.Checked Then
                    sSqlr = "SELECT frontrating, frontslope from tb_FemaleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("frontrating").ToString())
                        slope = Trim(drr.Item("frontslope").ToString())
                    End If
                    drr.Close()

                End If
                If rdoFeMaleTeeMiddle.Checked Then
                    sSqlr = "SELECT middlerating,middleslope from tb_FemaleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("middlerating").ToString())
                        slope = Trim(drr.Item("middleslope").ToString())
                    End If
                    drr.Close()
                End If
                If rdoFeMaleTeeBack.Checked Then
                    sSqlr = "SELECT backrating,backslope from tb_FemaleCourseRating WHERE locationid = '" & LocationID & "'"
                    drr = GetDataReader(sSqlr)
                    If drr.Read Then
                        rating = CInt(drr.Item("backrating").ToString())
                        slope = Trim(drr.Item("backslope").ToString())
                    End If
                    drr.Close()
                End If
            End If

            Dim sSql4 As String = "Select * FROM [tb_Scorecard] WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID() & "  and [Date] = '" & DateID() & "'"
            Dim drr4 As SqlDataReader
            drr4 = GetDataReader(sSql4)

            sSql = ""

            If drr4.Read Then
                sSql += "UPDATE [tb_Scorecard]"
                sSql += " SET [GhinID] = '" & ghinidx & "'"
                sSql += " ,[PairingID] = 0"
                sSql += " ,[memberid] = '" & memberidgrid & "'"
                sSql += " ,[TournamentHandicap] =" & Thandicap
                sSql += " ,[GhinHandicap] = " & Ghandicap
                sSql += " ,[Rating] =" & rating
                sSql += " ,[Slope] =" & slope
                sSql += " ,[Differential]=" & Differential
                sSql += " WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID() & " and [Date] = '" & DateID() & "'"
            Else
                sSql = "INSERT INTO [tb_Scorecard]([GhinID],[LocationID],[PairingID],[Date],[memberid] ,[Score1],[Score2],[Score3],[Score4],[Score5],[Score6],[Score7],[Score8],[Score9],[ScoreTotalout],[Score10],[Score11],[Score12],[Score13],[Score14],[Score15],[Score16],[Score17],[Score18],[ScoreTotalin],[GrandTotal],[TournamentHandicap] ,[GhinHandicap],[NetScore],[Rating],[Slope],[Differential],[ScorecardClosed],[stablefordpoints])"
                sSql += " VALUES ("
                sSql += "'" & ghinidx & "'"
                sSql += "," & LocationID()
                sSql += ",0"
                sSql += ",'" & DateID() & "'"
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
                sSql += "," & rating
                sSql += "," & slope
                sSql += "," & Differential
                sSql += ",'False'"
                sSql += ",0"
                sSql += ")"

            End If

            ExecuteSql(sSql)

            drr4.Close()


        End While
        drr1.Close() 
    End Sub

    Private Sub InsertGridScorecard(ByRef gvSelected As GridView, seq As Integer)
        Dim sSql As String = ""
        Dim memberidgrid As String = ""
        Dim Gender As String = ""
        Dim sSqlr As String = ""
        Dim sqldate As DateTime = DateID()

        Dim Thandicap As Integer
        Dim Ghandicap As Integer


        Dim rating As Integer
        Dim slope As Integer

        Dim gridrow As GridViewRow

        'check existing scorecards for location

        For Each gridrow In gvSelected.Rows
            Dim GhinIDgrid As Label = gridrow.FindControl("GhinIDLabel")

            If GhinIDgrid.Text <> "" Then

                sSql = "SELECT memberid,Gender,Tournamenthandicap,Ghinhandicap from [memberinfo] where ghinid=" & GhinIDgrid.Text

                Dim drr1 As SqlDataReader
                Dim drr As SqlDataReader


                drr1 = GetDataReader(sSql)
                Dim sqlslope As String = "'"
                If drr1.Read Then
                    memberidgrid = drr1.Item("memberid").ToString()
                    Thandicap = CInt(drr1.Item("Tournamenthandicap").ToString())
                    Ghandicap = CInt(drr1.Item("Ghinhandicap").ToString())

                    Gender = drr1.Item("Gender").ToString()

                    If Gender = "Male" Then

                        If rdoMaleTeeFront.Checked Then

                            sSqlr = "SELECT frontrating,  frontslope from tb_maleCourseRating WHERE locationid = '" & LocationID & "'"
                            drr = GetDataReader(sSqlr)
                            If drr.Read Then
                                rating = CInt(drr.Item("frontrating").ToString())
                                slope = Trim(drr.Item("frontslope").ToString())
                            End If
                            drr.Close()

                        End If
                        If rdoMaleTeeMiddle.Checked Then 
                            sSqlr = "SELECT  middlerating, middleslope from tb_maleCourseRating WHERE locationid = '" & LocationID & "'"
                            drr = GetDataReader(sSqlr)
                            If drr.Read Then
                                rating = CInt(drr.Item("middlerating").ToString())
                                slope = Trim(drr.Item("middleslope").ToString())
                            End If
                            drr.Close()
                        End If
                        If rdoMaleTeeBack.Checked Then 
                            sSqlr = "SELECT backrating,backslope from tb_maleCourseRating WHERE locationid = '" & LocationID & "'"
                            drr = GetDataReader(sSqlr)
                            If drr.Read Then
                                rating = CInt(drr.Item("backrating").ToString())
                                slope = Trim(drr.Item("backslope").ToString())
                            End If
                            drr.Close()
                        End If
                    End If

                    If Gender = "FeMale" Then

                        If rdoFeMaleTeeFront.Checked Then 
                            sSqlr = "SELECT frontrating, frontslope from tb_FemaleCourseRating WHERE locationid = '" & LocationID & "'"
                            drr = GetDataReader(sSqlr)
                            If drr.Read Then
                                rating = CInt(drr.Item("frontrating").ToString())
                                slope = Trim(drr.Item("frontslope").ToString())
                            End If
                            drr.Close()

                        End If
                        If rdoFeMaleTeeMiddle.Checked Then 
                            sSqlr = "SELECT middlerating,middleslope from tb_FemaleCourseRating WHERE locationid = '" & LocationID & "'"
                            drr = GetDataReader(sSqlr)
                            If drr.Read Then
                                rating = CInt(drr.Item("middlerating").ToString())
                                slope = Trim(drr.Item("middleslope").ToString())
                            End If
                            drr.Close()
                        End If
                        If rdoFeMaleTeeBack.Checked Then 
                            sSqlr = "SELECT backrating,backslope from tb_FemaleCourseRating WHERE locationid = '" & LocationID & "'"
                            drr = GetDataReader(sSqlr)
                            If drr.Read Then
                                rating = CInt(drr.Item("backrating").ToString())
                                slope = Trim(drr.Item("backslope").ToString())
                            End If
                            drr.Close()
                        End If
                    End If

                    Dim sSql4 As String = "Select * FROM [tb_Scorecard] WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID() & "  and [Date] = '" & DateID() & "'"
                    Dim drr4 As SqlDataReader
                    drr4 = GetDataReader(sSql4)

                    sSql = ""

                    If drr4.Read Then
                        sSql += "UPDATE [tb_Scorecard]"
                        sSql += " SET [GhinID] = '" & GhinIDgrid.Text & "'"
                        sSql += " ,[PairingID] =  " & seq
                        sSql += " ,[memberid] = '" & memberidgrid & "'"
                        sSql += " ,[TournamentHandicap] =" & Thandicap
                        sSql += " ,[GhinHandicap] = " & Ghandicap
                        sSql += " ,[Rating] =" & Rating
                        sSql += " ,[Slope] =" & Slope
                        sSql += " ,[Differential]=" & Differential
                        sSql += " WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID() & " and [Date] = '" & DateID() & "'"
                    Else
                        sSql = "INSERT INTO [tb_Scorecard]([GhinID],[LocationID],[PairingID],[Date],[memberid] ,[Score1],[Score2],[Score3],[Score4],[Score5],[Score6],[Score7],[Score8],[Score9],[ScoreTotalout],[Score10],[Score11],[Score12],[Score13],[Score14],[Score15],[Score16],[Score17],[Score18],[ScoreTotalin],[GrandTotal],[TournamentHandicap] ,[GhinHandicap],[NetScore],[Rating],[Slope],[Differential],[ScorecardClosed],[stablefordpoints])"
                        sSql += " VALUES ("
                        sSql += "'" & GhinIDgrid.Text & "'"
                        sSql += "," & LocationID()
                        sSql += "," & seq
                        sSql += ",'" & DateID() & "'"
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
                        sSql += ",0"
                        sSql += ")"

                    End If

                    ExecuteSql(sSql)

                    drr4.Close()

                End If
                drr1.Close()
            End If
        Next
    End Sub
    Private Sub checkandinsertRSVP()
        Dim ssql As String = ""
        Dim drr As SqlDataReader
        Dim memberid As String = ""
        ssql = "SELECT [memberid] FROM  [memberinfo] "

        drr = GetDataReader(ssql)

        While drr.Read
            memberid = drr.Item("memberid").ToString()
            insertRSVP(memberid)
        End While
    End Sub
    Private Sub insertRSVP(memberid As String)

        Dim Loc As Integer = LocationID
        Dim evid As Integer = getevid(Loc)

        Dim ssql As String = ""
        Dim drr As SqlDataReader
        ssql = "SELECT [memberid] FROM  [memberevite] where memberid = '" & memberid & "' and locationid = " & Loc & " and eventid = " & evid

        drr = GetDataReader(ssql)

        If drr.Read Then
        Else
            ssql = "INSERT INTO [MemberEvite] ([memberid],[LocationID],[EventID])"
            ssql += " VALUES ("
            ssql += "'" & memberid & "'"
            ssql += "," & Loc
            ssql += "," & evid
            ssql += ")"
            ExecuteSql(ssql)
        End If

    End Sub
    Private Function getevid(llc As Integer) As Integer
        Dim ssql As String = "SELECT top 1 Events.id frOM Events wHERE location =" & llc & " and (Events.starttime > getdate() OR(Events.starttime = getdate())) ORDER BY Events.starttime asc, Events.id asc "
        Dim drr As SqlDataReader

        Dim e1 As Integer = 0

        drr = GetDataReader(ssql)

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

