Imports System
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports MTFS.BL

Imports Owin
Public Class frmUsuario
    Inherits System.Web.UI.Page
    'Private vpo_Acceso As oCls_acceso
    Private WithEvents vpo_Acceso As oCls_acceso
    ' Private vpo_Usuario As oCls_acceso
    Private WithEvents vpo_Usuario As oCls_acceso

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        vpo_Acceso = New oCls_acceso
        Dim vpo_dt_roles As DataTable
        vpo_dt_roles = vpo_Acceso.fgo_ObtenerListadoRoles()
        DropDownList1.DataSource = vpo_dt_roles
        DropDownList1.DataValueField = "Id_Rol"
        DropDownList1.DataTextField = "Nombre_Rol"

        DropDownList1.DataBind()
        'DropDownList1.Items.Insert(0, New ListItem("Seleccionar", ""))


        mpn_MostrarGrillaUsuario()
    End Sub
    Private Sub mpn_MostrarGrillaUsuario()
        vpo_Usuario = New oCls_acceso
        Dim vpo_dt_Usuario As DataTable
        vpo_dt_Usuario = vpo_Usuario.fgo_ObtenerListadoUsuario
        GridView1.DataSource = vpo_dt_Usuario
        GridView1.DataBind()
    End Sub
    Private Sub mpn_BuscaYMuestraUsuarioXID_Rol(ByVal pvs_IdUsuario As String)
        vpo_Usuario = New oCls_acceso
        Dim vpo_dt_Usuario As New Data.DataTable
        vpo_dt_Usuario = vpo_Usuario.fgo_BuscaUsuarioxID(Trim(pvs_IdUsuario))

        If vpo_dt_Usuario IsNot Nothing Then
            If vpo_dt_Usuario.Rows.Count > 0 Then
                oHf_IdUsuario.Value = vpo_dt_Usuario.Rows(0).Item("Id_Usuario").ToString
                Me.DropDownList1.SelectedValue = Conversion.Int(vpo_dt_Usuario.Rows(0).Item("Id_Rol").ToString)

                Me.oTx_Dominio_Usuario.Text = vpo_dt_Usuario.Rows(0).Item("Dominio_Usuario").ToString
                Me.oTx_Usuario.Text = vpo_dt_Usuario.Rows(0).Item("Usuario").ToString
                Me.oTx_Nombre_Usuario.Text = vpo_dt_Usuario.Rows(0).Item("Nombre_Usuario").ToString
                Me.oTx_Apellido_Usuario.Text = vpo_dt_Usuario.Rows(0).Item("Apellido_Usuario").ToString
                Me.oTx_Email.Text = vpo_dt_Usuario.Rows(0).Item("Email").ToString
                Me.oTx_Pass1.Text = vpo_dt_Usuario.Rows(0).Item("Pass").ToString
                Me.oTx_Pass2.Text = vpo_dt_Usuario.Rows(0).Item("Pass").ToString

                If CBool(vpo_dt_Usuario.Rows(0).Item("Cambiar_Pass").ToString) = True Then
                    Me.oCv_CambiarPass_Usuario.SelectedValue = 1
                Else
                    Me.oCv_CambiarPass_Usuario.SelectedValue = 0
                End If

                If CBool(vpo_dt_Usuario.Rows(0).Item("Estado").ToString) = True Then
                    Me.oCv_DdlEstadoUsuario.SelectedValue = 1
                Else
                    Me.oCv_DdlEstadoUsuario.SelectedValue = 0
                End If
                ' Me.oCv_CambiarPass_Usuario.SelectedValue = 
                ' Me.oCv_DdlEstadoUsuario.SelectedValue = 
            End If
            Else
            MsgBox("error")

        End If



    End Sub
    'Private Sub mpn_BuscaYMuestraUsuarioXID(ByVal pvi_IdUsuario As Integer)
    '    Dim vlo_Dt_InfoUsuario As New Data.DataTable
    '    'Instancia de objeto
    '    vpo_Acceso = New oCls_acceso
    '    vlo_Dt_InfoUsuario = vpo_Acceso.fgo_BuscaUsuarioxID(pvi_IdUsuario)

    '    If vlo_Dt_InfoUsuario IsNot Nothing Then
    '        If vlo_Dt_InfoUsuario.Rows.Count > 0 Then

    '        End If

    '    End If


    'End Sub
    Private Sub mpn_LimpiarfrmUsuario()
        '  Me.DropDownList1.SelectedValue = 1
        Me.oCv_DdlEstadoUsuario.SelectedValue = -1
        Me.oCv_CambiarPass_Usuario.SelectedValue = -1
        Me.oTx_Dominio_Usuario.Text = ""
        Me.oTx_Usuario.Text = ""
        Me.oTx_Nombre_Usuario.Text = ""
        Me.oTx_Apellido_Usuario.Text = ""
        Me.oTx_Email.Text = ""
        Me.oTx_Pass1.Text = ""
        Me.oTx_Pass2.Text = ""
    End Sub
    'Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged

    'End Sub

    'Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


    'End Sub

    'Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click

    'End Sub

    'Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
    '    vpo_Usuario = New oCls_acceso
    '    vpo_Usuario.mgn_AgregarUsuario(DropDownList1.SelectedValue, oCv_DdlEstadoUsuario.SelectedValue, oTx_Dominio_Usuario.Text, oTx_Usuario.Text, oTx_Nombre_Usuario.Text, oTx_Apellido_Usuario.Text, oTx_Email.Text, oTx_Pass1.Text, oCv_CambiarPass_Usuario.SelectedValue)
    'End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged, DropDownList1.TextChanged
        Dim vpo_valor As String
        vpo_valor = DropDownList1.SelectedValue.ToString

        'TextBox2.Text = vpo_valor

        'TextBox3.Text = DropDownList1.Text

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If (e.CommandName = "Select") Then

            mpn_BuscaYMuestraUsuarioXID_Rol(Conversion.Int(GridView1.Rows(Conversion.Int(e.CommandArgument)).Cells(1).Text))


        End If

    End Sub

    Protected Sub obn_GuardaUsuario_Click(sender As Object, e As EventArgs) Handles obn_GuardaUsuario.Click
        vpo_Usuario = New oCls_acceso
        'vpo_Usuario.mgn_AgregarUsuario(Conversion.Int(DropDownList1.SelectedValue), Conversion.Int(oCv_DdlEstadoUsuario.SelectedValue), oTx_Dominio_Usuario.Text, oTx_Usuario.Text, oTx_Nombre_Usuario.Text, oTx_Apellido_Usuario.Text, oTx_Email.Text, oTx_Pass1.Text, Conversion.Int(oCv_CambiarPass_Usuario.SelectedValue))
        vpo_Usuario.mgn_AgregarUsuario(DropDownList1.Text, oCv_DdlEstadoUsuario.SelectedValue, oTx_Dominio_Usuario.Text, oTx_Usuario.Text, oTx_Nombre_Usuario.Text, oTx_Apellido_Usuario.Text, oTx_Email.Text, oTx_Pass1.Text, oCv_CambiarPass_Usuario.SelectedValue)
        mpn_MostrarGrillaUsuario()
        mpn_LimpiarfrmUsuario()
    End Sub

    Protected Sub obn_EliminarUsuario_Click(sender As Object, e As EventArgs) Handles obn_EliminarUsuario.Click
        vpo_Usuario = New oCls_acceso
        If (oHf_IdUsuario.Value <> "") Then
            vpo_Usuario.mdn_EliminaUsuario(Me.oHf_IdUsuario.Value)
            mpn_MostrarGrillaUsuario()
            mpn_LimpiarfrmUsuario()
        End If



    End Sub

    Protected Sub obn_LimpiarUsuario_Click(sender As Object, e As EventArgs) Handles obn_LimpiarUsuario.Click
        mpn_LimpiarfrmUsuario()
    End Sub
End Class