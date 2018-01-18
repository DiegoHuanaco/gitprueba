'------------------------------------------------------------------------------
' <generado automáticamente>
'     Este código fue generado por una herramienta.
'
'     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
'     se vuelve a generar el código. 
' </generado automáticamente>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On


Partial Public Class frmAccesoRoles
    
    '''<summary>
    '''Control oULa_Principal.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oULa_Principal As Global.System.Web.UI.UpdatePanel
    
    '''<summary>
    '''Control oPl_Roles.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPl_Roles As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control oHf_IdRol.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oHf_IdRol As Global.System.Web.UI.WebControls.HiddenField
    
    '''<summary>
    '''Control Button1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Button1 As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control oCv_DdlId_Rol.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oCv_DdlId_Rol As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control oCv_DdlGrupoModulo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oCv_DdlGrupoModulo As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control oPnlModulos.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPnlModulos As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control oGv_BusquedaCuentaXNombre.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oGv_BusquedaCuentaXNombre As Global.System.Web.UI.WebControls.GridView
    
    '''<summary>
    '''Control oPb_Guardar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPb_Guardar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control oPl_CargadorAjax.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPl_CargadorAjax As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control oPl_HeaderCargadorAjax.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPl_HeaderCargadorAjax As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control oLb_TituloCargadorAjax.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oLb_TituloCargadorAjax As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control oPl_BodyCargadorAjax.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPl_BodyCargadorAjax As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control oIb_Cargando.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oIb_Cargando As Global.System.Web.UI.WebControls.Image
    
    '''<summary>
    '''Control oULa_MensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oULa_MensajeInformativo As Global.System.Web.UI.UpdatePanel
    
    '''<summary>
    '''Control oPl_MensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPl_MensajeInformativo As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control oPl_HeaderMensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPl_HeaderMensajeInformativo As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control oLb_TituloMensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oLb_TituloMensajeInformativo As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control oLk_CerrarMensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oLk_CerrarMensajeInformativo As Global.System.Web.UI.WebControls.LinkButton
    
    '''<summary>
    '''Control oPl_BodyMensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPl_BodyMensajeInformativo As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control oIb_ImagenMensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oIb_ImagenMensajeInformativo As Global.System.Web.UI.WebControls.Image
    
    '''<summary>
    '''Control oLb_MensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oLb_MensajeInformativo As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control oPl_FooterMensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oPl_FooterMensajeInformativo As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control oHf_MensajeInformativo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents oHf_MensajeInformativo As Global.System.Web.UI.WebControls.HiddenField
End Class
