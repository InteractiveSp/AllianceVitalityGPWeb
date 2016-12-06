Imports Microsoft.VisualBasic

Public Class PageValidation



    Public Property FirstName() As String
        Get
            Return m_FirstName
        End Get
        Set(ByVal value As String)
            m_FirstName = value
        End Set
    End Property
    Private m_FirstName As String


    Public Property SurName() As String
        Get
            Return m_SurName
        End Get
        Set(ByVal value As String)
            m_SurName = value
        End Set
    End Property
    Private m_SurName As String

    Public Property Email() As String
        Get
            Return m_Email
        End Get
        Set(ByVal value As String)
            m_Email = value
        End Set
    End Property
    Private m_Email As String
End Class
