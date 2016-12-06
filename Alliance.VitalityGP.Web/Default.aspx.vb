Imports Alliance.Data
Imports DevExpress.Data.Filtering
Imports DevExpress.Xpo
Imports DevExpress.Xpo.Metadata
Imports DevExpress.Web
Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports DevExpress.Web.Internal


Partial Class _Default

    Inherits System.Web.UI.Page
    ' Shadows _session As Session

    Private Sub _Default1_Init(sender As Object, e As EventArgs) Handles Me.Init

        Dim _session As Session = XpoHelper.GetNewSession()
        _session = XpoHelper.GetNewSession()
        XpoDataSource2.Session = _session 'Session

        Dim PatientclassInfo As XPClassInfo = _session.GetClassInfo(GetType(Patient))
        txtAddress1.MaxLength = PatientclassInfo.GetMember("Addr1").MappingFieldSize
        txtAddress2.MaxLength = PatientclassInfo.GetMember("Addr2").MappingFieldSize
        txtAddress3.MaxLength = PatientclassInfo.GetMember("Addr3").MappingFieldSize
        txtCity.MaxLength = PatientclassInfo.GetMember("City").MappingFieldSize
        txtCounty.MaxLength = PatientclassInfo.GetMember("County").MappingFieldSize
        txtPostcode.MaxLength = PatientclassInfo.GetMember("PostCode").MappingFieldSize
        txtTPhone.MaxLength = PatientclassInfo.GetMember("HomePhone").MappingFieldSize
        txtFirstName.MaxLength = PatientclassInfo.GetMember("FirstName").MappingFieldSize
        txtLastname.MaxLength = PatientclassInfo.GetMember("SurName").MappingFieldSize


    End Sub

    '************Validation***************
    Protected Sub NameTextBox_Validation(ByVal sender As Object, ByVal e As ValidationEventArgs)
        If (TryCast(e.Value, String)).Length < 3 Then
            e.IsValid = False
        End If
    End Sub

    '*************************************
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim u As MembershipUser
        u = Membership.GetUser(User.Identity.Name)

        Try
            '***validation checks***
            If cboGPSelect.SelectedIndex = "1" And cboHospitalList.SelectedIndex = "-1" Then
                ' Response.Write("sdfdsfds")

                Exit Sub
            End If

            'Equivalent of an Insert Statement in SQL
            Using uow = XpoHelper.GetNewSession()

                Dim _patient As New Patient(uow)
                _patient.Title = cboTitle.SelectedItem.Value
                _patient.FirstName = txtFirstName.Text.Trim()
                _patient.SurName = txtLastname.Text.Trim()
                _patient.DOB = dtDOB.Text
                _patient.Gender = cboGender.SelectedItem.Value
                _patient.Addr1 = txtAddress1.Text.Trim()
                _patient.Addr2 = txtAddress2.Text.Trim()
                _patient.Addr3 = txtAddress3.Text.Trim()
                _patient.City = txtCity.Text.Trim()
                _patient.County = txtCounty.Text.Trim()
                _patient.PostCode = txtPostcode.Text.Trim()
                If txtTPhone.Text.Trim.StartsWith("07") Then
                    _patient.MobilePhone = txtTPhone.Text.Trim().Replace(" ", "")
                Else
                    _patient.WorkPhone = txtTPhone.Text.Trim().Replace(" ", "")
                End If

                _patient.ConsentToLeaveMessage = chkLeaveMessage.Checked.ToString

                _patient.Save()
                uow.Save(_patient)
                Dim _referral As New Referral(uow)

                '  _patient.ConsentThirdParty = chkThirdParty.Checked.ToString
                _referral.Patient = _patient
                _referral.PolicyNo = txtPolicyNumber.Text.Trim()
                'save.AuthNumber = txtAuthnumber.Text
                _referral.Details = txtPresentingCondition.Text.Trim()
                _referral.SpecialInstructions = txtSymptoms.Text.Trim()
                _referral.Symptom = uow.FindObject(Of Symptom)(CriteriaOperator.Parse("Symptom = ?", "WebReferral"))
                _referral.Insurer = uow.GetObjectByKey(Of Insurer)(9531)
                ' Session.FindObject(Of Practice)(CriteriaOperator.Parse("Oid = ?", pOid))
                _referral.StaffClaim = chkStaffClaim.Checked.ToString
                If spinExcess.Text = "" Then
                    _referral.Excess = 0
                Else
                    _referral.Excess = spinExcess.Text
                End If
                If spinOutPatientLimit.Text = "" Then
                    _referral.OutPatientLimit = 0
                Else
                    _referral.OutPatientLimit = spinOutPatientLimit.Text
                End If

                ' _referral.GPSelect = cboGPSelect.SelectedItem.Value
                ' _referral.AltContact = txtAltContact.Text

                If cboGPSelect.SelectedItem.Value = "No" Then
                    ' we only want to pass a Hospital value if GPSelect is No
                    _referral.HospitalList = cboHospitalList.SelectedItem.Value
                Else
                    _referral.HospitalList = DBNull.Value.ToString
                End If


                ' _referral.Callback = dtCallBack.Value
                ' _referral.SelfPaying = chkSelfPay.Checked.ToString


                ' _referral.userID = u.ProviderUserKey()
                '  _referral.GPID = intPersonID 'gpid
                _referral.Save()

                '.Save() will persistent your changes to the object but uow.CommitChanges() will save those changes back to the database
                uow.Save(_referral)
            End Using


        Catch ex As Exception
            MsgBox(ex.Message)
            '  errorMessageLabel.Visible = True
        End Try
    End Sub



    Private Sub dtCallBack_Init(sender As Object, e As EventArgs) Handles dtCallBack.Init
        dtCallBack.Date = Now.AddHours(2)
        dtCallBack.MinDate = Now.AddHours(2)
    End Sub


End Class
