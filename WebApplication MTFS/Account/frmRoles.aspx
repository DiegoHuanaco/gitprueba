<%@ Page Title=""  Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="frmRoles.aspx.vb" Inherits="WebApplication_MTFS.frmRoles" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <asp:UpdatePanel id="UpdatePanel1" runat="server">
    <ContentTemplate>
                <fieldset>
                <%--<legend></legend>--%>
<div class="col-lg-11 col-md-11">
    
 <div class="panel panel-default">
  <div class="panel-heading">Administracion de Roles</div>
   <div class="panel-body" >
       
<%--<%– inicio de formulario -%>--%>
 <div class="form-horizontal"> 

     <asp:HiddenField ID="oHf_IdRol" runat="server" />
     
        <div class="form-group">
            <div class="col-lg-1 col-md-1"></div>
            <div class="col-lg-2 col-md-2">
               <asp:LinkButton ID="olb_OpenModal" CssClass="btn btn-primary btn-md" data-toggle="modal" data-target="#LoginModal" data-backdrop="false"  runat="server" CausesValidation="False"><span class="glyphicon glyphicon-search small"/></asp:LinkButton>
                <asp:Label ID="Label11" runat="server" Text="Label" CssClass="lbl lbl-info"> Buscar</asp:Label>
            </div>
     
        </div>
      
     <div class="form-group"> </div>
       <%--<div class="row-offset-2"><br /></div>--%>
       
        <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label1" runat="server" Text="Label" CssClass="lbl lbl-info">Nombre</asp:Label>
            </div>
            <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" required=""></asp:TextBox>
               
                 <asp:RegularExpressionValidator ID="regRol" runat="server"     
                                    ErrorMessage="Expresion no valida." 
                                    ControlToValidate="TextBox1"     
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$"  EnableClientScript="False"  />
            </div>
            
         </div>
         <div class="row">
              <div class="col-lg-1 col-md-1">
                
            </div>
             <div class="col-lg-2 col-md-2"> 
                <asp:RequiredFieldValidator ID="oRFv_Rol" runat="server" ErrorMessage="Debe de ingresar el <strong>Rol</strong>." ControlToValidate="TextBox1" SetFocusOnError="True" ValidationGroup="vpg_IngresarRol"  />
            </div>
         </div>
  
  
     <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label8" runat="server" Text="Label" CssClass="lbl lbl-info">Descripcion</asp:Label>
            </div>
              <div class="col-lg-3 col-md-3">
                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control required" MaxLength="200" Height="32px" TextMode="MultiLine" ></asp:TextBox>
                  
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"     
                                    ErrorMessage="Expresion no valida." 
                                    ControlToValidate="TextBox8"     
                                    ValidationExpression="^[a-zA-Z'.\s]{1,2}$" />
            </div>
          
         </div>
       <div class="row">
              <div class="col-lg-1 col-md-1">
                
            </div>
             <div class="col-lg-2 col-md-2"> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe de ingresar el <strong>Descripcion</strong>." ControlToValidate="TextBox8" SetFocusOnError="True" ValidationGroup="vpg_IngresarRol"  />
            </div>
         </div>
       <div class="form-group">
            <div class="col-lg-1 col-md-1">
                <asp:Label ID="Label2" runat="server"  Text="Label" CssClass="lbl lbl-info">Estado</asp:Label>
            </div>
            <div class="col-lg-3 col-md-3">
                 <asp:DropDownList ID="oCv_DdlEstadoRol" runat="server"  CssClass="form-control required" >
                               <%-- <asp:ListItem Value="-1">Seleccione un estado..</asp:ListItem>--%>
                                <asp:ListItem Value="1">Activo</asp:ListItem>
                                <asp:ListItem Value="0">Inactivo</asp:ListItem>
                  </asp:DropDownList>
                <asp:CompareValidator ID="oCV_Estado" runat="server" 
                                 ControlToValidate="oCv_DdlEstadoRol"   
                                 ErrorMessage="Debe de seleccionar un &lt;strong&gt;Estado&lt;/strong&gt;." 
                                 Operator="NotEqual" ValidationGroup="vpg_IngresarRol" ValueToCompare="-1"></asp:CompareValidator>
            </div>
           <%-- <div class="col-lg-3 col-md-3">
                
                 
            </div>--%>
          
         </div>
    
     <div class="form-group"> </div>
     <div class="form-group">
         <div class="col-lg-1 col-md-1">
             <asp:Label ID="msjRoles" runat="server" Text="" CssClass=""></asp:Label>
         </div>
         

      <div class="col-lg-6 col-md-6">
        
            <div class="col-lg-2 col-md-2">
                <asp:LinkButton ID="obn_GuardaRol" CssClass="form-control btn btn-primary btn-xs" runat="server"  CausesValidation="True" ValidationGroup="vpg_IngresarRol"  >Guardar</asp:LinkButton>
                 <ajaxToolkit:AnimationExtender ID="AnimationExtenderLogin" TargetControlID="obn_GuardaRol" runat="server">
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
                 <asp:LinkButton ID="obn_EliminarRol" CssClass="form-control btn btn-primary btn-xs" runat="server" CausesValidation="False">Eliminar</asp:LinkButton>
            </div> 
            <div class="col-lg-2 col-md-2">
                <asp:LinkButton ID="obn_LimpiarRol" CssClass="form-control btn btn-primary btn-xs" runat="server" CausesValidation="False">Limpiar</asp:LinkButton>
        
          </div>
      </div>        
   </div>
</div> <%--cierre class form horizontal--%>
<%--<%– fin de formulario -%>--%>  
    <%--<%– inicio de panel y grilla -%>--%>
    <%--<div class="col-lg-10 col-md-10">--%>
  <%--<%– fin de panel -%>--%>
   <%-- <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup"  ScrollBars="Vertical">
    <div class="row">
        <div class="col-lg-8 col-md-8">
           <%-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                <Columns>
                   <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/ico_btn.png"  />
                  
                    <asp:BoundField DataField="Id_Rol" HeaderText="Id Rol" />
                    <asp:BoundField DataField="Nombre_Rol" HeaderText="Nombre" />
                    <asp:BoundField DataField="Descripcion_Rol" HeaderText="Descripcion" />
                  
                </Columns>
            </asp:GridView>--%>
      <%--  </div> 
     </div>
       <div class="row">
        <div class="col-lg-1 col-md-1">
            <asp:Button ID="Button5" runat="server" Text="Salir" />
         </div>
       </div>
    </asp:Panel>--%>
    <%--<%– fin de panel -%>--%>
 <%--   </div>--%>
   <%-- <%– fin de panel y grilla -%>--%>
   <%-- <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="TestLinkButton" BackgroundCssClass="modalBackround" CancelControlID="Button5" CacheDynamicResults="True" RepositionMode="RepositionOnWindowResize"></ajaxToolkit:ModalPopupExtender>--%>
    
    </div> <%--cierre panel body--%>
    

     </div> <%--cierre deafault panel--%>
<%--</div>--%>
   </div>
 

                </fieldset>
 <%--<%– inicio tabla modal -%>--%>  
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true"  >
<div class="modal-dialog" >
<div class="modal-content">
<div class="modal-heade modal-header">

<h5 class="modal-title" id="ModalTitle">Listado Roles</h5>
</div>

<div class="modal-body" style="height:350px;overflow-y:scroll;">
 
    <asp:Panel ID="Panel2" runat="server"  >
        
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                <Columns>
                   <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/ico_btn.png" CausesValidation="False"  />
                
                    <asp:BoundField DataField="Id_Rol" HeaderText="Id Rol" />
                    <asp:BoundField DataField="Nombre_Rol" HeaderText="Nombre" />
                    <asp:BoundField DataField="Descripcion_Rol" HeaderText="Descripcion" />
                    <asp:BoundField DataField="Estado_Rol" HeaderText="Estado" />
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
