Imports Alliance.Data

Public Class RootMaster
    Inherits System.Web.UI.MasterPage


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim _session = XpoHelper.GetNewSession()
            Dim user As MembershipUser = Membership.GetUser()

            ' Dim _clientstaff As ClientStaff = _session.GetObjectByKey(Of ClientStaff)(user.ProviderUserKey)
            ' Dim _client As Client = _session.GetObjectByKey(Of Client)(_clientstaff.Client.Oid)
            ' TitleLink.InnerText = "Alliance Surgical Corporate Health (" + _client.FullName + ")"


        Else
            'test storing sessions vars here
            ' defaultFormValidation.FirstName = Page.Session("FirstName")
        End If

    End Sub

End Class