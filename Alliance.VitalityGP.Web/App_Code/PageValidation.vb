Imports Microsoft.VisualBasic
Imports DevExpress.Web
Public Class PageValidation

    ''' <summary>
    ''' Checks that the phone number is between 10 and 12 digits long and only contains numbers
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Public Function checkPhoneNumber(ByVal sender As Object, ByVal e As ValidationEventArgs) As Boolean
        Dim isValid As Boolean = False
        'Is the phone number greater then 9 characters and less then 13
        If (TryCast(e.Value, String)).Length >= 10 And (TryCast(e.Value, String)).Length <= 12 Then
            ' e.IsValid = False
            isValid = True
        Else
            Return False
        End If

        'Does the phone number only contain numbers
        If IsNumeric(e.Value.ToString.Trim()) Then
            isValid = True
        End If

        Return isValid
    End Function

    ''' <summary>
    ''' Checks whether the string isnt blank and character lengh is greater then 1
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Public Function IsItBlank(ByVal sender As Object, ByVal e As ValidationEventArgs) As Boolean
        Dim isValid As Boolean = False
        'Is the length greater then 1
        If (TryCast(e.Value, String)).Length >= 0 Then
            isValid = True
        End If

        Return isValid
    End Function

    ''' <summary>
    ''' Checks that date of birth has a valid date and is less then todays date
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Public Function checkDOB(ByVal sender As Object, ByVal e As ValidationEventArgs) As Boolean
        Dim isValid As Boolean = False
        Try
            'Is the date less then the date/time now
            If CDate(e.Value) < Now() Then
                isValid = True
            Else
                Return False
            End If
        Catch ex As Exception
            'The would happen when a valid date hasn't been entered
            Return False
        End Try

        Return isValid
    End Function

    ''' <summary>
    ''' Checks whether a string contains only letters
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Public Function checkName(ByVal sender As Object, ByVal e As ValidationEventArgs) As Boolean
        Dim isValid As Boolean = False

        If Not Regex.Match(e.Value, "^[a-z]*$", RegexOptions.IgnoreCase).Success Then 'Only Letters
            isValid = False 'Boolean = False
        Else
            isValid = True 'Everything Fine
        End If

        Return isValid
    End Function

    ''' <summary>
    ''' Checks for valid emails.  The function ensures that theres an @ symbol, no doubles quotes, 
    ''' no consecutive dots and no invalid characters such as !#$%^&*()=+{}[]|\;:'"/?>
    ''' </summary>
    ''' <param name="strEmail"></param>
    Public Function checkEmail(ByVal strEmail As String) As Boolean
        'http://www.TechKnowledgeyInc.com

        Dim bCK As Boolean
        Dim strDomainType As String
        ' Dim strDomainName As String
        Const sInvalidChars As String = "!#$%^&*()=+{}[]|\;:'/?>,< "
        Dim i As Integer

        bCK = Not InStr(1, strEmail, Chr(34)) > 0 'Check to see if there is a double quote
        If Not bCK Then GoTo ExitFunction

        bCK = Not InStr(1, strEmail, "..") > 0 'Check to see if there are consecutive dots
        If Not bCK Then GoTo ExitFunction

        ' Check for invalid characters.
        If Len(strEmail) > Len(sInvalidChars) Then
            For i = 1 To Len(sInvalidChars)
                If InStr(strEmail, Mid(sInvalidChars, i, 1)) > 0 Then
                    bCK = False
                    GoTo ExitFunction
                End If
            Next
        Else
            For i = 1 To Len(strEmail)
                If InStr(sInvalidChars, Mid(strEmail, i, 1)) > 0 Then
                    bCK = False
                    GoTo ExitFunction
                End If
            Next
        End If

        If InStr(1, strEmail, "@") > 1 Then 'Check for an @ symbol
            bCK = Len(Left(strEmail, InStr(1, strEmail, "@") - 1)) > 0
        Else
            bCK = False
        End If
        If Not bCK Then GoTo ExitFunction

        strEmail = Right(strEmail, Len(strEmail) - InStr(1, strEmail, "@"))
        bCK = Not InStr(1, strEmail, "@") > 0 'Check to see if there are too many @'s
        If Not bCK Then GoTo ExitFunction

        strDomainType = Right(strEmail, Len(strEmail) - InStr(1, strEmail, "."))
        bCK = Len(strDomainType) > 0 And InStr(1, strEmail, ".") < Len(strEmail)
        If Not bCK Then GoTo ExitFunction

        strEmail = Left(strEmail, Len(strEmail) - Len(strDomainType) - 1)
        Do Until InStr(1, strEmail, ".") <= 1
            If Len(strEmail) >= InStr(1, strEmail, ".") Then
                strEmail = Left(strEmail, Len(strEmail) - (InStr(1, strEmail, ".") - 1))
            Else
                bCK = False
                GoTo ExitFunction
            End If
        Loop
        If strEmail = "." Or Len(strEmail) = 0 Then bCK = False

ExitFunction:
        Return bCK
    End Function


End Class
