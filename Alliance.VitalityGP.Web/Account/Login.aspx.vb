Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web
Imports System.Web.Security
Imports Alliance.Data

Partial Class Account_Login
    Inherits System.Web.UI.Page
    ' Shadows _session As DevExpress.Xpo.Session

    Protected Sub login_LoginError(ByVal sender As Object, ByVal e As EventArgs)
        ' Define the name and type of the client scripts on the page.
        Dim csErrorRowName As String = "errorRowScript"
        Dim cstype As Type = Me.GetType()

        ' Get a ClientScriptManager reference from the Page class.
        Dim cs As ClientScriptManager = Page.ClientScript

        ' Check to see if the startup script is already registered.
        If (Not cs.IsStartupScriptRegistered(cstype, csErrorRowName)) Then
            cs.RegisterStartupScript(cstype, csErrorRowName, "document.getElementById(""errorRow"").style.display=""block"";", True)
        End If
    End Sub

    Protected Sub Login1_Init(sender As Object, e As EventArgs) Handles Login1.Init
        If Environment.MachineName = "Alliance-RS" Then
            LoginDetails1.Visible = True
        End If
        'LoginDetails1.DataBind()

    End Sub


    Protected Sub Login1_LoggedIn(sender As Object, e As EventArgs) Handles Login1.LoggedIn
        '_session = XpoHelper.GetNewSession()
        'Dim user As MembershipUser = Membership.GetUser()
        'Dim _Beneficiary As Beneficiary

        '_Beneficiary = _session.GetObjectByKey(Of Beneficiary)(user.ProviderUserKey)
        'If _Beneficiary.Client.Oid = 120 Then
        '    Response.Redirect("../MITIE/Mitie.aspx")
        'Else

        'End If


    End Sub


    Protected Sub LoginButton_Click(sender As Object, e As EventArgs)

    End Sub
End Class
