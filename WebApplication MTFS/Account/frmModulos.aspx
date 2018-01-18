<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="frmModulos.aspx.vb" Inherits="WebApplication_MTFS.frmModulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <asp:UpdatePanel id="UpdatePanel1" runat="server">
            <ContentTemplate>
                <fieldset> 
               <%-- <legend>Modulo de Sistema</legend>--%>
<div class="col-lg-11 col-md-11">
    
 <div class="panel panel-default">
  <div class="panel-heading">Administracion de Modulo</div>
<div class="panel-body"  >
<div class="form-horizontal"> 
    <div class="form-group">
       <div class="col-lg-1 col-md-1">                 
       </div>
       <div class="col-lg-2 col-md-2">
            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary btn-md" data-toggle="modal" data-target="#LoginModal" data-backdrop="false" runat="server" CausesValidation="False"><span class="glyphicon glyphicon-search small"/></asp:LinkButton>
                <asp:Label ID="Label11" runat="server" Text="Label" CssClass="lbl lbl-info"> Buscar</asp:Label>
       </div>
    </div>  <%--cierre primer boton--%>
    <div class="form-group"> </div>
     <asp:HiddenField ID="oHf_IdModulo" runat="server" />
        
        <div class="form-group">
             <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lbl lbl-info">Nombre</asp:Label>
                <%--<asp:LinkButton ID="olb_OpenModal" CssClass="btn btn-primary btn-md" data-toggle="modal" data-target="#LoginModal" data-backdrop="false" runat="server" CausesValidation="False"><span class="glyphicon glyphicon-search small"/></asp:LinkButton>--%>
            </div>
           
            <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="otx_NombreModulo" runat="server" CssClass="form-control" required=""></asp:TextBox>
                   
                 <asp:RegularExpressionValidator ID="regRol" runat="server"     
                                    ErrorMessage="Expresion no valida." 
                                    ControlToValidate="otx_NombreModulo"     
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$"  EnableClientScript="False"  />
            </div>
            
         </div>
        <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                <asp:RequiredFieldValidator ID="oRFv_Rol" runat="server" ErrorMessage="Debe de ingresar el <strong>Rol</strong>." ControlToValidate="otx_NombreModulo" SetFocusOnError="True" ValidationGroup="vpg_IngresarModulo"  />
            </div>
        </div>
    <%--cierre campo nombre--%>
     <div class="form-group">
           <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label8" runat="server" Text="Label" CssClass="lbl lbl-info">Ruta</asp:Label>
            </div>
              <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="otx_RutaModulo" runat="server"  CssClass="form-control"></asp:TextBox>
               
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"     
                                    ErrorMessage="Expresion no valida." 
                                    ControlToValidate="otx_RutaModulo"     
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$"  EnableClientScript="False"  />
            </div>
             <div class="col-lg-3 col-md-3">
               
            </div>
     </div>
     <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe de ingresar el <strong>Rol</strong>." ControlToValidate="otx_RutaModulo" SetFocusOnError="True" ValidationGroup="vpg_IngresarModulo"  />
            </div>
     </div>
     <%--cierre campo ruta--%>
     <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label2" runat="server" Text="Label" CssClass="lbl lbl-info">Grupo</asp:Label>
            </div>
              <div class="col-lg-3 col-md-3">
                  <asp:DropDownList ID="oCv_DdlGrupoModulo" runat="server" CssClass="form-control"></asp:DropDownList>
                  
            </div>
         <div class="col-lg-3 col-md-3">
            
         </div> 
            
     </div>
      <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                   <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                 ControlToValidate="oCv_DdlGrupoModulo"   
                                 ErrorMessage="Debe de seleccionar un &lt;strong&gt;Estado&lt;/strong&gt;." 
                                 Operator="NotEqual" ValidationGroup="vpg_IngresarModulo" ValueToCompare="-1"></asp:CompareValidator>
            </div>
      </div>
    <%--cierre campo grupo--%>
          <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label3" runat="server"  Text="Label" CssClass="lbl lbl-info">Estado</asp:Label>
            </div>
            <div class="col-lg-3 col-md-3">
                 <asp:DropDownList ID="oCv_DdlEstadoModulo" runat="server"  CssClass="form-control required" >
                                <%--<asp:ListItem Value="-1">Seleccione un estado..</asp:ListItem>--%>
                                <asp:ListItem Value="1">Activo</asp:ListItem>
                                <asp:ListItem Value="0">Inactivo</asp:ListItem>
                  </asp:DropDownList>
                <asp:CompareValidator ID="oCV_Estado" runat="server" 
                                 ControlToValidate="oCv_DdlEstadoModulo"   
                                 ErrorMessage="Debe de seleccionar un &lt;strong&gt;Estado&lt;/strong&gt;." 
                                 Operator="NotEqual" ValidationGroup="vpg_IngresarModulo" ValueToCompare="-1"></asp:CompareValidator>
            </div>
            <div class="col-lg-3 col-md-3">
                
                 
            </div>
          
         </div>
       <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
           
            </div>
      </div>
     <%--cierre campo Estado--%>
     <div class="form-group">
             <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label4" runat="server"  Text="Label" CssClass="lbl lbl-info">Tipo</asp:Label>
            </div>
     <div class="col-lg-3 col-md-3">
                 <asp:DropDownList ID="oCv_DdlTipoModulo" runat="server"  CssClass="form-control required" >
                                <asp:ListItem Value="-1">Seleccione un tipo..</asp:ListItem>
                                <asp:ListItem Value="1">Uno</asp:ListItem>
                                <asp:ListItem Value="0">Dos</asp:ListItem>
                  </asp:DropDownList>
               <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                 ControlToValidate="oCv_DdlTipoModulo"   
                                 ErrorMessage="Debe de seleccionar un &lt;strong&gt;Tipo&lt;/strong&gt;." 
                                 Operator="NotEqual" ValidationGroup="vpg_IngresarModulo" ValueToCompare="-1"></asp:CompareValidator>
            </div>
            <div class="col-lg-3 col-md-3">
                 
                 
            </div>
          
         </div>
      <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
           
            </div>
      </div>
      <%--cierre campo tipo--%>
      <div class="form-group">
           <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label5" runat="server" Text="Label" CssClass="lbl lbl-info">Indice</asp:Label>
            </div>
              <div class="col-lg-1 col-md-1">
                  <asp:TextBox ID="oTx_indice" runat="server"  CssClass="form-control"></asp:TextBox>
              </div>
              
            <div class="col-lg-3 col-md-3">
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"     
                                    ErrorMessage="Expresion no valida." 
                                    ControlToValidate="oTx_indice"     
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$"  EnableClientScript="False"  />
            </div>
            
         </div>
          
           <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe de ingresar el <strong>Rol</strong>." ControlToValidate="oTx_indice" SetFocusOnError="True" ValidationGroup="vpg_IngresarModulo"  />
            </div>
      </div>
    <%-- <div class="row" >
         <div class="col-lg-2 col-md-2"></div>

      <div class="col-lg-3 col-md-3">
         <div class="form-control" style="background-color:#e2eaed;" >
            <div class="col-lg-4 col-md-4">
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary btn-xs" Text="Guardar" />
            </div> 
            <div class="col-lg-4 col-md-4">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-xs" Text="Eliminar" />
            </div> 
            <div class="col-lg-4 col-md-4">
                <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary btn-xs" Text="Limpiar" />
            </div> 
        </div>
      </div>        
   </div>--%>
       <div class="row" >
          <div class="col-lg-1 col-md-1"></div>

      <div class="col-lg-6 col-md-6">
        
            <div class="col-lg-2 col-md-2">
                <asp:LinkButton ID="obn_GuardaModulo" CssClass="form-control btn btn-primary btn-xs" runat="server"  CausesValidation="True" ValidationGroup="vpg_IngresarModulo">Guardar</asp:LinkButton>
             <ajaxToolkit:AnimationExtender ID="AnimationExtenderLogin" TargetControlID="obn_GuardaModulo" runat="server">
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
           <div class="col-lg-2 col-md-2">
                 <asp:LinkButton ID="obn_EliminarModulo" CssClass="form-control btn btn-primary btn-xs" runat="server" CausesValidation="False">Eliminar</asp:LinkButton>
            </div> 
            <div class="col-lg-2 col-md-2">
                <asp:LinkButton ID="obn_LimpiarModulo" CssClass="form-control btn btn-primary btn-xs" runat="server" CausesValidation="False">Limpiar</asp:LinkButton>
        
        </div>
      </div>        
   </div>

   

  </div>
</div>   <%--cierre panel body--%>

</div>
</div>
                </fieldset>
<%--<%– inicio tabla modal -%>--%>  
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">

<h4 class="modal-title" id="ModalTitle"></h4>
</div>

<div class="modal-body" style="height:350px;overflow-y:scroll;">
 
    <asp:Panel ID="Panel2" runat="server"  >
        
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                <Columns>
                   <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/ico_btn.png" CausesValidation="False"  />
                
                    <asp:BoundField DataField="Id_Modulo" HeaderText="Id Modulo" />
                    <asp:BoundField DataField="Nombre_Modulo" HeaderText="Nombre" />
                    <asp:BoundField DataField="Ruta_Modulo" HeaderText="Ruta" />
                    <asp:BoundField DataField="Estado_Modulo" HeaderText="Estado" />
                </Columns>
            </asp:GridView>
    </asp:Panel>
    </div>
    <div class="modal-footer">
       <asp:LinkButton ID="olb_SalirModal" CssClass="btn btn-primary btn-md"  runat="server" data-dismiss="modal" >Salir</asp:LinkButton>
    </div>
</div>
</div>
</div>
<%--<%– fin tabla modal -%>--%>  
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
