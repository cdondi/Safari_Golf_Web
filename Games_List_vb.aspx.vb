
Imports System
Imports System.Web.UI.WebControls
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports DevCow.Web.UI

Partial Public Class Events_Calendar
    Inherits DevCowThemePage
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
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        IsAdmin = User.IsInRole("Administrators")
        'panel1.Visible = IsAdmin;
        SqlDataSource2.SelectParameters("id").DefaultValue = Convert.ToString(LocationID)
    End Sub
    Protected Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs)
        Dim pages As Integer
        pages = System.Convert.ToInt32(e.Command.Parameters("@pageCount").Value)

    End Sub
    Protected Sub pn1_SelectedPageChanged(sender As Object, e As EventArgs)

    End Sub
    Protected Sub Pn2_SelectedPageChanged(sender As Object, e As EventArgs)

    End Sub
    Protected Sub nextButton_Click(sender As Object, e As EventArgs)
        InitValsFromSql(LocationID)
        If nextLocationID <> INVALIDID Then
            prevLocationID = LocationID
            LocationID = nextLocationID
            SqlDataSource2.SelectParameters("id").DefaultValue = Convert.ToString(nextLocationID)
        End If
        ToggleLinks()
    End Sub
    Protected Sub prevButton_Click(sender As Object, e As System.EventArgs)
        InitValsFromSql(LocationID)
        If prevLocationID <> INVALIDID Then
            nextLocationID = LocationID
            LocationID = prevLocationID
            SqlDataSource2.SelectParameters("id").DefaultValue = Convert.ToString(prevLocationID)
        End If
        ToggleLinks()
    End Sub
    Protected Sub ToggleLinks()
        LinkButton1.Enabled = (nextLocationID <> INVALIDID)
        LinkButton3.Enabled = (nextLocationID <> INVALIDID)
        LinkButton2.Enabled = (prevLocationID <> INVALIDID)
        LinkButton4.Enabled = (prevLocationID <> INVALIDID)
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

