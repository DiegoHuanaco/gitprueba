Public Class oCls_acceso
#Region "Variables"

    Private vpo_Acceso As DataSet_accesoTableAdapters.UsuariosTableAdapter
    Private vpo_Roles As DataSet_accesoTableAdapters.RolesTableAdapter
    Private vpo_Modulos As DataSet_accesoTableAdapters.Modulos_SistemaTableAdapter
    Private vpo_AccesoRolesModuloTableAdapter As DataSet_accesoTableAdapters.Accesos_Roles_ModulosTableAdapter




#End Region
#Region "Roles"
    ''' <summary>
    ''' Metodo que agrega regisros de Roles
    ''' </summary>
    ''' <param name="pvs_Nombre"></param>
    ''' <param name="pvs_Descripcion"></param>
    ''' <param name="pvs_Estado"></param>
    Public Sub mgn_AgregarRol(ByVal pvs_Nombre As String, ByVal pvs_Descripcion As String, ByVal pvs_Estado As Boolean)
        Try
            vpo_Roles = New DataSet_accesoTableAdapters.RolesTableAdapter
            vpo_Roles.Insert(pvs_Nombre, pvs_Descripcion, pvs_Estado)


        Catch ex As Exception

        End Try

    End Sub
    ''' <summary>
    ''' Metodo que elimina un registro de Rol
    ''' </summary>
    ''' <param name="pvi_Id_rol"></param>
    Public Sub mdn_EliminaAcceso(ByVal pvi_Id_rol As Integer)
        Try
            vpo_Roles = New DataSet_accesoTableAdapters.RolesTableAdapter
            vpo_Roles.mdn_EliminaRol(pvi_Id_rol)


        Catch ex As Exception

        End Try

    End Sub
    Public Sub mun_ActualizaRol(ByVal pvs_NombreRol As String, ByVal pvs_DescripcionRol As String, ByVal pvb_EstadoRol As Boolean, ByVal pvi_Id_rol As Integer)
        Try
            vpo_Roles = New DataSet_accesoTableAdapters.RolesTableAdapter
            vpo_Roles.mun_ActualizaRol(pvs_NombreRol, pvs_DescripcionRol, pvb_EstadoRol, pvi_Id_rol)

        Catch ex As Exception

        End Try

    End Sub
    ''' <summary>
    ''' Function que retorna un Datatable con listado de roles
    ''' </summary>
    ''' <returns></returns>
    Function fgo_ObtenerListadoRoles()
        Try
            vpo_Roles = New DataSet_accesoTableAdapters.RolesTableAdapter
            'Dim vpo_DT_Roles As DataTable = vpo_Acceso.
            Dim vpo_DT_Roles As DataTable = vpo_Roles.msoListadoRoles

            If Not vpo_DT_Roles Is Nothing Then
                Return vpo_DT_Roles
            Else
                Return Nothing
            End If
        Catch ex As Exception
            '  RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try
    End Function
    ''' <summary>
    ''' Funcion que obtiene Regisro de roles por busqueda de Id_Rol
    ''' </summary>
    ''' <param name="pvi_IdRol"></param>
    ''' <returns></returns>
    Public Function fgo_BuscaRolesXIdRol(ByVal pvi_IdRol As Integer) As DataTable
        'Inicio de captura de errores
        Try
            vpo_Roles = New DataSet_accesoTableAdapters.RolesTableAdapter     'Instancia de objeto

            'Obtención de Roles x Nombre
            Dim vpo_DT_Roles As DataTable = vpo_Roles.mso_BuscaRolXId_Rol(Trim(pvi_IdRol))

            If Not vpo_DT_Roles Is Nothing Then
                Return vpo_DT_Roles   'Retorno de función
            Else
                'RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception
            '  RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try
    End Function
#End Region

#Region "Usuario"
    Public Sub mgn_AgregarUsuario(ByVal pvi_Rol As String, ByVal pvi_Estado As Boolean, ByVal pvs_Domminio As String, ByVal pvs_Usuario As String, ByVal pvs_Nombre As String, ByVal pvs_Apellido As String, ByVal pvs_Email As String, ByVal pvs_Pass As String, ByVal pvi_Cambiarpass As Boolean)
        Try
            vpo_Acceso = New DataSet_accesoTableAdapters.UsuariosTableAdapter



            'vpo_Acceso.Insert(pvs_Rol, True, "", pvs_Nombre, "amino", "miño", "alexisjmp@gmail.com", "123", False)
            vpo_Acceso.Insert(pvi_Rol, pvi_Estado, pvs_Domminio, pvs_Usuario, pvs_Nombre, pvs_Apellido, pvs_Email, pvs_Pass, pvi_Cambiarpass)

            '  RaiseEvent eCorrectos(eNm_Correctos.guardar_actualizar_rol)                 'Activación de evento de correcto
        Catch ex As Exception
            '  RaiseEvent eErrores(eNm_Errores.guardar_actualizar_rol)                     'Activación de evento de error
        End Try
    End Sub

    Public Sub mdn_EliminaUsuario(ByVal pvi_Id_usuario As Integer)
        Try
            vpo_Acceso = New DataSet_accesoTableAdapters.UsuariosTableAdapter
            vpo_Acceso.mdnEliminaUsuarioxId(pvi_Id_usuario)

        Catch ex As Exception

        End Try
    End Sub
    Function fgo_ObtenerListadoUsuario()
        Try

            vpo_Acceso = New DataSet_accesoTableAdapters.UsuariosTableAdapter


            Dim vpo_DT_Usuario As DataTable = vpo_Acceso.msoListadoUsuario


            If Not vpo_DT_Usuario Is Nothing Then
                Return vpo_DT_Usuario 'Retorno de función
            Else
                '  RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception
            '  RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try

    End Function
    Public Function fgo_BuscaUsuarioxID(ByVal pvi_Id_Usuario As Integer) As DataTable
        Try
            vpo_Acceso = New DataSet_accesoTableAdapters.UsuariosTableAdapter
            Dim vpo_Dt_Usuario As DataTable = vpo_Acceso.msoBuscaUsuarioxID(pvi_Id_Usuario)

            If Not vpo_Dt_Usuario Is Nothing Then
                Return vpo_Dt_Usuario
            Else
                Return Nothing
            End If
        Catch ex As Exception
            Return Nothing
        End Try

    End Function
    Public Function fgo_BuscaUsuarioxPassyUsuario(ByVal pvs_Usuario As String, ByVal pvs_Pass As String) As DataTable
        Try
            vpo_Acceso = New DataSet_accesoTableAdapters.UsuariosTableAdapter
            Dim vpo_Dt_Usuario As DataTable = vpo_Acceso.msoBuscaUsuarioxPassyUsuario(pvs_Usuario, pvs_Pass)

            If Not vpo_Dt_Usuario Is Nothing Then
                Return vpo_Dt_Usuario
            Else
                Return Nothing
            End If
        Catch ex As Exception
            Return Nothing
        End Try

    End Function

#End Region

#Region "Modulo"
    Public Sub mgn_AgregaModulo(ByVal pvs_Nombre As String, ByVal pvs_ruta As String, ByVal pvs_grupo As Integer, ByVal pvs_Estado As Boolean, ByVal pvs_tipo As Integer, ByVal pvs_Indice As Integer)
        Try
            vpo_Modulos = New DataSet_accesoTableAdapters.Modulos_SistemaTableAdapter
            vpo_Modulos.Insert(pvs_Nombre, pvs_ruta, pvs_grupo, pvs_Estado, pvs_tipo, pvs_Indice)

        Catch ex As Exception

        End Try


    End Sub
    Public Function fgo_obtenerListadoModulos() As DataTable
        Try
            vpo_Modulos = New DataSet_accesoTableAdapters.Modulos_SistemaTableAdapter
            Dim vpo_Dt_Modulos As DataTable = vpo_Modulos.msoListadoModulos

            If Not vpo_Dt_Modulos Is Nothing Then
                Return vpo_Dt_Modulos
            Else
                Return Nothing
            End If
        Catch ex As Exception

        End Try
    End Function
    Public Function fgo_BuscaModuloXId(ByVal pvi_Id_Modulo As Integer) As DataTable
        Try
            vpo_Modulos = New DataSet_accesoTableAdapters.Modulos_SistemaTableAdapter
            Dim vpo_DT_Modulo As DataTable = vpo_Modulos.msolistadoModuloxid(pvi_Id_Modulo)
            If Not vpo_DT_Modulo Is Nothing Then
                Return vpo_DT_Modulo   'Retorno de función
            Else
                'RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception

        End Try
    End Function
#End Region

#Region "Acceso Roles"
    Public Sub mun_ActualizaAccesoRolModulos(ByVal pvi_Id_Rol As Integer, ByVal pvi_Id_Modulo As Integer, ByVal pvb_Acceso As Boolean, ByVal pvb_Modifica As Boolean, ByVal pvb_Elimina As Boolean)
        Try
            vpo_AccesoRolesModuloTableAdapter = New DataSet_accesoTableAdapters.Accesos_Roles_ModulosTableAdapter
            vpo_AccesoRolesModuloTableAdapter.munActualizaAccesoRolModulos(pvb_Acceso, pvb_Modifica, pvb_Elimina, pvi_Id_Rol, pvi_Id_Modulo)
        Catch ex As Exception

        End Try
    End Sub
    ''' <summary>
    ''' Funcion que busca los tipos de niveles de acceso
    ''' </summary>
    ''' <param name="pvi_IdRol">Id del Rol del usuario logeado</param>
    ''' <param name="pvi_IdModulo">Id del Modulo del usuario logeado</param>
    ''' <remarks>Sebastian Sagardia - 22-01-2014</remarks>
    Function fgo_BuscaAccesoRoles(ByVal pvi_IdRol As Integer, ByVal pvi_IdModulo As Integer)
        Try

            vpo_AccesoRolesModuloTableAdapter = New DataSet_accesoTableAdapters.Accesos_Roles_ModulosTableAdapter

            'Obtención de Roles x Nombre
            Dim vlo_AccesoRolesModuloDataTable As DataTable = vpo_AccesoRolesModuloTableAdapter.msoBuscaRolModuloAcceso(pvi_IdRol, pvi_IdModulo)


            If Not vlo_AccesoRolesModuloDataTable Is Nothing Then
                Return vlo_AccesoRolesModuloDataTable 'Retorno de función
            Else
                '  RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception
            '  RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try
    End Function
    'Function fgo_obtenerAccesoRolesModulos()
    '    Try

    '        vpo_AccesoRolesModuloTableAdapter = New DataSet_accesoTableAdapters.Accesos_Roles_ModulosTableAdapter

    '        'Obtención de Roles x Nombre
    '        Dim vpo_Dt_AccesoRolesModulo As DataTable = vpo_AccesoRolesModuloTableAdapter.msoListadoAccesoRolesModulo

    '        If Not vpo_Dt_AccesoRolesModulo Is Nothing Then
    '            Return vpo_Dt_AccesoRolesModulo
    '        Else
    '            Return Nothing
    '        End If
    '    Catch ex As Exception

    '    End Try
    'End Function
#End Region


    'Public Function fpo_BuscaModulosPadresXUsuario(ByVal pvi_IdUsuario As Integer) As DataTable
    '    'Inicio de captura de errores
    '    Try

    '        'INSTANCIO EL TABLE ADAPTER Y OBTENGO TODOS SUS METOS Y PROPIEDADES
    '        vpo_ModulosSistemaTableAdapter = New oDs_AccesoTableAdapters.ModulosTableAdapter      'Instancia de objeto

    '        Dim vlo_ModulosDataTable As DataTable = vpo_ModulosSistemaTableAdapter.mso_BuscaModulosPadresXIdUsuario(pvi_IdUsuario)

    '        If Not vlo_ModulosDataTable Is Nothing Then
    '            Return vlo_ModulosDataTable   'Retorno de función
    '        Else
    '            RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
    '            Return Nothing
    '        End If

    '    Catch ex As Exception
    '        RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
    '        Return Nothing
    '    End Try
    'End Function


    'Public Function fpo_BuscaModulosHijosXUsuario(ByVal pvi_IdUsuario As Integer, ByVal pvi_IdModulo As Integer) As DataTable

    '    'Inicio de captura de errores
    '    Try

    '        'INSTANCIO EL TABLE ADAPTER Y OBTENGO TODOS SUS METOS Y PROPIEDADES
    '        vpo_ModulosSistemaTableAdapter = New oDs_AccesoTableAdapters.ModulosTableAdapter      'Instancia de objeto

    '        Dim vlo_ModulosDataTable As DataTable = vpo_ModulosSistemaTableAdapter.mso_BuscaModulosHijosXIdUsuario(pvi_IdUsuario, pvi_IdModulo)

    '        If Not vlo_ModulosDataTable Is Nothing Then
    '            Return vlo_ModulosDataTable   'Retorno de función
    '        Else
    '            RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
    '            Return Nothing
    '        End If

    '    Catch ex As Exception
    '        RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
    '        Return Nothing
    '    End Try
    'End Function


    ''' <summary>
    ''' Metodo que consulta los modulos por usuario
    ''' </summary>
    ''' <param name="pvi_IdUsuario">Id Usuario a consultar</param>
    ''' <returns>Datatable con modulos con acceso del usuario</returns>
    ''' <remarks>Ilians Bastos - 17-01-2014</remarks>
    Public Function fpn_LlenarGrupoModulo(ByVal pvi_IdUsuario As Integer) As DataTable
        'Inicio de captura de errores
        Try

            'INSTANCIO EL TABLE ADAPTER Y OBTENGO TODOS SUS METOS Y PROPIEDADES
            vpo_Modulos = New DataSet_accesoTableAdapters.Modulos_SistemaTableAdapter      'Instancia de objeto

            Dim vlo_ModulosDataTable As DataTable = vpo_Modulos.mso_listado_grupo_modulos(pvi_IdUsuario)

            If Not vlo_ModulosDataTable Is Nothing Then
                Return vlo_ModulosDataTable   'Retorno de función
            Else
                '  RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception
            ' RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' Metodo que consulta los modulos por usuario y grupo
    ''' </summary>
    ''' <param name="pvi_IdUsuario">Id Usuario a consultar</param>
    ''' <param name="pvi_IdModulo">Id Modulo a consultar</param>
    ''' <returns>Datatable con modulos con acceso del usuario y grupo</returns>
    ''' <remarks>Ilians Bastos - 17-01-2014</remarks>
    Public Function fpn_LlenarGrupoModuloViewHijos(ByVal pvi_IdUsuario As Integer, ByVal pvi_IdModulo As Integer) As DataTable

        'Inicio de captura de errores
        Try

            'INSTANCIO EL TABLE ADAPTER Y OBTENGO TODOS SUS METOS Y PROPIEDADES
            vpo_Modulos = New DataSet_accesoTableAdapters.Modulos_SistemaTableAdapter     'Instancia de objeto

            Dim vlo_ModulosDataTable As DataTable = vpo_Modulos.mso_listado_modulos(pvi_IdUsuario, pvi_IdModulo)

            If Not vlo_ModulosDataTable Is Nothing Then
                Return vlo_ModulosDataTable   'Retorno de función
            Else
                ' RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception
            '   RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try
    End Function







End Class
