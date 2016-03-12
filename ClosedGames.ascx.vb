
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

Partial Class ClosedGamesControl
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        
            BindClosedGrid()


    End Sub


 Private Sub BindClosedGrid()
        Dim i As Integer = 1
        Dim ssqlr As String = "Select distincT([tb_Scorecard].[Date]) as dtx FROM [tb_Scorecard] where [LocationID] = 1 order by [Date] desc"
        Dim drr As SqlDataReader
        Dim DateString As String = ""
        drr = GetDataReader(ssqlr)

        While drr.Read
            DateString = drr.Item("dtx").ToString()
            GetClosedGametoGrid(DateString, i)
            i = i + 1
        End While
        drr.Close()

    End Sub
    Private Sub GetClosedGametoGrid(DateString As String, gridnum As Integer)
        'crazy stuff, the first griview is a dummy.  second one will not show if you delete this one
        Dim query As String = "SELECT [Locations].[id] as id, [Locations].[title] as title,[memberinfo].[firstname] as firstname,[memberinfo].[lastname] as lastname, [tb_Scorecard].[scorecardid] as scorecardid , [memberinfo].[Tournamenthandicap],[memberinfo].[ghinhandicap],[tb_Scorecard].[Grandtotal] as totalscore,CASE WHEN ((Select count(*) FROM [tb_Scorecard] WHERE  [tb_Scorecard].[memberid] =[memberinfo].[memberid]) < 5 or  [memberinfo].[Tournamenthandicap] > [memberinfo].[ghinhandicap]) THEN [tb_Scorecard].[Grandtotal] - [memberinfo].[ghinhandicap]   ELSE [tb_Scorecard].[Grandtotal] - [memberinfo].[Tournamenthandicap] END as Netscore FROM [Locations], [memberinfo],  [tb_Scorecard]   where [Date] = '" & DateString & "' and [Locations].[id] = [tb_Scorecard].[locationid] and [tb_Scorecard].[memberid] =[memberinfo].[memberid] and    [memberinfo].[memberid]=[tb_Scorecard].[memberid] and [Locations].[id] = 1 and [tb_Scorecard].[scorecardclosed] = 'True' group by [Locations].[id], [Locations].[title],    [memberinfo].[firstname], [memberinfo].[lastname], [tb_Scorecard].[scorecardid],[memberinfo].[memberid],   [memberinfo].[Tournamenthandicap] , [memberinfo].[Ghinhandicap],[tb_Scorecard].[Grandtotal]  order by Netscore asc"
        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim sdapair0 As New SqlDataAdapter(query, con)
        Dim dtpair0 As New DataTable()
        sdapair0.Fill(dtpair0)

        If gridnum = 1 Then
            DatePlayed1.Text = "Game Played on:" & DateString
            GridViewClosed1.DataSource = dtpair0
            GridViewClosed1.DataBind()
        End If
        If gridnum = 2 Then
            DatePlayed2.Text = "Game Played on:" & DateString
            GridViewClosed2.DataSource = dtpair0
            GridViewClosed2.DataBind()
        End If
        If gridnum = 3 Then
            DatePlayed3.Text = "Game Played on:" & DateString
            GridViewClosed3.DataSource = dtpair0
            GridViewClosed3.DataBind()
        End If
        If gridnum = 4 Then
            DatePlayed4.Text = "Game Played on:" & DateString
            GridViewClosed4.DataSource = dtpair0
            GridViewClosed4.DataBind()
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


End Class
