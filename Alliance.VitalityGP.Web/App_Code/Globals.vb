
Imports DevExpress.Xpo


Public Class Globals
    ''' <summary>
    ''' Sends emails using .Net functionality.  You can also pass exceptions into this function you want to include error details to the email.
    ''' </summary>
    ''' <param name="EmailBody"></param>
    ''' <param name="EmailSubject"></param>
    ''' <param name="SendAsHTML"></param>
    ''' <param name="IncludeErrorDetails"></param>
    Public Function SendEmail(ByVal EmailBody As String, ByVal EmailSubject As String, ByVal SendAsHTML As Boolean, Optional ByVal IncludeErrorDetails As Exception = Nothing) As String
        SendEmail = "Email sent successfully"

        Try
            Dim objMail As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage
            objMail.Sender = New Net.Mail.MailAddress(System.Configuration.ConfigurationManager.AppSettings("emailSendEmailFrom"))
            objMail.From = New Net.Mail.MailAddress(System.Configuration.ConfigurationManager.AppSettings("emailSendEmailFrom"))
            objMail.To.Add(New System.Net.Mail.MailAddress(System.Configuration.ConfigurationManager.AppSettings("emailSendEmailTo")))

            objMail.Subject = EmailSubject
            If IncludeErrorDetails Is Nothing Then
                objMail.Body = EmailBody & "."
            Else

                objMail.Body = EmailBody _
                   & Environment.NewLine & Environment.NewLine & "Error: " & IncludeErrorDetails.Message.ToString() _
                   & Environment.NewLine & Environment.NewLine & "Stack Trace: " & IncludeErrorDetails.StackTrace.ToString() _
                   & Environment.NewLine & Environment.NewLine & "The application generating this email is running on: " & System.Net.Dns.GetHostName.ToString() & "."
            End If

            objMail.IsBodyHtml = SendAsHTML
            Dim emailUsername As String
            Dim emailPassword As String
            Dim emailHost As String
            emailHost = System.Configuration.ConfigurationManager.AppSettings("emailHost")
            emailUsername = System.Configuration.ConfigurationManager.AppSettings("emailUsername")
            emailPassword = System.Configuration.ConfigurationManager.AppSettings("emailPassword")
            Dim objSMTP As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient
            objSMTP.Port = System.Configuration.ConfigurationManager.AppSettings("emailPort")
            objSMTP.Host = emailHost
            Dim objCredentials As System.Net.NetworkCredential = New System.Net.NetworkCredential(emailUsername, emailPassword, emailHost)
            objSMTP.UseDefaultCredentials = True
            ' objSMTP.EnableSsl = Convert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings("emailEnableSSL"))
            objSMTP.Credentials = objCredentials
            objCredentials = Nothing
            objSMTP.Send(objMail)
            objSMTP = Nothing
            objMail.Dispose()
            objMail = Nothing

        Catch ex As Exception
            SendEmail = ex.Message.ToString() & Environment.NewLine & ex.StackTrace.ToString()
        End Try
    End Function


    ''' <summary>
    ''' Populates an XPCollection with values from the Title table where the values are ordered by the DisplayOrder Field in aescending order
    ''' </summary>
    ''' <param name="_session"></param>
    Public Function GetTitles(_session As Session) As XPCollection(Of Alliance.Data.Title)
        Dim collection As New XPCollection(Of Alliance.Data.Title)(_session, Nothing, New SortProperty("DisplayOrder", DevExpress.Xpo.DB.SortingDirection.Ascending))
        Return collection
    End Function
End Class
