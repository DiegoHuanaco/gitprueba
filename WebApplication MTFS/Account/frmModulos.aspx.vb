Imports System
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports MTFS.BL

Imports Owin
Public Class frmModulos
    Inherits System.Web.UI.Page
    Private WithEvents vpo_Modulos As oCls_acceso
    Private WithEvents vpo_Acceso As oCls_acceso
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            vpo_Acceso = New oCls_acceso
            Dim vpo_dt_Modulos As DataTable
            vpo_dt_Modulos = vpo_Acceso.fgo_obtenerListadoModulos
            oCv_DdlGrupoModulo.DataSource = vpo_dt_Modulos
            oCv_DdlGrupoModulo.DataValueField = "Id_Modulo"
            oCv_DdlGrupoModulo.DataTextField = "Nombre_Modulo"

            oCv_DdlGrupoModulo.DataBind()

            mpn_MostrarGrillaModulo()
        End If

    End Sub
    Private Sub mpn_limpiaModulo()
        Me.otx_NombreModulo.Text = ""
        Me.otx_RutaModulo.Text = ""
        'Me.oCv_DdlGrupoModulo.SelectedValue = -1
        'Me.oCv_DdlEstadoModulo.SelectedValue = -1
        'Me.oCv_DdlTipoModulo.SelectedValue = -1
        Me.oTx_indice.Text = ""
    End Sub
    Private Sub mpn_MostrarGrillaModulo()
        vpo_Modulos = New oCls_acceso
        Dim vpo_dt_Modulo As DataTable
        vpo_dt_Modulo = vpo_Modulos.fgo_obtenerListadoModulos
        GridView1.DataSource = vpo_dt_Modulo
        GridView1.DataBind()
    End Sub

    'Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
    '    vpo_Acceso = New oCls_acceso
    '    vpo_Acceso.mgn_AgregaModulo(TextBox1.Text, TextBox8.Text, 1, True, 1, Conversion.Int(TextBox2.Text))
    'End Sub

    Protected Sub obn_GuardaModulo_Click(sender As Object, e As EventArgs) Handles obn_GuardaModulo.Click
        vpo_Acceso = New oCls_acceso
        vpo_Acceso.mgn_AgregaModulo(otx_NombreModulo.Text, otx_RutaModulo.Text, oCv_DdlGrupoModulo.Text, oCv_DdlEstadoModulo.SelectedValue, oCv_DdlTipoModulo.SelectedValue, oTx_indice.Text)
        mpn_MostrarGrillaModulo()
        mpn_limpiaModulo()
    End Sub

    Protected Sub obn_EliminarModulo_Click(sender As Object, e As EventArgs) Handles obn_EliminarModulo.Click
        mpn_limpiaModulo()
    End Sub

    Protected Sub obn_LimpiarModulo_Click(sender As Object, e As EventArgs) Handles obn_LimpiarModulo.Click
        mpn_limpiaModulo()
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If (e.CommandName = "Select") Then
            'mpn_BuscaYMuestraRolXID_Rol(Conversion.Int(GridView1.Rows(Conversion.Int(e.CommandArgument)).Cells(1).Text))
            mpn_BuscaYMuestraModuloXID(Conversion.Int(GridView1.Rows(Conversion.Int(e.CommandArgument)).Cells(1).Text))

        End If
    End Sub
    Private Sub mpn_BuscaYMuestraModuloXID(ByVal pvs_Id_Modulo As String)
        Dim vlo_Dt_Modulo As New Data.DataTable

        'Instancia de objeto
        vpo_Acceso = New oCls_acceso
        'Obtención de cliente por R.U.T.
        vlo_Dt_Modulo = vpo_Acceso.fgo_BuscaModuloXId(Trim(pvs_Id_Modulo))

        'Verificación de existencia de cliente
        If vlo_Dt_Modulo IsNot Nothing Then
            If vlo_Dt_Modulo.Rows.Count > 0 Then

                Me.oHf_IdModulo.Value = vlo_Dt_Modulo.Rows(0).Item("Id_Modulo").ToString
                Me.otx_NombreModulo.Text = vlo_Dt_Modulo.Rows(0).Item("Nombre_Modulo").ToString
                Me.otx_RutaModulo.Text = vlo_Dt_Modulo.Rows(0).Item("Ruta_Modulo").ToString
                If CBool(vlo_Dt_Modulo.Rows(0).Item("Estado_Modulo").ToString) = True Then
                    Me.oCv_DdlEstadoModulo.SelectedValue = 1
                Else
                    Me.oCv_DdlEstadoModulo.SelectedValue = 0
                End If


                Me.oCv_DdlGrupoModulo.SelectedValue = Conversion.Int(vlo_Dt_Modulo.Rows(0).Item("Grupo_Modulo").ToString)

                Me.oCv_DdlTipoModulo.SelectedValue = Conversion.Int(vlo_Dt_Modulo.Rows(0).Item("Tipo_Modulo").ToString)
                Me.oTx_indice.Text = vlo_Dt_Modulo.Rows(0).Item("Indice_Modulo").ToString

            Else

                End If
        End If

        'Actualiza UpdatePanel principal
        '    Me.oULa_Principal.Update()

    End Sub
End Class