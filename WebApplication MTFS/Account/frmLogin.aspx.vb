Imports System.Linq
Imports System.Threading
Imports System.Timers
Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports MTFS.BL


Imports Owin
Public Class frmLogin
    Inherits System.Web.UI.Page
#Region "Variables"
    Private WithEvents vpo_BLAcceso As oCls_acceso


#End Region
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            'Dim usuario As String
            'Dim dominio As String

            'usuario = Environment.UserName
            'dominio = Environment.UserDomainName

            Try

                ''Vacia las variables de session
                'Session("Id_Usuario") = ""
                'Session("Id_Rol") = ""
                'Session("Nombre_Usuario") = ""
                'oTx_Usuario.Focus()


            Catch

            End Try

        End If

    End Sub
    Private Sub mpn_BuscaYMuestraUsuarioXID_Rol(ByVal pvs_Usuario As String, ByVal pvs_Pass As String)
        vpo_BLAcceso = New oCls_acceso
        Dim vpo_dt_Usuario As New Data.DataTable
        vpo_dt_Usuario = vpo_BLAcceso.fgo_BuscaUsuarioxPassyUsuario(Trim(pvs_Usuario), Trim(pvs_Pass))

        If vpo_dt_Usuario IsNot Nothing Then
            If vpo_dt_Usuario.Rows.Count > 0 Then
                MsgBox("logueado")
            Else
                MsgBox("No logueado")
            End If
        Else
            MsgBox("error")

        End If



    End Sub
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        mpn_BuscaYMuestraUsuarioXID_Rol(txtusuario.Text, txtcontrasena.Text)
    End Sub
End Class