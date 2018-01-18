﻿Imports BUDGET.BL
Imports BUDGET.SERV

Public Class AccesoRol
    Inherits System.Web.UI.Page

#Region "Variables"
    Private WithEvents vpo_BLAcceso As BL.oCls_Acceso
    Private Const IdModulo As Integer = 25
#End Region

    ''' <summary>
    ''' Inicio de página.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Asignación de foco
            Session("Enviame") = IdModulo
            mpn_BuscaAccesoRoles(Session("Id_Rol"), IdModulo)
            mpn_BuscaYMuestraRolesXEstado()
            mpn_BuscaYMuestraGrupoModulo()
            mpn_BuscaYMuestraAccesoRoles(CInt(Me.oCv_DdlId_Rol.SelectedValue), CInt(Me.oCv_DdlGrupoModulo.SelectedValue))
            Page.SetFocus(Me.oCv_DdlId_Rol)

        End If
    End Sub

#Region "Botones"
    ''' <summary>
    ''' Botón guardar.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub oPb_Guardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles oPb_Guardar.Click
        mpn_ActualizarAccesoRolesModulos()
    End Sub
   

#End Region

#Region "Métodos"

    ''' <summary>
    ''' Metodo de busqueda por ID de cuenta
    ''' </summary>
    ''' <param name="pvs_IdCuenta">ID de la cuenta</param>
    ''' <remarks></remarks>
    Private Sub mpn_BuscaYMuestraCuentaXID_Cuenta(ByVal pvs_IdCuenta As String)
        Dim vlo_InfoCliente As New Data.DataTable

        'Instancia de objeto
        vpo_BLAcceso = New BL.oCls_Acceso
        'Obtención de cliente por R.U.T.
        vlo_InfoCliente = vpo_BLAcceso.fgo_BuscaCuentaXId_Cuenta(Trim(pvs_IdCuenta))

        'Verificación de existencia de cliente
        If vlo_InfoCliente IsNot Nothing Then
            If vlo_InfoCliente.Rows.Count > 0 Then
                'Asignación de datos del cliente al formulario

                If vlo_InfoCliente.Rows(0).Item("Estado_Rol").ToString = False Then
                    vpo_BLAcceso_eValidaciones(BL.oCls_Acceso.eNm_Validaciones.rol_inactivo)
                ElseIf vlo_InfoCliente.Rows(0).Item("Estado_Rol").ToString = True Then
                    Me.oCv_DdlId_Rol.SelectedValue = vlo_InfoCliente.Rows(0).Item("Id_Rol").ToString
                End If


            Else
                'Cambia mensaje e icono de mensaje informativo
                Me.oLb_MensajeInformativo.Text = "El Usuario buscado no existe."
                Me.oIb_ImagenMensajeInformativo.ImageUrl = oCls_Rutas.pgs_RutaIconoInformacion
                'Muestra mensaje informativo
                Me.oMPa_MensajeInformativo.Show()
                Me.oULa_MensajeInformativo.Update()
                'Asignación de foco
                oSMa_Principal.SetFocus("oPb_AceptarMensajeInformativo")
            End If
        End If

        'Actualiza UpdatePanel principal
        Me.oULa_Principal.Update()

    End Sub

    ''' <summary>
    ''' Método que rellena el DdlId_Rol
    ''' </summary>
    ''' <remarks>Sebastian Sagardia 17-01-2014</remarks>
    Private Sub mpn_BuscaYMuestraRolesXEstado()
        Dim vlo_InfoCliente As New Data.DataTable

        'Instancia de objeto
        vpo_BLAcceso = New BL.oCls_Acceso
        'Obtención de ID Rol y Nombre Rol.
        vlo_InfoCliente = vpo_BLAcceso.fgo_BuscaRolesXEstado
        Me.oCv_DdlId_Rol.DataSource = vpo_BLAcceso.fgo_BuscaRolesXEstado
        Me.oCv_DdlId_Rol.DataBind()

    End Sub

    ''' <summary>
    ''' Metodo Busca y Muestra Grupo de modulos
    ''' </summary>
    ''' <remarks>Sebastian Sagardia - 21-01-2014</remarks>
    Private Sub mpn_BuscaYMuestraGrupoModulo()
        Dim vlo_InfoCliente As New Data.DataTable

        'Instancia de objeto
        vpo_BLAcceso = New BL.oCls_Acceso
        'Obtención de ID Modulo y Nombre Modulo.
        vlo_InfoCliente = vpo_BLAcceso.fgo_BuscaGrupoModulo
        Me.oCv_DdlGrupoModulo.DataSource = vpo_BLAcceso.fgo_BuscaGrupoModulo
        Me.oCv_DdlGrupoModulo.DataBind()

    End Sub

    ''' <summary>
    ''' Método que rellena el oGv de Acceso Roles
    ''' </summary>
    ''' <remarks>Sebastian Sagardia - 20-01-2014</remarks>
    Private Sub mpn_BuscaYMuestraAccesoRoles(ByVal pvi_IdRol As Integer, ByVal pvi_GrupoModulo As Integer)
        Dim vlo_InfoCliente As New Data.DataTable

        'Instancia de objeto
        vpo_BLAcceso = New BL.oCls_Acceso
        'Obtención de ID Rol y Nombre Rol.
        vlo_InfoCliente = vpo_BLAcceso.fgo_BuscaModuloSistema(pvi_IdRol, pvi_GrupoModulo)
        Me.oGv_BusquedaCuentaXNombre.DataSource = vpo_BLAcceso.fgo_BuscaModuloSistema(pvi_IdRol, pvi_GrupoModulo)
        Me.oGv_BusquedaCuentaXNombre.DataBind()

    End Sub

    ''' <summary>
    ''' Metodo que busca los niveles de acceso y los traspasa a los checkbock
    ''' </summary>
    ''' <remarks>Sebastian Sagardia - 22-01-2014</remarks>
    Private Sub mpn_ActualizarAccesoRolesModulos()
        For Each oGv As GridViewRow In oGv_BusquedaCuentaXNombre.Rows

            Dim cBxAcceso As CheckBox = oGv.FindControl("cBxAcceso")
            Dim cBxModifica As CheckBox = oGv.FindControl("cBxModifica")
            Dim cBxElimina As CheckBox = oGv.FindControl("cBxElimina")
            Dim oHfIdModulo As HiddenField = oGv.FindControl("oHfIdModulo")

            'Instancia de objeto
            vpo_BLAcceso = New BL.oCls_Acceso
            vpo_BLAcceso.mgn_ActualizaAccesoRolesModulo(Me.oCv_DdlId_Rol.SelectedValue, CInt(oHfIdModulo.Value), (cBxAcceso.Checked), (cBxModifica.Checked), (cBxElimina.Checked))

        Next

    End Sub

    ''' <summary>
    ''' Metodo que Busca el nivel de Acceso Por Roles
    ''' </summary>
    ''' <param name="pvi_IdRol">Id del Rol del usuario</param>
    ''' <param name="pvi_IdModulo">Id del Modulo que Accede el usuario</param>
    ''' <remarks></remarks>
    Private Sub mpn_BuscaAccesoRoles(ByVal pvi_IdRol As Integer, ByVal pvi_IdModulo As Integer)

        Dim vlo_InfoCliente As New Data.DataTable

        'Instancia de objeto
        vpo_BLAcceso = New BL.oCls_Acceso
        'Obtención de datos
        vlo_InfoCliente = vpo_BLAcceso.fgo_BuscaAccesoRoles(pvi_IdRol, pvi_IdModulo)

        'Verificación de existencia de datos
        If vlo_InfoCliente IsNot Nothing Then
            If vlo_InfoCliente.Rows.Count > 0 Then
                'Asignación de datos
                If vlo_InfoCliente.Rows(0).Item("Acceso").ToString = False Then
                    'Cambia mensaje e icono de mensaje informativo
                    Me.oLb_MensajeInformativo.Text = "El usuario no tiene privilegios para acceder a esta pagina."
                    Me.oIb_ImagenMensajeInformativo.ImageUrl = oCls_Rutas.pgs_RutaIconoInformacion
                    'Muestra mensaje informativo
                    Me.oMPa_MensajeInformativo.Show()
                    Me.oULa_MensajeInformativo.Update()
                    'Asignación de foco
                    oSMa_Principal.SetFocus("oPb_AceptarMensajeInformativo")
                    oPl_Roles.Visible = False
                ElseIf vlo_InfoCliente.Rows(0).Item("Modifica").ToString = False Then
                    Me.oPb_Guardar.Visible = False
                End If
            End If
        End If

        'Actualiza UpdatePanel principal
        Me.oULa_Principal.Update()

    End Sub
#End Region

#Region "GridView (Búsqueda de Acceso Roles)"

    ''' <summary>
    ''' Paginación de grilla de búsqueda de Acceso Modulos.
    ''' </summary>
    ''' <param name="e"></param>
    ''' <remarks>Sebastian Sagardia - 20-01-2014</remarks>
    Protected Sub oGv_BusquedaCuentaXNombre_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles oGv_BusquedaCuentaXNombre.PageIndexChanging
        'Cambio de página de grilla
        If e.NewPageIndex > -1 Then
            Me.oGv_BusquedaCuentaXNombre.PageIndex = e.NewPageIndex
        Else
            Me.oGv_BusquedaCuentaXNombre.PageIndex = 0
        End If
        'Instancia de objeto
        vpo_BLAcceso = New BL.oCls_Acceso
        'Obtiene Acceso a modulos (Origen de datos)
        Me.oGv_BusquedaCuentaXNombre.DataSource = vpo_BLAcceso.fgo_BuscaModuloSistema(CInt(Me.oCv_DdlId_Rol.SelectedValue), CInt(Me.oCv_DdlGrupoModulo.SelectedValue))
        Me.oGv_BusquedaCuentaXNombre.DataBind()
        'Muestra ModalPopup

    End Sub

    ''' <summary>
    ''' Se produce cuando una fila de datos se enlaza a los datos de un control GridView.
    ''' - Para las filas tipo "DataRow": se agregan los evento OnMouseOver y OnMouseOut.
    ''' - Para la fila tipo "Pager": se agrega el ComboBox con la cantidad de paginas que tiene el GridView.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub oGv_BusquedaRolXNombre_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles oGv_BusquedaCuentaXNombre.RowDataBound
        'DataRow
        If e.Row.RowType = DataControlRowType.DataRow Then
            'Estilos OnMouseOver / OnMouseOut filas grilla
            e.Row.Attributes.Add("OnMouseOver", "fgn_OnMouseOverFilaGridView(this);")
            e.Row.Attributes.Add("OnMouseOut", "fgn_OnMouseOutFilaGridView(this);")
            'Pager
        ElseIf e.Row.RowType = DataControlRowType.Pager Then
            Dim vlo_ListadoDePaginas As DropDownList = e.Row.FindControl("oCb_ListadoDePaginas")
            'Asignación de cantidad de páginas de grilla a ComboBox
            vlo_ListadoDePaginas.Items.Clear()
            For i As Integer = 1 To Me.oGv_BusquedaCuentaXNombre.PageCount
                vlo_ListadoDePaginas.Items.Add(i)
            Next
            'Selección de item de ComboBox, con el número de pagina seleccionada actualmente en grilla
            vlo_ListadoDePaginas.Text = Me.oGv_BusquedaCuentaXNombre.PageIndex + 1
        End If
    End Sub

    ''' <summary>
    ''' Selección de fila en ComboBox.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub oCb_ListadoDePaginas_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim vlo_ListadoDePaginas As DropDownList = CType(sender, DropDownList)
        'Selección de fila en grilla, según la selección en ComboBox
        Me.oGv_BusquedaCuentaXNombre.PageIndex = vlo_ListadoDePaginas.SelectedValue - 1
        'Quita selección de fila en grilla
        Me.oGv_BusquedaCuentaXNombre.SelectedIndex = -1
        'Instancia de objeto
        vpo_BLAcceso = New BL.oCls_Acceso
        'Obtiene Acceso a modulos (Origen de datos)
        Me.oGv_BusquedaCuentaXNombre.DataSource = vpo_BLAcceso.fgo_BuscaModuloSistema(CInt(Me.oCv_DdlId_Rol.SelectedValue), CInt(Me.oCv_DdlGrupoModulo.SelectedValue))
        Me.oGv_BusquedaCuentaXNombre.DataBind()
        'Muestra ModalPopup

    End Sub

    ''' <summary>
    ''' Selección de fila en grilla.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub oGv_BusquedaCuentaXNombre_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles oGv_BusquedaCuentaXNombre.SelectedIndexChanging
        'Búsqueda de rol y asignación de información de "este" al formulario
        mpn_BuscaYMuestraCuentaXID_Cuenta(Me.oGv_BusquedaCuentaXNombre.Rows(e.NewSelectedIndex).Cells(1).Text)
    End Sub
#End Region

#Region "Eventos"
    ''' <summary>
    ''' Eventos de error de la capa BL, de la clase oCls_Acceso.
    ''' </summary>
    ''' <param name="pveNm_Errores">Error</param>
    ''' <remarks></remarks>
    Protected Sub vpo_BLAcceso_eErrores(ByVal pveNm_Errores As BL.oCls_Acceso.eNm_Errores) Handles vpo_BLAcceso.eErrores
        Select Case pveNm_Errores
            Case BL.oCls_Acceso.eNm_Errores.error_general
                Me.oLb_MensajeInformativo.Text = SERV.oCls_Rutas.pgs_MensajeGeneralDeError
            Case BL.oCls_Acceso.eNm_Errores.eliminar_rol
                Me.oLb_MensajeInformativo.Text = "Error al intentar eliminar la Cuenta."
            Case BL.oCls_Acceso.eNm_Errores.guardar_actualizar_rol
                Me.oLb_MensajeInformativo.Text = "Error al intentar guardar la Cuenta."
            Case BL.oCls_Acceso.eNm_Errores.guardar_actualizar_rol
                Me.oLb_MensajeInformativo.Text = "Error al intentar Actualizar los Accesos."
        End Select
        'Cambia icono de mensaje informativo
        Me.oIb_ImagenMensajeInformativo.ImageUrl = SERV.oCls_Rutas.pgs_RutaIconoError
        'Muestra ModalPopup de mensaje informativo
        Me.oULa_MensajeInformativo.Update()
        Me.oMPa_MensajeInformativo.Show()
        'Asignación de foco
        oSMa_Principal.SetFocus("oPb_AceptarMensajeInformativo")
    End Sub

    ''' <summary>
    ''' Eventos de validación de la capa BL, de la clase oCls_Acceso.
    ''' </summary>
    ''' <param name="pveNm_Validacion">Validación</param>
    ''' <remarks></remarks>
    Protected Sub vpo_BLAcceso_eValidaciones(ByVal pveNm_Validacion As oCls_Acceso.eNm_Validaciones) Handles vpo_BLAcceso.eValidaciones
        Select Case pveNm_Validacion
            Case BL.oCls_Acceso.eNm_Validaciones.rol_no_existe
                Me.oLb_MensajeInformativo.Text = "La Cuenta que trata de eliminar no existe."
            Case BL.oCls_Acceso.eNm_Validaciones.rol_inactivo
                Me.oLb_MensajeInformativo.Text = "La Cuenta seleccionada posee un rol inactivo, Debe seleccionar otro rol."
        End Select
        'Cambia icono de mensaje informativo
        Me.oIb_ImagenMensajeInformativo.ImageUrl = SERV.oCls_Rutas.pgs_RutaIconoInformacion
        'Muestra ModalPopup de mensaje informativo
        Me.oULa_MensajeInformativo.Update()
        Me.oMPa_MensajeInformativo.Show()
        'Asignación de foco
        oSMa_Principal.SetFocus("oPb_AceptarMensajeInformativo")
    End Sub

    ''' <summary>
    ''' Eventos correctos de la capa BL, de la clase oCls_Acceso.
    ''' </summary>
    ''' <param name="pveNm_Correctos">Evento correcto</param>
    ''' <remarks></remarks>
    Protected Sub vpo_BLAcceso_eCorrectos(ByVal pveNm_Correctos As oCls_Acceso.eNm_Correctos) Handles vpo_BLAcceso.eCorrectos
        Select Case pveNm_Correctos

            Case BL.oCls_Acceso.eNm_Correctos.guardar_actualizar_rol
                Me.oLb_MensajeInformativo.Text = "Accesos guardados correctamente."
        End Select
        'Cambia icono de mensaje informativo
        Me.oIb_ImagenMensajeInformativo.ImageUrl = SERV.oCls_Rutas.pgs_RutaIconoCorrecto
        'Muestra ModalPopup de mensaje informativo
        Me.oULa_MensajeInformativo.Update()
        Me.oMPa_MensajeInformativo.Show()
        'Asignación de foco
        oSMa_Principal.SetFocus("oPb_AceptarMensajeInformativo")
    End Sub
#End Region


    ''' <summary>
    ''' Evento cambio de seleccion de oCv DdlID_ROL
    ''' </summary>
    ''' <param name="sender">ID del ROL</param>
    ''' <param name="e"></param>
    ''' <remarks>Sebastian Sagardia - 20-01-2014</remarks>
    Protected Sub oCv_DdlId_Rol_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oCv_DdlId_Rol.SelectedIndexChanged
        mpn_BuscaYMuestraAccesoRoles(CInt(Me.oCv_DdlId_Rol.SelectedValue), CInt(Me.oCv_DdlGrupoModulo.SelectedValue))
    End Sub

    ''' <summary>
    '''  Evento cambio de seleccion de oCv DdlGrupoModulo
    ''' </summary>
    ''' <param name="sender">Grupo de Modulo</param>
    ''' <param name="e"></param>
    ''' <remarks>Sebastian Sagardia - 20-01-2014</remarks>
    Private Sub oCv_DdlGrupoModulo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles oCv_DdlGrupoModulo.SelectedIndexChanged
        mpn_BuscaYMuestraAccesoRoles(CInt(Me.oCv_DdlId_Rol.SelectedValue), CInt(Me.oCv_DdlGrupoModulo.SelectedValue))
    End Sub
End Class