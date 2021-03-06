﻿<%@ Page Title="Registrarse" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Formulario.aspx.vb" Inherits="WebApplication_MTFS.Formulario" %>

<%@ Import Namespace="WebApplication_MTFS" %>
<%@ Import Namespace="Microsoft.AspNet.Identity" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
    rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>

    <script type="text/javascript">

    </script>

    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>



    <div class="form-horizontal">


<%--        <h4>Crear una nueva cuenta</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Correo electrónico</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Contraseña</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirmar contraseña</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="El campo de confirmación de contraseña es obligatorio." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrarse" CssClass="btn btn-default" />
            </div>
        </div>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
	<ContentTemplate>
        <div class="form-group">
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
                <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control"/>
            </div>
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Operacion_Click" Text="Operacion" CssClass="btn btn-default" />
                <asp:Button ID="Button1" runat="server" Text="Button" />
            </div>
       </div>
            <asp:GridView ID="GridView1" CssClass="footable" runat="server" AutoGenerateColumns="false"
                Style="max-width: 500px">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Dia" />
                    <asp:BoundField DataField="Id" HeaderText="Hora" />
                    <asp:BoundField DataField="Country" HeaderText="Paciente" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" />
                </Columns>
            </asp:GridView>


            <asp:GridView ID="GridView2" CssClass="footable" runat="server" AutoGenerateColumns="False"
                Style="max-width: 500px">
                <Columns>
                    <asp:BoundField DataField="Usuario" HeaderText="nombre" />
                    <asp:BoundField DataField="Apellido_Usuario" HeaderText="Apellido" />
                    </Columns>
            </asp:GridView>

        </div>
    </ContentTemplate>
    </asp:UpdatePanel>

     


    

        <script type="text/javascript">
        
        </script>

    </div>


</asp:Content>
