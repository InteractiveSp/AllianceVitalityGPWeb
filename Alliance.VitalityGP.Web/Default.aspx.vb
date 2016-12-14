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

    Public Property ASPxClientEdit As Object
    Private formValidation As New PageValidation
    Private globalfunctions As New Globals
    Private Sub _Default1_Init(sender As Object, e As EventArgs) Handles Me.Init

        If User.Identity.Name = "" Then
            Response.Redirect("Login.aspx")
        End If

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

        ' Dim sendemail As New Globals()
        'Console.WriteLine(sendemail.SendEmail("Error from Alliance.VitalityGP web site.", "Alliance.VitalityGP.Web Error", False))

        'Populate Title drop down box
        cboTitle.DataSource = globalfunctions.GetTitles(_session)
        cboTitle.DataBind()

        'Populate Contact Title drop down box
        cboContactTitle.DataSource = globalfunctions.GetTitles(_session)
        cboContactTitle.DataBind()
    End Sub

    '************Validation***************

    Dim isError As Boolean = False

    ''' <summary>
    ''' Validates name field to ensuring only letters are entered
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub NameTextBox_Validation(ByVal sender As Object, ByVal e As ValidationEventArgs)
        e.IsValid = formValidation.checkName(sender, e)
        If e.IsValid = True Then
            isError = False
        Else
            isError = True
        End If
    End Sub


    ''' <summary>
    ''' Validates a telephone field to ensuring only numbers are entered and thats its between 10 to 12 digits long
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub PhoneTextBox_Validation(ByVal sender As Object, ByVal e As ValidationEventArgs)
        e.IsValid = formValidation.checkPhoneNumber(sender, e)
        If e.IsValid = True Then
            isError = False
        Else
            isError = True
        End If
    End Sub

    ''' <summary>
    ''' Validates the date of birth field to ensuring a date in the past is entered
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub DOBTextBox_Validation(ByVal sender As Object, ByVal e As ValidationEventArgs)
        e.IsValid = formValidation.checkDOB(sender, e)
        If e.IsValid = True Then
            isError = False
        Else
            isError = True
        End If
    End Sub

    ''' <summary>
    ''' Validates the hospital list drop down box to ensuring the hospital dropdown box has a value selected if the GP Select dropdown box is set to "No"
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub HospitalListBox_Validation(ByVal sender As Object, ByVal e As ValidationEventArgs)
        If cboGPSelect.Text.ToLower() = "no" And cboHospitalList.SelectedIndex = "-1" Then
            e.IsValid = False
        End If

        If e.IsValid = True Then
            isError = False
        Else
            isError = True
        End If
    End Sub

    ''' <summary>
    ''' Validates the symptom field by checking whether its blank
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub SymptomsTextBox_Validation(ByVal sender As Object, ByVal e As ValidationEventArgs)
        e.IsValid = formValidation.IsItBlank(sender, e)
    End Sub

    '*************************************



    ''' <summary>
    ''' Saves form deatils into the database if theres no errors on the page.  Also clears the fields.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        'Save details if theres no errors from the page validation
        lblResult.Text = ""
        If isError = False Then

            Dim u As MembershipUser
            u = Membership.GetUser(User.Identity.Name)

            Try

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
                    _patient.GuardianTitle = cboContactTitle.SelectedItem.Value()
                    _patient.GuardianFirstName = txtContactFirstname.Text.Trim()
                    _patient.GuardianSurName = txtContactFirstname.Text.Trim()

                    If txtTPhone.Text.Trim.StartsWith("07") Then
                        _patient.MobilePhone = txtTPhone.Text.Trim().Replace(" ", "")
                    Else
                        _patient.WorkPhone = txtTPhone.Text.Trim().Replace(" ", "")
                    End If

                    _patient.ConsentToLeaveMessage = chkLeaveMessage.Checked.ToString

                    _patient.Save()



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
                    _referral.Stage = eReferralStage.Received
                    _referral.Save()

                    '.Save() will persistent your changes to the object but uow.CommitChanges() will save those changes back to the database

                    Dim _callback As New TrackingNote(uow)
                    _callback.Referral = _referral
                    _callback.Stage = eReferralStage.Received
                    _callback.Patient = _referral.Patient
                    _callback.NextAction = eNextActionType.ContactPatient
                    _callback.AssignedTeam = _referral.AssignedTeam
                    _callback.AssignedUser = _referral.AssignedUser
                    _callback.Date = DateTime.Now
                    _callback.NextActionDue = dtCallBack.Value
                    _callback.Text = "VitalityGP referral"
                    _callback.Save()
                    '_referral.Stage = eReferralStage.Received
                    ' _callback.CommitChanges()

                    'Final Save
                    'uow.Save(_patient)
                    'uow.Save(_referral)
                    'uow.Save(_callback)

                    lblResult.Text = "Successfully saved " & txtFirstName.Text.Trim() & " " & txtLastname.Text.Trim() & ", referral ID = " & _referral.Oid.ToString
                    lblResult.ForeColor = Drawing.Color.Green
                    'clearing textboxes and dropdown values
                    ASPxEdit.ClearEditorsInContainer(ASPxFormLayout1)
                End Using


            Catch ex As Exception

                lblResult.Text = "Save Failed"
                lblResult.ForeColor = Drawing.Color.Red
                MsgBox(ex.Message)
                'Dim sendemail As New Globals()
                'Console.WriteLine(sendemail.SendEmail("Error from Alliance.VitalityGP web site.", "Alliance.VitalityGP.Web Error", False, ex))

                '  errorMessageLabel.Visible = True
            End Try
        End If
    End Sub



    Private Sub dtCallBack_Init(sender As Object, e As EventArgs) Handles dtCallBack.Init
        'dtCallBack.Date = Now.AddHours(2)
        'dtCallBack.MinDate = Now.AddHours(2)
    End Sub


End Class
