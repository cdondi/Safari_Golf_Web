
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

Partial Class LeaderBoardControl
    Inherits System.Web.UI.UserControl
    Private Rating As Integer
    Private Slope As Integer
    Private Differential As Integer
    Protected IsAdmin As Boolean
    Private nextLocationID As Integer
    Private prevLocationID As Integer
    Const INVALIDID As Integer = -1


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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            BindLeaderBoardGrid()
        End If


    End Sub

    Private Sub BindLeaderBoardGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)

        Dim Query As String = "SELECT  [tb_Scorecard].[GhinID] ,[MemberInfo].[firstname] ,[MemberInfo].[lastname] ,[tb_Scorecard].[Date], [tb_Scorecard].[ScoreTotalout],[tb_Scorecard].[ScoreTotalin],[tb_Scorecard].[GrandTotal],[tb_Scorecard].[TournamentHandicap],[tb_Scorecard].[GhinHandicap],[tb_Scorecard].[NetScore] FROM [tb_Scorecard],[MemberInfo] where [MemberInfo].[GhinID]= [tb_Scorecard].[GhinID] and [tb_Scorecard].[ScorecardClosed] = 'False' and [tb_Scorecard].[locationid] =" & LocationID & " and [tb_Scorecard].[NetScore] > 0  order by [NetScore] asc"

        Dim sdapair1 As New SqlDataAdapter(Query, con)
        Dim dtpair1 As New DataTable()
        sdapair1.Fill(dtpair1)
        LeaderboardGrid.DataSource = dtpair1
        LeaderboardGrid.DataBind()

        con.Close()
    End Sub


    Protected Sub btnRefreshLeaderBoard_Click(sender As Object, e As System.EventArgs) Handles btnRefreshLeaderBoard.Click
        'SELECT [Locations].[id] as id, [Locations].[title] as title,[memberinfo].[firstname] as firstname,[memberinfo].[lastname] as lastname,[tb_scorecardnew].[scorecardid] as scorecardid , [memberinfo].[Tournamenthandicap],[memberinfo].[ghinhandicap],[tb_scorecardnew].[Grandtotal] as totalscore,CASE WHEN ((Select count(*) FROM [tb_scorecardnew] WHERE  [tb_scorecardnew].[memberid] =[memberinfo].[memberid]) < 5 or [memberinfo].[Tournamenthandicap] > [memberinfo].[ghinhandicap]) THEN [tb_scorecardnew].[Grandtotal] - [memberinfo].[ghinhandicap] ELSE [tb_scorecardnew].[Grandtotal] - [memberinfo].[Tournamenthandicap] END as Netscore FROM [Locations], [memberinfo],  [tb_scorecardnew] where [Locations].[id] = [tb_scorecardnew].[locationid] and [tb_scorecardnew].[memberid] =[memberinfo].[memberid] and [memberinfo].[memberid]=[tb_scorecardnew].[memberid] and [Locations].[id] = 1 group by [Locations].[id], [Locations].[title], [memberinfo].[firstname], [memberinfo].[lastname], [tb_scorecardnew].[scorecardid],[memberinfo].[memberid],[memberinfo].[Tournamenthandicap] , [memberinfo].[Ghinhandicap],[tb_scorecardnew].[Grandtotal]  order by Netscore asc"><SelectParameters>
        lblRefreshLeader.Text = "Refreshed!"
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


End Class
