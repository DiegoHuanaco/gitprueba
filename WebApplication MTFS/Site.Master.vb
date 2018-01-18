Imports Microsoft.AspNet.Identity
Imports MTFS.BL
Public Class SiteMaster
    Inherits MasterPage
    Private Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
    Private Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
    Private _antiXsrfTokenValue As String
    Private vpo_Acceso As oCls_acceso
    Public vps_Menu As String

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        ' El código siguiente ayuda a proteger frente a ataques XSRF
        Dim requestCookie = Request.Cookies(AntiXsrfTokenKey)
        Dim requestCookieGuidValue As Guid

        'ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "show", "$(function () { $('#" + Panel1.ClientID + "').modal('show'); });", True);
        'UpdatePanel2.Update();

        If requestCookie IsNot Nothing AndAlso Guid.TryParse(requestCookie.Value, requestCookieGuidValue) Then
            ' Utilizar el token Anti-XSRF de la cookie
            _antiXsrfTokenValue = requestCookie.Value
            Page.ViewStateUserKey = _antiXsrfTokenValue
        Else
            ' Generar un nuevo token Anti-XSRF y guardarlo en la cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N")
            Page.ViewStateUserKey = _antiXsrfTokenValue

            Dim responseCookie = New HttpCookie(AntiXsrfTokenKey) With { _
                 .HttpOnly = True, _
                 .Value = _antiXsrfTokenValue _
            }
            If FormsAuthentication.RequireSSL AndAlso Request.IsSecureConnection Then
                responseCookie.Secure = True
            End If
            Response.Cookies.[Set](responseCookie)
        End If
        'mpn_CrearMenuSistema2()
        AddHandler Page.PreLoad, AddressOf master_Page_PreLoad
    End Sub

    Protected Sub master_Page_PreLoad(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            ' Establecer token Anti-XSRF
            ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey
            ViewState(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, [String].Empty)
        Else
            ' Validar el token Anti-XSRF
            If DirectCast(ViewState(AntiXsrfTokenKey), String) <> _antiXsrfTokenValue OrElse DirectCast(ViewState(AntiXsrfUserNameKey), String) <> (If(Context.User.Identity.Name, [String].Empty)) Then
                Throw New InvalidOperationException("Error de validación del token Anti-XSRF.")
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Unnamed_LoggingOut(sender As Object, e As LoginCancelEventArgs)
        Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie)
    End Sub
    'Private Sub mpn_CrearMenuSistema2()
    '    Try
    '        Session("Id_Usuario") = 30
    '        Dim nodohijo As String
    '        Dim vlo_dr_modulos As New Data.DataTable
    '        Dim vlo_dr_grupo_modulos As New Data.DataTable
    '        vpo_Acceso = New oCls_acceso

    '        vlo_dr_grupo_modulos = vpo_Acceso.fpn_LlenarGrupoModulo(Session("Id_Usuario"))


    '        For i = 0 To vlo_dr_grupo_modulos.Rows.Count - 1

    '            'CREO LOS NODOS PRINCIPALES
    '            vps_Menu += "<h1>" + vlo_dr_grupo_modulos(i)("Nombre_Modulo") + "</h1>"
    '            vps_Menu += "<ul class=""toggle"">"

    '            vlo_dr_modulos = vpo_Acceso.fpn_LlenarGrupoModuloViewHijos(CInt(vlo_dr_grupo_modulos(i)("id_modulo")), Session("Id_Usuario"))

    '            For j = 0 To vlo_dr_modulos.Rows.Count - 1
    '                'CREO LOS NODOS HIJOS
    '                nodohijo = vlo_dr_modulos(j)("Ruta_Modulo")
    '                vps_Menu += "<li class=""icn_new_article"" id=" + vlo_dr_modulos(j)("Ruta_Modulo") + "><a href=""#"" onclick=""CargarIframe('" + vlo_dr_modulos(j)("Ruta_Modulo") + "')"";>" + vlo_dr_modulos(j)("Nombre_Modulo") + "</a></li>"
    '            Next
    '            vps_Menu += "</ul>"
    '        Next

    '        vps_Menu += "<ul>"
    '        'vps_Menu += "<li class=""icn_security"" id=""links""><a href=""#"" onclick=""CargarIframe('../Acceso/ActualizarUsuario.aspx')"";> Actualizar Datos Usuario </a></li>"
    '        vps_Menu += "</ul>"

    '        oDiv_Menu.InnerHtml = vps_Menu

    '    Catch

    '    End Try

    'End Sub

End Class