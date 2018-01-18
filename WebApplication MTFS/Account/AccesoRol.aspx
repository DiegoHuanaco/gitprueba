<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AccesoRol.aspx.vb" Inherits="WebApplication_MTFS.frmAccesoRoles"   %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>

<%--<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
       <script type="text/javascript">

    </script>
</asp:Content>--%>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
  <%--  <cc1:ToolkitScriptManager ID="oSMa_Principal" runat="server"></cc1:ToolkitScriptManager>--%>

    <%--Mensaje Informativo--%>
    <asp:UpdatePanel ID="oULa_Principal" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="oPl_Roles" runat="server" 
                GroupingText="Administración de Accesos" >
                <asp:HiddenField ID="oHf_IdRol" runat="server" />
                <table class="tabla_general_form">
                    <tr>
    	                <td class="columna_etiquetado">Rol:</td>
                        <asp:Button ID="Button1" runat="server" Text="Button" />
    	                <td class="columna_control">
                             
                                <asp:DropDownList ID="oCv_DdlId_Rol" runat="server" Width="160px" 
                                 DataTextField="Nombre_Rol" 
                                 DataValueField="Id_Rol" AutoPostBack="True"> </asp:DropDownList>  
                        </td>
                            	
                    </tr>
                      <tr>
    	                <td class="columna_etiquetado">Grupo Modulo:</td>
    	                <td class="columna_control">
                             
                                <asp:DropDownList ID="oCv_DdlGrupoModulo" runat="server" Width="160px" 
                                 DataTextField="Nombre_Modulo" 
                                 DataValueField="Id_Modulo" AutoPostBack="True"> </asp:DropDownList>  
                        </td>
                        <td class="columna_asterisco">
                        </td>          	
                    </tr>
                     <tr>
    	                <td class="columna_etiquetado">Acceso Roles:</td>
    	                <td class="columna_control" >
                            <asp:Panel ID="oPnlModulos" runat="server" Height="350px" ScrollBars="Vertical">
                                <asp:GridView ID="oGv_BusquedaCuentaXNombre" runat="server" AutoGenerateColumns="False" Caption="Modulos de Sistema" Width="595px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Nombre Modulo">
                                            <ItemTemplate>
                                                <asp:Label ID="LblNombreModulo" runat="server" Text='<%# Bind("Nombre_Modulo") %>'></asp:Label>
                                                <asp:HiddenField ID="oHfIdModulo" runat="server" Value='<%# Bind("Id_Modulo") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Acceso">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cBxAcceso" runat="server" Checked='<%# Bind("Acceso") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Modifica">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cBxModifica" runat="server" Checked='<%# Bind("Modifica") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Elimina">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cBxElimina" runat="server" Checked='<%# Bind("Elimina") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerTemplate>
                                        Página:&nbsp;&nbsp;<asp:DropDownList ID="oCb_ListadoDePaginas" runat="server" AutoPostBack="True" CssClass="gridview_style_listado_de_pag" onselectedindexchanged="oCb_ListadoDePaginas_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:Button ID="oPb_PagPrimeraGrillaBusquedaCuentaXNombre" runat="server" CommandArgument="First" CommandName="Page" SkinID="primera_pagina" />
                                        <asp:Button ID="oPb_PagAnteriorGrillaBusquedaCuentaXNombre" runat="server" CommandArgument="Prev" CommandName="Page" SkinID="pagina_anterior" />
                                        <asp:Button ID="oPb_PagSiguienteGrillaBusquedaCuentaXNombre" runat="server" CommandArgument="Next" CommandName="Page" SkinID="pagina_siguiente" />
                                        <asp:Button ID="oPb_PagUltimaGrillaBusquedaCuentaXNombre" runat="server" CommandArgument="Last" CommandName="Page" SkinID="ultima_pagina" />
                                    </PagerTemplate>
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                         <td class="columna_asterisco" > 
    
                        </td>
                                 	
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <asp:Button ID="oPb_Guardar" runat="server" Text="Guardar" ToolTip="Guardar" 
                                Width="70px"  />                           
                        </td>
                        
                    </tr>
                </table>                        
            </asp:Panel>  
        </ContentTemplate>
    </asp:UpdatePanel>     
        



   <%--UpdatePanelAnimationExtender--%>
    <cc1:updatepanelanimationextender ID="oUAa_Principal" runat="server" TargetControlID="oULa_Principal">
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
    </cc1:updatepanelanimationextender>        

     <%--Mensaje Cargando--%>
    <asp:Panel ID="oPl_CargadorAjax" runat="server" SkinID="modal_popup_cargador_contenedor_skin" style="display:none;">                
        <div class="modal_popup_overlay">
            <asp:Panel ID="oPl_HeaderCargadorAjax" runat="server" SkinID="modal_popup_header_skin">
                <asp:Label ID="oLb_TituloCargadorAjax" runat="server" CssClass="modal_popup_titulo" Text="Cargando..." />                        
            </asp:Panel>                                  
            <asp:Panel ID="oPl_BodyCargadorAjax" runat="server" SkinID="modal_popup_cargador_body_skin">                
                <asp:Image ID="oIb_Cargando" runat="server" SkinID="cargador_ajax" />
            </asp:Panel>
        </div>
    </asp:Panel>
    <cc1:modalpopupextender ID="oMPa_CargadorAjax" runat="server" PopupControlID="oPl_CargadorAjax" TargetControlID="oPl_CargadorAjax" BehaviorID="oMPa_CargadorAjax_BehaviorID" SkinID="cargador_ajax" />
        
    <%--Mensaje Informativo--%>
    <asp:UpdatePanel ID="oULa_MensajeInformativo" runat="server" UpdateMode="Conditional">
        <ContentTemplate>    
            <asp:Panel ID="oPl_MensajeInformativo" runat="server" SkinID="modal_popup_cargador_contenedor_skin" style="display:none;">                
                <div class="modal_popup_overlay">
                    <asp:Panel ID="oPl_HeaderMensajeInformativo" runat="server" SkinID="modal_popup_header_skin">
                        <asp:Label ID="oLb_TituloMensajeInformativo" runat="server" CssClass="modal_popup_titulo" Text="Mensaje" />                        
                        <asp:LinkButton ID="oLk_CerrarMensajeInformativo" runat="server" CssClass="modal_popup_cerrar" ToolTip="Cerrar" />
                    </asp:Panel>
                      <asp:Panel ID="oPl_BodyMensajeInformativo" runat="server" SkinID="modal_popup_cargador_body_skin">
                        <table>
                            <tr>
                                <td>
                                    <asp:Image ID="oIb_ImagenMensajeInformativo" runat="server" ImageUrl="~/App_Themes/plantilla_uno/imagenes/icono_informacion.gif" />
                                </td>
                                <td>
                                    <asp:Label ID="oLb_MensajeInformativo" runat="server" Text="Acceso Modulo Guardado." SkinID="mensaje_informativo"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="oPl_FooterMensajeInformativo" runat="server" SkinID="modal_popup_footer_mensaje_skin">
                        <input id="oPb_AceptarMensajeInformativo" type="button" value="Aceptar" title="Aceptar" class="botones" /></asp:Panel>
                </div>
            </asp:Panel>
            <cc1:ModalPopupExtender ID="oMPa_MensajeInformativo" runat="server" OkControlID="oPb_AceptarMensajeInformativo" CancelControlID="oLk_CerrarMensajeInformativo" PopupControlID="oPl_MensajeInformativo" TargetControlID="oHf_MensajeInformativo" PopupDragHandleControlID="oPl_HeaderMensajeInformativo" BehaviorID="oMPa_MensajeInformativo_BehaviorID" />
            <asp:HiddenField ID="oHf_MensajeInformativo" runat="server" /> 
        </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>

