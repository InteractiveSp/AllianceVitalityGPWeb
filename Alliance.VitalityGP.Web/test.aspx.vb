Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports DevExpress.Web.Internal
Imports DevExpress.Web
Imports Alliance.Data
Imports DevExpress.Data.Filtering
Imports DevExpress.Xpo
Imports DevExpress.Xpo.Metadata

Partial Class test
    Inherits System.Web.UI.Page

    'Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
    '    Response.Write("sdfdsf")
    'End Sub
    Private Sub test_Init(sender As Object, e As EventArgs) Handles Me.Init

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

    Protected Sub NameTextBox_Validation(ByVal sender As Object, ByVal e As ValidationEventArgs)
        If (TryCast(e.Value, String)).Length < 4 Then
            e.IsValid = False
        End If
    End Sub

    Private Sub dtCallBack_Init(sender As Object, e As EventArgs) Handles dtCallBack.Init
        dtCallBack.Date = Now.AddHours(2)
        dtCallBack.MinDate = Now.AddHours(2)
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

    End Sub
End Class
