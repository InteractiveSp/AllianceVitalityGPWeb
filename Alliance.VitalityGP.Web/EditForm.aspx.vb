Imports DevExpress.Xpo
Imports System.Web.SessionState
Imports DevExpress.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Data.Filtering
Imports Alliance.Data
Partial Class EditForm
    Inherits System.Web.UI.Page
    Dim strOid As String


    Private Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        'Dim session As Session = XpoHelper.GetNewSession()
        'XpoDataSource2.Session = session

        'Dim session As Session = XpoHelper2.GetNewSession(XpoHelper.Database.XpoWebTest)
        'XpoDataSource1.Session = session


        'Dim session As Session = XpoHelper.GetNewSession()
        'XpoDataSource1.Session = session

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' Get our membership info
        ' Dim u As MembershipUser
        ' u = Membership.GetUser(user.Identity.Name)


        '' Alternative to using bound text box to save on realestate just query xpo object with id And display referral in Referral Detail group section header
        'If CInt(Request.QueryString("id")) Then
        '    Using collection As New XPCollection(XpoDataSource1.Session, GetType(Referral))
        '        collection.Filter = CriteriaOperator.Parse("Oid = " & Request.QueryString("id"))
        '        Dim viewRef As Referral = CType(collection(0), Referral)
        '        ASPxFormLayout1.Items(3).Caption = "AS Ref " & viewRef.CreatedBy.ToString() & " Details"
        '    End Using

        'End If

        Dim session As Session = XpoHelper.GetNewSession()
        XpoDataSource1.Session = Session
        Dim _Referral As Referral
        _Referral = XpoDataSource1.Session.GetObjectByKey(Of Referral)(CInt(Request.QueryString("id")))

        cboTitle.Text = _Referral.Patient.Title.ToString()
        txtFirstName.Text = _Referral.Patient.FirstName '.ToString()
        txtLastname.Text = _Referral.Patient.SurName '.ToString()
        dtDOB.Text = _Referral.Patient.DOB '.ToShortDateString()
        cboGender.Text = _Referral.Patient.Gender
        txtPolicyNumber.Text = _Referral.PolicyNo
        ASPxFormLayout1_E1.Checked = _Referral.StaffClaim
        txtAddress1.Text = _Referral.Patient.Addr1
        txtAddress2.Text = _Referral.Patient.Addr2
        txtAddress3.Text = _Referral.Patient.Addr3
        txtCity.Text = _Referral.Patient.City
        txtCounty.Text = _Referral.Patient.County
        ' txtPostcode.Text = _Referral.Patient.PostCode
        ' txtAltContact.Text = _Referral.Patient.
        If IsDBNull(_Referral.Patient.HomePhone) And IsDBNull(_Referral.Patient.WorkPhone) Then
            txtTelephone.Text = _Referral.Patient.MobilePhone
        Else

            If IsDBNull(_Referral.Patient.HomePhone) Then
                txtTelephone.Text = _Referral.Patient.MobilePhone
            Else
                txtTelephone.Text = _Referral.Patient.WorkPhone
            End If

        End If

        'dtCallBack.Text = _Referral.Patient.

        'chkLeaveMessage.Checked = _Referral.
        ' chkThirdParty.Checked = _Referral.Patient.
        txtPresentingCondition.Text = _Referral.Details
        '  chkSelfPay.Checked = _Referral
        txtSymptoms.Text = _Referral.SymptomDetails
        spinOutPatientLimit.Text = _Referral.OutPatientLimit
        spinExcess.Text = _Referral.Excess
        ' cboGPSelect.SelectedItem.Value = _Referral.gp
        cboHospitalList.Text = _Referral.HospitalList
        txtPostalCode.Text = _Referral.Patient.PostCode
        'txtpost.Text = _Referral.Patient.PostCode
    End Sub


    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click, btnCancel.Click
        Response.Redirect("~/prevrefs.aspx")
    End Sub
End Class
