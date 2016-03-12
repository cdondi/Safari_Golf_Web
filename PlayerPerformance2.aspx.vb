
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
                    m_LocationID = 1
                End If
                ViewState("LocationID") = m_LocationID
            End If
            Return m_LocationID
        End Get
        Set(value As Integer)
            ViewState("LocationID") = value
        End Set
    End Property

    Protected Property GhinID() As Integer
        Get
            Dim m_GhinID As Integer
            Dim id As Object = ViewState("GhinID")
            If id IsNot Nothing Then
                m_GhinID = CInt(id)
            Else
                id = Request.QueryString("GhinID")
                If id IsNot Nothing Then
                    m_GhinID = Convert.ToInt32(id)
                Else
                    m_GhinID = 1
                End If
                ViewState("LocationID") = m_GhinID
            End If
            Return m_GhinID
        End Get
        Set(value As Integer)
            ViewState("GhinID") = value
        End Set
    End Property

    Protected Property DateID() As Integer
        Get
            Dim m_DateID As Integer
            Dim id As Object = ViewState("DateID")
            If id IsNot Nothing Then
                m_DateID = CInt(id)
            Else
                id = Request.QueryString("DateID")
                If id IsNot Nothing Then
                    m_DateID = Convert.ToInt32(id)
                Else
                    m_DateID = 1
                End If
                ViewState("DateID") = m_DateID
            End If
            Return m_DateID
        End Get
        Set(value As Integer)
            ViewState("DateID") = value
        End Set
    End Property
   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        ' Dim TabParam As New ArrayList(New Object() {New ArrayList(New Object() {True, "Last 20 Games Performance", "OnTabClick(0)", True}), New ArrayList(New Object() {False, "StableFord Standing", "OnTabClick(1)", True})})
        'Tabs1.TabParams = TabParam
 
        Dim GhinID As String = Request.QueryString("GhinID")
        Dim ssql2 As String = ""

        GetSeriesValues(GhinID)

        Me.Chart1.Series(0).PostBackValue = "#AXISLABEL"
        Me.Chart1.Series(0).ToolTip = "#AXISLABEL Score: #VAL{D}"

        'GetStablefordPoints()

    End Sub
    Private Sub GetStablefordPoints()

        Dim sSQL As String

        sSQL = "select Ghinid, [firstname],[lastname], [StableFordPoints] FROM [MemberInfo] order by [StableFordPoints] desc"

        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim sdapair0 As New SqlDataAdapter(sSQL, con)
        Dim dtpair0 As New DataTable()
        sdapair0.Fill(dtpair0)
        'GridViewStableFord.DataSource = dtpair0
        'GridViewStableFord.DataBind()
    End Sub
    Protected Sub Chart1_Click(sender As Object, e As ImageMapEventArgs)

        Dim Playdate As Date = e.PostBackValue

        'Me.GridView.Caption = "Play Date: " & Playdate


        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)

        Dim Query As String = "SELECT [GhinID],[Date] ,[Score1],[Score2],[Score3],[Score4] ,[Score5] ,[Score6] ,[Score7] ,[Score8] ,[Score9],[Score10],[Score11],[Score12],[Score13],[Score14],[Score15],[Score16] ,[Score17],[Score18] ,[GrandTotal] ,[TournamentHandicap] ,[GhinHandicap] ,[NetScore] FROM [tb_Scorecard] where [Ghinid] ='" & GhinID & "' And [Date] ='" & Playdate & "'"
        Dim dataSet As New DataSet()
        Dim seriesTable As New DataTable()

        seriesTable.Columns.Add(New DataColumn("Hole", GetType(String)))
        seriesTable.Columns.Add(New DataColumn("Score", GetType(String)))

        Dim dr1 As SqlDataReader
        dr1 = GetDataReader(Query)

        If dr1.Read Then
            seriesTable.Rows.Add(New Object() {1, dr1.Item("Score1").ToString()})
            seriesTable.Rows.Add(New Object() {2, dr1.Item("Score2").ToString()})
            seriesTable.Rows.Add(New Object() {3, dr1.Item("Score3").ToString()})
            seriesTable.Rows.Add(New Object() {4, dr1.Item("Score4").ToString()})
            seriesTable.Rows.Add(New Object() {5, dr1.Item("Score5").ToString()})
            seriesTable.Rows.Add(New Object() {6, dr1.Item("Score6").ToString()})
            seriesTable.Rows.Add(New Object() {7, dr1.Item("Score7").ToString()})
            seriesTable.Rows.Add(New Object() {8, dr1.Item("Score8").ToString()})
            seriesTable.Rows.Add(New Object() {9, dr1.Item("Score9").ToString()})
            seriesTable.Rows.Add(New Object() {10, dr1.Item("Score10").ToString()})
            seriesTable.Rows.Add(New Object() {11, dr1.Item("Score11").ToString()})
            seriesTable.Rows.Add(New Object() {12, dr1.Item("Score12").ToString()})
            seriesTable.Rows.Add(New Object() {13, dr1.Item("Score13").ToString()})
            seriesTable.Rows.Add(New Object() {14, dr1.Item("Score14").ToString()})
            seriesTable.Rows.Add(New Object() {15, dr1.Item("Score15").ToString()})
            seriesTable.Rows.Add(New Object() {16, dr1.Item("Score16").ToString()})
            seriesTable.Rows.Add(New Object() {17, dr1.Item("Score17").ToString()})
            seriesTable.Rows.Add(New Object() {18, dr1.Item("Score18").ToString()})
            seriesTable.Rows.Add(New Object() {"Gross Score", dr1.Item("GrandTotal").ToString()})
            seriesTable.Rows.Add(New Object() {"Net Score", dr1.Item("NetScore").ToString()})

        End If

        'GridView.DataSource = seriesTable
        'GridView.DataBind()

        dr1.Close()
    End Sub


    Private Sub GetSeriesValues(ByVal Ghinid As String)

        Chart1.Series("Series1").Points.Clear()


        Dim ser As Series = Me.Chart1.Series("Series1")

        Dim dataSet As New DataSet()
        Dim seriesTable As New DataTable(ser.Name)

        seriesTable.Columns.Add(New DataColumn("No", GetType(Integer)))
        seriesTable.Columns.Add(New DataColumn("PlayDate", GetType(String)))
        seriesTable.Columns.Add(New DataColumn("Score", GetType(Double)))


        Dim sSQL As String

        '  sSQL = "SELECT top 20 [tb_Scorecard].[GhinID] ,[firstname] ,[lastname],(select CONVERT(VARCHAR(8), [Date], 1) AS [MM/DD/YY]) as PlayDate ,[GrandTotal] as Score FROM [tb_Scorecard],[MemberInfo] where [MemberInfo].[GhinID] = [tb_Scorecard].[GhinID] and [tb_Scorecard].[GhinID]  = '" & Ghinid & "' and [GrandTotal] > 0  order by [Date] Desc"

        If Ghinid <> "" Then
            sSQL = "select [tb_Scorecard].[GhinID] as GhinID ,[firstname],[lastname], (select CONVERT(VARCHAR(8), [Date], 1) AS [MM/DD/YY]) as PlayDate ,[GrandTotal] as Score,[Locations].[title] as locationname FROM [tb_Scorecard],[MemberInfo],[Locations]  where [Locations].[ID] = [tb_Scorecard].[Locationid] and [MemberInfo].[GhinID] = [tb_Scorecard].[GhinID] and [tb_Scorecard].[GhinID]  =  '" & Ghinid & "' and [GrandTotal] > 0  and [Date] in (SELECT top 20 [tb_Scorecard].[Date] FROM [tb_Scorecard],[MemberInfo] where [MemberInfo].[GhinID] = [tb_Scorecard].[GhinID] and [tb_Scorecard].[GhinID]  =  '" & Ghinid & "'  and [GrandTotal] > 0  order by [Date] Desc) order by [Date] asc"
        Else
            sSQL = "select top 1 [tb_Scorecard].[GhinID] as GhinID ,[firstname],[lastname], (select CONVERT(VARCHAR(8), [Date], 1) AS [MM/DD/YY]) as PlayDate ,[GrandTotal] as Score,[Locations].[title] as locationname FROM [tb_Scorecard],[MemberInfo],[Locations]  where [Locations].[ID] = [tb_Scorecard].[Locationid] and [MemberInfo].[GhinID] = [tb_Scorecard].[GhinID] and [GrandTotal] > 0  and [Date] in (SELECT top 20 [tb_Scorecard].[Date] FROM [tb_Scorecard],[MemberInfo] where [MemberInfo].[GhinID] = [tb_Scorecard].[GhinID] and [GrandTotal] > 0  order by [Date] Desc) order by [Date] asc"
        End If


        Dim count As Integer = 0
        Dim dr1 As SqlDataReader
        dr1 = GetDataReader(sSQL)
        Dim titlex As String = ""

        While dr1.Read
            Chart1.Series("Series1").Points.AddXY(dr1.Item("PlayDate").ToString(), dr1.Item("Score").ToString())
            'Dim p As DataPoint = ser.Points(count)
            'seriesTable.Rows.Add(New Object() {count, dr1.Item("PlayDate").ToString(), dr1.Item("Score").ToString()})
            'count = count + 1
            titlex = dr1.Item("firstname").ToString() & " " & dr1.Item("lastname").ToString()
            lblScore.Text = "Click on the bar to view each golf round details"
        End While

        Chart1.Titles(0).Text = "Most Current 20 Games for " & titlex
        Chart1.Series("Series1").IsXValueIndexed = False
        Chart1.ChartAreas("ChartArea1").AxisX.LabelStyle.Interval = 1
        Chart1.ChartAreas("ChartArea1").AxisX.MajorGrid.Interval = 1
        Chart1.ChartAreas("ChartArea1").AxisX.MajorTickMark.Interval = 1

        ' Disable axis labels auto fitting of text
        Chart1.ChartAreas("ChartArea1").AxisX.IsLabelAutoFit = True

        ' Set axis labels angle
        Chart1.ChartAreas("ChartArea1").AxisX.LabelStyle.Angle = 45

        ' Disable offset labels style
        Chart1.ChartAreas("ChartArea1").AxisX.LabelStyle.IsStaggered = False

        ' Enable X axis labels
        Chart1.ChartAreas("ChartArea1").AxisX.LabelStyle.Enabled = True

        Chart1.ChartAreas("ChartArea1").AxisX.Interval = 1
        'Chart1.Series("Series1").ToolTip = "#VALX"

        ' Draw as 3D Cylinder
        Chart1.Series("Series1")("DrawingStyle") = "Cylinder"

        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim sdapair0 As New SqlDataAdapter(sSQL, con)
        Dim dtpair0 As New DataTable()
        sdapair0.Fill(dtpair0)
        'DataGrid1.DataSource = dtpair0
        'DataGrid1.DataBind()
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

