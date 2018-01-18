<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="WebForm2.aspx.vb" Inherits="WebApplication_MTFS.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:LinkButton ID="olb_OpenModal" CssClass="btn btn-primary btn-md" data-toggle="modal" data-target="#LoginModal" data-backdrop="false" runat="server" CausesValidation="False"><span class="glyphicon glyphicon-search small"/></asp:LinkButton>

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
</asp:Content>
