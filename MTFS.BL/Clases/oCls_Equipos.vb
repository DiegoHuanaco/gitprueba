Imports System.Data.SqlClient

Public Class oCls_Equipos

#Region "Variables"

    Event eErrores(ByVal pveNm_Errores As eNm_Errores)
    Event eCorrectos(ByVal pveNm_Correctos As eNm_Correctos)
    Event eValidaciones(ByVal pveNm_Validacion As eNm_Validaciones)

    Private vpo_KPI As DataSet_IndicadoresTableAdapters.KPI_QBXAreaTableAdapter

    Private vpo_Equipos As DataSet_EquiposTableAdapters.EquiposTableAdapter
    Private vpo_Parametros As DataSet_EquiposTableAdapters.Parametros_EquipoTableAdapter
    Private vpo_Temperatura As DataSet_EquiposTableAdapters.TemperaturaTableAdapter

    Private vpo_Equipos2 As DataSet_IndicadoresTableAdapters.EquiposTableAdapter


#End Region

#Region "DATOS EQUIPO"




    Function fgo_ObtenerListadoEquipoXCliente(ByVal pvi_IdCliente As Integer)
        Try

            vpo_Equipos = New DataSet_EquiposTableAdapters.EquiposTableAdapter

            Dim vlo_Equipos As DataTable = vpo_Equipos.mso_ListadoEquiposXId_Cliente(pvi_IdCliente)

            If Not vlo_Equipos Is Nothing Then
                Return vlo_Equipos 'Retorno de función
            Else
                RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception
            RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try
    End Function

#End Region


#Region "DATOS TEMPERATURA"

    Function fgo_ObtenerParametrosEquipo(ByVal pvi_IdEquipo As Integer, ByVal pvd_FechaIncio As Date, ByVal pvd_FechaTermino As Date)
        Try

            vpo_Parametros = New DataSet_EquiposTableAdapters.Parametros_EquipoTableAdapter

            Dim vlo_Parametros As DataTable = vpo_Parametros.mso_ObtenerPrametrosXId_Equipo(pvi_IdEquipo)

            If Not vlo_Parametros Is Nothing Then
                Return vlo_Parametros 'Retorno de función
            Else
                RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception
            RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try
    End Function

    Function fgo_ObtenerTemperaturaEquipo(ByVal pvi_IdEquipo As Integer, ByVal pvd_FechaIncio As Date, ByVal pvd_FechaTermino As Date)
        Try

            vpo_Temperatura = New DataSet_EquiposTableAdapters.TemperaturaTableAdapter

            Dim vlo_Temperatura As DataTable = vpo_Temperatura.mso_TemperaturaXId_Equipo(pvi_IdEquipo)

            If Not vlo_Temperatura Is Nothing Then
                Return vlo_Temperatura 'Retorno de función
            Else
                RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception
            RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try
    End Function



    Function fgo_ObtenerKPIXArea(ByVal pvi_IdArea As Integer, ByVal pvd_FechaIncio As Date, ByVal pvd_FechaTermino As Date)
        Try

            vpo_KPI = New DataSet_IndicadoresTableAdapters.KPI_QBXAreaTableAdapter

            'Obtención de Roles x Nombre
            Dim vlo_KPIxAreas As DataTable = vpo_KPI.mso_KPIxArea(pvi_IdArea, pvd_FechaIncio, pvd_FechaTermino)

            If Not vlo_KPIxAreas Is Nothing Then
                Return vlo_KPIxAreas 'Retorno de función
            Else
                RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
                Return Nothing
            End If

        Catch ex As Exception
            RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
            Return Nothing
        End Try
    End Function

#End Region

#Region "DIAS MAIL"

    'Function fgo_ObtenerDiasMailXId(ByVal pvi_Id As Integer)
    '    Try

    '        vpo_ConfiguracionDiasMail = New oDs_ConfiguracionesTableAdapters.Fecha_Envio_MailTableAdapter

    '        'Obtención de Roles x Nombre
    '        Dim vlo_ConfiguracionDias As DataTable = vpo_ConfiguracionDiasMail.mso_ObtenerConfiguracionXId(pvi_Id)

    '        If Not vlo_ConfiguracionDias Is Nothing Then
    '            Return vlo_ConfiguracionDias 'Retorno de función
    '        Else
    '            RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
    '            Return Nothing
    '        End If

    '    Catch ex As Exception
    '        RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
    '        Return Nothing
    '    End Try
    'End Function

    'Function fgo_ObtenerDiasMailXNombre(ByVal pvs_Nombre As String)
    '    Try

    '        vpo_ConfiguracionDiasMail = New oDs_ConfiguracionesTableAdapters.Fecha_Envio_MailTableAdapter

    '        'Obtención de Roles x Nombre
    '        Dim vlo_ConfiguracionDias As DataTable = vpo_ConfiguracionDiasMail.mso_BuscarValorXNombre(pvs_Nombre)

    '        If Not vlo_ConfiguracionDias Is Nothing Then
    '            Return vlo_ConfiguracionDias 'Retorno de función
    '        Else
    '            RaiseEvent eErrores(eNm_Errores.error_general)  'Activación de evento de error
    '            Return Nothing
    '        End If

    '    Catch ex As Exception
    '        RaiseEvent eErrores(eNm_Errores.error_general)      'Activación de evento de error
    '        Return Nothing
    '    End Try
    'End Function

    'Public Sub mgn_AgregarConfiguracionEnvioMail(ByVal pvs_Nombre As String, ByVal pvs_Valor As String, ByVal pvi_Estado As Integer)
    '    Try
    '        vpo_ConfiguracionDiasMail = New oDs_ConfiguracionesTableAdapters.Fecha_Envio_MailTableAdapter
    '        vpo_ConfiguracionDiasMail.min_AgregarConfiguracion(pvs_Nombre, pvs_Valor, pvi_Estado)

    '        RaiseEvent eCorrectos(eNm_Correctos.guardar_actualizar_rol)                 'Activación de evento de correcto
    '    Catch ex As Exception
    '        RaiseEvent eErrores(eNm_Errores.guardar_actualizar_rol)                     'Activación de evento de error
    '    End Try
    'End Sub

    'Public Sub mgn_ModificarValoresEnvioMail(ByVal pvi_Id As Integer, ByVal pvi_Estado As Integer, ByVal pvs_Nombre As String, ByVal pvs_Valor As String)
    '    Try
    '        vpo_ConfiguracionDiasMail = New oDs_ConfiguracionesTableAdapters.Fecha_Envio_MailTableAdapter
    '        vpo_ConfiguracionDiasMail.msu_CambiarValor(pvi_Id, pvs_Nombre, pvs_Valor, pvi_Id)

    '        RaiseEvent eCorrectos(eNm_Correctos.guardar_actualizar_rol)                 'Activación de evento de correcto
    '    Catch ex As Exception
    '        RaiseEvent eErrores(eNm_Errores.guardar_actualizar_rol)                     'Activación de evento de error
    '    End Try
    'End Sub


#End Region

#Region "Enumeradores"
    Public Enum eNm_Errores As Short
        error_general
        guardar_actualizar_rol
        guardar_actualizar_AccesoModulo
        guardar_actualizar_modulo
        eliminar_rol
        elimina_modulo
    End Enum
    Public Enum eNm_Correctos As Short
        guardar_actualizar_AccesoModulo
        guardar_actualizar_modulo
        guardar_actualizar_rol
        guardar_actualizar
        elimina_rol
        elimina_modulo
    End Enum
    Public Enum eNm_Validaciones As Short
        rol_no_existe
        rol_inactivo
        Modulo_inactivo
        GrupoModulo_Inactivo
    End Enum
#End Region

End Class
