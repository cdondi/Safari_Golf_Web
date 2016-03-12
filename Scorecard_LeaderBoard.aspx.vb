
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
    Protected Sub Page_Load(sender As Object, e As EventArgs)
         
        Dim dateid As String = Request.QueryString("dateid")

        Dim locid As String = Request.QueryString("LocationID")

        If Not IsPostBack Then
            'Dim controlToReturn As Control = FindControlRecursive(Repeater1, "dateid")
        End If

        If locid <> "" And dateid <> "" Then
            GetClosedGametoGrid(dateid, locid)
        End If

    End Sub
    Private Function FindControlRecursive(ByVal rootControl As Control, ByVal controlID As String) As Control

        If rootControl.ID = controlID Then
            Return rootControl
        End If

        For Each controlToSearch As Control In rootControl.Controls
            Dim controlToReturn As Control =
                FindControlRecursive(controlToSearch, controlID)
            If controlToReturn IsNot Nothing Then
                Return controlToReturn
            End If
        Next
        Return Nothing
    End Function


    Protected Sub btnRefreshLeaderBoard_Click(sender As Object, e As System.EventArgs) Handles btnRefreshLeaderBoard.Click

        Dim dateid As String = Request.QueryString("dateid")

        Dim locid As String = Request.QueryString("LocationID")

        If locid <> "" And dateid <> "" Then
            GetClosedGametoGrid(dateid, locid)

            lblRefreshLeader.Text = "Refreshed!"

        End If

    End Sub



    Private Sub GetClosedGametoGrid(DateString As String, locid As Integer)
        'crazy stuff, the first griview is a dummy.  second one will not show if you delete this 

        
        Dim query As String = "SELECT  [tb_Scorecard].[GhinID] ,[MemberInfo].[firstname] ,[MemberInfo].[lastname] , (select CONVERT(VARCHAR(8),  [tb_Scorecard].[Date], 1) AS [MM/DD/YYYY]) as Playdate, [tb_Scorecard].[ScoreTotalout],[tb_Scorecard].[ScoreTotalin],[tb_Scorecard].[GrandTotal],[tb_Scorecard].[TournamentHandicap],[tb_Scorecard].[GhinHandicap],[tb_Scorecard].[netscore]  FROM [tb_Scorecard],[MemberInfo] where [MemberInfo].[GhinID]= [tb_Scorecard].[GhinID] and [tb_Scorecard].[locationid] = " & locid & " AND [tb_Scorecard].[Date] ='" & DateString & "' and [tb_Scorecard].[GrandTotal] > 0  order by [tb_Scorecard].[netscore] asc, [tb_Scorecard].[grandtotal] asc"
        Dim constr As String = ConfigurationManager.ConnectionStrings("ClubSiteDB").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim sdapair0 As New SqlDataAdapter(query, con)
        Dim dtpair0 As New DataTable()
        sdapair0.Fill(dtpair0)

        DatePlayed1.Text = "Date:" & DateString
        GridViewClosed1.DataSource = dtpair0
        GridViewClosed1.DataBind()

        Dim ssql2 As String = "SELECT [Locations].[title] as title from locations where id =" & CInt(locid)

        Dim dr2 As SqlDataReader
        dr2 = GetDataReader(ssql2)
        While dr2.Read
            LocationPlayed.Text = " - At: " & Trim(dr2.Item("title").ToString())
        End While
        dr2.Close()
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

