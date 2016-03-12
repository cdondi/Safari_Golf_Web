
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

Partial Class ScorecardControl
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
            BindScorecardGrid()
        End If


    End Sub

    Private Sub BindScorecardGrid()

        Dim partotalout As Integer = 0
        Dim partotalin As Integer = 0
        Dim yardagetotalout As Integer = 0
        Dim yardagetotalin As Integer = 0
        Dim grandpartotal As Integer = 0
        Dim grandyardagetotal As Integer = 0

        Dim i As Integer = 1

        Save1.Enabled = False
        Close1.Enabled = False

        i = 1
        Dim blank As String = ""

        Dim ssql As String = "Select * from (SELECT [Ordinal],[Handicap] FROM [tb_Hole] where [LocationId] = " & LocationID & " ) as s PIVOT (max(Handicap) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18])) AS pvt"
        Dim dr As SqlDataReader
        dr = GetDataReader(ssql)

        While dr.Read

            lblHCPD1.Text = dr.Item("1").ToString()
            lblHCPD2.Text = dr.Item("2").ToString()
            lblHCPD3.Text = dr.Item("3").ToString()
            lblHCPD4.Text = dr.Item("4").ToString()
            lblHCPD5.Text = dr.Item("5").ToString()
            lblHCPD6.Text = dr.Item("6").ToString()
            lblHCPD7.Text = dr.Item("7").ToString()
            lblHCPD8.Text = dr.Item("8").ToString()
            lblHCPD9.Text = dr.Item("9").ToString()

            lblHCPD10.Text = dr.Item("10").ToString()
            lblHCPD11.Text = dr.Item("11").ToString()
            lblHCPD12.Text = dr.Item("12").ToString()
            lblHCPD13.Text = dr.Item("13").ToString()
            lblHCPD14.Text = dr.Item("14").ToString()
            lblHCPD15.Text = dr.Item("15").ToString()
            lblHCPD16.Text = dr.Item("16").ToString()
            lblHCPD17.Text = dr.Item("17").ToString()
            lblHCPD18.Text = dr.Item("18").ToString()


        End While
        dr.Close()

        ssql = "Select * from (SELECT [Ordinal],[Par] FROM [tb_Hole] where [LocationId] = " & LocationID & "  ) as s PIVOT (max(Par) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt"

        dr = GetDataReader(ssql)

        While dr.Read

            partotalout = CInt(dr.Item("1").ToString()) + CInt(dr.Item("2").ToString()) + CInt(dr.Item("3").ToString()) + CInt(dr.Item("4").ToString()) + CInt(dr.Item("5").ToString()) + CInt(dr.Item("6").ToString()) + CInt(dr.Item("7").ToString()) + CInt(dr.Item("8").ToString()) + CInt(dr.Item("9").ToString())

            partotalin = CInt(dr.Item("10").ToString()) + CInt(dr.Item("11").ToString()) + CInt(dr.Item("12").ToString()) + CInt(dr.Item("13").ToString()) + CInt(dr.Item("14").ToString()) + CInt(dr.Item("15").ToString()) + CInt(dr.Item("16").ToString()) + CInt(dr.Item("17").ToString()) + CInt(dr.Item("18").ToString())

            grandpartotal = partotalout + partotalin

            lblParD1.Text = dr.Item("1").ToString()
            lblParD2.Text = dr.Item("2").ToString()
            lblParD3.Text = dr.Item("3").ToString()
            lblParD4.Text = dr.Item("4").ToString()
            lblParD5.Text = dr.Item("5").ToString()
            lblParD6.Text = dr.Item("6").ToString()
            lblParD7.Text = dr.Item("7").ToString()
            lblParD8.Text = dr.Item("8").ToString()
            lblParD9.Text = dr.Item("9").ToString()
            lblParDTotalOut.Text = partotalout
            lblParD10.Text = dr.Item("10").ToString()
            lblParD11.Text = dr.Item("11").ToString()
            lblParD12.Text = dr.Item("12").ToString()
            lblParD13.Text = dr.Item("13").ToString()
            lblParD14.Text = dr.Item("14").ToString()
            lblParD15.Text = dr.Item("15").ToString()
            lblParD16.Text = dr.Item("16").ToString()
            lblParD17.Text = dr.Item("17").ToString()
            lblParD18.Text = dr.Item("18").ToString()
            lblParDTotalin.Text = partotalin
            lblParDGrandTotal.Text = grandpartotal

        End While
        dr.Close()

        ssql = "Select * from (SELECT [Ordinal],[Yardage] FROM [tb_Hole] where [LocationId] = " & LocationID & "  ) as s PIVOT (max(Yardage) FOR [Ordinal] IN ([1], [2], [3],[4],[5],[6],[7],[8],[9],[10],[11], [12], [13],[14],[15],[16],[17],[18]))AS pvt"

        dr = GetDataReader(ssql)

        While dr.Read

            yardagetotalout = CInt(dr.Item("1").ToString()) + CInt(dr.Item("2").ToString()) + CInt(dr.Item("3").ToString()) + CInt(dr.Item("4").ToString()) + CInt(dr.Item("5").ToString()) + CInt(dr.Item("6").ToString()) + CInt(dr.Item("7").ToString()) + CInt(dr.Item("8").ToString()) + CInt(dr.Item("9").ToString())

            yardagetotalin = CInt(dr.Item("10").ToString()) + CInt(dr.Item("11").ToString()) + CInt(dr.Item("12").ToString()) + CInt(dr.Item("13").ToString()) + CInt(dr.Item("14").ToString()) + CInt(dr.Item("15").ToString()) + CInt(dr.Item("16").ToString()) + CInt(dr.Item("17").ToString()) + CInt(dr.Item("18").ToString())

            grandyardagetotal = yardagetotalout + yardagetotalin

            lblYardD1.Text = dr.Item("1").ToString()
            lblYardD2.Text = dr.Item("2").ToString()
            lblYardD3.Text = dr.Item("3").ToString()
            lblYardD4.Text = dr.Item("4").ToString()
            lblYardD5.Text = dr.Item("5").ToString()
            lblYardD6.Text = dr.Item("6").ToString()
            lblYardD7.Text = dr.Item("7").ToString()
            lblYardD8.Text = dr.Item("8").ToString()
            lblYardD9.Text = dr.Item("9").ToString()
            lblYardDTotalOut.Text = yardagetotalout
            lblYardD10.Text = dr.Item("10").ToString()
            lblYardD11.Text = dr.Item("11").ToString()
            lblYardD12.Text = dr.Item("12").ToString()
            lblYardD13.Text = dr.Item("13").ToString()
            lblYardD14.Text = dr.Item("14").ToString()
            lblYardD15.Text = dr.Item("15").ToString()
            lblYardD16.Text = dr.Item("16").ToString()
            lblYardD17.Text = dr.Item("17").ToString()
            lblYardD18.Text = dr.Item("18").ToString()
            lblYardDTotalin.Text = yardagetotalin
            lblYardDGrandTotal.Text = grandyardagetotal

        End While
        dr.Close()


        ssql = "SELECT  [tb_Scorecard].[ScorecardClosed] as scorecardsclosed, [tb_Scorecard].[ScorecardId] as ScorecardId, [tb_Scorecard].[GhinID] ,[LocationID], [tb_Scorecard].[PairingID] ,[tb_Scorecard].[Date] ,[tb_Scorecard].[memberid] as memberid,[memberinfo].[firstname] as firstname,[memberinfo].[lastname] as lastname,[Score1] ,[Score2] ,[Score3] ,[Score4] ,[Score5]   ,[Score6]  ,[Score7] ,[Score8]  ,[Score9] ,[Score10]  ,[ScoreTotalout]   ,[Score11] ,[Score12]  ,[Score13],[Score14]   ,[Score15]    ,[Score16] ,[Score17]  ,[Score18] ,[ScoreTotalin] ,[GrandTotal],[memberinfo].[TournamentHandicap]  ,[memberinfo].[GhinHandicap]  ,[NetScore] FROM  [tb_Scorecard], [memberinfo] where [tb_Scorecard].[memberid] =[memberinfo].[memberid] and [PairingID] = 2 and [LocationID]  = " & LocationID
        Dim dr1 As SqlDataReader
        dr1 = GetDataReader(ssql)
        i = 1

        Dim scorecardsclosed As Boolean = False

        While dr1.Read
            If i = 1 Then

                lblGhin1.Text = dr1.Item("GhinID").ToString()
                lblScorecardID1.Text = dr1.Item("ScorecardID").ToString()
                lblmemberid1.Text = dr1.Item("memberid").ToString()

                lblUserNameScore1.Text = dr1.Item("firstname").ToString() & " " & dr1.Item("lastname").ToString()


                txtScore1_1.Text = IIf(dr1.Item("Score1").ToString() = 0, "", dr1.Item("Score1").ToString())
                txtScore1_2.Text = IIf(dr1.Item("Score2").ToString() = 0, "", dr1.Item("Score2").ToString())
                txtScore1_3.Text = IIf(dr1.Item("Score3").ToString() = 0, "", dr1.Item("Score3").ToString())
                txtScore1_4.Text = IIf(dr1.Item("Score4").ToString() = 0, "", dr1.Item("Score4").ToString())
                txtScore1_5.Text = IIf(dr1.Item("Score5").ToString() = 0, "", dr1.Item("Score5").ToString())
                txtScore1_6.Text = IIf(dr1.Item("Score6").ToString() = 0, "", dr1.Item("Score6").ToString())
                txtScore1_7.Text = IIf(dr1.Item("Score7").ToString() = 0, "", dr1.Item("Score7").ToString())
                txtScore1_8.Text = IIf(dr1.Item("Score8").ToString() = 0, "", dr1.Item("Score8").ToString())
                txtScore1_9.Text = IIf(dr1.Item("Score9").ToString() = 0, "", dr1.Item("Score9").ToString())

                txtScore1_10.Text = IIf(dr1.Item("Score10").ToString() = 0, "", dr1.Item("Score10").ToString())
                txtScore1_11.Text = IIf(dr1.Item("Score11").ToString() = 0, "", dr1.Item("Score11").ToString())
                txtScore1_12.Text = IIf(dr1.Item("Score12").ToString() = 0, "", dr1.Item("Score12").ToString())
                txtScore1_13.Text = IIf(dr1.Item("Score13").ToString() = 0, "", dr1.Item("Score13").ToString())
                txtScore1_14.Text = IIf(dr1.Item("Score14").ToString() = 0, "", dr1.Item("Score14").ToString())
                txtScore1_15.Text = IIf(dr1.Item("Score15").ToString() = 0, "", dr1.Item("Score15").ToString())
                txtScore1_16.Text = IIf(dr1.Item("Score16").ToString() = 0, "", dr1.Item("Score16").ToString())
                txtScore1_17.Text = IIf(dr1.Item("Score17").ToString() = 0, "", dr1.Item("Score17").ToString())
                txtScore1_18.Text = IIf(dr1.Item("Score18").ToString() = 0, "", dr1.Item("Score18").ToString())

                txtScore1_Tournamenthandicap.Text = dr1.Item("Tournamenthandicap").ToString()
                txtScore1_Ghinhandicap.Text = dr1.Item("Ghinhandicap").ToString()
                txtScore1_TotalOut.Text = CInt(dr1.Item("ScoreTotalout").ToString())
                txtScore1_Totalin.Text = CInt(dr1.Item("ScoreTotalin").ToString())
                txtScore1_GrandTotal.Text = CInt(dr1.Item("GrandTotal").ToString())
                txtScore1_NetScore.Text = CInt(dr1.Item("NetScore").ToString())

                scorecardsclosed = dr1.Item("scorecardsclosed").ToString()

                If scorecardsclosed Then
                    txtScore1_1.Enabled = False
                    txtScore1_2.Enabled = False
                    txtScore1_3.Enabled = False
                    txtScore1_4.Enabled = False
                    txtScore1_5.Enabled = False
                    txtScore1_6.Enabled = False
                    txtScore1_7.Enabled = False
                    txtScore1_8.Enabled = False
                    txtScore1_9.Enabled = False
                    txtScore1_10.Enabled = False
                    txtScore1_11.Enabled = False
                    txtScore1_12.Enabled = False
                    txtScore1_13.Enabled = False
                    txtScore1_14.Enabled = False
                    txtScore1_15.Enabled = False
                    txtScore1_16.Enabled = False
                    txtScore1_17.Enabled = False
                    txtScore1_18.Enabled = False
                End If

                Dim currentUser As MembershipUser = Membership.GetUser()
                If currentUser Is Nothing Then
                Else
                    Dim username As String = currentUser.UserName
                    Dim UserId As String = currentUser.ProviderUserKey.ToString()
                    If UserId = lblmemberid1.Text Then
                        Save1.Enabled = True
                        Close1.Enabled = False
                    End If
                End If


            End If

            If i = 2 Then

                lblGhin2.Text = dr1.Item("GhinID").ToString()
                lblScorecardID2.Text = dr1.Item("ScorecardID").ToString()
                lblmemberid2.Text = dr1.Item("memberid").ToString()

                lblUserNameScore2.Text = dr1.Item("firstname").ToString() & " " & dr1.Item("lastname").ToString()


                txtScore2_1.Text = IIf(dr1.Item("Score1").ToString() = 0, "", dr1.Item("Score1").ToString())
                txtScore2_2.Text = IIf(dr1.Item("Score2").ToString() = 0, "", dr1.Item("Score2").ToString())
                txtScore2_3.Text = IIf(dr1.Item("Score3").ToString() = 0, "", dr1.Item("Score3").ToString())
                txtScore2_4.Text = IIf(dr1.Item("Score4").ToString() = 0, "", dr1.Item("Score4").ToString())
                txtScore2_5.Text = IIf(dr1.Item("Score5").ToString() = 0, "", dr1.Item("Score5").ToString())
                txtScore2_6.Text = IIf(dr1.Item("Score6").ToString() = 0, "", dr1.Item("Score6").ToString())
                txtScore2_7.Text = IIf(dr1.Item("Score7").ToString() = 0, "", dr1.Item("Score7").ToString())
                txtScore2_8.Text = IIf(dr1.Item("Score8").ToString() = 0, "", dr1.Item("Score8").ToString())
                txtScore2_9.Text = IIf(dr1.Item("Score9").ToString() = 0, "", dr1.Item("Score9").ToString())

                txtScore2_10.Text = IIf(dr1.Item("Score10").ToString() = 0, "", dr1.Item("Score10").ToString())
                txtScore2_11.Text = IIf(dr1.Item("Score11").ToString() = 0, "", dr1.Item("Score11").ToString())
                txtScore2_12.Text = IIf(dr1.Item("Score12").ToString() = 0, "", dr1.Item("Score12").ToString())
                txtScore2_13.Text = IIf(dr1.Item("Score13").ToString() = 0, "", dr1.Item("Score13").ToString())
                txtScore2_14.Text = IIf(dr1.Item("Score14").ToString() = 0, "", dr1.Item("Score14").ToString())
                txtScore2_15.Text = IIf(dr1.Item("Score15").ToString() = 0, "", dr1.Item("Score15").ToString())
                txtScore2_16.Text = IIf(dr1.Item("Score16").ToString() = 0, "", dr1.Item("Score16").ToString())
                txtScore2_17.Text = IIf(dr1.Item("Score17").ToString() = 0, "", dr1.Item("Score17").ToString())
                txtScore2_18.Text = IIf(dr1.Item("Score18").ToString() = 0, "", dr1.Item("Score18").ToString())

                txtScore2_Tournamenthandicap.Text = dr1.Item("Tournamenthandicap").ToString()
                txtScore2_Ghinhandicap.Text = dr1.Item("Ghinhandicap").ToString()
                txtScore2_TotalOut.Text = CInt(dr1.Item("ScoreTotalout").ToString())
                txtScore2_Totalin.Text = CInt(dr1.Item("ScoreTotalin").ToString())
                txtScore2_GrandTotal.Text = CInt(dr1.Item("GrandTotal").ToString())
                txtScore2_NetScore.Text = CInt(dr1.Item("NetScore").ToString())

                scorecardsclosed = dr1.Item("scorecardsclosed").ToString()

                If scorecardsclosed Then
                    txtScore2_1.Enabled = False
                    txtScore2_2.Enabled = False
                    txtScore2_3.Enabled = False
                    txtScore2_4.Enabled = False
                    txtScore2_5.Enabled = False
                    txtScore2_6.Enabled = False
                    txtScore2_7.Enabled = False
                    txtScore2_8.Enabled = False
                    txtScore2_9.Enabled = False
                    txtScore2_10.Enabled = False
                    txtScore2_11.Enabled = False
                    txtScore2_12.Enabled = False
                    txtScore2_13.Enabled = False
                    txtScore2_14.Enabled = False
                    txtScore2_15.Enabled = False
                    txtScore2_16.Enabled = False
                    txtScore2_17.Enabled = False
                    txtScore2_18.Enabled = False
                End If

                Dim currentUser As MembershipUser = Membership.GetUser()
                If currentUser Is Nothing Then
                Else
                    Dim username As String = currentUser.UserName
                    Dim UserId As String = currentUser.ProviderUserKey.ToString()
                    If UserId = lblmemberid2.Text Then
                        Save1.Enabled = True
                        Close1.Enabled = False
                    End If
                End If



            End If
            If i = 3 Then

                lblGhin3.Text = dr1.Item("GhinID").ToString()
                lblScorecardID3.Text = dr1.Item("ScorecardID").ToString()
                lblmemberid3.Text = dr1.Item("memberid").ToString()

                lblUserNameScore3.Text = dr1.Item("firstname").ToString() & " " & dr1.Item("lastname").ToString()


                txtScore3_1.Text = IIf(dr1.Item("Score1").ToString() = 0, "", dr1.Item("Score1").ToString())
                txtScore3_2.Text = IIf(dr1.Item("Score2").ToString() = 0, "", dr1.Item("Score2").ToString())
                txtScore3_3.Text = IIf(dr1.Item("Score3").ToString() = 0, "", dr1.Item("Score3").ToString())
                txtScore3_4.Text = IIf(dr1.Item("Score4").ToString() = 0, "", dr1.Item("Score4").ToString())
                txtScore3_5.Text = IIf(dr1.Item("Score5").ToString() = 0, "", dr1.Item("Score5").ToString())
                txtScore3_6.Text = IIf(dr1.Item("Score6").ToString() = 0, "", dr1.Item("Score6").ToString())
                txtScore3_7.Text = IIf(dr1.Item("Score7").ToString() = 0, "", dr1.Item("Score7").ToString())
                txtScore3_8.Text = IIf(dr1.Item("Score8").ToString() = 0, "", dr1.Item("Score8").ToString())
                txtScore3_9.Text = IIf(dr1.Item("Score9").ToString() = 0, "", dr1.Item("Score9").ToString())

                txtScore3_10.Text = IIf(dr1.Item("Score10").ToString() = 0, "", dr1.Item("Score10").ToString())
                txtScore3_11.Text = IIf(dr1.Item("Score11").ToString() = 0, "", dr1.Item("Score11").ToString())
                txtScore3_12.Text = IIf(dr1.Item("Score12").ToString() = 0, "", dr1.Item("Score12").ToString())
                txtScore3_13.Text = IIf(dr1.Item("Score13").ToString() = 0, "", dr1.Item("Score13").ToString())
                txtScore3_14.Text = IIf(dr1.Item("Score14").ToString() = 0, "", dr1.Item("Score14").ToString())
                txtScore3_15.Text = IIf(dr1.Item("Score15").ToString() = 0, "", dr1.Item("Score15").ToString())
                txtScore3_16.Text = IIf(dr1.Item("Score16").ToString() = 0, "", dr1.Item("Score16").ToString())
                txtScore3_17.Text = IIf(dr1.Item("Score17").ToString() = 0, "", dr1.Item("Score17").ToString())
                txtScore3_18.Text = IIf(dr1.Item("Score18").ToString() = 0, "", dr1.Item("Score18").ToString())

                txtScore3_Tournamenthandicap.Text = dr1.Item("Tournamenthandicap").ToString()
                txtScore3_Ghinhandicap.Text = dr1.Item("Ghinhandicap").ToString()
                txtScore3_TotalOut.Text = CInt(dr1.Item("ScoreTotalout").ToString())
                txtScore3_Totalin.Text = CInt(dr1.Item("ScoreTotalin").ToString())
                txtScore3_GrandTotal.Text = CInt(dr1.Item("GrandTotal").ToString())
                txtScore3_NetScore.Text = CInt(dr1.Item("NetScore").ToString())

                scorecardsclosed = dr1.Item("scorecardsclosed").ToString()

                If scorecardsclosed Then
                    txtScore3_1.Enabled = False
                    txtScore3_2.Enabled = False
                    txtScore3_3.Enabled = False
                    txtScore3_4.Enabled = False
                    txtScore3_5.Enabled = False
                    txtScore3_6.Enabled = False
                    txtScore3_7.Enabled = False
                    txtScore3_8.Enabled = False
                    txtScore3_9.Enabled = False
                    txtScore3_10.Enabled = False
                    txtScore3_11.Enabled = False
                    txtScore3_12.Enabled = False
                    txtScore3_13.Enabled = False
                    txtScore3_14.Enabled = False
                    txtScore3_15.Enabled = False
                    txtScore3_16.Enabled = False
                    txtScore3_17.Enabled = False
                    txtScore3_18.Enabled = False
                End If


                Dim currentUser As MembershipUser = Membership.GetUser()
                If currentUser Is Nothing Then
                Else
                    Dim username As String = currentUser.UserName
                    Dim UserId As String = currentUser.ProviderUserKey.ToString()
                    If UserId = lblmemberid3.Text Then
                        Save1.Enabled = True
                        Close1.Enabled = False
                    End If
                End If


            End If
            If i = 4 Then

                lblGhin4.Text = dr1.Item("GhinID").ToString()
                lblScorecardID4.Text = dr1.Item("ScorecardID").ToString()
                lblmemberid4.Text = dr1.Item("memberid").ToString()

                lblUserNameScore4.Text = dr1.Item("firstname").ToString() & " " & dr1.Item("lastname").ToString()


                txtScore4_1.Text = IIf(dr1.Item("Score1").ToString() = 0, "", dr1.Item("Score1").ToString())
                txtScore4_2.Text = IIf(dr1.Item("Score2").ToString() = 0, "", dr1.Item("Score2").ToString())
                txtScore4_3.Text = IIf(dr1.Item("Score3").ToString() = 0, "", dr1.Item("Score3").ToString())
                txtScore4_4.Text = IIf(dr1.Item("Score4").ToString() = 0, "", dr1.Item("Score4").ToString())
                txtScore4_5.Text = IIf(dr1.Item("Score5").ToString() = 0, "", dr1.Item("Score5").ToString())
                txtScore4_6.Text = IIf(dr1.Item("Score6").ToString() = 0, "", dr1.Item("Score6").ToString())
                txtScore4_7.Text = IIf(dr1.Item("Score7").ToString() = 0, "", dr1.Item("Score7").ToString())
                txtScore4_8.Text = IIf(dr1.Item("Score8").ToString() = 0, "", dr1.Item("Score8").ToString())
                txtScore4_9.Text = IIf(dr1.Item("Score9").ToString() = 0, "", dr1.Item("Score9").ToString())

                txtScore4_10.Text = IIf(dr1.Item("Score10").ToString() = 0, "", dr1.Item("Score10").ToString())
                txtScore4_11.Text = IIf(dr1.Item("Score11").ToString() = 0, "", dr1.Item("Score11").ToString())
                txtScore4_12.Text = IIf(dr1.Item("Score12").ToString() = 0, "", dr1.Item("Score12").ToString())
                txtScore4_13.Text = IIf(dr1.Item("Score13").ToString() = 0, "", dr1.Item("Score13").ToString())
                txtScore4_14.Text = IIf(dr1.Item("Score14").ToString() = 0, "", dr1.Item("Score14").ToString())
                txtScore4_15.Text = IIf(dr1.Item("Score15").ToString() = 0, "", dr1.Item("Score15").ToString())
                txtScore4_16.Text = IIf(dr1.Item("Score16").ToString() = 0, "", dr1.Item("Score16").ToString())
                txtScore4_17.Text = IIf(dr1.Item("Score17").ToString() = 0, "", dr1.Item("Score17").ToString())
                txtScore4_18.Text = IIf(dr1.Item("Score18").ToString() = 0, "", dr1.Item("Score18").ToString())

                txtScore4_Tournamenthandicap.Text = dr1.Item("Tournamenthandicap").ToString()
                txtScore4_Ghinhandicap.Text = dr1.Item("Ghinhandicap").ToString()
                txtScore4_TotalOut.Text = CInt(dr1.Item("ScoreTotalout").ToString())
                txtScore4_Totalin.Text = CInt(dr1.Item("ScoreTotalin").ToString())
                txtScore4_GrandTotal.Text = CInt(dr1.Item("GrandTotal").ToString())
                txtScore4_NetScore.Text = CInt(dr1.Item("NetScore").ToString())

                scorecardsclosed = dr1.Item("scorecardsclosed").ToString()

                If scorecardsclosed Then
                    txtScore4_1.Enabled = False
                    txtScore4_2.Enabled = False
                    txtScore4_3.Enabled = False
                    txtScore4_4.Enabled = False
                    txtScore4_5.Enabled = False
                    txtScore4_6.Enabled = False
                    txtScore4_7.Enabled = False
                    txtScore4_8.Enabled = False
                    txtScore4_9.Enabled = False
                    txtScore4_10.Enabled = False
                    txtScore4_11.Enabled = False
                    txtScore4_12.Enabled = False
                    txtScore4_13.Enabled = False
                    txtScore4_14.Enabled = False
                    txtScore4_15.Enabled = False
                    txtScore4_16.Enabled = False
                    txtScore4_17.Enabled = False
                    txtScore4_18.Enabled = False
                End If

                Dim currentUser As MembershipUser = Membership.GetUser()
                If currentUser Is Nothing Then
                Else
                    Dim username As String = currentUser.UserName
                    Dim UserId As String = currentUser.ProviderUserKey.ToString()
                    If UserId = lblmemberid4.Text Then
                        Save1.Enabled = True
                        Close1.Enabled = False
                    End If
                End If


            End If
            If i = 5 Then

                lblGhin5.Text = dr1.Item("GhinID").ToString()
                lblScorecardID5.Text = dr1.Item("ScorecardID").ToString()
                lblmemberid5.Text = dr1.Item("memberid").ToString()

                lblUserNameScore5.Text = dr1.Item("firstname").ToString() & " " & dr1.Item("lastname").ToString()

                txtScore5_1.Text = IIf(dr1.Item("Score1").ToString() = 0, "", dr1.Item("Score1").ToString())
                txtScore5_2.Text = IIf(dr1.Item("Score2").ToString() = 0, "", dr1.Item("Score2").ToString())
                txtScore5_3.Text = IIf(dr1.Item("Score3").ToString() = 0, "", dr1.Item("Score3").ToString())
                txtScore5_4.Text = IIf(dr1.Item("Score4").ToString() = 0, "", dr1.Item("Score4").ToString())
                txtScore5_5.Text = IIf(dr1.Item("Score5").ToString() = 0, "", dr1.Item("Score5").ToString())
                txtScore5_6.Text = IIf(dr1.Item("Score6").ToString() = 0, "", dr1.Item("Score6").ToString())
                txtScore5_7.Text = IIf(dr1.Item("Score7").ToString() = 0, "", dr1.Item("Score7").ToString())
                txtScore5_8.Text = IIf(dr1.Item("Score8").ToString() = 0, "", dr1.Item("Score8").ToString())
                txtScore5_9.Text = IIf(dr1.Item("Score9").ToString() = 0, "", dr1.Item("Score9").ToString())

                txtScore5_10.Text = IIf(dr1.Item("Score10").ToString() = 0, "", dr1.Item("Score10").ToString())
                txtScore5_11.Text = IIf(dr1.Item("Score11").ToString() = 0, "", dr1.Item("Score11").ToString())
                txtScore5_12.Text = IIf(dr1.Item("Score12").ToString() = 0, "", dr1.Item("Score12").ToString())
                txtScore5_13.Text = IIf(dr1.Item("Score13").ToString() = 0, "", dr1.Item("Score13").ToString())
                txtScore5_14.Text = IIf(dr1.Item("Score14").ToString() = 0, "", dr1.Item("Score14").ToString())
                txtScore5_15.Text = IIf(dr1.Item("Score15").ToString() = 0, "", dr1.Item("Score15").ToString())
                txtScore5_16.Text = IIf(dr1.Item("Score16").ToString() = 0, "", dr1.Item("Score16").ToString())
                txtScore5_17.Text = IIf(dr1.Item("Score17").ToString() = 0, "", dr1.Item("Score17").ToString())
                txtScore5_18.Text = IIf(dr1.Item("Score18").ToString() = 0, "", dr1.Item("Score18").ToString())

                txtScore5_Tournamenthandicap.Text = dr1.Item("Tournamenthandicap").ToString()
                txtScore5_Ghinhandicap.Text = dr1.Item("Ghinhandicap").ToString()
                txtScore5_TotalOut.Text = CInt(dr1.Item("ScoreTotalout").ToString())
                txtScore5_Totalin.Text = CInt(dr1.Item("ScoreTotalin").ToString())
                txtScore5_GrandTotal.Text = CInt(dr1.Item("GrandTotal").ToString())
                txtScore5_NetScore.Text = CInt(dr1.Item("NetScore").ToString())

                scorecardsclosed = dr1.Item("scorecardsclosed").ToString()

                If scorecardsclosed Then
                    txtScore5_1.Enabled = False
                    txtScore5_2.Enabled = False
                    txtScore5_3.Enabled = False
                    txtScore5_4.Enabled = False
                    txtScore5_5.Enabled = False
                    txtScore5_6.Enabled = False
                    txtScore5_7.Enabled = False
                    txtScore5_8.Enabled = False
                    txtScore5_9.Enabled = False
                    txtScore5_10.Enabled = False
                    txtScore5_11.Enabled = False
                    txtScore5_12.Enabled = False
                    txtScore5_13.Enabled = False
                    txtScore5_14.Enabled = False
                    txtScore5_15.Enabled = False
                    txtScore5_16.Enabled = False
                    txtScore5_17.Enabled = False
                    txtScore5_18.Enabled = False
                End If

                Dim currentUser As MembershipUser = Membership.GetUser()
                If currentUser Is Nothing Then
                Else
                    Dim username As String = currentUser.UserName
                    Dim UserId As String = currentUser.ProviderUserKey.ToString()
                    If UserId = lblmemberid5.Text Then
                        Save1.Enabled = True
                        Close1.Enabled = False
                    End If
                End If


            End If

            i = i + 1
        End While
        dr1.Close()

        If Trim(lblUserNameScore1.Text) = "" Then
            txtScore1_1.Visible = False
            txtScore1_2.Visible = False
            txtScore1_3.Visible = False
            txtScore1_4.Visible = False
            txtScore1_5.Visible = False
            txtScore1_6.Visible = False
            txtScore1_7.Visible = False
            txtScore1_8.Visible = False
            txtScore1_9.Visible = False
            txtScore1_10.Visible = False
            txtScore1_11.Visible = False
            txtScore1_12.Visible = False
            txtScore1_13.Visible = False
            txtScore1_14.Visible = False
            txtScore1_15.Visible = False
            txtScore1_16.Visible = False
            txtScore1_17.Visible = False
            txtScore1_18.Visible = False
        End If

        If Trim(lblUserNameScore2.Text) = "" Then
            txtScore2_1.Visible = False
            txtScore2_2.Visible = False
            txtScore2_3.Visible = False
            txtScore2_4.Visible = False
            txtScore2_5.Visible = False
            txtScore2_6.Visible = False
            txtScore2_7.Visible = False
            txtScore2_8.Visible = False
            txtScore2_9.Visible = False
            txtScore2_10.Visible = False
            txtScore2_11.Visible = False
            txtScore2_12.Visible = False
            txtScore2_13.Visible = False
            txtScore2_14.Visible = False
            txtScore2_15.Visible = False
            txtScore2_16.Visible = False
            txtScore2_17.Visible = False
            txtScore2_18.Visible = False
        End If

        If Trim(lblUserNameScore3.Text) = "" Then
            txtScore3_1.Visible = False
            txtScore3_2.Visible = False
            txtScore3_3.Visible = False
            txtScore3_4.Visible = False
            txtScore3_5.Visible = False
            txtScore3_6.Visible = False
            txtScore3_7.Visible = False
            txtScore3_8.Visible = False
            txtScore3_9.Visible = False
            txtScore3_10.Visible = False
            txtScore3_11.Visible = False
            txtScore3_12.Visible = False
            txtScore3_13.Visible = False
            txtScore3_14.Visible = False
            txtScore3_15.Visible = False
            txtScore3_16.Visible = False
            txtScore3_17.Visible = False
            txtScore3_18.Visible = False
        End If

        If Trim(lblUserNameScore4.Text) = "" Then
            txtScore4_1.Visible = False
            txtScore4_2.Visible = False
            txtScore4_3.Visible = False
            txtScore4_4.Visible = False
            txtScore4_5.Visible = False
            txtScore4_6.Visible = False
            txtScore4_7.Visible = False
            txtScore4_8.Visible = False
            txtScore4_9.Visible = False
            txtScore4_10.Visible = False
            txtScore4_11.Visible = False
            txtScore4_12.Visible = False
            txtScore4_13.Visible = False
            txtScore4_14.Visible = False
            txtScore4_15.Visible = False
            txtScore4_16.Visible = False
            txtScore4_17.Visible = False
            txtScore4_18.Visible = False
        End If


        If Trim(lblUserNameScore5.Text) = "" Then
            txtScore5_1.Visible = False
            txtScore5_2.Visible = False
            txtScore5_3.Visible = False
            txtScore5_4.Visible = False
            txtScore5_5.Visible = False
            txtScore5_6.Visible = False
            txtScore5_7.Visible = False
            txtScore5_8.Visible = False
            txtScore5_9.Visible = False
            txtScore5_10.Visible = False
            txtScore5_11.Visible = False
            txtScore5_12.Visible = False
            txtScore5_13.Visible = False
            txtScore5_14.Visible = False
            txtScore5_15.Visible = False
            txtScore5_16.Visible = False
            txtScore5_17.Visible = False
            txtScore5_18.Visible = False
        End If

        lblScorecardSave.Text = "This Scorecard can only be updated by:" & lblUserNameScore1.Text & " " & lblUserNameScore2.Text & " " & lblUserNameScore3.Text & " " & lblUserNameScore4.Text & " " & lblUserNameScore5.Text

        'admins can update anything
        Dim currentUserx As MembershipUser = Membership.GetUser()
        If currentUserx Is Nothing Then
        Else
            Dim isadmin As Boolean = HttpContext.Current.User.IsInRole("Administrators")
            If isadmin Then
                Save1.Enabled = True
                Close1.Enabled = False
            End If
        End If


        'testing
        Save1.Enabled = True
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


    Protected Sub Close1_Click(sender As Object, e As System.EventArgs) Handles Close1.Click
        Dim ssql As String = ""
        Dim scoreid As Integer
        If lblScorecardID1.Text <> "" Then
            scoreid = CInt(lblScorecardID1.Text)
            ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
            ExecuteSql(ssql)
        End If
        If lblScorecardID2.Text <> "" Then
            scoreid = CInt(lblScorecardID2.Text)
            ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
            ExecuteSql(ssql)
        End If
        If lblScorecardID3.Text <> "" Then
            scoreid = CInt(lblScorecardID3.Text)
            ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
            ExecuteSql(ssql)
        End If
        If lblScorecardID4.Text <> "" Then
            scoreid = CInt(lblScorecardID4.Text)
            ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
            ExecuteSql(ssql)
        End If
        If lblScorecardID5.Text <> "" Then
            scoreid = CInt(lblScorecardID5.Text)
            ssql = "UPDATE [tb_Scorecard] SET [ScorecardClosed] = 'True' WHERE scorecardid=" & scoreid
            ExecuteSql(ssql)
        End If
        lblScorecardSave.Text = "This Scorecard is now closed. No Changes can be made except by an administrator."
    End Sub

    Protected Sub Save1_Click(sender As Object, e As System.EventArgs) Handles Save1.Click


        If lblGhin1.Text <> "" Then
            updateScoreCard(lblGhin1.Text, txtScore1_1.Text, txtScore1_2.Text, txtScore1_3.Text, txtScore1_4.Text, txtScore1_5.Text, txtScore1_6.Text, txtScore1_7.Text, txtScore1_8.Text, txtScore1_9.Text, txtScore1_10.Text, txtScore1_11.Text, txtScore1_12.Text, txtScore1_13.Text, txtScore1_14.Text, txtScore1_15.Text, txtScore1_16.Text, txtScore1_17.Text, txtScore1_18.Text)
        End If

        If lblGhin2.Text <> "" Then
            updateScoreCard(lblGhin2.Text, txtScore2_1.Text, txtScore2_2.Text, txtScore2_3.Text, txtScore2_4.Text, txtScore2_5.Text, txtScore2_6.Text, txtScore2_7.Text, txtScore2_8.Text, txtScore2_9.Text, txtScore2_10.Text, txtScore2_11.Text, txtScore2_12.Text, txtScore2_13.Text, txtScore2_14.Text, txtScore2_15.Text, txtScore2_16.Text, txtScore2_17.Text, txtScore2_18.Text)
        End If

        If lblGhin3.Text <> "" Then
            updateScoreCard(lblGhin3.Text, txtScore3_1.Text, txtScore3_2.Text, txtScore3_3.Text, txtScore3_4.Text, txtScore3_5.Text, txtScore3_6.Text, txtScore3_7.Text, txtScore3_8.Text, txtScore3_9.Text, txtScore3_10.Text, txtScore3_11.Text, txtScore3_12.Text, txtScore3_13.Text, txtScore3_14.Text, txtScore3_15.Text, txtScore3_16.Text, txtScore3_17.Text, txtScore3_18.Text)
        End If

        If lblGhin4.Text <> "" Then
            updateScoreCard(lblGhin4.Text, txtScore4_1.Text, txtScore4_2.Text, txtScore4_3.Text, txtScore4_4.Text, txtScore4_5.Text, txtScore4_6.Text, txtScore4_7.Text, txtScore4_8.Text, txtScore4_9.Text, txtScore4_10.Text, txtScore4_11.Text, txtScore4_12.Text, txtScore4_13.Text, txtScore4_14.Text, txtScore4_15.Text, txtScore4_16.Text, txtScore4_17.Text, txtScore4_18.Text)
        End If

        If lblGhin5.Text <> "" Then
            updateScoreCard(lblGhin5.Text, txtScore5_1.Text, txtScore5_2.Text, txtScore5_3.Text, txtScore5_4.Text, txtScore5_5.Text, txtScore5_6.Text, txtScore5_7.Text, txtScore5_8.Text, txtScore5_9.Text, txtScore5_10.Text, txtScore5_11.Text, txtScore5_12.Text, txtScore5_13.Text, txtScore5_14.Text, txtScore5_15.Text, txtScore5_16.Text, txtScore5_17.Text, txtScore5_18.Text)
        End If

        BindScorecardGrid()

        lblScorecardSave.Text = "Scores Saved"

    End Sub
    Private Sub updateScoreCard(ByVal GhinID As String, ByVal Score1 As String, ByVal Score2 As String, ByVal Score3 As String, ByVal Score4 As String, ByVal Score5 As String, ByVal Score6 As String, ByVal Score7 As String, ByVal Score8 As String, ByVal Score9 As String, ByVal Score10 As String, ByVal Score11 As String, ByVal Score12 As String, ByVal Score13 As String, ByVal Score14 As String, ByVal Score15 As String, ByVal Score16 As String, ByVal Score17 As String, ByVal Score18 As String)

        Dim partotalout As Integer = 0
        Dim partotalin As Integer = 0
        Dim yardagetotalout As Integer = 0
        Dim yardagetotalin As Integer = 0
        Dim grandpartotal As Integer = 0
        Dim grandyardagetotal As Integer = 0

        Dim i As Integer = 1

        Dim gamesplayed As Integer = 0
        Dim ScoreTotalOut As Integer = 0
        Dim ScoreTotalin As Integer = 0
        Dim GrandTotal As Integer = 0
        Dim NetScore As Integer = 0
        Dim Thandicap As Integer = 0
        Dim Ghandicap As Integer = 0

        Dim sSql As String = ""
        Dim memberidgrid As String = ""
        Dim Gender As String = ""
        Dim date1 As Date = Now
        Dim sqldate As String = "'" & date1.ToString("MM/dd/yyyy") & "'"


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

            Gender = drr.Item("Gender").ToString()

            getrating(Gender)

            gamesplayed = getgamesplayed(memberidgrid)

            Thandicap = CInt(drr.Item("Tournamenthandicap").ToString())
            Ghandicap = CInt(drr.Item("Ghinhandicap").ToString())

            ScoreTotalOut = CInt(Score1) + CInt(Score2) + CInt(Score3) + CInt(Score4) + CInt(Score5) + CInt(Score6) + CInt(Score7) + CInt(Score8) + CInt(Score9)
            ScoreTotalin = CInt(Score10) + CInt(Score11) + CInt(Score12) + CInt(Score13) + CInt(Score14) + CInt(Score15) + CInt(Score16) + CInt(Score17) + CInt(Score18)
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


            Dim sSql4 As String = "DELETE FROM [tb_Scorecard] WHERE memberid='" & memberidgrid & "' and locationid =" & LocationID & "  and Scorecardclosed='False'"
            ExecuteSql(sSql4)

            sSql = "INSERT INTO [tb_Scorecard]([GhinID],[LocationID],[PairingID],[Date],[memberid] ,[Score1],[Score2],[Score3],[Score4],[Score5],[Score6],[Score7],[Score8],[Score9],[ScoreTotalout],[Score10],[Score11],[Score12],[Score13],[Score14],[Score15],[Score16],[Score17],[Score18],[ScoreTotalin],[GrandTotal],[TournamentHandicap] ,[GhinHandicap],[NetScore],Rating, Slope, Differential,Scorecardclosed)"

            sSql += " VALUES ("
            sSql += GhinID
            sSql += "," & LocationID
            sSql += ",1"
            sSql += "," & sqldate
            sSql += ",'" & memberidgrid & "'"
            sSql += "," & Score1
            sSql += "," & Score2
            sSql += "," & Score3
            sSql += "," & Score4
            sSql += "," & Score5
            sSql += "," & Score6
            sSql += "," & Score7
            sSql += "," & Score8
            sSql += "," & Score9
            sSql += "," & ScoreTotalOut
            sSql += "," & Score10
            sSql += "," & Score11
            sSql += "," & Score12
            sSql += "," & Score13
            sSql += "," & Score14
            sSql += "," & Score15
            sSql += "," & Score16
            sSql += "," & Score17
            sSql += "," & Score18
            sSql += "," & ScoreTotalin
            sSql += "," & GrandTotal
            sSql += "," & Thandicap
            sSql += "," & Ghandicap
            sSql += "," & NetScore
            sSql += "," & Rating
            sSql += "," & Slope
            sSql += "," & Differential
            sSql += ",'False'"
            sSql += ")"
            ExecuteSql(sSql)
        End If

    End Sub
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
            sSql = "SELECT [FemaleRating] as Rating ,[FemaleSlope] as Slope FROM [tb_CourseRating] where [LocationId] =" & LocationID & "   order by [RatingId]"
        Else
            sSql = "SELECT [MaleRating] as Rating ,[MaleSlope] as Slope  FROM [tb_CourseRating] where [LocationId] =" & LocationID & "   order by [RatingId]"
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


End Class
