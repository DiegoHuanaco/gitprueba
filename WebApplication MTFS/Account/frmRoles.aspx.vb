Imports System
Imports System.Linq
Imports System.Threading
Imports System.Timers
Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports MTFS.BL
'Imports System.Threading.Tasks

Imports Owin
Public Class frmRoles
    Inherits System.Web.UI.Page
#Region "Variables"
    Private WithEvents vpo_BLAcceso As oCls_acceso


#End Region
    Private vpo_Acceso As oCls_acceso
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        mpn_MostrarGrilla()



    End Sub

    ''' <summary>
    ''' Procedimiento que muesra la grilla listado de Roles
    ''' </summary>
    Private Sub mpn_MostrarGrilla()
        vpo_Acceso = New oCls_acceso
        Dim vpo_dt_roles As DataTable
        vpo_dt_roles = vpo_Acceso.fgo_ObtenerListadoRoles
        GridView1.DataSource = vpo_dt_roles
        GridView1.DataBind()
    End Sub
    Private Sub mpn_Limpiaformuario()
        Me.TextBox1.Text = ""
        Me.TextBox8.Text = ""
        Me.oCv_DdlEstadoRol.SelectedValue = -1
        Me.msjRoles.Text = ""
        Me.msjRoles.CssClass = ""
    End Sub
    ''' <summary>
    ''' Metodo que realiza un busqueda por el parametro identificador unico Id_Rol
    ''' </summary>
    ''' <param name="pvs_IdRol"></param>
    Private Sub mpn_BuscaYMuestraRolXID_Rol(ByVal pvs_IdRol As String)
        Dim vlo_InfoCliente As New Data.DataTable

        'Instancia de objeto
        vpo_BLAcceso = New oCls_acceso
        'Obtención de cliente por R.U.T.
        vlo_InfoCliente = vpo_BLAcceso.fgo_BuscaRolesXIdRol(Trim(pvs_IdRol))

        'Verificación de existencia de cliente
        If vlo_InfoCliente IsNot Nothing Then
            If vlo_InfoCliente.Rows.Count > 0 Then
                'Asignación de datos del cliente al formulario
                Me.oHf_IdRol.Value = vlo_InfoCliente.Rows(0).Item("Id_Rol").ToString
                Me.TextBox1.Text = vlo_InfoCliente.Rows(0).Item("Nombre_Rol").ToString
                Me.TextBox8.Text = vlo_InfoCliente.Rows(0).Item("Descripcion_Rol").ToString
                If CBool(vlo_InfoCliente.Rows(0).Item("Estado_Rol").ToString) = True Then
                    Me.oCv_DdlEstadoRol.SelectedValue = 1
                ElseIf CBool(vlo_InfoCliente.Rows(0).Item("Estado_Rol").ToString) = False Then
                    Me.oCv_DdlEstadoRol.SelectedValue = 0

                End If


            End If
        End If


    End Sub

    ''' <summary>
    ''' Boton que permite seleccionar un registro de la grilla con listado de los roles
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If (e.CommandName = "Select") Then
            mpn_BuscaYMuestraRolXID_Rol(Conversion.Int(GridView1.Rows(Conversion.Int(e.CommandArgument)).Cells(1).Text))

        End If

    End Sub

    ''' <summary>
    ''' Procedimiento que permite guardar registros de roles
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub obn_GuardaRol_Click(sender As Object, e As EventArgs) Handles obn_GuardaRol.Click
        'Dim aTimer As System.Timers.Timer
        Try
            vpo_Acceso = New oCls_acceso
            If (Me.oHf_IdRol.Value = "") Then
                vpo_Acceso.mgn_AgregarRol(Me.TextBox1.Text, Me.TextBox8.Text, Me.oCv_DdlEstadoRol.SelectedValue)
            Else
                vpo_Acceso.mun_ActualizaRol(Me.TextBox1.Text, Me.TextBox8.Text, Me.oCv_DdlEstadoRol.SelectedValue, Me.oHf_IdRol.Value)

            End If


            mpn_MostrarGrilla()
            mpn_Limpiaformuario()

        Catch ex As Exception

        End Try
    End Sub

    ''' <summary>
    ''' Boton eliminar: activa Procedimiento que permite eleminar un registro Rol por medio de una id_rol
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub obn_EliminarRol_Click(sender As Object, e As EventArgs) Handles obn_EliminarRol.Click
        vpo_Acceso = New oCls_acceso
        If (oHf_IdRol.Value <> "") Then
            vpo_Acceso = New oCls_acceso
            vpo_Acceso.mdn_EliminaAcceso(Conversion.Int(oHf_IdRol.Value))

            mpn_MostrarGrilla()
            mpn_Limpiaformuario()
        End If
    End Sub
    ''' <summary>
    ''' Boton Limpiar: activa procedimiento que resetea y limpia las cajas de texto del formulario de ingreso de roles
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub obn_LimpiarRol_Click(sender As Object, e As EventArgs) Handles obn_LimpiarRol.Click
        mpn_Limpiaformuario()
    End Sub
End Class