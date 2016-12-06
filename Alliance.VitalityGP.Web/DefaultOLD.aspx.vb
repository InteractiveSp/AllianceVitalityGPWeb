Imports DevExpress.Xpo
Imports Alliance.Data
Imports DevExpress.Web
Imports DevExpress.Data.Filtering

Public Class _DefaultOld
    Inherits System.Web.UI.Page
    Shadows _session As Session

    Dim _clientStaff As ClientStaff
    Dim _globalUser As GlobalUser
    Dim _client As Client

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        _session = XpoHelper.GetNewSession()
        Dim user As MembershipUser = Membership.GetUser()
        _clientStaff = _session.GetObjectByKey(Of ClientStaff)(user.ProviderUserKey)
        ' _client = _session.GetObjectByKey(Of Client)(_clientStaff.Client.Oid)

        XpoDataSource1.Session = _session
        ' XpoDataSource1.Criteria = String.Format("[ClientOid] = {0}", _client.Oid)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub GridView_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating

        Dim _claim = _session.GetObjectByKey(Of Claim)(e.Keys(0))

        Dim _beneficiary = _session.GetObjectByKey(Of Beneficiary)(_claim.Beneficiary.Oid)

        _beneficiary.FirstName = TryCast(e.NewValues("FirstName"), String)
        _beneficiary.SurName = TryCast(e.NewValues("SurName"), String)
        _beneficiary.DOB = Convert.ToDateTime(e.NewValues("DOB"))
        _beneficiary.Email = TryCast(e.NewValues("Email"), String)

        _beneficiary.Addr1 = TryCast(e.NewValues("Addr1"), String)
        _beneficiary.Addr2 = TryCast(e.NewValues("Addr2"), String)
        _beneficiary.City = TryCast(e.NewValues("City"), String)
        _beneficiary.County = TryCast(e.NewValues("County"), String)
        _beneficiary.PostCode = TryCast(e.NewValues("PostCode"), String)
        _beneficiary.Email = TryCast(e.NewValues("Email"), String)
        _beneficiary.Gender = TryCast(e.NewValues("Gender"), String)
        _beneficiary.MobilePhone = TryCast(e.NewValues("MobilePhone"), String)
        _beneficiary.Title = TryCast(e.NewValues("Title"), String)
        _beneficiary.WorkPhone = TryCast(e.NewValues("WorkPhone"), String)

        _beneficiary.Save()

        Dim g As ASPxGridView = TryCast(sender, ASPxGridView)
        g.CancelEdit()
        e.Cancel = True

    End Sub

    Protected Sub GridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        Dim _firstname As String = TryCast(e.NewValues("FirstName"), String)
        Dim _surName As String = TryCast(e.NewValues("SurName"), String)
        Dim _postCode As String = TryCast(e.NewValues("PostCode"), String)
        Dim _DOB As Date = Convert.ToDateTime(e.NewValues("DOB"))

        Dim filter As CriteriaOperator
        filter = CriteriaOperator.Parse("Client= ? and FirstName = ? and SurName = ? and PostCode = ? and DOB = ?", _client.Oid, _firstname, _surName, _postCode, _DOB)

        Dim _beneficiary As Beneficiary

        _beneficiary = _session.FindObject(Of Beneficiary)(filter)

        If _beneficiary Is Nothing Then
            _beneficiary = New Beneficiary(_session)
            _beneficiary.Client = _client
            _beneficiary.ClientType = _client.ClientType
            _beneficiary.JoinDate = DateTime.Today
            _beneficiary.Scheme = _session.FindObject(Of Scheme)(CriteriaOperator.Parse("Client= ?", _client.Oid))
            _beneficiary.LevelofCover = _session.GetObjectByKey(Of LevelofCover)(10)
            _beneficiary.RelationShip = _session.GetObjectByKey(Of RelationShip)(11)
        End If

        _beneficiary.FirstName = TryCast(e.NewValues("FirstName"), String)
        _beneficiary.SurName = TryCast(e.NewValues("SurName"), String)
        _beneficiary.DOB = Convert.ToDateTime(e.NewValues("DOB"))
        _beneficiary.Email = TryCast(e.NewValues("Email"), String)

        _beneficiary.Addr1 = TryCast(e.NewValues("Addr1"), String)
        _beneficiary.Addr2 = TryCast(e.NewValues("Addr2"), String)
        _beneficiary.City = TryCast(e.NewValues("City"), String)
        _beneficiary.County = TryCast(e.NewValues("County"), String)
        _beneficiary.PostCode = TryCast(e.NewValues("PostCode"), String)
        _beneficiary.Email = TryCast(e.NewValues("Email"), String)
        _beneficiary.Gender = TryCast(e.NewValues("Gender"), String)
        _beneficiary.MobilePhone = TryCast(e.NewValues("MobilePhone"), String)
        _beneficiary.Title = TryCast(e.NewValues("Title"), String)
        _beneficiary.WorkPhone = TryCast(e.NewValues("WorkPhone"), String)

        _beneficiary.Save()

        Dim _Triage As New Communication(_session)
        _Triage.Beneficiary = _beneficiary
        _Triage.TaskLabel = eTaskLabel.Triage
        _Triage.Subject = "Triage"
        _Triage.Text = TryCast(e.NewValues("TriageNotes"), String)
        _Triage.Save()

        Dim _claim As Claim = New Claim(_session)
        _claim.ClientType = _client.ClientType
        _claim.Status = eClaimStatus.Pended
        _claim.Source = eClaimSource.Web
        _claim.ClaimDate = DateTime.Today
        _claim.Beneficiary = _beneficiary
        _claim.Client = _client

        _claim.Symptom = _session.FindObject(Of Symptom)(CriteriaOperator.Parse("Symptom = ? ", "WebReferral"))
        _claim.Triage = _Triage

        _claim.Save()

        _Triage.Claim = _claim
        _Triage.Save()
        Dim g As ASPxGridView = TryCast(sender, ASPxGridView)
        g.CancelEdit()
        e.Cancel = True

    End Sub

    Protected Sub ASPxGridView1_CellEditorInitialize(sender As Object, e As ASPxGridViewEditorEventArgs) Handles ASPxGridView1.CellEditorInitialize
        If ASPxGridView1.IsNewRowEditing Then
            Return
        End If
        If e.Column.FieldName = "TriageNotes" Then
            e.Editor.[ReadOnly] = True
            e.Editor.Enabled = False
        End If

    End Sub
    Protected Sub ASPxGridView1_BeforeGetCallbackResult(sender As Object, e As EventArgs) Handles ASPxGridView1.BeforeGetCallbackResult
        Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
        If grid.IsNewRowEditing Then
            grid.SettingsText.CommandUpdate = "Send"
        Else
            grid.SettingsText.CommandUpdate = "Update"
        End If
    End Sub

End Class