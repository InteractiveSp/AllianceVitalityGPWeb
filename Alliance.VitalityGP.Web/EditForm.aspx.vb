Imports DevExpress.Xpo
Imports System.Web.SessionState
Imports DevExpress.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Data.Filtering
Imports Alliance.Data
Partial Class EditForm
    Inherits System.Web.UI.Page


    ''' <summary>
    ''' Populates the fields with values from the database based on referral ID pulled from the querystring 
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim session As Session = XpoHelper.GetNewSession()
        XpoDataSource1.Session = session
        Dim _Referral As Referral
        _Referral = XpoDataSource1.Session.GetObjectByKey(Of Referral)(CInt(Request.QueryString("id")))

        cboTitle.Text = _Referral.Patient.Title.ToString()
        txtFirstName.Text = _Referral.Patient.FirstName '.ToString()
        txtLastname.Text = _Referral.Patient.SurName '.ToString()
        dtDOB.Text = _Referral.Patient.DOB '.ToShortDateString()
        cboGender.Text = _Referral.Patient.Gender
        txtPolicyNumber.Text = _Referral.PolicyNo
        chkStaffClaim.Checked = _Referral.StaffClaim
        txtAddress1.Text = _Referral.Patient.Addr1
        txtAddress2.Text = _Referral.Patient.Addr2
        txtAddress3.Text = _Referral.Patient.Addr3
        txtCity.Text = _Referral.Patient.City
        txtCounty.Text = _Referral.Patient.County
        ' txtPostcode.Text = _Referral.Patient.PostCode
        ' txtAltContact.Text = _Referral.Patient.
        If IsDBNull(_Referral.Patient.HomePhone) And IsDBNull(_Referral.Patient.WorkPhone) Then

            txtTPhone.Text = _Referral.Patient.MobilePhone
        Else

            If IsDBNull(_Referral.Patient.HomePhone) Then
                txtTPhone.Text = _Referral.Patient.MobilePhone
            Else
                txtTPhone.Text = _Referral.Patient.WorkPhone
            End If

        End If

        'dtCallBack.Text = _Referral.Patient.

        'chkLeaveMessage.Checked = _Referral.
        ' chkThirdParty.Checked = _Referral.Patient.
        txtPresentingCondition.Text = _Referral.SpecialInstructions
        cboContactTitle.Text = _Referral.Patient.GuardianTitle
        txtContactFirstname.Text = _Referral.Patient.GuardianFirstName
        txtContactLastname.Text = _Referral.Patient.GuardianSurName
        '  chkSelfPay.Checked = _Referral
        txtSymptoms.Text = _Referral.Details
        spinOutPatientLimit.Text = _Referral.OutPatientLimit
        spinExcess.Text = _Referral.Excess
        ' cboGPSelect.SelectedItem.Value = _Referral.gp
        cboHospitalList.Text = _Referral.HospitalList
        txtPostcode.Text = _Referral.Patient.PostCode
        'txtpost.Text = _Referral.Patient.PostCode
    End Sub


    ''' <summary>
    ''' Redirects user to the prevrefs page
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click, btnCancel.Click
        Response.Redirect("~/prevrefs.aspx")
    End Sub
End Class
