
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

Imports System.Net.Mail
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
 
       

        If Not IsPostBack Then

            IsAdmin = User.IsInRole("Administrators")
            'panel1.Visible = IsAdmin;
            'SqlDataSource4.SelectParameters("locationid").DefaultValue = Convert.ToString(LocationID)
            'MaleGolfRating.SelectParameters("locationid").DefaultValue = Convert.ToString(LocationID)
            'FemaleGolfRating.SelectParameters("locationid").DefaultValue = Convert.ToString(LocationID)

            BindCourseGrid() 
        End If


        IsAdmin = User.IsInRole("Administrators") 
        
    End Sub


    Protected Sub grdViewLocationsEditLocation(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        grdViewLocations.EditIndex = e.NewEditIndex
        grdViewLocationsBindData()
    End Sub
    Protected Sub grdViewLocationsCancelEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        grdViewLocations.EditIndex = -1
        grdViewLocationsBindData()
    End Sub
    Protected Sub grdViewLocationsUpdate(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)

        Dim lblhole1 As String = DirectCast(grdViewLocations.Rows(e.RowIndex).FindControl("lblhole"), Label).Text
        Dim lblYards1 As String = DirectCast(grdViewLocations.Rows(e.RowIndex).FindControl("lblYards"), Label).Text
        Dim lblPar1 As String = DirectCast(grdViewLocations.Rows(e.RowIndex).FindControl("lblPar"), Label).Text
        Dim lblHCP1 As String = DirectCast(grdViewLocations.Rows(e.RowIndex).FindControl("lblHCP"), Label).Text

        updateHoles(lblhole1, lblYards1, lblPar1, lblHCP1)
        grdViewLocations.EditIndex = -1


    End Sub

    Private Sub updateHoles(ByVal lblhole1 As String, ByVal lblYards1 As String, ByVal lblPar1 As String, ByVal hcp2 As String)
        Dim i As Integer = 1

        Dim sSql As String = ""

        sSql += "UPDATE [tb_hole]"
        sSql += " ,[Ordinal] = " & lblhole1
        sSql += " ,[Yardage] = " & lblYards1
        sSql += " ,[Par] = " & lblPar1
        sSql += " ,[Handicap] = " & hcp2
        sSql += " WHERE locationid = " & LocationID

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


    Protected Sub grdViewLocationsOnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        grdViewLocationsBindData()
        grdViewLocations.PageIndex = e.NewPageIndex
        grdViewLocations.DataBind()
    End Sub

    Private Sub BindCourseGrid()
        'Dim strQuery As String = "SELECT  [tb_Scorecard].[ScorecardClosed] as scorecardsclosed, [tb_Scorecard].[ScorecardId] as ScorecardId, [tb_Scorecard].[GhinID] as [GhinID],[tb_Scorecard].[memberid] as memberid,concat([memberinfo].[firstname], ' ' ,[memberinfo].[lastname]) as playername,[Score1] ,[Score2] ,[Score3] ,[Score4] ,[Score5]   ,[Score6]  ,[Score7] ,[Score8]  ,[Score9]  ,[ScoreTotalout] FROM  [tb_Scorecard], [memberinfo] where [tb_Scorecard].[memberid] =[memberinfo].[memberid] and [PairingID] =" & ScorecardPairID & " and [LocationID]  = " & LocationID & " order by [tb_Scorecard].[GhinID]"

        CheckandCreateHoles()

        Dim ssql As String = "SELECT [LocationId] , [Holeid], [Ordinal],[Yardage],[Par],[Handicap]  FROM [tb_Hole] where [LocationId] = " & LocationID & " order by [ordinal] asc"

        Dim cmd As New SqlCommand(ssql)
        grdViewLocations.DataSource = GetData(cmd)
        grdViewLocations.DataBind()

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


    Private Sub CheckandCreateHoles()

        On Error Resume Next

        Dim ssql As String = "SELECT [LocationId] , [Holeid], [Ordinal],[Yardage],[Par],[Handicap]  FROM [tb_Hole] where [LocationId] = " & LocationID & " order by [ordinal] asc"

        Dim drx As SqlDataReader
        drx = GetDataReader(sSql)

        If Not drx.Read Then
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,1,400,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,2,200,3,10)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,3,420,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,4,600,5,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,5,400,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,6,330,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,7,290,3,8)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,8,400,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,9,440,4,8)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,10,300,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,11,400,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,12,400,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,13,440,4,7)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,14,400,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,15,400,4,5)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,16,200,3,15)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,17,440,4,4)"
            ExecuteSql(ssql)
            ssql = "INSERT INTO [tb_Hole]([LocationId] ,[Ordinal] ,[Yardage] ,[Par] ,[Handicap]) VALUES (" & LocationID & " ,18,550,5,5)"
            ExecuteSql(ssql)
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

