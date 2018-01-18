<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication_MTFS.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <asp:UpdatePanel id="UpdatePanel1" runat="server">
    <ContentTemplate>
                <fieldset>
    <%--<div class="form-horizontal"> --%>
    <h4>Crear una nueva cuenta</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Correo electrónico</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
            </div>
            <div class="col-md-10">
               <asp:LinkButton ID="olb_OpenModal" CssClass="btn btn-primary btn-md" data-toggle="modal" data-target="#LoginModal" data-backdrop="false" runat="server" CausesValidation="False"><span class="glyphicon glyphicon-search small"/></asp:LinkButton>
            </div>
        </div>


                <%--<%– inicio tabla modal -%>--%>  
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">

<h4 class="modal-title" id="ModalTitle"></h4>
</div>

<div class="modal-body" style="height:350px;overflow-y:scroll;">
 
    <asp:Panel ID="Panel2" runat="server"  >
        
         <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                <Columns>
                   <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/ico_btn.png" CausesValidation="False"  />
                
                    <asp:BoundField DataField="Id_Rol" HeaderText="Id Rol" />
                    <asp:BoundField DataField="Nombre_Rol" HeaderText="Nombre" />
                    <asp:BoundField DataField="Descripcion_Rol" HeaderText="Descripcion" />
                    <asp:BoundField DataField="Estado_Rol" HeaderText="Estado" />
                </Columns>
            </asp:GridView>--%>
    </asp:Panel>
    </div>
    <div class="modal-footer">
       <asp:LinkButton ID="olb_SalirModal" CssClass="btn btn-primary btn-md"  runat="server" data-dismiss="modal" >Salir</asp:LinkButton>
    </div>
</div>
</div>
</div>
<%--<%– fin tabla modal -%>--%> 
    <%--</div>--%> <%--cierre form horizontal--%>
   
         </fieldset>      
       
       </ContentTemplate>
   </asp:UpdatePanel>
</asp:Content>

