﻿Imports System.Web.UI.WebControls
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

Partial Class WebUserControl
    Inherits System.Web.UI.UserControl

        Private partotalout As Integer = 0
        Private partotalin As Integer = 0
        Private yardagetotalout As Integer = 0
        Private yardagetotalin As Integer = 0
        Private grandpartotal As Integer = 0
        Private grandyardagetotal As Integer = 0

        Private gamesplayed As Integer = 0
        Private ScoreTotalOut As Integer = 0
        Private ScoreTotalin As Integer = 0
        Private GrandTotal As Integer = 0
        Private NetScore As Integer = 0
        Private Thandicap As Integer = 0
        Private Ghandicap As Integer = 0


        Private Rating As Integer
        Private Slope As Integer
        Private Differential As Integer
        Protected IsAdmin As Boolean
        Private nextLocationID As Integer
        Private prevLocationID As Integer
        Const INVALIDID As Integer = -1

        Private ScorecardPairID As Integer = 0

        Public Property myIntValue() As Integer
            Get
                Return m_myIntValue
            End Get
            Set(value As Integer)
                m_myIntValue = value
            End Set
        End Property

        Private m_myIntValue As Integer

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

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim sSql As String
        ScorecardPairID = myIntValue

        If Not IsPostBack Then
             
            sSql = "SELECT top 1  [LocationID],[PairingID] ,[Date]  FROM [tb_Scorecard] where [LocationId] =" & LocationID() & " and [Date] = '" & DateID() & "'"

            Dim drx As SqlDataReader
            drx = GetDataReader(sSql)

            If drx.Read Then
                loaddata()
            End If

            drx.Close()

        End If
    End Sub

    Private Sub loaddata()
        grdViewScorecardpopupBindData()
    End Sub
     
   
    Protected Sub grdViewScorecardpopup_RowCreated(sender As Object, e As GridViewRowEventArgs)
       
        Dim partotalout As Integer = 0
        Dim partotalin As Integer = 0
        Dim yardagetotalout As Integer = 0
        Dim yardagetotalin As Integer = 0
        Dim grandpartotal As Integer = 0
        Dim grandyardagetotal As Integer = 0

        Dim i As Integer = 1

        Close1.Enabled = False

        i = 1
        Dim blank As String = ""

        If e.Row.RowType = DataControlRowType.Header Then
            Dim ProductGrid As GridView = DirectCast(sender, GridView)
            Dim HeaderRow As New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

            Dim ssql As String = "Select * from (SELECT [Ordinal],[Handicap] FROM [tb_Hole] where [LocationId] = " & LocationID() & " ) as s PIVOT (max(Handicap) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18])) AS pvt"
            Dim dr As SqlDataReader
            dr = GetDataReader(ssql)

            'Adding HCP Column
            Dim HeaderCell As New TableCell()
            HeaderCell.Text = "HCP"
            HeaderCell.HorizontalAlign = HorizontalAlign.Center
            'HeaderCell.RowSpan = 3
            HeaderCell.CssClass = "HeaderStyle"
            HeaderRow.Cells.Add(HeaderCell)

            If dr.Read Then

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("1").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("2").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("3").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("4").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("5").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("6").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("7").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("8").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("9").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("10").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("11").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("12").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("13").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("14").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("15").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("16").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("17").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("18").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)


            End If
            dr.Close()

            ProductGrid.Controls(0).Controls.AddAt(0, HeaderRow)

            HeaderRow = New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

            ssql = "Select * from (SELECT [Ordinal],[Par] FROM [tb_Hole] where [LocationId] = " & LocationID() & "  ) as s PIVOT (max(Par) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt"

            dr = GetDataReader(ssql)

            'Adding HCP Column
            HeaderCell = New TableCell()
            HeaderCell.Text = "Par"
            HeaderCell.HorizontalAlign = HorizontalAlign.Center
            'HeaderCell.RowSpan = 3
            HeaderCell.CssClass = "HeaderStyle"
            HeaderRow.Cells.Add(HeaderCell)

            If dr.Read Then

                partotalout = CInt(dr.Item("1").ToString()) + CInt(dr.Item("2").ToString()) + CInt(dr.Item("3").ToString()) + CInt(dr.Item("4").ToString()) + CInt(dr.Item("5").ToString()) + CInt(dr.Item("6").ToString()) + CInt(dr.Item("7").ToString()) + CInt(dr.Item("8").ToString()) + CInt(dr.Item("9").ToString())

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("1").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("2").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("3").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("4").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("5").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("6").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("7").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("8").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("9").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = partotalout
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                partotalin = CInt(dr.Item("10").ToString()) + CInt(dr.Item("11").ToString()) + CInt(dr.Item("12").ToString()) + CInt(dr.Item("13").ToString()) + CInt(dr.Item("14").ToString()) + CInt(dr.Item("15").ToString()) + CInt(dr.Item("16").ToString()) + CInt(dr.Item("17").ToString()) + CInt(dr.Item("18").ToString())

                grandpartotal = partotalout + partotalin

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("10").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("11").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("12").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("13").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("14").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("15").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("16").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("17").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("18").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = partotalin
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = grandpartotal
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)



            End If
            dr.Close()

            ProductGrid.Controls(0).Controls.AddAt(1, HeaderRow)

            HeaderRow = New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

            ssql = "Select * from (SELECT [Ordinal],[Yardage] FROM [tb_Hole] where [LocationId] = " & LocationID() & "  ) as s PIVOT (max(Yardage) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt"

            dr = GetDataReader(ssql)

            'Adding HCP Column

            HeaderCell = New TableCell()
            HeaderCell.Text = "Yards"
            HeaderCell.HorizontalAlign = HorizontalAlign.Center
            'HeaderCell.RowSpan = 3 
            HeaderCell.CssClass = "HeaderStyle"
            HeaderRow.Cells.Add(HeaderCell)

            If dr.Read Then

                yardagetotalout = CInt(dr.Item("1").ToString()) + CInt(dr.Item("2").ToString()) + CInt(dr.Item("3").ToString()) + CInt(dr.Item("4").ToString()) + CInt(dr.Item("5").ToString()) + CInt(dr.Item("6").ToString()) + CInt(dr.Item("7").ToString()) + CInt(dr.Item("8").ToString()) + CInt(dr.Item("9").ToString())

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("1").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("2").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("3").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("4").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("5").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("6").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("7").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("8").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("9").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = yardagetotalout
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                yardagetotalin = CInt(dr.Item("10").ToString()) + CInt(dr.Item("11").ToString()) + CInt(dr.Item("12").ToString()) + CInt(dr.Item("13").ToString()) + CInt(dr.Item("14").ToString()) + CInt(dr.Item("15").ToString()) + CInt(dr.Item("16").ToString()) + CInt(dr.Item("17").ToString()) + CInt(dr.Item("18").ToString())

                grandyardagetotal = yardagetotalout + yardagetotalin


                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("10").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("11").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("12").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("13").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("14").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("15").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("16").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("17").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = dr.Item("18").ToString()
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = yardagetotalin
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = grandyardagetotal
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

                HeaderCell = New TableCell()
                HeaderCell.Text = blank
                HeaderCell.HorizontalAlign = HorizontalAlign.Center
                'HeaderCell.RowSpan = 3
                HeaderCell.CssClass = "HeaderStyle"
                HeaderRow.Cells.Add(HeaderCell)

            End If
            dr.Close()

            ProductGrid.Controls(0).Controls.AddAt(2, HeaderRow)

            HeaderRow = New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert)

        End If
    End Sub

    Private Sub grdViewScorecardpopupBindData()
        'Dim strQuery As String = "SELECT  [tb_Scorecard].[ScorecardClosed] as scorecardsclosed, [tb_Scorecard].[ScorecardId] as ScorecardId, [tb_Scorecard].[GhinID] as [GhinID],[tb_Scorecard].[memberid] as memberid,concat([memberinfo].[firstname], ' ' ,[memberinfo].[lastname]) as playername,[Score1] ,[Score2] ,[Score3] ,[Score4] ,[Score5]   ,[Score6]  ,[Score7] ,[Score8]  ,[Score9]  ,[ScoreTotalout] FROM  [tb_Scorecard], [memberinfo] where [tb_Scorecard].[memberid] =[memberinfo].[memberid] and [PairingID] =" & ScorecardPairID & " and [LocationID]  = " & LocationID & " order by [tb_Scorecard].[GhinID]"
        Dim strQuery As String = ""
        strQuery = "SELECT  [tb_Scorecard].[ScorecardClosed] as scorecardsclosed, [tb_Scorecard].[ScorecardId] as ScorecardId, [tb_Scorecard].[GhinID] as [GhinID],[tb_Scorecard].[memberid] as memberid, [memberinfo].[firstname] + ' ' + [memberinfo].[lastname] as playername,[Score1] ,[Score2] ,[Score3] ,[Score4] ,[Score5]   ,[Score6]  ,[Score7] ,[Score8]  ,[Score9]  ,[ScoreTotalout],[Score10],[Score11] ,[Score12]  ,[Score13],[Score14]   ,[Score15]    ,[Score16] ,[Score17]  ,[Score18] ,[ScoreTotalin] ,[GrandTotal],[memberinfo].[TournamentHandicap]  ,[memberinfo].[GhinHandicap]  ,[NetScore]  FROM  [tb_Scorecard], [memberinfo] where [tb_Scorecard].[memberid] =[memberinfo].[memberid] and [LocationID]  = " & LocationID() & " and [Date] = '" & DateID() & "' order by [tb_Scorecard].[GhinID]"

        Dim cmd As New SqlCommand(strQuery)
        grdViewScorecardpopup.DataSource = GetData(cmd)
        grdViewScorecardpopup.DataBind()


        'lblScorecardSave.Text = "Can be updated by:" & lblplayername.Text & " " & lblUserNameScore2.Text & " " & lblUserNameScore3.Text & " " & lblUserNameScore4.Text & " " & lblUserNameScore5.Text


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


    'Protected Sub Close1_Click(sender As Object, e As System.EventArgs) Handles Close1.Click
    '    Dim ssql As String = ""
    '    Dim scoreid As Integer
    '    If lblScorecardID1.Text <> "" Then
    '        scoreid = CInt(lblScorecardID1.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    If lblScorecardID2.Text <> "" Then
    '        scoreid = CInt(lblScorecardID2.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    If lblScorecardID3.Text <> "" Then
    '        scoreid = CInt(lblScorecardID3.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    If lblScorecardID4.Text <> "" Then
    '        scoreid = CInt(lblScorecardID4.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    If lblScorecardID5.Text <> "" Then
    '        scoreid = CInt(lblScorecardID5.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    lblScorecardSave.Text = "This Scorecard is now closed."
    'End Sub


    'Protected Sub open1_Click(sender As Object, e As System.EventArgs) Handles Open1.Click
    '    Dim ssql As String = ""
    '    Dim scoreid As Integer
    '    If lblScorecardID1.Text <> "" Then
    '        scoreid = CInt(lblScorecardID1.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'False' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    If lblScorecardID2.Text <> "" Then
    '        scoreid = CInt(lblScorecardID2.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'False' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    If lblScorecardID3.Text <> "" Then
    '        scoreid = CInt(lblScorecardID3.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'False' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    If lblScorecardID4.Text <> "" Then
    '        scoreid = CInt(lblScorecardID4.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'False' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    If lblScorecardID5.Text <> "" Then
    '        scoreid = CInt(lblScorecardID5.Text)
    '        ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'False' WHERE scorecardid=" & scoreid
    '        ExecuteSql(ssql)
    '    End If
    '    lblScorecardSave.Text = "This Scorecard is now open."
    'End Sub

    Protected Sub btnScoreCard_Click(sender As Object, e As System.EventArgs) Handles btnScoreCard.Click
        loaddata()
        lblScorecardSave.Text = "Scorecards Refreshed!"
    End Sub

    'Private Sub updateScoreCard(ByVal GhinID As String, ByVal Score1 As String, ByVal Score2 As String, ByVal Score3 As String, ByVal Score4 As String, ByVal Score5 As String, ByVal Score6 As String, ByVal Score7 As String, ByVal Score8 As String, ByVal Score9 As String, ByVal Score10 As String, ByVal Score11 As String, ByVal Score12 As String, ByVal Score13 As String, ByVal Score14 As String, ByVal Score15 As String, ByVal Score16 As String, ByVal Score17 As String, ByVal Score18 As String)

    '    Dim partotalout As Integer = 0
    '    Dim partotalin As Integer = 0
    '    Dim yardagetotalout As Integer = 0
    '    Dim yardagetotalin As Integer = 0
    '    Dim grandpartotal As Integer = 0
    '    Dim grandyardagetotal As Integer = 0

    '    Dim i As Integer = 1

    '    Dim gamesplayed As Integer = 0
    '    Dim ScoreTotalOut As Integer = 0
    '    Dim ScoreTotalin As Integer = 0
    '    Dim GrandTotal As Integer = 0
    '    Dim NetScore As Integer = 0
    '    Dim Thandicap As Integer = 0
    '    Dim Ghandicap As Integer = 0

    '    Dim sSql As String = ""
    '    Dim memberidgrid As String = ""
    '    Dim Gender As String = ""
    '    Dim date1 As Date = Now
    '    Dim sqldate As String = "'" & date1.ToString("MM/dd/yyyy") & "'"


    '    If Score1 = "" Then Score1 = "0"
    '    If Score2 = "" Then Score2 = "0"
    '    If Score3 = "" Then Score3 = "0"
    '    If Score4 = "" Then Score4 = "0"
    '    If Score5 = "" Then Score5 = "0"
    '    If Score6 = "" Then Score6 = "0"
    '    If Score7 = "" Then Score7 = "0"
    '    If Score8 = "" Then Score8 = "0"
    '    If Score9 = "" Then Score9 = "0"
    '    If Score10 = "" Then Score10 = "0"
    '    If Score11 = "" Then Score11 = "0"
    '    If Score12 = "" Then Score12 = "0"
    '    If Score13 = "" Then Score13 = "0"
    '    If Score14 = "" Then Score14 = "0"
    '    If Score15 = "" Then Score15 = "0"
    '    If Score16 = "" Then Score16 = "0"
    '    If Score17 = "" Then Score17 = "0"
    '    If Score18 = "" Then Score18 = "0"

    '    sSql = "SELECT memberid,Gender,Tournamenthandicap,Ghinhandicap from [memberinfo] where ghinid=" & GhinID

    '    Dim drr As SqlDataReader
    '    drr = GetDataReader(sSql)

    '    If drr.Read Then

    '        memberidgrid = drr.Item("memberid").ToString()

    '        Gender = drr.Item("Gender").ToString()

    '        getrating(Gender)

    '        gamesplayed = getgamesplayed(memberidgrid)

    '        Thandicap = CInt(drr.Item("Tournamenthandicap").ToString())
    '        Ghandicap = CInt(drr.Item("Ghinhandicap").ToString())

    '        ScoreTotalOut = CInt(Score1) + CInt(Score2) + CInt(Score3) + CInt(Score4) + CInt(Score5) + CInt(Score6) + CInt(Score7) + CInt(Score8) + CInt(Score9)
    '        ScoreTotalin = CInt(Score10) + CInt(Score11) + CInt(Score12) + CInt(Score13) + CInt(Score14) + CInt(Score15) + CInt(Score16) + CInt(Score17) + CInt(Score18)
    '        GrandTotal = ScoreTotalOut + ScoreTotalin

    '        If Gender = "Male" Then
    '            If Ghandicap > 28 Then Ghandicap = 28
    '            If Ghandicap = 0 Then Ghandicap = 28
    '        End If

    '        If Gender = "Female" Then
    '            If Ghandicap > 36 Then Ghandicap = 36
    '            If Ghandicap = 0 Then Ghandicap = 36
    '        End If

    '        If Thandicap = 0 Then Thandicap = Ghandicap
    '        If Thandicap = 0 Then Thandicap = Ghandicap

    '        If Thandicap > Ghandicap Then
    '            NetScore = GrandTotal - Ghandicap
    '        Else
    '            NetScore = GrandTotal - Thandicap
    '        End If

    '        If GrandTotal = 0 Then
    '            NetScore = 0
    '        End If

    '        Dim sSql4 As String = "Select * FROM [tb_Scorecard] WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID & " and [PairingID] =" & ScorecardPairID & " and Scorecardclosed = 'False'"
    '        Dim drr4 As SqlDataReader
    '        drr4 = GetDataReader(sSql4)

    '        sSql = ""

    '        If drr4.Read Then
    '            sSql += "UPDATE [tb_Scorecard]"
    '            sSql += " SET [GhinID] = '" & GhinID & "'"
    '            sSql += " ,[LocationID] =  " & LocationID
    '            sSql += " ,[PairingID] =  " & ScorecardPairID
    '            sSql += " ,[Date] = " & sqldate
    '            sSql += " ,[memberid] = '" & memberidgrid & "'"

    '            sSql += " ,[Score1] = " & Score1
    '            sSql += " ,[Score2] = " & Score2
    '            sSql += " ,[Score3] = " & Score3
    '            sSql += " ,[Score4] = " & Score4
    '            sSql += " ,[Score5] = " & Score5
    '            sSql += " ,[Score6] = " & Score6
    '            sSql += " ,[Score7] = " & Score7
    '            sSql += " ,[Score8] = " & Score8
    '            sSql += " ,[Score9] = " & Score9

    '            sSql += " ,[ScoreTotalOut] = " & ScoreTotalOut

    '            sSql += " ,[Score11] = " & Score11
    '            sSql += " ,[Score12] = " & Score12
    '            sSql += " ,[Score13] = " & Score13
    '            sSql += " ,[Score14] = " & Score14
    '            sSql += " ,[Score15] = " & Score15
    '            sSql += " ,[Score16] = " & Score16
    '            sSql += " ,[Score17] = " & Score17
    '            sSql += " ,[Score18] = " & Score18

    '            sSql += " ,[ScoreTotalin] = " & ScoreTotalin
    '            sSql += " ,[GrandTotal] = " & GrandTotal
    '            sSql += " ,[NetScore] = " & NetScore

    '            sSql += " ,[TournamentHandicap] =" & Thandicap
    '            sSql += " ,[GhinHandicap] = " & Ghandicap
    '            sSql += " ,[Rating] =" & Rating
    '            sSql += " ,[Slope] =" & Slope
    '            sSql += " ,[Differential]=" & Differential
    '            sSql += " WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID & "  and Scorecardclosed = 'False'"
    '        Else
    '            sSql = "INSERT INTO [tb_Scorecard]([GhinID],[LocationID],[PairingID],[Date],[memberid] ,[Score1],[Score2],[Score3],[Score4],[Score5],[Score6],[Score7],[Score8],[Score9],[ScoreTotalout],[Score10],[Score11],[Score12],[Score13],[Score14],[Score15],[Score16],[Score17],[Score18],[ScoreTotalin],[GrandTotal],[TournamentHandicap] ,[GhinHandicap],[NetScore],Rating, Slope, Differential,Scorecardclosed)"

    '            sSql += " VALUES ("
    '            sSql += GhinID
    '            sSql += "," & LocationID
    '            sSql += "," & ScorecardPairID
    '            sSql += "," & sqldate
    '            sSql += ",'" & memberidgrid & "'"
    '            sSql += "," & Score1
    '            sSql += "," & Score2
    '            sSql += "," & Score3
    '            sSql += "," & Score4
    '            sSql += "," & Score5
    '            sSql += "," & Score6
    '            sSql += "," & Score7
    '            sSql += "," & Score8
    '            sSql += "," & Score9
    '            sSql += "," & ScoreTotalOut
    '            sSql += "," & Score10
    '            sSql += "," & Score11
    '            sSql += "," & Score12
    '            sSql += "," & Score13
    '            sSql += "," & Score14
    '            sSql += "," & Score15
    '            sSql += "," & Score16
    '            sSql += "," & Score17
    '            sSql += "," & Score18
    '            sSql += "," & ScoreTotalin
    '            sSql += "," & GrandTotal
    '            sSql += "," & Thandicap
    '            sSql += "," & Ghandicap
    '            sSql += "," & NetScore
    '            sSql += "," & Rating
    '            sSql += "," & Slope
    '            sSql += "," & Differential
    '            sSql += ",'False'"
    '            sSql += ")"
    '        End If

    '        ExecuteSql(sSql)

    '        drr4.Close()
    '    End If

    'End Sub

    Private Function getgamesplayed(mbr As String) As Integer
        Dim games As Integer = 0
        Dim drx As SqlDataReader
        drx = GetDataReader("Select count(*)  as gamesplayed  FROM [tb_Scorecard] WHERE  [tb_Scorecard].[memberid] ='" & mbr & "'")

        If drx.Read Then
            games = CInt(drx.Item("gamesplayed").ToString())
        End If

        Return games
    End Function
    Private Sub getrating(gnd As String)
        Dim sSql As String
        If gnd = "Female" Then
            sSql = "SELECT [FemaleRating] as Rating ,[FemaleSlope] as Slope FROM [tb_CourseRating] where [LocationId] =" & LocationID() & "   order by [RatingId]"
        Else
            sSql = "SELECT [MaleRating] as Rating ,[MaleSlope] as Slope  FROM [tb_CourseRating] where [LocationId] =" & LocationID() & "   order by [RatingId]"
        End If

        Dim drx As SqlDataReader
        drx = GetDataReader(sSql)

        If drx.Read Then
            Rating = CInt(drx.Item("Rating").ToString())
            Slope = CInt(drx.Item("Slope").ToString())
        End If

    End Sub
    Public Sub ExecuteSql(ByVal sSql As String)

        Dim cn As New SqlConnection(GetConnectionString())
        cn.Open()
        Dim cm As New SqlCommand(sSql, cn)
        cm.ExecuteNonQuery()
        cn.Close()

    End Sub

    Protected Sub Edit(ByVal sender As Object, ByVal e As EventArgs)
        Dim row As GridViewRow = CType(CType(sender, LinkButton).Parent.Parent, GridViewRow)

        txtGhinID.Text = row.Cells(0).Text
        txtScorecardID.Text = row.Cells(1).Text
        memberid.Text = row.Cells(2).Text
        txtplayername.Text = row.Cells(3).Text
        ddlscore1.SelectedValue = row.Cells(4).Text
        ddlscore2.SelectedValue = row.Cells(5).Text
        ddlscore3.SelectedValue = row.Cells(6).Text
        ddlscore4.SelectedValue = row.Cells(7).Text
        ddlscore5.SelectedValue = row.Cells(8).Text
        ddlscore6.SelectedValue = row.Cells(9).Text
        ddlscore7.SelectedValue = row.Cells(10).Text
        ddlscore8.SelectedValue = row.Cells(11).Text
        ddlscore9.SelectedValue = row.Cells(12).Text
        ddlscore10.SelectedValue = row.Cells(13).Text
        ddlscore11.SelectedValue = row.Cells(15).Text
        ddlscore12.SelectedValue = row.Cells(16).Text
        ddlscore13.SelectedValue = row.Cells(17).Text
        ddlscore14.SelectedValue = row.Cells(18).Text
        ddlscore15.SelectedValue = row.Cells(19).Text
        ddlscore16.SelectedValue = row.Cells(20).Text
        ddlscore17.SelectedValue = row.Cells(21).Text
        ddlscore18.SelectedValue = row.Cells(22).Text
        popup.Show()
    End Sub

    Protected Sub Save(ByVal sender As Object, ByVal e As EventArgs)
         
        updateScoreCard1(txtGhinID.Text, txtScorecardID.Text, ddlscore1.SelectedValue, ddlscore2.SelectedValue, ddlscore3.SelectedValue, ddlscore4.SelectedValue, ddlscore5.SelectedValue, ddlscore6.SelectedValue, ddlscore7.SelectedValue, ddlscore8.SelectedValue, ddlscore9.SelectedValue, ddlscore10.SelectedValue, ddlscore11.SelectedValue, ddlscore12.SelectedValue, ddlscore13.SelectedValue, ddlscore14.SelectedValue, ddlscore15.SelectedValue, ddlscore16.SelectedValue, ddlscore17.SelectedValue, ddlscore18.SelectedValue)
         
        FindandUpdateTotals(txtGhinID.Text, txtScorecardID.Text)

        loaddata()

    End Sub


    Private Sub updateScoreCard1(ByVal GhinID As String, ByVal scorecardid As String, ByVal Score1 As String, ByVal Score2 As String, ByVal Score3 As String, ByVal Score4 As String, ByVal Score5 As String, ByVal Score6 As String, ByVal Score7 As String, ByVal Score8 As String, ByVal Score9 As String, ByVal Score10 As String, ByVal Score11 As String, ByVal Score12 As String, ByVal Score13 As String, ByVal Score14 As String, ByVal Score15 As String, ByVal Score16 As String, ByVal Score17 As String, ByVal Score18 As String)
        Dim i As Integer = 1

        Dim sSql As String = ""
        Dim memberidgrid As String = ""
        Dim Gender As String = ""
        Dim date1 As Date = Now
        Dim sqldate As String = "'" & date1.ToString("MM/dd/yyyy") & "'"

        If GhinID = "" Or scorecardid = "" Then Exit Sub

        If Score1 = "" Then Score1 = "0"
        If Score2 = "" Then Score2 = "0"
        If Score3 = "" Then Score3 = "0"
        If Score4 = "" Then Score4 = "0"
        If Score5 = "" Then Score5 = "0"
        If Score6 = "" Then Score6 = "0"
        If Score7 = "" Then Score7 = "0"
        If Score8 = "" Then Score8 = "0"
        If Score9 = "" Then Score9 = "0"
        If Score10 = "" Then Score10 = "0"
        If Score11 = "" Then Score11 = "0"
        If Score12 = "" Then Score12 = "0"
        If Score13 = "" Then Score13 = "0"
        If Score14 = "" Then Score14 = "0"
        If Score15 = "" Then Score15 = "0"
        If Score16 = "" Then Score16 = "0"
        If Score17 = "" Then Score17 = "0"
        If Score18 = "" Then Score18 = "0"

        sSql = "SELECT memberid,Gender,Tournamenthandicap,Ghinhandicap from [memberinfo] where ghinid=" & GhinID

        Dim drr As SqlDataReader
        drr = GetDataReader(sSql)

        If drr.Read Then

            memberidgrid = drr.Item("memberid").ToString()

            Dim sSql4 As String = "Select * FROM [tb_Scorecard] WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID() & " and [Scorecardid] =" & CInt(scorecardid)
            Dim drr4 As SqlDataReader
            drr4 = GetDataReader(sSql4)

            sSql = ""

            If drr4.Read Then
                sSql += "UPDATE [tb_Scorecard]"
                sSql += " SET [GhinID] = '" & GhinID & "'"
                sSql += " ,[Score1] = " & Score1
                sSql += " ,[Score2] = " & Score2
                sSql += " ,[Score3] = " & Score3
                sSql += " ,[Score4] = " & Score4
                sSql += " ,[Score5] = " & Score5
                sSql += " ,[Score6] = " & Score6
                sSql += " ,[Score7] = " & Score7
                sSql += " ,[Score8] = " & Score8
                sSql += " ,[Score9] = " & Score9
                sSql += " ,[Score10] = " & Score10
                sSql += " ,[Score11] = " & Score11
                sSql += " ,[Score12] = " & Score12
                sSql += " ,[Score13] = " & Score13
                sSql += " ,[Score14] = " & Score14
                sSql += " ,[Score15] = " & Score15
                sSql += " ,[Score16] = " & Score16
                sSql += " ,[Score17] = " & Score17
                sSql += " ,[Score18] = " & Score18
                sSql += " WHERE memberid='" & memberidgrid & "' and locationid = " & LocationID() & "  and [Scorecardid] =" & CInt(scorecardid)
            End If

            ExecuteSql(sSql)

            drr4.Close()
        End If

    End Sub

   
    Private Sub FindandUpdateTotals(ByVal GhinID As String, ByVal scorecardid As String)

        Dim sSql As String = ""
        Dim memberidgrid As String = ""
        Dim Gender As String = ""
        Dim date1 As Date = Now
        Dim sqldate As String = "'" & date1.ToString("MM/dd/yyyy") & "'"

        If GhinID <> "" Then

            sSql = "SELECT memberid,Gender,Tournamenthandicap,Ghinhandicap  from [memberinfo] where ghinid='" & GhinID & "'"

            Dim drr As SqlDataReader
            drr = GetDataReader(sSql)

            If drr.Read Then

                memberidgrid = drr.Item("memberid").ToString()

                Gender = drr.Item("Gender").ToString()

                getrating(Gender)

                gamesplayed = getgamesplayed(memberidgrid)

                Thandicap = CInt(drr.Item("Tournamenthandicap").ToString())
                Ghandicap = CInt(drr.Item("Ghinhandicap").ToString())


                Dim sSql4 As String = "Select * FROM [tb_Scorecard] WHERE [Scorecardid] =" & CInt(scorecardid)
                Dim drr4 As SqlDataReader
                drr4 = GetDataReader(sSql4)

                If drr4.Read Then

                    ScoreTotalOut = CInt(drr4.Item("score1").ToString()) + CInt(drr4.Item("score2").ToString()) + CInt(drr4.Item("score3").ToString()) + CInt(drr4.Item("score4").ToString()) + CInt(drr4.Item("score5").ToString()) + CInt(drr4.Item("score6").ToString()) + CInt(drr4.Item("score7").ToString()) + CInt(drr4.Item("score8").ToString()) + CInt(drr4.Item("score9").ToString())
                    ScoreTotalin = CInt(drr4.Item("score10").ToString()) + CInt(drr4.Item("score11").ToString()) + CInt(drr4.Item("score12").ToString()) + CInt(drr4.Item("score13").ToString()) + CInt(drr4.Item("score14").ToString()) + CInt(drr4.Item("score15").ToString()) + CInt(drr4.Item("score16").ToString()) + CInt(drr4.Item("score17").ToString()) + CInt(drr4.Item("score18").ToString())

                    GrandTotal = ScoreTotalOut + ScoreTotalin

                    If Gender = "Male" Then
                        If Ghandicap > 28 Then Ghandicap = 28
                        If Ghandicap = 0 Then Ghandicap = 28
                    End If

                    If Gender = "Female" Then
                        If Ghandicap > 36 Then Ghandicap = 36
                        If Ghandicap = 0 Then Ghandicap = 36
                    End If

                    If Thandicap = 0 Then Thandicap = Ghandicap
                    If Thandicap = 0 Then Thandicap = Ghandicap

                    If Thandicap > Ghandicap Then
                        NetScore = GrandTotal - Ghandicap
                    Else
                        NetScore = GrandTotal - Thandicap
                    End If

                    If GrandTotal = 0 Then
                        NetScore = 0
                    End If

                    Thandicap = CInt(drr.Item("Tournamenthandicap").ToString())
                    Ghandicap = CInt(drr.Item("Ghinhandicap").ToString())
                    'Differential = CInt(drr.Item("Differential").ToString())

                    sSql = "UPDATE [tb_Scorecard] SET "
                    sSql += "  [LocationID] =  " & LocationID()
                    sSql += " ,[PairingID] =  " & ScorecardPairID
                    sSql += " ,[memberid] = '" & memberidgrid & "'"
                    sSql += " ,[ScoreTotalout] = " & ScoreTotalOut
                    sSql += " ,[ScoreTotalin] = " & ScoreTotalin
                    sSql += " ,[GrandTotal] = " & GrandTotal
                    sSql += " ,[NetScore] = " & NetScore
                    sSql += " ,[TournamentHandicap] =" & Thandicap
                    sSql += " ,[GhinHandicap] = " & Ghandicap
                    sSql += " ,[Rating] =" & Rating
                    sSql += " ,[Slope] =" & Slope
                    sSql += " WHERE [Scorecardid] =" & CInt(scorecardid)

                    ExecuteSql(sSql)

                End If

                drr4.Close()

            End If

            drr.Close()

        End If

    End Sub

End Class
