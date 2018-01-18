Imports System
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports MTFS.BL

Imports Owin
Public Class test
    Inherits System.Web.UI.Page
    Private vpo_Acceso As oCls_acceso
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        vpo_Acceso = New oCls_acceso
        Dim vpo_dt_Usuario As DataTable
        vpo_dt_Usuario = vpo_Acceso.fgo_ObtenerListadoUsuario
        GridView1.DataSource = vpo_dt_Usuario
        GridView1.DataBind()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

    End Sub
End Class