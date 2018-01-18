<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="frmLogin.aspx.vb" Inherits="WebApplication_MTFS.frmLogin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
             <fieldset >
                <%-- <legend>Control de acceso</legend>--%>
           
             
            
               <div class="panel-body"  >
                 <div class="form-horizontal"> 
                  
                      
                           <div class="form-group">
                                <div class="col-sm-2 col-md-2 col-lg-2 col-xs-12">
                                    <asp:Label ID="lblusuario" CssClass="lbl lbl-info" runat="server" Text="Usuario"></asp:Label>
                                </div>
                                <div class="col-sm-10 col-md-10 col-lg-10 col-xs-12">
                                    <asp:TextBox ID="txtusuario" placeholder="Ingrese su nombre de usuario" CssClass="form-control" runat="server" title="Ingrese nombre de Usuario" required=""></asp:TextBox>
                                </div>
                            </div>
                       
                        
                          <div class="form-group">
                                <div class="col-sm-2 col-md-2 col-lg-2 col-xs-12">
                                    <asp:Label ID="lblcontrasena" CssClass="lbl lbl-info" runat="server" Text="Contraseña"></asp:Label>
                                </div>
                                <div class="col-sm-10 col-md-10 col-lg-10 col-xs-12">
                                    <asp:TextBox ID="txtcontrasena" placeholder="Ingrese su contraseña" CssClass="form-control" runat="server" TextMode="Password" title="Ingrese Password" required=""></asp:TextBox>
                                </div>
                            </div>
                       
                       
                          <div class="form-group">
                                <div class=" col-sm-12 col-md-12 col-lg-12 col-xs-12">
                                    <asp:Button CssClass="btn btn-primary btn-md" ID="btnLogin" runat="server" Text="Entrar"></asp:Button>
                                     <ajaxToolkit:AnimationExtender ID="AnimationExtenderLogin" TargetControlID="btnLogin" runat="server">
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
                 
                   </div> <%--fin cierre form horizonal--%>
                 </div>  <%--fin panel body--%>
            
                 <%--<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" ScrollBars="Both">
                     <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                     <asp:Button ID="Button4" runat="server" Text="salir" />
                 </asp:Panel>--%>

                 <%--<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button3" CancelControlID="Button4"  BackgroundCssClass="modalBackround" PopupControlID="Panel1" ></ajaxToolkit:ModalPopupExtender>--%>

 
              </fieldset>
         </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
