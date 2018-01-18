<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Usuario.aspx.vb" MasterPageFile="~/Site.Master" Inherits="BUDGET.WEB.Usuario"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">
        //Limpia formulario
        function fpn_LimpiaFormulario() {
            var vlo_CajaTextoDominio;
            var vlo_CajaTextoUsuario;
            var vlo_CajaTextoNombreUsuario;
            var vlo_CajaTextoApellidoUsuario;
            var vlo_CajaTextoEmail;
            var vlo_CajaTextoPass;
            var vlo_DropDownListEstado;
            var vlo_DropDownListROL;
            var vlo_oHf_IdUsuario;

            vlo_DropDownListROL = document.getElementById('<%=oCv_DdlId_Rol.ClientID%>')
            vlo_DropDownListEstado = document.getElementById('<%=oCv_DdlEstadoUsuario.ClientID%>');
            vlo_CajaTextoDominio = document.getElementById('<%=oTx_Dominio.ClientID%>');
            vlo_CajaTextoUsuario = document.getElementById('<%=oTx_Usuario.ClientID%>');
            vlo_CajaTextoNombreUsuario = document.getElementById('<%=oTx_NombreUsuario.ClientID%>');
            vlo_CajaTextoApellidoUsuario = document.getElementById('<%=oTx_ApellidoUsuario.ClientID%>');
            vlo_CajaTextoEmail = document.getElementById('<%=oTx_Email.ClientID%>');
            vlo_CajaTextoPass = document.getElementById('<%=oTx_Pass.ClientID%>');
            vlo_oHf_IdUsuario = document.getElementById('<%=oHf_IdUsuario.ClientID%>');

            vlo_oHf_IdUsuario.disable = false;
            vlo_oHf_IdUsuario.value = '';
            vlo_DropDownListROL.focus();
            vlo_DropDownListROL.disabled = false;
            vlo_DropDownListROL.value = 1;
            vlo_DropDownListEstado.disabled = false;
            vlo_DropDownListEstado.value = 1;
            vlo_CajaTextoDominio.disabled = false;
            vlo_CajaTextoUsuariodisabled = false;
            vlo_CajaTextoNombreUsuariodisabled = false;
            vlo_CajaTextoApellidoUsuariodisabled = false;
            vlo_CajaTextoEmaildisabled = false;
            vlo_CajaTextoPassdisabled = false;
            vlo_CajaTextoDominio.value = '';
            vlo_CajaTextoUsuario.value = '';
            vlo_CajaTextoNombreUsuario.value = '';
            vlo_CajaTextoApellidoUsuario.value = '';
            vlo_CajaTextoEmail.value = '';
            vlo_CajaTextoPass.value = '';



        }
        //Asignación de foco a control
        function fpn_AsignacionFoco(pvs_IDControl) {
            var vlo_Control;

            vlo_Control = document.getElementById(pvs_IDControl);

            if (!vlo_Control.disabled) {
                vlo_Control.focus();
            }
        }
        function oPb_Limpiar_onclick() {

        } 



    </script>
 
    <cc1:ToolkitScriptManager ID="oSMa_Principal" runat="server"></cc1:ToolkitScriptManager>

    <%--Contenido de la Pagina--%>
    <asp:UpdatePanel ID="oULa_Principal" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="oPl_Roles" runat="server" 
                GroupingText="Administración de Usuarios" >
                <asp:HiddenField ID="oHf_IdRol" runat="server" />
                <asp:HiddenField ID="oHf_IdUsuario" runat="server" />
                <table class="tabla_general_form">
                    <tr>
    	                <td class="columna_etiquetado">Rol:</td>
    	                <td class="columna_control">
                             <asp:DropDownList ID="oCv_DdlId_Rol" runat="server" Width="160px" 
                                 DataTextField="Nombre_Rol" 
                                 DataValueField="Id_Rol">
                                
                             
                            </asp:DropDownList>
                          
                        </td>
                                           	
                    </tr>
                     <tr>
    	                <td class="columna_etiquetado">Estados:</td>
    	                <td class="columna_control">
                            <asp:DropDownList ID="oCv_DdlEstadoUsuario" runat="server" Width="160px" 
                                meta:resourcekey="oCv_DdlEstadoUsuarioResource1">
                                <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">Activo</asp:ListItem>
                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource3">Inactivo</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="Button1" runat="server" Text="Button" />
                        </td>
                                 	
                    </tr>
                     <tr>
    	                <td class="columna_etiquetado">Dominio:</td>
    	                <td class="columna_control">
                            <asp:TextBox ID="oTx_Dominio" 
                                runat="server" MaxLength="50" meta:resourcekey="oTx_DominioResource1" />
                        </td>
                        <td class="columna_asterisco">
                        <asp:RequiredFieldValidator ID="oRFv_Dominio" runat="server" 
                                ErrorMessage="Debe de ingresar el <strong>Dominio</strong> para poder guardarlo" ControlToValidate="oTx_Dominio" SetFocusOnError="True" 
                                ValidationGroup="vpg_IngresarRol" display="None" /> 
                        <cc1:ValidatorCalloutExtender ID="oRFv_Dominio_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="oRFv_Dominio"  />
                                </td>
                                       	
                    </tr>
                    <tr>
    	                <td class="columna_etiquetado">Usuario:</td>
    	                <td class="columna_control"><asp:TextBox ID="oTx_Usuario" 
                                runat="server" MaxLength="50" meta:resourcekey="oTx_UsuarioResource1" />
                        </td>
                        <td class="columna_asterisco" colspan="7">
                         <asp:ImageButton ID="oIb_BuscarXCuenta" runat="server" ToolTip="Buscar Roles"
                           ImageUrl="~/App_Themes/plantilla_uno/Imagenes/lupa.gif" />
                           <asp:RequiredFieldValidator ID="oRFv_Usuario" runat="server" ErrorMessage="Debe de ingresar el <strong>Usuario</strong> para poder guardarlo." ControlToValidate="oTx_Usuario" SetFocusOnError="True" ValidationGroup="vpg_IngresarRol" Display="None" />   
                        <cc1:ValidatorCalloutExtender ID="oRFv_Usuario_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="oRFv_Usuario"  />
                        </td>  
                         
                                        	
                    </tr>
                    <tr>
    	                <td class="columna_etiquetado">Nombre Usuario:</td>
    	                <td class="columna_control"><asp:TextBox ID="oTx_NombreUsuario" 
                                runat="server" MaxLength="50" meta:resourcekey="oTx_NombreUsuarioResource1" />
                        </td>
                        <td class="columna_asterisco" colspan="7">
                        <asp:RequiredFieldValidator ID="oRFv_NombreUsuario" runat="server" ErrorMessage="Debe de ingresar el <strong>Nombre de Usuario</strong> para poder guardarlo." ControlToValidate="oTx_NombreUsuario" SetFocusOnError="True" ValidationGroup="vpg_IngresarRol" Display="None"/>
                          <cc1:ValidatorCalloutExtender ID="oRFv_NombreUsuario_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="oRFv_NombreUsuario"  />
                        </td>
                                        	
                    </tr>
                    <tr>
    	                <td class="columna_etiquetado">Apellido Usuario:</td>
    	                <td class="columna_control"><asp:TextBox ID="oTx_ApellidoUsuario" 
                                runat="server" MaxLength="50" meta:resourcekey="oTx_ApellidoUsuarioResource1" />
                        </td>
                        <td class="columna_asterisco" colspan="7">
                        <asp:RequiredFieldValidator ID="oRFv_ApellidoUsuario" runat="server" ErrorMessage="Debe de ingresar el <strong>Apellido del Usuario</strong> para poder guardarlo." ControlToValidate="oTx_ApellidoUsuario" SetFocusOnError="True" ValidationGroup="vpg_IngresarRol" Display="None"/>
                        <cc1:ValidatorCalloutExtender ID="oRFv_ApellidoUsuario_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="oRFv_ApellidoUsuario"  />
                        </td>
                                         	
                    </tr>
                    <tr>
    	                <td class="columna_etiquetado">Email:</td>
    	                <td class="columna_control">
                            <asp:TextBox ID="oTx_Email" runat="server" 
                                MaxLength="50" meta:resourcekey="oTx_EmailResource1" Width="157px" />
                        </td>
                        <td class="columna_asterisco" colspan="7">
                        <asp:RequiredFieldValidator ID="oRFv_Email" runat="server" ErrorMessage="Debe de ingresar el <strong>Email</strong> para poder guardarlo." ControlToValidate="oTx_Email" SetFocusOnError="True" ValidationGroup="vpg_IngresarRol" Display="None"/>
                        <cc1:ValidatorCalloutExtender ID="oRFv_Email_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="oRFv_Email"  />
                        
                   <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" Enabled="True" TargetControlID="oRev_ValidaNum" />
                            <asp:RegularExpressionValidator id="oRev_ValidaNum" runat="server" 
                                
                                
                                ErrorMessage="&lt;strong&gt;ejemplo@ejemplo.com&lt;/strong&gt; El email debe cumplir con este formato." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ControlToValidate="oTx_Email" Display="None" 
                                ValidationGroup="vpg_IngresarRol" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                                          	
                    </tr>
                    <tr>
    	                <td class="columna_etiquetado">Pass:</td>
    	                <td class="columna_control"><asp:TextBox ID="oTx_Pass" runat="server" 
                                MaxLength="20" meta:resourcekey="oTx_PassResource1" />
                        </td>
                        <td class="columna_asterisco" colspan="7">
                        <asp:RequiredFieldValidator ID="oRFv_Pass" runat="server" ErrorMessage="Debe de ingresar la <strong>Pass</strong> para poder guardarlo." ControlToValidate="oTx_Pass" SetFocusOnError="True" ValidationGroup="vpg_IngresarRol" Display="None"/>
                        <cc1:ValidatorCalloutExtender ID="oRFv_Pass_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="oRFv_Pass"  />
                        </td>
                                          	
                    </tr>
                    <tr>
                        <td colspan="4" align="right">
                                                  
                        </td>
                        <td><asp:Button ID="oPb_Guardar" runat="server" Text="Guardar" ToolTip="Guardar" 
                                ValidationGroup="vpg_IngresarRol" meta:resourcekey="oPb_GuardarResource1" />
                            <asp:Button ID="oPb_Eliminar" runat="server" Text="Eliminar" ToolTip="Eliminar" 
                                ValidationGroup="vpg_EliminacionCliente" 
                                meta:resourcekey="oPb_EliminarResource1" />
                            <input id="oPb_Limpiar" type="button" value="Limpiar" onclick="fpn_LimpiaFormulario();" class="botones" title="Limpiar" />      </td>
                        
                    </tr>
                </table>                        
            </asp:Panel>  
                                            
            <asp:Panel ID="oPl_MensajePreguntaEliminacionRol" runat="server" 
                SkinID="modal_popup_cargador_contenedor_skin" style="display:none;" 
                meta:resourcekey="oPl_MensajePreguntaEliminacionRolResource1">                
                <div class="modal_popup_overlay">
                    <asp:Panel ID="oPl_HeaderMensajePreguntaEliminacionRol" runat="server" 
                        SkinID="modal_popup_header_skin" 
                        meta:resourcekey="oPl_HeaderMensajePreguntaEliminacionRolResource1">
                        <asp:Label ID="oLb_TituloMensajePreguntaEliminacionRol" runat="server" 
                            CssClass="modal_popup_titulo" Text="Pregunta" 
                            meta:resourcekey="oLb_TituloMensajePreguntaEliminacionRolResource1" />                        
                        <asp:LinkButton ID="oLk_CerrarMensajePreguntaEliminacionRol" runat="server" 
                            CssClass="modal_popup_cerrar" ToolTip="Cerrar" 
                            meta:resourcekey="oLk_CerrarMensajePreguntaEliminacionRolResource1" />
                    </asp:Panel>
                    <asp:Panel ID="oPl_BodyMensajePreguntaEliminacionRol" runat="server" 
                        SkinID="modal_popup_cargador_body_skin" 
                        meta:resourcekey="oPl_BodyMensajePreguntaEliminacionRolResource1">
                        <table>
                            <tr>
                                <td>
                                    <asp:Image ID="oIb_ImagenMensajePreguntaEliminacionRol" runat="server" 
                                        ImageUrl="~/App_Themes/plantilla_uno/imagenes/icono_pregunta.gif" 
                                        meta:resourcekey="oIb_ImagenMensajePreguntaEliminacionRolResource1" />
                                </td>
                                <td>
                                    <asp:Label ID="oLb_MensajePreguntaEliminacionRol" runat="server" 
                                        Text="Esta a punto de eliminar una Cuenta, ¿Desea continuar?" 
                                        SkinID="mensaje_informativo"> 
                                        </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="oPl_FooterMensajePreguntaEliminacionRol" runat="server" 
                        SkinID="modal_popup_footer_mensaje_skin" 
                        meta:resourcekey="oPl_FooterMensajePreguntaEliminacionRolResource1">
                        <asp:Button ID="oPb_EliminarRolSi" runat="server" Text="Si" ToolTip="Si" 
                            Width="40px" meta:resourcekey="oPb_EliminarRolSiResource1" />
                        <asp:Button ID="oPb_EliminarRolNo" runat="server" Text="No" ToolTip="No" 
                            Width="40px" meta:resourcekey="oPb_EliminarRolNoResource1" />                 
                    </asp:Panel>
                </div>
            </asp:Panel>
            <cc1:ModalPopupExtender ID="oMPa_MensajePreguntaEliminacionRol" runat="server" 
                CancelControlID="oLk_CerrarMensajePreguntaEliminacionRol" 
                OkControlID="oPb_EliminarRolNo" 
                PopupControlID="oPl_MensajePreguntaEliminacionRol" 
                TargetControlID="oHf_MensajePreguntaEliminacionRol" 
                PopupDragHandleControlID="oPl_HeaderMensajePreguntaEliminacionRol" 
                DynamicServicePath="" Enabled="True" />
            <asp:HiddenField ID="oHf_MensajePreguntaEliminacionRol" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>     
        

  <%--PopUp Busqueda de Roles--%>
    <asp:UpdatePanel ID="oULa_BusquedaCuentaXNombre" runat="server">
        <ContentTemplate>
            <asp:Panel ID="oPl_PopupBusquedaCuentaXNombre" runat="server" SkinID="modal_popup_contenedor_skin" style="display:inherit;">
                <div class="modal_popup_overlay">
                    <asp:Panel ID="oPl_HeaderPopupBusquedaCuentaXNombre" runat="server" SkinID="modal_popup_header_skin">
                        <asp:Label ID="oLb_TituloPopupBusquedaCuentaXNombre" runat="server" CssClass="modal_popup_titulo" Text="Búsqueda" />
                        <asp:LinkButton ID="oLk_CerrarPopupBusquedaCuentaXNombre" runat="server" CssClass="modal_popup_cerrar" ToolTip="Cerrar" OnClientClick="$find('oMPa_BusquedaCuentaXNombreBehaviorID').hide(); return false;" />
                    </asp:Panel>                                  
                    <asp:Panel ID="oPl_BodyPopupBusquedaCuentaXNombre" runat="server" SkinID="modal_popup_body_skin">
                        <table class="tabla_general_form">
                            <tr>
                                <td class="columna_etiquetado"><asp:Label ID="oLb_NombreBusquedaCuenta" runat="server" Text="Nombre:" /></td>
                                <td class="columna_control"><asp:TextBox ID="oTx_ParametroBusquedaCuentaXNombre" runat="server" /></td>
                                <td class="columna_asterisco">*</td>
                                <td class="columna_boton"><asp:Button ID="oPb_BuscarCuentaXNombre" runat="server" Text="Buscar" ToolTip="Buscar" /></td>                	                        
                            </tr>
                        </table>
                        <hr />
                        <asp:Panel ID="oPl_ContenedorGridviewBusquedaCuentaXNombre" runat="server" SkinID="contenedor_gridview">
                            <div class="contenedor_gridview">
                                <asp:GridView ID="oGv_BusquedaCuentaXNombre" runat="server" AutoGenerateColumns="False" Caption="Usuario">                                    
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="oIb_SeleccionarFilaGridView" runat="server" CausesValidation="False" 
                                                    CommandName="Select" 
                                                    ImageUrl="~/App_Themes/plantilla_uno/imagenes/seleccionar.gif" 
                                                    AlternateText="Seleccionar" ToolTip="Seleccionar" />
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" Width="30px" />
                                            <ItemStyle Wrap="False" Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Id_Usuario" HeaderText="ID Usuario">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Nombre_Rol" HeaderText="Nombre Rol">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Estado" HeaderText="Estado Usuario">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Usuario" HeaderText="Usuario">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="Nombre_Usuario" HeaderText="Nombre Usuario">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="Apellido_Usuario" HeaderText="Apellido Usuario">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                           
                                    </Columns>
                                    <PagerTemplate>                                        
                                        Página:&nbsp;&nbsp;<asp:DropDownList CssClass="gridview_style_listado_de_pag" ID="oCb_ListadoDePaginas" runat="server" AutoPostBack="True" onselectedindexchanged="oCb_ListadoDePaginas_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                        <asp:Button ID="oPb_PagPrimeraGrillaBusquedaCuentaXNombre" runat="server" SkinID="primera_pagina" CommandName="Page" CommandArgument="First" />                    
                                        <asp:Button ID="oPb_PagAnteriorGrillaBusquedaCuentaXNombre" runat="server" SkinID="pagina_anterior" CommandName="Page" CommandArgument="Prev" />    
                                        <asp:Button ID="oPb_PagSiguienteGrillaBusquedaCuentaXNombre" runat="server" SkinID="pagina_siguiente" CommandName="Page" CommandArgument="Next" />                        
                                        <asp:Button ID="oPb_PagUltimaGrillaBusquedaCuentaXNombre" runat="server" SkinID="ultima_pagina" CommandName="Page" CommandArgument="Last" />                      
                                    </PagerTemplate>            
                                </asp:GridView>
                            </div>                            
                        </asp:Panel>                        
                    </asp:Panel>
                    <asp:Panel ID="oPl_FooterPopupBusquedaCuentaXNombre" runat="server" SkinID="modal_popup_footer_skin">
                        <asp:Button ID="oPb_CerrarBusquedaCuentaXNombre" runat="server" Text="Cerrar" ToolTip="Cerrar" />
                    </asp:Panel>
                </div>                            
            </asp:Panel>
            <cc1:ModalPopupExtender ID="oMPa_BusquedaCuentaXNombre" runat="server" PopupControlID="oPl_PopupBusquedaCuentaXNombre" TargetControlID="oHf_BusquedaCuentaXNombre" CancelControlID="oPb_CerrarBusquedaCuentaXNombre" BehaviorID="oMPa_BusquedaCuentaXNombreBehaviorID" />
            <asp:HiddenField ID="oHf_BusquedaCuentaXNombre" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <%--UpdatePanelAnimationExtender--%>
    <cc1:UpdatePanelAnimationExtender ID="oUAa_Principal" runat="server" TargetControlID="oULa_Principal">
        <Animations>
            <OnUpdating>
                <Parallel duration="0">                    
                    <ScriptAction Script="fgn_Updating('oMPa_CargadorAjax_BehaviorID');" /> 
                 </Parallel>
            </OnUpdating>
            <OnUpdated>
                <Parallel duration="0">                    
                    <ScriptAction Script="fgn_Updated('oMPa_CargadorAjax_BehaviorID');" />
                </Parallel> 
            </OnUpdated>
        </Animations>
    </cc1:UpdatePanelAnimationExtender>        
    <cc1:UpdatePanelAnimationExtender ID="oUAa_BusquedaCuentaXNombre" runat="server" TargetControlID="oULa_BusquedaCuentaXNombre">
        <Animations>
            <OnUpdating>
                <Parallel duration="0">                    
                    <ScriptAction Script="fgn_Updating('oMPa_CargadorAjax_BehaviorID');" /> 
                 </Parallel>
            </OnUpdating>
            <OnUpdated>
                <Parallel duration="0">                    
                    <ScriptAction Script="fgn_Updated('oMPa_CargadorAjax_BehaviorID');" />
                </Parallel> 
            </OnUpdated>
        </Animations>
    </cc1:UpdatePanelAnimationExtender> 
 
        
    <%--Mensaje Cargando--%>
    <asp:Panel ID="oPl_CargadorAjax" runat="server" 
        SkinID="modal_popup_cargador_contenedor_skin" style="display:none;" 
        meta:resourcekey="oPl_CargadorAjaxResource1">                
        <div class="modal_popup_overlay">
            <asp:Panel ID="oPl_HeaderCargadorAjax" runat="server" 
                SkinID="modal_popup_header_skin" 
                meta:resourceKey="oPl_HeaderCargadorAjaxResource1">
                <asp:Label ID="oLb_TituloCargadorAjax" runat="server" 
                    CssClass="modal_popup_titulo" Text="Cargando..." 
                    meta:resourceKey="oLb_TituloCargadorAjaxResource1" />                        
            </asp:Panel>                                  
            <asp:Panel ID="oPl_BodyCargadorAjax" runat="server" 
                SkinID="modal_popup_cargador_body_skin" 
                meta:resourceKey="oPl_BodyCargadorAjaxResource1">                
                <asp:Image ID="oIb_Cargando" runat="server" SkinID="cargador_ajax" 
                    meta:resourceKey="oIb_CargandoResource1" />
            </asp:Panel>
        </div>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="oMPa_CargadorAjax" runat="server" 
        PopupControlID="oPl_CargadorAjax" TargetControlID="oPl_CargadorAjax" 
        BehaviorID="oMPa_CargadorAjax_BehaviorID" SkinID="cargador_ajax" 
        DynamicServicePath="" Enabled="True" />
        
    <%--Mensaje Informativo--%>
    <asp:UpdatePanel ID="oULa_MensajeInformativo" runat="server" UpdateMode="Conditional">
        <ContentTemplate>    
            <asp:Panel ID="oPl_MensajeInformativo" runat="server" 
                SkinID="modal_popup_cargador_contenedor_skin" style="display:none;" 
                meta:resourcekey="oPl_MensajeInformativoResource1">                
                <div class="modal_popup_overlay">
                    <asp:Panel ID="oPl_HeaderMensajeInformativo" runat="server" 
                        SkinID="modal_popup_header_skin" 
                        meta:resourcekey="oPl_HeaderMensajeInformativoResource1">
                        <asp:Label ID="oLb_TituloMensajeInformativo" runat="server" 
                            CssClass="modal_popup_titulo" Text="Mensaje" 
                            meta:resourcekey="oLb_TituloMensajeInformativoResource1" />                        
                        <asp:LinkButton ID="oLk_CerrarMensajeInformativo" runat="server" 
                            CssClass="modal_popup_cerrar" ToolTip="Cerrar" 
                            meta:resourcekey="oLk_CerrarMensajeInformativoResource1" />
                    </asp:Panel>
                    <asp:Panel ID="oPl_BodyMensajeInformativo" runat="server" 
                        SkinID="modal_popup_cargador_body_skin" 
                        meta:resourcekey="oPl_BodyMensajeInformativoResource1">
                        <table>
                            <tr>
                                <td>
                                    <asp:Image ID="oIb_ImagenMensajeInformativo" runat="server" 
                                        ImageUrl="~/App_Themes/plantilla_uno/imagenes/icono_informacion.gif" 
                                        meta:resourcekey="oIb_ImagenMensajeInformativoResource1" />
                                </td>
                                <td>
                                    <asp:Label ID="oLb_MensajeInformativo" runat="server" 
                                        Text="El Rol buscado no existe." SkinID="mensaje_informativo" 
                                        meta:resourcekey="oLb_MensajeInformativoResource1"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="oPl_FooterMensajeInformativo" runat="server" 
                        SkinID="modal_popup_footer_mensaje_skin" 
                        meta:resourcekey="oPl_FooterMensajeInformativoResource1">
                        <input id="oPb_AceptarMensajeInformativo" type="button" value="Aceptar" title="Aceptar" class="botones"/></asp:Panel>
                </div>
            </asp:Panel>
            <cc1:ModalPopupExtender ID="oMPa_MensajeInformativo" runat="server" 
                OkControlID="oPb_AceptarMensajeInformativo" 
                CancelControlID="oLk_CerrarMensajeInformativo" 
                PopupControlID="oPl_MensajeInformativo" 
                TargetControlID="oHf_MensajeInformativo" 
                PopupDragHandleControlID="oPl_HeaderMensajeInformativo" 
                BehaviorID="oMPa_MensajeInformativo_BehaviorID" DynamicServicePath="" 
                Enabled="True" />
            <asp:HiddenField ID="oHf_MensajeInformativo" runat="server" /> 
        </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>

