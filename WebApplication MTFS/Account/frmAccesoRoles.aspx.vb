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
Public Class frmAccesoRoles
    Inherits System.Web.UI.Page
#Region "Variables"
    Private WithEvents vpo_BLAcceso As oCls_acceso


#End Region
    Private vpo_Acceso As oCls_acceso
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mpn_ListadoRoles()
            mpn_listadoModulos()
            '  mpn_MostrarGrilla()

            mpn_MostrarGrillaAccesoRolModulo()
        End If



    End Sub
    Private Sub mpn_ListadoRoles()
        vpo_Acceso = New oCls_acceso
        Dim vpo_dt_roles As DataTable
        vpo_dt_roles = vpo_Acceso.fgo_ObtenerListadoRoles()
        DropDownList1.DataSource = vpo_dt_roles
        DropDownList1.DataValueField = "Id_Rol"
        DropDownList1.DataTextField = "Nombre_Rol"

        DropDownList1.DataBind()
    End Sub
    Private Sub mpn_listadoModulos()
        vpo_Acceso = New oCls_acceso
        Dim vpo_dt_roles As DataTable
        vpo_dt_roles = vpo_Acceso.fgo_obtenerListadoModulos
        DropDownList2.DataSource = vpo_dt_roles
        DropDownList2.DataValueField = "Id_Modulo"
        DropDownList2.DataTextField = "Nombre_Modulo"

        DropDownList2.DataBind()
    End Sub
    ''' <summary>
    ''' Procedimiento que muesra la grilla listado de Roles
    ''' </summary>
    Private Sub mpn_MostrarGrillaAccesoRolModulo()
        If (DropDownList1.Text <> "" And DropDownList2.Text <> "") Then
            vpo_Acceso = New oCls_acceso
            Dim vpo_dt_AccesoRolModulo As DataTable
            vpo_dt_AccesoRolModulo = vpo_Acceso.fgo_BuscaAccesoRoles(DropDownList1.Text, DropDownList2.Text)
            oGv_ListadoAccesoRol.DataSource = vpo_dt_AccesoRolModulo
            oGv_ListadoAccesoRol.DataBind()
        End If

    End Sub
    Private Sub mpn_Limpiaformuario()
        'Me.TextBox1.Text = ""
        'Me.TextBox8.Text = ""
        'Me.oCv_DdlEstadoRol.SelectedValue = -1
        'Me.msjRoles.Text = ""
        'Me.msjRoles.CssClass = ""
    End Sub
    ''' <summary>
    ''' Metodo que realiza un busqueda por el parametro identificador unico Id_Rol
    ''' </summary>
    ''' <param name="pvs_IdRol"></param>
    'Private Sub mpn_BuscaYMuestraRolXID_Rol(ByVal pvs_IdRol As String)
    '    Dim vlo_InfoCliente As New Data.DataTable

    '    'Instancia de objeto
    '    vpo_BLAcceso = New oCls_acceso
    '    'Obtención de cliente por R.U.T.
    '    vlo_InfoCliente = vpo_BLAcceso.fgo_BuscaRolesXIdRol(Trim(pvs_IdRol))

    '    'Verificación de existencia de cliente
    '    If vlo_InfoCliente IsNot Nothing Then
    '        If vlo_InfoCliente.Rows.Count > 0 Then
    '            'Asignación de datos del cliente al formulario
    '            Me.oHf_IdRol.Value = vlo_InfoCliente.Rows(0).Item("Id_Rol").ToString
    '            Me.TextBox1.Text = vlo_InfoCliente.Rows(0).Item("Nombre_Rol").ToString
    '            Me.TextBox8.Text = vlo_InfoCliente.Rows(0).Item("Descripcion_Rol").ToString
    '            If CBool(vlo_InfoCliente.Rows(0).Item("Estado_Rol").ToString) = True Then
    '                Me.oCv_DdlEstadoRol.SelectedValue = 1
    '            ElseIf CBool(vlo_InfoCliente.Rows(0).Item("Estado_Rol").ToString) = False Then
    '                Me.oCv_DdlEstadoRol.SelectedValue = 0

    '            End If


    '        End If
    '    End If


    'End Sub

    ''' <summary>
    ''' Boton que permite seleccionar un registro de la grilla con listado de los roles
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    'Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
    '    If (e.CommandName = "Select") Then
    '        mpn_BuscaYMuestraRolXID_Rol(Conversion.Int(GridView1.Rows(Conversion.Int(e.CommandArgument)).Cells(1).Text))

    '    End If

    'End Sub

    ''' <summary>
    ''' Procedimiento que permite guardar registros de roles
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    'Protected Sub obn_GuardaRol_Click(sender As Object, e As EventArgs) Handles obn_GuardaRol.Click
    '    'Dim aTimer As System.Timers.Timer
    '    Try
    '        vpo_Acceso = New oCls_acceso
    '        vpo_Acceso.mgn_AgregarRol(Me.TextBox1.Text, Me.TextBox8.Text, Me.oCv_DdlEstadoRol.SelectedValue)
    '        mpn_MostrarGrilla()

    '        Me.msjRoles.Text = "Grabado!"
    '        Me.msjRoles.CssClass = "alert alert-success"
    '        'Await Task.Delay(5000)
    '        'Me.msjRoles.Text = ""
    '        'Me.msjRoles.CssClass = ""
    '    Catch ex As Exception

    '    End Try
    'End Sub

    ''' <summary>
    ''' Boton eliminar: activa Procedimiento que permite eleminar un registro Rol por medio de una id_rol
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    'Protected Sub obn_EliminarRol_Click(sender As Object, e As EventArgs) Handles obn_EliminarRol.Click
    '    vpo_Acceso = New oCls_acceso
    '    If (oHf_IdRol.Value <> "") Then
    '        vpo_Acceso = New oCls_acceso
    '        vpo_Acceso.mdn_EliminaAcceso(Conversion.Int(oHf_IdRol.Value))

    '        mpn_MostrarGrilla()
    '        mpn_Limpiaformuario()
    '    End If
    'End Sub
    '''' <summary>
    '''' Boton Limpiar: activa procedimiento que resetea y limpia las cajas de texto del formulario de ingreso de roles
    '''' </summary>
    '''' <param name="sender"></param>
    '''' <param name="e"></param>
    'Protected Sub obn_LimpiarRol_Click(sender As Object, e As EventArgs) Handles obn_LimpiarRol.Click
    '    mpn_Limpiaformuario()
    'End Sub

    Protected Sub oGv_ListadoAccesoRol_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oGv_ListadoAccesoRol.SelectedIndexChanged

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        mpn_MostrarGrillaAccesoRolModulo()
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList2.SelectedIndexChanged
        mpn_MostrarGrillaAccesoRolModulo()
    End Sub
    Private Sub mpn_ActualizarAccesoRolesModulos()
        For Each oGv As GridViewRow In oGv_ListadoAccesoRol.Rows

            Dim cBxAcceso As CheckBox = oGv.FindControl("cBxAcceso")
            Dim cBxModifica As CheckBox = oGv.FindControl("cBxModifica")
            Dim cBxElimina As CheckBox = oGv.FindControl("cBxElimina")
            Dim oHfIdModulo As HiddenField = oGv.FindControl("oHfIdModulo")
            Dim oHfIdRol As HiddenField = oGv.FindControl("oHfIdRol")

            'Instancia de objeto
            vpo_BLAcceso = New oCls_acceso
            '  vpo_BLAcceso.mgn_ActualizaAccesoRolesModulo(Me.oCv_DdlId_Rol.SelectedValue, CInt(oHfIdModulo.Value), (cBxAcceso.Checked), (cBxModifica.Checked), (cBxElimina.Checked))
            vpo_BLAcceso.mun_ActualizaAccesoRolModulos(CInt(oHfIdRol.Value), CInt(oHfIdModulo.Value), (cBxAcceso.Checked), (cBxModifica.Checked), (cBxElimina.Checked))

        Next

    End Sub

    'Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
    '    mpn_ActualizarAccesoRolesModulos()
    'End Sub

    Protected Sub obn_GuardaAccesoRol_Click(sender As Object, e As EventArgs) Handles obn_GuardaAccesoRol.Click
        mpn_ActualizarAccesoRolesModulos()
    End Sub


    'Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
    '    mpn_ActualizarAccesoRolesModulos()
    'End Sub
End Class