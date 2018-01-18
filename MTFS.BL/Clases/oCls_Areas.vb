Imports System.Data.SqlClient
Imports MTFS.BL

Public Class oCls_Areas

#Region "Variables"

    Event eErrores(ByVal pveNm_Errores As eNm_Errores)
    Event eCorrectos(ByVal pveNm_Correctos As eNm_Correctos)
    Event eValidaciones(ByVal pveNm_Validacion As eNm_Validaciones)

    Private vpo_Areas As DataSet_AreasTableAdapters.AreasTableAdapter


#End Region

#Region "AREAS"


    Function fgo_ObtenerListadoAreas()
        Try

            vpo_Areas = New DataSet_AreasTableAdapters.AreasTableAdapter


            Dim vpo_DT_Areas As DataTable = vpo_Areas.mso_ListadoAreas()

            If Not vpo_DT_Areas Is Nothing Then
                Return vpo_DT_Areas 'Retorno de función
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

    Public Shared Widening Operator CType(v As oCls_Indicadores) As oCls_Areas
        Throw New NotImplementedException()
    End Operator
#End Region

End Class
