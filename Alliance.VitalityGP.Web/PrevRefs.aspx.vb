Imports DevExpress.Xpo
Imports Alliance.Data
Imports DevExpress.Data.Filtering

Partial Class PrevRefs
    Inherits System.Web.UI.Page
    Private Sub PrevRefs_Init(sender As Object, e As EventArgs) Handles Me.Init
        'Dim session As Session = XpoHelper.GetNewSession()
        'XpoDataSource2.Session = session


        'Dim session As Session = XpoHelper.GetNewSession()
        'XpoDataSource1.Session = session


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' MsgBox("Current user logged in is" & HttpContext.Current.User.Identity.Name.ToString)

        Dim session As Session = XpoHelper.GetNewSession()
        XpoDataSource1.Session = session


        Dim u As MembershipUser
        u = Membership.GetUser(User.Identity.Name)
        XpoDataSource1.Criteria = "[CreatedBy]= " & u.ProviderUserKey.ToString


        'Dim _referral As Referral = session.GetObjectByKey(Of Referral)(u.ProviderUserKey)

        Dim _referralView As XPView = New XPView(XpoDataSource1.Session, GetType(Referral))
        _referralView.AddProperty("Oid", "Oid")
        _referralView.AddProperty("Source", "Source")
        _referralView.AddProperty("Title", "Patient.Title")
        _referralView.AddProperty("FirstName", "Patient.FirstName")
        _referralView.AddProperty("Surname", "Patient.SurName")
        _referralView.AddProperty("DOB", "Patient.DOB")
        _referralView.AddProperty("PostCode", "PostCode")
        ' _referralView.AddProperty("DOB", "Patient.DOB")
        _referralView.AddProperty("TertiaryReferral", "TertiaryReferral")
        _referralView.AddProperty("Insurer", "Insurer")
        _referralView.AddProperty("InsurerAgent", "InsurerAgent")
        _referralView.AddProperty("Patient", "Patient")
        _referralView.AddProperty("Client", "Client")
        _referralView.AddProperty("Claim", "Claim")
        _referralView.AddProperty("Opportunityid", "Opportunityid")
        _referralView.AddProperty("ReferralDate", "ReferralDate")
        _referralView.AddProperty("AuthorisationNo", "AuthorisationNo")
        _referralView.AddProperty("MembershipNo", "MembershipNo")
        _referralView.AddProperty("PolicyNo", "PolicyNo")
        _referralView.AddProperty("System", "System")
        _referralView.AddProperty("ReferralType", "ReferralType")
        _referralView.AddProperty("ReferralCategory", "ReferralCategory")
        _referralView.AddProperty("F2FPractice", "F2FPractice")
        _referralView.AddProperty("HospitalList", "HospitalList")
        _referralView.AddProperty("NamedConsultant", "NamedConsultant")
        _referralView.AddProperty("Excess", "Excess")
        _referralView.AddProperty("ExcessRemaining", "ExcessRemaining")
        _referralView.AddProperty("OutPatientFull", "OutPatientFull")
        _referralView.AddProperty("OutPatientLimit", "OutPatientLimit")
        _referralView.AddProperty("OutPatientLimitRemaining", "OutPatientLimitRemaining")
        _referralView.AddProperty("StaffClaim", "StaffClaim")
        _referralView.AddProperty("PolicyRenewalDate", "PolicyRenewalDate")
        _referralView.AddProperty("Symptom", "Symptom")
        _referralView.AddProperty("SymptomDetails", "SymptomDetails")
        _referralView.AddProperty("Details", "Details")
        _referralView.AddProperty("NewProcess", "NewProcess")
        _referralView.AddProperty("Triaged", "Triaged")
        _referralView.AddProperty("ComplexTriage", "ComplexTriage")
        _referralView.AddProperty("ConsultantTaffed", "ConsultantTaffed")
        _referralView.AddProperty("PatientTaffed", "PatientTaffed")
        _referralView.AddProperty("DatePatientTaffed", "DatePatientTaffed")
        ' _referralView.AddProperty("isTaffed", "isTaffed")
        ' _referralView.AddProperty("IsBooked", "IsBooked")
        _referralView.AddProperty("BookedBy", "BookedBy")
        _referralView.AddProperty("BookedDate", "BookedDate")
        _referralView.AddProperty("CCardAuthorised", "CCardAuthorised")
        _referralView.AddProperty("CardFirstPayment", "CardFirstPayment")
        _referralView.AddProperty("Triageconsultant", "Triageconsultant")
        _referralView.AddProperty("HCAAvoided", "HCAAvoided")
        _referralView.AddProperty("SpecialInstructions", "SpecialInstructions")
        _referralView.AddProperty("PCASource", "PCASource")
        _referralView.AddProperty("AssignedTeam", "AssignedTeam")
        _referralView.AddProperty("AssignedUser", "AssignedUser")
        _referralView.AddProperty("SeenGP", "SeenGP")
        _referralView.AddProperty("CreatedBy", "CreatedBy")
        ' _referralView.AddProperty("Patient", "Patient.FirstName + ' ' + Patient.SurName")

        _referralView.AddProperty("Specialism", "Specialism")
        _referralView.AddProperty("Consultant", "Consultant")
        _referralView.AddProperty("Hospital", "Hospital")
        _referralView.AddProperty("FirstConsultation", "FirstConsultation")

        _referralView.AddProperty("Latitude", "Latitude")
        _referralView.AddProperty("Longitude", "Longitude")
        _referralView.AddProperty("Distance", "Distance")
        _referralView.AddProperty("DischargeDate", "DischargeDate")
        _referralView.AddProperty("InvoicedValue", "InvoicedValue")
        _referralView.AddProperty("ConsultantValue", "ConsultantValue")

        ' _referralView.AddProperty("Description", "Description")

        _referralView.AddProperty("CreatedAt", "CreatedAt")
        _referralView.Criteria = CriteriaOperator.Parse("CreatedBy = ? ", u.ProviderUserKey.ToString)


        ASPxGridView1.DataSource = _referralView
        ASPxGridView1.DataBind()

    End Sub

    Protected Sub ASPxGridView1_CustomColumnDisplayText(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs) Handles ASPxGridView1.CustomColumnDisplayText

        'display true false strings (CRM compatibility) to y and no or checked
        If e.Column.FieldName = "ConsentThirdParty" Or e.Column.FieldName = "LeaveMessage" Then
            If Convert.ToBoolean(e.Value) = True Then
                e.DisplayText = "Y"
            ElseIf Convert.ToBoolean(e.Value) = False Then
                e.DisplayText = "N"

            End If
        End If

        If e.Column.FieldName = "DOB" Then
            If IsDate(e.Value) Then
                e.DisplayText = FormatDateTime(e.Value, DateFormat.ShortDate)
            End If
        End If

    End Sub
End Class
