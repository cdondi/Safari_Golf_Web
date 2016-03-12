
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

    Private Best_of_4_Mugs As Integer = 0
    Private Best_of_3_Mugs As Integer = 0
    Private Best_of_2_Tournaments As Integer = 0
    Private Best_of_3_Tournaments As Integer = 0
    Private Best_of_3_Mugs_and_2_Tournaments As Integer = 0
    Private Best_of_3_Mugs_and_3_Tournaments As Integer = 0
    Private Best_of_4_Mugs_and_3_Tournaments As Integer = 0

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            GetMemberInfo()

        End If

    End Sub
    
    Private Sub GetMemberInfo()

        Dim dt As DataTable = DirectCast(Session("TestData"), DataTable)

        Dim titles As String = ""

        Dim ssql As String = "SELECT [title] from [Events] where [StableFordPoint] = 'True' order by starttime asc"
        Dim drr As SqlDataReader
       

        Dim loc As Integer = 0

        drr = GetDataReader(ssql)

        While drr.Read
            titles = titles & "[" & drr.Item("title").ToString() & "],"
        End While

        drr.Close()

        If Len(titles) > 0 Then
            titles = Mid(titles, 1, Len(titles) - 1)
        End If
         
        ssql = "Select * from (Select   [tb_Scorecard].[GhinID] as 'Ghin ID',[Events].[title],memberinfo.firstname as 'First Name'  ,memberinfo.lastname as 'Last Name', "
        ssql = ssql & " [tb_Scorecard].[StableFordPoints] FROM [tb_Scorecard], [Events], memberinfo   "
        ssql = ssql & " where [Events].[StableFordPoint] = 'True' "
        ssql = ssql & " and [Events].[location] =[tb_Scorecard].[LocationID] "
        ssql = ssql & " and memberinfo.[memberid]  =[tb_Scorecard].[memberid]"
        ssql = ssql & " and (DATEPART(YYYY, [Events].[starttime]) * 10000 + DATEPART(MM, [Events].[starttime]) * 100 + DATEPART(DD, [Events].[starttime]) = DATEPART(YYYY, [tb_Scorecard].[Date]) * 10000 + DATEPART(MM, [tb_Scorecard].[Date]) * 100 + DATEPART(DD, [tb_Scorecard].[Date]))"
        ssql = ssql & " ) "
        ssql = ssql & " as s PIVOT (max(StableFordPoints) FOR [title] IN (" & titles & ")) AS pvt "

        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim sdapair0 As New SqlDataAdapter(ssql, con)
        Dim dtpair0 As New DataTable()
        sdapair0.Fill(dtpair0)

        dtpair0.Columns.Add(New DataColumn("Best of 4 Mugs", GetType(Integer)))
        dtpair0.Columns.Add(New DataColumn("Best of 3 Mugs", GetType(Integer)))
        dtpair0.Columns.Add(New DataColumn("Best of 2 Tournaments", GetType(Integer)))
        dtpair0.Columns.Add(New DataColumn("Best of 3 Tournaments", GetType(Integer)))
        dtpair0.Columns.Add(New DataColumn("Best of 3 Mugs and 2 Tournaments", GetType(Integer)))
        dtpair0.Columns.Add(New DataColumn("Best of 3 Mugs and 3 Tournaments", GetType(Integer)))
        dtpair0.Columns.Add(New DataColumn("Best of 4 Mugs and 3 Tournaments", GetType(Integer)))

        For Each row As DataRow In dtpair0.Rows
           
            sumoftotal(row.Item("Ghin ID").ToString)

            row.Item("Best of 4 Mugs") = Best_of_4_Mugs
            row.Item("Best of 3 Mugs") = Best_of_3_Mugs
            row.Item("Best of 2 Tournaments") = Best_of_2_Tournaments
            row.Item("Best of 3 Tournaments") = Best_of_3_Tournaments
            row.Item("Best of 3 Mugs and 2 Tournaments") = Best_of_3_Mugs_and_2_Tournaments
            row.Item("Best of 3 Mugs and 3 Tournaments") = Best_of_3_Mugs_and_3_Tournaments
            row.Item("Best of 4 Mugs and 3 Tournaments") = Best_of_4_Mugs_and_3_Tournaments

        Next row
         
        dtpair0.DefaultView.Sort = "Best of 4 Mugs and 3 Tournaments" & " desc"

        MemberInfoUpdates.DataSource = dtpair0
        MemberInfoUpdates.DataBind()
         

    End Sub

    Private Sub sumoftotal(ByVal ghinid As String)

        Best_of_4_Mugs = 0
        Best_of_3_Mugs = 0
        Best_of_2_Tournaments = 0
        Best_of_3_Tournaments = 0
        Best_of_3_Mugs_and_2_Tournaments = 0
        Best_of_3_Mugs_and_3_Tournaments = 0
        Best_of_4_Mugs_and_3_Tournaments = 0

        Dim drr As SqlDataReader

        Dim SSSQL As String = "SELECT  top(4) [Events].[GameType],  [tb_Scorecard].[StableFordPoints] "

        SSSQL = SSSQL & " FROM [tb_Scorecard] , [Events] "
        SSSQL = SSSQL & "  where [Events].[StableFordPoint] = 'True' "
        SSSQL = SSSQL & " and  [tb_Scorecard].[GhinID] = '" & ghinid & "' "
        SSSQL = SSSQL & " and [Events].[GameType] = 'mug' "
        SSSQL = SSSQL & " and [Events].[location] =[tb_Scorecard].[LocationID]  "
        SSSQL = SSSQL & " and (DATEPART(YYYY, [Events].[starttime]) * 10000 + DATEPART(MM, [Events].[starttime]) * 100 + DATEPART(DD, [Events].[starttime]) = DATEPART(YYYY, [tb_Scorecard].[Date]) * 10000 + DATEPART(MM, [tb_Scorecard].[Date]) * 100 + DATEPART(DD, [tb_Scorecard].[Date]))  "


        SSSQL = SSSQL & " Union "


        SSSQL = SSSQL & " SELECT  top(4) [Events].[GameType],  [tb_Scorecard].[StableFordPoints] "
        SSSQL = SSSQL & " FROM [tb_Scorecard] , [Events] "
        SSSQL = SSSQL & "  where [Events].[StableFordPoint] = 'True' "
        SSSQL = SSSQL & " and  [tb_Scorecard].[GhinID] = '" & ghinid & "' "
        SSSQL = SSSQL & " and [Events].[GameType] = 'tournament' "
        SSSQL = SSSQL & " and [Events].[location] =[tb_Scorecard].[LocationID]  "
        SSSQL = SSSQL & " and (DATEPART(YYYY, [Events].[starttime]) * 10000 + DATEPART(MM, [Events].[starttime]) * 100 + DATEPART(DD, [Events].[starttime]) = DATEPART(YYYY, [tb_Scorecard].[Date]) * 10000 + DATEPART(MM, [tb_Scorecard].[Date]) * 100 + DATEPART(DD, [tb_Scorecard].[Date]))  "
        SSSQL = SSSQL & " order by [tb_Scorecard].[StableFordPoints] desc"

        drr = GetDataReader(SSSQL)
        Dim countmugs As Integer = 0
        Dim amounttot As Integer = 0
        Dim counttournaments As Integer = 0
        Dim gametypex As String = ""

        While drr.Read

            gametypex = drr.Item("gametype").ToString()
            amounttot = CInt(drr.Item("StableFordPoints"))


            If gametypex = "Mug" Then

                countmugs = countmugs + 1

                If countmugs < 4 Then
                    Best_of_3_Mugs = Best_of_3_Mugs + amounttot
                    Best_of_3_Mugs_and_2_Tournaments = Best_of_3_Mugs_and_2_Tournaments + amounttot
                    Best_of_3_Mugs_and_3_Tournaments = Best_of_3_Mugs_and_3_Tournaments + amounttot
                End If

                If countmugs < 5 Then
                    Best_of_4_Mugs = Best_of_4_Mugs + amounttot
                    Best_of_4_Mugs_and_3_Tournaments = Best_of_4_Mugs_and_3_Tournaments + amounttot
                End If


            End If

            If gametypex = "Tournament" Then

                counttournaments = counttournaments + 1

                If counttournaments < 3 Then
                    Best_of_2_Tournaments = Best_of_2_Tournaments + amounttot
                    Best_of_3_Mugs_and_2_Tournaments = Best_of_3_Mugs_and_2_Tournaments + amounttot
                End If

                If counttournaments < 4 Then
                    Best_of_3_Tournaments = Best_of_3_Tournaments + amounttot
                    Best_of_3_Mugs_and_3_Tournaments = Best_of_3_Mugs_and_3_Tournaments + amounttot
                    Best_of_4_Mugs_and_3_Tournaments = Best_of_4_Mugs_and_3_Tournaments + amounttot
                End If

            End If


        End While
        drr.Close()

    End Sub

 
    Private Sub GetMemberInfoxxx()

        Dim dt As DataTable = DirectCast(Session("TestData"), DataTable)

        Dim titles As String = ""

        Dim ssql As String = "SELECT [title] from [Events] where [StableFordPoint] = 'True' order by starttime asc"
        Dim drr As SqlDataReader 
        Dim drx As SqlDataReader


        Dim loc As Integer = 0

        drr = GetDataReader(ssql)

        While drr.Read
            titles = titles & "[" & drr.Item("title").ToString() & "],"
        End While

        drr.Close()

        If Len(titles) > 0 Then
            titles = Mid(titles, 1, Len(titles) - 1)
        End If

        'old
        ssql = "Select * from (Select   [tb_Scorecard].[GhinID],[Events].[title],memberinfo.firstname  ,memberinfo.lastname, "
        ssql = ssql & " [tb_Scorecard].[StableFordPoints] FROM [tb_Scorecard], [Events], memberinfo   "
        ssql = ssql & " where [Events].[StableFordPoint] = 'True' "
        ssql = ssql & " and [Events].[location] =[tb_Scorecard].[LocationID] "
        ssql = ssql & " and memberinfo.[memberid]  =[tb_Scorecard].[memberid]"
        ssql = ssql & " and (DATEPART(YYYY, [Events].[starttime]) * 10000 + DATEPART(MM, [Events].[starttime]) * 100 + DATEPART(DD, [Events].[starttime]) = DATEPART(YYYY, [tb_Scorecard].[Date]) * 10000 + DATEPART(MM, [tb_Scorecard].[Date]) * 100 + DATEPART(DD, [tb_Scorecard].[Date]))"
        ssql = ssql & " ) "
        ssql = ssql & " as s PIVOT (max(StableFordPoints) FOR [title] IN (" & titles & ")) AS pvt "

        ssql = "Select [memberid], [firstname] ,[lastname] FROM  [MemberInfo]  order by [lastname]"

        Dim dataSet As New DataSet()
        Dim seriesTable As New DataTable("stable")

        seriesTable.Columns.Add(New DataColumn("memberid", GetType(String)))
        seriesTable.Columns.Add(New DataColumn("firstname", GetType(String)))
        seriesTable.Columns.Add(New DataColumn("lastname", GetType(String)))
        seriesTable.Columns.Add(New DataColumn("date", GetType(String)))
        seriesTable.Columns.Add(New DataColumn("locationname", GetType(String)))
        seriesTable.Columns.Add(New DataColumn("StableFordPoints", GetType(String)))

        Dim dr2 As SqlDataReader
        dr2 = GetDataReader(ssql)
        Dim p As Integer = 0
        Dim g As Integer = 0

        Dim pp(100, 100) As String

        While dr2.Read

            ssql = "Select [firstname]"
            ssql = ssql & " ,[lastname],[starttime],[MemberInfo].[memberid] as memberid,[Date]"
            ssql = ssql & " ,[Events].[title]   as locationtname   "
            ssql = ssql & " ,[Locations].[title] as titlENAME "
            ssql = ssql & " ,[location]"
            ssql = ssql & " ,[StableFordPoints]"
            ssql = ssql & "  FROM  [Events], [Locations], [tb_Scorecard], [MemberInfo] "
            ssql = ssql & " where [Events].[StableFordPoint] = 'True'"
            ssql = ssql & " and [Locations].[id] = [Events].[location] and  [Location] =[tb_Scorecard].[LocationID]"
            ssql = ssql & " and [tb_Scorecard].[memberid]=[MemberInfo].[memberid]  "
            ssql = ssql & " and (DATEPART(YYYY, [Events].[starttime]) * 10000 + DATEPART(MM, [Events].[starttime]) * 100 + DATEPART(DD, "
            ssql = ssql & " [Events].[starttime]) = DATEPART(YYYY, [tb_Scorecard].[Date]) * 10000 + DATEPART(MM, [tb_Scorecard].[Date]) * 100 + DATEPART(DD, [tb_Scorecard].[Date]))"
            ssql = ssql & " and [MemberInfo].[memberid] = '" & dr2.Item("memberid").ToString() & "'"
            p = p + 1
            g = 0
            drx = GetDataReader(ssql)
            While drx.Read
                g = g + 1
                dt.Rows.Add(New Object() {drx.Item("memberid").ToString(), drx.Item("firstname").ToString(), dr2.Item("lastname").ToString(), drx.Item("starttime").ToString(), drx.Item("locationtname").ToString(), drx.Item("StableFordPoints").ToString()})
            End While
            drx.Close()

        End While
        dr2.Close()

        MemberInfoUpdates.DataSource = dt
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

        MemberUpdates(lblMemberid.Text, lblGhin.Text)
        MemberInfoUpdates.EditIndex = -1
        GetMemberInfo()

    End Sub

    Private Sub MemberUpdates(ByVal lblMemberid As String, ByVal lblGhin As String)
        Dim i As Integer = 1

        Dim sSql As String = ""

        'sSql += "UPDATE [MemberInfo]"
        'sSql += " SET [address]  = '" & lblAddress & "'"
        'sSql += " ,[phone]  = '" & lblPhone & "'"
        'sSql += " ,[firstname]  = '" & lblFirsttName & "'"
        'sSql += " ,[lastname]  = '" & lblLastName & "'"
        'sSql += " ,[Tournamenthandicap]  = '" & lbltxtTournamentHCP & "'"
        'sSql += " ,[Ghinhandicap]  = '" & lbltxtGhinHCP & "'"
        'sSql += " ,[GhinID]  = '" & lblGhin & "'"
        'sSql += " ,[Gender]  = '" & lblGender & "'"
        'sSql += " ,[StableFordPoints] = '" & lblStableFordPoints & "'"
        'sSql += " WHERE Memberid= '" & lblMemberid & "'"

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

