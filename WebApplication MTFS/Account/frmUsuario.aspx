<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="frmUsuario.aspx.vb" Inherits="WebApplication_MTFS.frmUsuario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:UpdatePanel id="UpdatePanel1" runat="server">
            <ContentTemplate>
                <fieldset> 
               <%-- <legend>Administracion de Usuario</legend>--%>
<div class="col-lg-11 col-md-11">
    
 <div class="panel panel-default">
  <div class="panel-heading">Administracion de Roles</div>
<div class="panel-body">
    <div class="form-horizontal">
        <asp:HiddenField ID="oHf_IdUsuario" runat="server" />
        <div class="form-group">
            <div class="col-lg-1 col-md-1">
                 
            </div>
            <div class="col-lg-2 col-md-2">
                <asp:LinkButton ID="olb_OpenModal" CssClass="btn btn-primary btn-md" data-toggle="modal" data-target="#LoginModal" data-backdrop="false" runat="server" CausesValidation="False"><span class="glyphicon glyphicon-search small"/></asp:LinkButton>
                <asp:Label ID="Label11" runat="server" Text="Label" CssClass="lbl lbl-info"> Buscar</asp:Label>
            </div>

        </div> <%--cierre primer boton--%>
    <div class="form-group"> </div>
 
     <div class="form-group">
             <div class="col-lg-1 col-md-1">
                 <%--<asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary btn-md" data-toggle="modal" data-target="#LoginModal" data-backdrop="false" runat="server" CausesValidation="False"><span class="glyphicon glyphicon-search small"/></asp:LinkButton>--%>
                <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lbl lbl-info">Rol</asp:Label>
            </div>
            <div class="col-lg-3 col-md-3">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <%--<asp:ListItem Value="0">&lt;Seleccione un Item&gt;</asp:ListItem>--%>

                </asp:DropDownList>
                <%--<asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>--%>
              
            </div>
             <div class="col-lg-1 col-md-1">
                   
                  
              </div>
      </div>
      <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                
            </div>
      </div>
   
         <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label2" runat="server" Text="Label" CssClass="lbl lbl-info">Dominio</asp:Label>
            </div>
             <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="oTx_Dominio_Usuario" runat="server" CssClass="form-control"></asp:TextBox>
                
            </div>
            
             <div class="col-lg-3 col-md-3">
                 
             </div> 
         </div>
        <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe de ingresar el <strong>Dominio</strong>." ControlToValidate="oTx_Dominio_Usuario" SetFocusOnError="True" ValidationGroup="vpg_IngresarUsuario"  />
            </div>
         </div>
        
     <div class="form-group">
           <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label3" runat="server" Text="Label" CssClass="lbl lbl-info">Usuario</asp:Label>
            </div>
               <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="oTx_Usuario" runat="server" CssClass="form-control"></asp:TextBox>
                
            </div>
            <div class="col-lg-3 col-md-3">
                 
             </div> 
     </div>
     <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe de ingresar el <strong>Usuario</strong>." ControlToValidate="oTx_Usuario" SetFocusOnError="True" ValidationGroup="vpg_IngresarUsuario"  />
            </div>
      </div>
      <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label4" runat="server" Text="Label" CssClass="lbl lbl-info">Nombre</asp:Label>
            </div>
               <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="oTx_Nombre_Usuario" runat="server" CssClass="form-control"></asp:TextBox>
                
            </div>
            <div class="col-lg-3 col-md-3">
                
             </div>
      </div>
      <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe de ingresar el <strong>Nombre</strong>." ControlToValidate="oTx_Nombre_Usuario" SetFocusOnError="True" ValidationGroup="vpg_IngresarUsuario"  />
            </div>
      </div>
    <div class="form-group">
           <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label5" runat="server" Text="Label" CssClass="lbl lbl-info">Apellido</asp:Label>
            </div>
             <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="oTx_Apellido_Usuario" runat="server" CssClass="form-control"></asp:TextBox>
                  
            </div>
            <div class="col-lg-3 col-md-3">
                
             </div>
            
     </div>
     <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Debe de ingresar el <strong>Apellido</strong>." ControlToValidate="oTx_Apellido_Usuario" SetFocusOnError="True" ValidationGroup="vpg_IngresarUsuario"  />
            </div>
      </div>
     <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label6" runat="server" Text="Label" CssClass="lbl lbl-info">E-mail</asp:Label>
            </div>
              <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="oTx_Email" runat="server" CssClass="form-control"></asp:TextBox>
               
            </div>
            <div class="col-lg-3 col-md-3">
                 
             </div>
     </div>
     <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Debe de ingresar el <strong>E-mail</strong>." ControlToValidate="oTx_Email" SetFocusOnError="True" ValidationGroup="vpg_IngresarUsuario"  />
            </div>
      </div>
     <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label7" runat="server" Text="Label" CssClass="lbl lbl-info">pass1</asp:Label>
            </div>
              <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="oTx_Pass1" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                 
            </div>
             <div class="col-lg-3 col-md-3">
                
             </div>
     </div>
      <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Debe de ingresar el <strong>Pass</strong>." ControlToValidate="oTx_Pass1" SetFocusOnError="True" ValidationGroup="vpg_IngresarUsuario"  />
            </div>
      </div>
      <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label8" runat="server" Text="Label" CssClass="lbl lbl-info">pass2</asp:Label>
            </div>
              <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="oTx_Pass2" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                
            </div>
            <div class="col-lg-3 col-md-3">
                
             </div>
     </div>
     <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Debe de ingresar el <strong>Pass2</strong>." ControlToValidate="oTx_Pass2" SetFocusOnError="True" ValidationGroup="vpg_IngresarUsuario"  />
            </div>
      </div>
      <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label9" runat="server" Text="Label" CssClass="lbl lbl-info">Estado</asp:Label>
            </div>
              <div class="col-lg-3 col-md-3">
                  <asp:DropDownList ID="oCv_DdlEstadoUsuario" runat="server"  CssClass="form-control required" >
                                <%--<asp:ListItem Value="-1">Seleccione un estado..</asp:ListItem>--%>
                                <asp:ListItem Value="1">Activo</asp:ListItem>
                                <asp:ListItem Value="0">Inactivo</asp:ListItem>
                  </asp:DropDownList>
                  
            </div>
           <div class="col-lg-3 col-md-3">
             
             </div>
            
     </div>
      <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                  <asp:CompareValidator ID="oCV_Estado" runat="server" 
                                 ControlToValidate="oCv_DdlEstadoUsuario"   
                                 ErrorMessage="Debe de seleccionar un &lt;strong&gt;Estado&lt;/strong&gt;." 
                                 Operator="NotEqual" ValidationGroup="vpg_IngresarUsuario" ValueToCompare="-1"></asp:CompareValidator>
            </div>
      </div>
     <div class="form-group">
           <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label10" runat="server" Text="Label" CssClass="lbl lbl-info">Cambiar pass</asp:Label>
            </div>
              <div class="col-lg-3 col-md-3">
                  <asp:DropDownList ID="oCv_CambiarPass_Usuario" runat="server"  CssClass="form-control required" >
                                <asp:ListItem Value="-1">Seleccione..</asp:ListItem>
                                <asp:ListItem Value="1">Si</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                  </asp:DropDownList>
                 
            </div>
            <div class="col-lg-3 col-md-3">
              
             </div>
     </div>
     <div class="row"> 
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-3 col-md-3">
                  <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                 ControlToValidate="oCv_CambiarPass_Usuario"   
                                 ErrorMessage="Debe de seleccionar un &lt;strong&gt;Estado&lt;/strong&gt;." 
                                 Operator="NotEqual" ValidationGroup="vpg_IngresarUsuario" ValueToCompare="-1"></asp:CompareValidator>
            </div>
      </div>

  <%--      <div class="row" >
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
      </div>   --%>   
<div class="form-group">
<div class="col-lg-1 col-md-1"></div>
      <div class="col-lg-6 col-md-6">
        
            <div class="col-lg-2 col-md-2">
                <asp:LinkButton ID="obn_GuardaUsuario" CssClass="form-control btn btn-primary btn-xs" runat="server"  CausesValidation="True" ValidationGroup="vpg_IngresarUsuario">Guardar</asp:LinkButton>
            </div> 
           <div class="col-lg-2 col-md-2">
                 <asp:LinkButton ID="obn_EliminarUsuario" CssClass="form-control btn btn-primary btn-xs" runat="server" CausesValidation="False">Eliminar</asp:LinkButton>
            </div> 
            <div class="col-lg-2 col-md-2">
                <asp:LinkButton ID="obn_LimpiarUsuario" CssClass="form-control btn btn-primary btn-xs" runat="server" CausesValidation="False">Limpiar</asp:LinkButton>
            </div>
      </div>     
   </div>

   <%--<div class="col-lg-10 col-md-10">
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" >
     <div class="row">
        <div class="col-lg-8 col-md-8">
          <asp:GridView ID="GridView1" runat="server" CssClass="col-lg-8 col-md-8" AutoGenerateColumns="False">
            <Columns>
                   <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/ico_btn.png" CausesValidation="False"  />
                
                    <asp:BoundField DataField="Id_Usuario" HeaderText="Id Usuario" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    <asp:BoundField DataField="Dominio_Usuario" HeaderText="Dominio" />
                    <asp:BoundField DataField="Nombre_Usuario" HeaderText="Nombre" />
                </Columns>
        </asp:GridView>
        </div> 
     </div>
       <div class="row">
        <div class="col-lg-1 col-md-1">
            <asp:Button ID="Button5" runat="server" Text="Salir" />
         </div>
       </div>
    </asp:Panel>
</div>--%>
   
    <%--<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="Panel1" TargetControlID="Button4" BackgroundCssClass="modalBackround" CancelControlID="Button5"></ajaxToolkit:ModalPopupExtender>  --%>
   </div>  <%-- fin class form horizontal--%>
</div>  <%-- fin panel body--%>

</div>   <%-- fin panel default--%>
</div> <%--fin class general 11--%>
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
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"  AutoGenerateColumns="False" >
            <Columns>
                   <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/ico_btn.png" CausesValidation="False"  />
                
                    <asp:BoundField DataField="Id_Usuario" HeaderText="Id Usuario" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    <asp:BoundField DataField="Dominio_Usuario" HeaderText="Dominio" />
                    <asp:BoundField DataField="Nombre_Usuario" HeaderText="Nombre" />
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
