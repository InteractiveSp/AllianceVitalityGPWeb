Imports DevExpress.Web
Imports System.IO

Public Class MainMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        'Page.DataBind()
        'ASPxNavBar1.Groups.Clear()
        'Dim pageName As String = Path.GetFileNameWithoutExtension(HttpContext.Current.Request.Url.AbsolutePath)
        'Select Case pageName
        '    Case "Default", "default"
        '        Dim group1 As New NavBarGroup()
        '        group1.Text = "Referrals"
        '        group1.Items.Add("Current Referrals")
        '        ASPxNavBar1.Groups.Add(group1)
        '        Exit Select
        '    Case "Beneficaries"
        '        Dim group2 As New NavBarGroup()
        '        group2.Text = "Beneficaries"
        '        group2.Items.Add("Beneficary List")
        '        ASPxNavBar1.Groups.Add(group2)
        '        Exit Select
        '    Case Else
        '        'Dim group As New NavBarGroup()
        '        'group.Text = "Home"
        '        'group.Items.Add("Home 1")
        '        'group.Items.Add("Home 2")
        '        'ASPxNavBar1.Groups.Add(group)
        '        Exit Select
        'End Select

    End Sub


End Class