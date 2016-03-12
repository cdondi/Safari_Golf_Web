Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Xml
Imports System.Web
Imports System.Web.HttpResponse
Imports Microsoft.VisualBasic 
Imports System.Web.Services

Namespace calendarVB

    Public Class Helper

        Public mainworkingfolder As String

        Public Function GlobalConnectionString() As String

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

        Public Function createConnectionString(ByVal server As String, ByVal catalog As String, ByVal user As String, ByVal password As String) As String
            Dim strconnector As String = "Data Source=" & server & ";Initial Catalog=" & catalog & ";User Id=" & user & ";Password=" & password & ";"
            Return strconnector
        End Function
        Public Function GetHFMDataReader(ByVal sSql As String, ByVal server As String, ByVal catalog As String, ByVal user As String, ByVal password As String) As SqlDataReader
            Dim strconnector As String = "Data Source=" & server & ";Initial Catalog=" & catalog & ";User Id=" & user & ";Password=" & password & ";"

            Dim cn As New SqlConnection(strconnector)
            cn.Open()
            Dim cm As New SqlCommand(sSql, cn)
            Return cm.ExecuteReader(CommandBehavior.CloseConnection)
        End Function

        Public Function ExecuteScalar(ByVal sSql As String) As String
            Dim cn As New SqlConnection(GetConnectionString())
            cn.Open()
            Dim cm As New SqlCommand(sSql, cn)
            Dim sRet As String = cm.ExecuteScalar()
            cn.Close()
            Return sRet
        End Function

        Public Function GetDataReaderDb(ByVal sSql As String) As SqlDataReader
            Dim cn As New SqlConnection(GetConnectionString())
            cn.Open()
            Dim cm As New SqlCommand(sSql, cn)
            Return cm.ExecuteReader(CommandBehavior.CloseConnection)

        End Function

        Public Function GetDataReader(ByVal sSql As String) As SqlDataReader
            Dim cn As New SqlConnection(GetConnectionString())
            cn.Open()
            Dim cm As New SqlCommand(sSql, cn)
            Return cm.ExecuteReader(CommandBehavior.CloseConnection)
        End Function

        Public Function GetDataReaderSQLBackup(ByVal sSql As String, ByVal s1 As String, ByVal u1 As String, ByVal p1 As String) As SqlDataReader
            Dim cn As New SqlConnection(GetConnectionStringSQLBackup(s1, u1, p1))
            cn.Open()
            Dim cm As New SqlCommand(sSql, cn)
            Return cm.ExecuteReader(CommandBehavior.CloseConnection)
        End Function
        Public Function GetDataReaderWithConnection(ByVal sSql As String, ByVal conString As String) As SqlDataReader
            Dim cn As New SqlConnection(conString)
            cn.Open()
            Dim cm As New SqlCommand(sSql, cn)
            Return cm.ExecuteReader(CommandBehavior.CloseConnection)
        End Function
        Public Function XMLWorkingFolder() As String

            Dim oHelper As New Helper
            Dim sSql As String = "SELECT  config_value FROM config where config_var = 'WorkingFolder'"
            Dim config_value As String = ""
            Dim dr As SqlDataReader = oHelper.GetDataReader(sSql)
            While dr.Read
                config_value = dr.GetValue(dr.GetOrdinal("config_value"))
            End While
            dr.Close()

            Return config_value

        End Function

        Public Function GetTheConnectionString() As String
            'Return "File Name = " & System.Web.HttpContext.Current.Server.MapPath("connect.udl")
            'Dim strConnectionString As String = ConfigurationManager.ConnectionStrings("EldoretSoftware").ConnectionString
            Dim strConnectionString As String = GetConnectionString()
            GetTheConnectionString = strConnectionString
        End Function
        Public Function TestSQLConnectionString() As Boolean

            Dim strConnectionString As String = GetTheConnectionString()

            If strConnectionString = "" Then
                'msgbox("Database and application settings must be set before continuing with this application.")
                TestSQLConnectionString = False
                Exit Function
            End If

            Try
                Dim cn As New SqlConnection(strConnectionString)
                cn.Open()
                TestSQLConnectionString = True
                Exit Function
            Catch
                'MsgBox("Active Database setting not valid. Fix before continuing.")
                TestSQLConnectionString = False
            End Try

        End Function

        Private Function GetConnectionString() As String

            Dim server As String = ""
            Dim catalog As String = ""
            Dim user As String = ""
            Dim password As String = ""

            Dim oHelper As New Helper
            Dim strConnectionString As String = oHelper.GlobalConnectionString()


            Dim AcceptString() As String = Split(strConnectionString, ";")

            Dim iii As Integer
            For iii = 0 To UBound(AcceptString)

                Dim AcceptString1() As String = Split(AcceptString(iii), "=")


                If AcceptString1(0) = "Data Source" Then
                    server = Trim(AcceptString1(1))
                End If

                If AcceptString1(0) = "Initial Catalog" Then
                    catalog = Trim(AcceptString1(1))
                End If

                If AcceptString1(0) = "User Id" Then
                    user = Trim(AcceptString1(1))
                End If


                If AcceptString1(0) = "Password" Then
                    password = Trim(AcceptString1(1))
                End If

            Next

            Return strConnectionString

        End Function

        Private Function GetConnectionStringSQLBackup(ByVal s1 As String, ByVal u1 As String, ByVal p1 As String) As String

            Dim strConnectionString As String = ""
            Dim server As String = ""
            Dim catalog As String = ""
            Dim user As String = ""
            Dim password As String = ""

            Dim appConnection As String = ""

            strConnectionString = "Server=" & s1 & ";Initial Catalog=master;User ID=" & u1 & ";Password=" & p1 & ";"

            Return strConnectionString

        End Function




        Private Function GetConnectionStringxx() As String
            Dim sFilePath As String = System.AppDomain.CurrentDomain.BaseDirectory() & "connect.udl"
            Return "Initial File Name = " & sFilePath
        End Function
        Public Sub SetSelect(ByVal oSelect As System.Web.UI.WebControls.ListBox, _
                             ByVal sSql As String)

            Dim dt As DataTable = GetTable(sSql)
            Dim sKey As String
            Dim sValue As String
            Dim bTwoColumns As Boolean = dt.Columns.Count > 1

            For i As Int32 = 0 To dt.Rows.Count - 1
                sKey = dt.Rows(i)(0).ToString()

                If bTwoColumns Then
                    sValue = dt.Rows(i)(1).ToString()
                Else
                    sValue = sKey
                End If

                oSelect.Items.Add(New System.Web.UI.WebControls.ListItem(sValue, sKey))
            Next
        End Sub

        Public Sub SetSelect(ByVal oSelect As System.Web.UI.WebControls.DropDownList, _
                             ByVal sSql As String)

            Dim dt As DataTable = GetTable(sSql)
            Dim sKey As String
            Dim sValue As String
            Dim bTwoColumns As Boolean = dt.Columns.Count > 1

            For i As Int32 = 0 To dt.Rows.Count - 1
                sKey = dt.Rows(i)(0).ToString()

                If bTwoColumns Then
                    sValue = dt.Rows(i)(1).ToString()
                Else
                    sValue = sKey
                End If

                oSelect.Items.Add(New System.Web.UI.WebControls.ListItem(sValue, sKey))
            Next
        End Sub

        Public Function GetTable(ByVal sSql As String, _
                             Optional ByVal sConnectionString As String = "") As System.Data.DataTable
            Dim cn As SqlConnection
            cn = New SqlConnection(GetConnectionString())
            cn.Open()

            Dim ad As SqlDataAdapter = New SqlDataAdapter(sSql, cn)
            Dim ds As DataSet = New DataSet

            ad.Fill(ds)
            cn.Close()
            Return ds.Tables(0)
        End Function

    End Class

End Namespace
