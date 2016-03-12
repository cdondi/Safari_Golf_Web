
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
            bindalldata()
        End If

    End Sub

    'Protected Sub CourseList1_SelectedIndexChanged(sender As Object, e As System.EventArgs)
    '    bindalldata()

    'End Sub

    Private Sub bindalldata()
        Dim ssql As String = "" 

        BindLeaderBoardGrid() 

        Dim ssql2 As String = "SELECT [Locations].[title] as title from locations where id =" & LocationID()

        Dim dr2 As SqlDataReader
        dr2 = GetDataReader(ssql2)
        While dr2.Read

            'Coursename2.Text = Trim(dr2.Item("title").ToString())
            coursename3.Text = Trim(dr2.Item("title").ToString())
        End While
        dr2.Close()


        IsAdmin = True 'User.IsInRole("Administrators")

    End Sub
 
    

    Private Sub BindLeaderBoardGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)

        Dim Query As String = "SELECT  [tb_Scorecard].[GhinID] ,[MemberInfo].[firstname] ,[MemberInfo].[lastname] ,  (select CONVERT(VARCHAR(8),  [tb_Scorecard].[Date], 1) AS [MM/DD/YY]) as PlayDate    , [tb_Scorecard].[ScoreTotalout],[tb_Scorecard].[ScoreTotalin],[tb_Scorecard].[GrandTotal],[tb_Scorecard].[TournamentHandicap],[tb_Scorecard].[GhinHandicap],[tb_Scorecard].[NetScore] FROM [tb_Scorecard],[MemberInfo] where [MemberInfo].[GhinID]= [tb_Scorecard].[GhinID] and [tb_Scorecard].[locationid] =" & LocationID() & " and [Date] = '" & DateID() & "' and [tb_Scorecard].[GrandTotal] > 0 order by [NetScore] asc"

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
   

    Public Sub ExecuteSql(ByVal sSql As String)

        Dim cn As New SqlConnection(GetConnectionString())
        cn.Open()
        Dim cm As New SqlCommand(sSql, cn)
        cm.ExecuteNonQuery()
        cn.Close()

    End Sub

     
    Protected Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs)
        'Dim pages As Integer
        'pages = System.Convert.ToInt32(e.Command.Parameters("@pageCount").Value)

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

