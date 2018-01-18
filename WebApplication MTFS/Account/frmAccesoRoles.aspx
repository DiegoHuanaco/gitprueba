<%@ Page Title=""  Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="frmAccesoRoles.aspx.vb" Inherits="WebApplication_MTFS.frmAccesoRoles" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <asp:UpdatePanel id="UpdatePanel1" runat="server">
            <ContentTemplate>
                <fieldset>
                <%--<legend>Administracion de Acceso a Roles y Modulos</legend>--%>
<div class="col-lg-11 col-md-11">
    
 <div class="panel panel-default" style="height:500px;">
  <div class="panel-heading">Administracion de Acceso a Roles y Modulos</div>
<div class="panel-body" >
   <div class="form-horizontal">     
<%--<%– inicio de formulario -%>--%>

     <asp:HiddenField ID="oHf_IdRol" runat="server" />
       <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label1" runat="server"  Text="Label" CssClass="lbl lbl-info">Roles</asp:Label>
            </div>
            <div class="col-lg-3 col-md-3">
                 <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="form-control required" AutoPostBack="True" >
                                
                  </asp:DropDownList>
                
            </div>
            <div class="col-lg-3 col-md-3">
                
                 
            </div>
          
       </div>
        <div class="row">
              <div class="col-lg-1 col-md-1">
                
            </div>
             <div class="col-lg-2 col-md-2"> 
               <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                 ControlToValidate="DropDownList1"   
                                 ErrorMessage="Debe de seleccionar un &lt;strong&gt;Estado&lt;/strong&gt;." 
                                 Operator="NotEqual" ValidationGroup="vpg_IngresarRol" ValueToCompare="-1"></asp:CompareValidator>
            </div>
         </div>
     <%--cierre campo roles--%>
    <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label3" runat="server"  Text="Label" CssClass="lbl lbl-info">Modulos</asp:Label>
            </div>
            <div class="col-lg-3 col-md-3">
                 <asp:DropDownList ID="DropDownList2" runat="server"  CssClass="form-control required" AutoPostBack="True" >
                               
                  </asp:DropDownList>
                
            </div>
            <div class="col-lg-3 col-md-3">
                
                 
            </div>
          
     </div>
       <div class="row">
              <div class="col-lg-1 col-md-1">
                
            </div>
             <div class="col-lg-2 col-md-2"> 
              <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                 ControlToValidate="DropDownList2"   
                                 ErrorMessage="Debe de seleccionar un &lt;strong&gt;Estado&lt;/strong&gt;." 
                                 Operator="NotEqual" ValidationGroup="vpg_IngresarRol" ValueToCompare="-1"></asp:CompareValidator>
            </div>
      </div>
  <%--cierre campo Modulos--%>

   
  
  <div class="form-group">
        <div class="col-lg-1 col-md-1">
            </div>
       <div class="col-lg-2 col-md-2">
                <asp:LinkButton ID="obn_GuardaAccesoRol" CssClass="form-control btn btn-primary btn-xs" runat="server"  CausesValidation="True" ValidationGroup="vpg_IngresarRol"  >Guardar</asp:LinkButton>
                <ajaxToolkit:AnimationExtender ID="AnimationExtenderLogin" TargetControlID="obn_GuardaAccesoRol" runat="server">
                                                <Animations>
                                                    <OnLoad>  
                                                        <Sequence>  
                                                        <Color   
                                                            AnimationTarget="oPanelMensaje"   
                                                            Duration="2"   
                                                            Property="style"   
                                                            PropertyKey="backgroundColor"  
                                                            StartValue="#cce0ff"   
                                                            EndValue="#005ce6" />   
                                                        </Sequence>  
                                                    </OnLoad> 
                                                </Animations>
                                                </ajaxToolkit:AnimationExtender>
            </div> 
      
    </div>
       <div class="form-group"></div>
       <div class="form-group"></div>

<%--<%– fin de formulario -%>--%>  
    <%--<%– inicio de panel y grilla -%>--%>
  
<div class="form-group">
 <div class="col-lg-1 col-md-1"></div>
  <div class="col-lg-8 col-md-8">
    <asp:Panel ID="Panel1" runat="server" CssClass="form_control"  style="height:150px;overflow-x :hidden;overflow-y :auto; ">
     
         <asp:GridView ID="oGv_ListadoAccesoRol" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" Caption="Modulos de Sistema"  >
                                    <Columns>
                                        <asp:TemplateField HeaderText="Nombre Modulo" >
                                            <ItemTemplate>
                                                <asp:Label ID="LblNombreModulo"  runat="server" Text='<%# Bind("Nombre_Modulo") %>'></asp:Label>
                                                <asp:HiddenField ID="oHfIdModulo" runat="server" Value='<%# Bind("Id_Modulo") %>' />
                                                <asp:HiddenField ID="oHfIdRol" runat="server" Value='<%# Bind("Id_Rol") %>' />
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
                                        <%--Página:&nbsp;&nbsp;<asp:DropDownList ID="oCb_ListadoDePaginas" runat="server" AutoPostBack="True" CssClass="gridview_style_listado_de_pag" onselectedindexchanged="oCb_ListadoDePaginas_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:Button ID="oPb_PagPrimeraGrillaBusquedaCuentaXNombre" runat="server" CommandArgument="First" CommandName="Page" SkinID="primera_pagina" />
                                        <asp:Button ID="oPb_PagAnteriorGrillaBusquedaCuentaXNombre" runat="server" CommandArgument="Prev" CommandName="Page" SkinID="pagina_anterior" />
                                        <asp:Button ID="oPb_PagSiguienteGrillaBusquedaCuentaXNombre" runat="server" CommandArgument="Next" CommandName="Page" SkinID="pagina_siguiente" />
                                        <asp:Button ID="oPb_PagUltimaGrillaBusquedaCuentaXNombre" runat="server" CommandArgument="Last" CommandName="Page" SkinID="ultima_pagina" />--%>
                                    </PagerTemplate>
                                </asp:GridView>
       
      
    </asp:Panel>
      <%-- <%– fin de panel y grilla -%>--%>
   </div>   <%--fin div col 8--%>
  </div>   <%--fin form group--%>
   <%--fin class row--%>

    <div class="form-group">  </div>
    
    <div class="form-group"> </div>
    <%--<div class="form-group">
        <div class="col-lg-1 col-md-1">
            </div>
       <div class="col-lg-2 col-md-2">
                <asp:LinkButton ID="obn_GuardaAccesoRol" CssClass="form-control btn btn-primary btn-xs" runat="server"  CausesValidation="True" ValidationGroup="vpg_IngresarRol"  >Guardar</asp:LinkButton>
       </div> 
      
    </div>--%>
    
  <%--cierre campo Modulos--%>

   
   
   <%-- <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="TestLinkButton" BackgroundCssClass="modalBackround" CancelControlID="Button5" CacheDynamicResults="True" RepositionMode="RepositionOnWindowResize"></ajaxToolkit:ModalPopupExtender>--%>
  </div>  <%--fin cierre form horizontal--%> 
</div> <%--fin panel body--%>
    

</div>  <%--fin panel panel default--%>
</div>      <%--cierre class col general--%>
     
 

                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>

</asp:Content>
