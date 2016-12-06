Imports Alliance.Data
Imports DevExpress.Xpo
Imports DevExpress.Xpo.DB
Imports DevExpress.Xpo.Session

Partial Class ucLoginDetails
    Inherits System.Web.UI.UserControl
    Private _session As UnitOfWork 'was new

    Protected Sub Repeater1_Load(sender As Object, e As EventArgs) Handles Repeater1.Load
        If _session Is Nothing Then
            _session = XpoHelper.GetNewUnitOfWork()
        End If

        Dim sSql As String = ""

        sSql = "SELECT DISTINCT Client.FullName, GlobalUser.UserName, GlobalUser.Password " _
            & "FROM ClientStaff INNER JOIN " _
            & "Client ON ClientStaff.Client = Client.OID INNER JOIN " _
            & "Authorisation ON Client.OID = Authorisation.Client INNER JOIN " _
            & "GlobalUser ON ClientStaff.OID = GlobalUser.Oid " _
            & "WHERE Client.ClientType = 2  and GlobalUser.ApplicationName= '" & Membership.ApplicationName.ToString & "'"

        Dim dv As New XPDataView()
        Dim data As SelectedData = _session.ExecuteQueryWithMetadata(sSql)

        For Each row As SelectStatementResultRow In data.ResultSet(0).Rows
            dv.AddProperty(DirectCast(row.Values(0), String), DBColumn.[GetType](DirectCast([Enum].Parse(GetType(DBColumnType), DirectCast(row.Values(2), String)), DBColumnType)))
        Next

        dv.LoadData(New SelectedData(data.ResultSet(1)))
        Repeater1.DataSource = dv
        Repeater1.DataBind()
        'End If

    End Sub
End Class
