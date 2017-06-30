<%@ Page Title="Registrarse" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Formulario.aspx.vb" Inherits="WebApplication_MTFS.Formulario" %>

<%@ Import Namespace="WebApplication_MTFS" %>
<%@ Import Namespace="Microsoft.AspNet.Identity" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>


    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

<%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
	<ContentTemplate>--%>

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

        <div class="form-group">
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
                <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control"/>
            </div>
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Operacion_Click" Text="Operacion" CssClass="btn btn-default" />
            </div>

            <asp:GridView ID="GridView1" CssClass="footable" runat="server" AutoGenerateColumns="false"
                Style="max-width: 500px">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Id" HeaderText="Customer Id" />
                    <asp:BoundField DataField="Country" HeaderText="Country" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" />
                </Columns>
            </asp:GridView>


        </div>


        <div class="form-group">

            <h1>Navs</h1>
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#">Home</a></li>
                <li role="presentation"><a href="#">Profile</a></li>
                <li role="presentation"><a href="#">Messages</a></li>
            </ul>
            <ul class="nav nav-pills" role="tablist">
                <li role="presentation" class="active"><a href="#">Home</a></li>
                <li role="presentation"><a href="#">Profile</a></li>
                <li role="presentation"><a href="#">Messages</a></li>
            </ul>

        </div>


        <div class="panel panel-default" style="width: 500px; padding: 10px; margin: 10px">
            <div id="Tabs" role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li><a href="#personal" aria-controls="personal" role="tab" data-toggle="tab">Personal
                    </a></li>
                    <li><a href="#employment" aria-controls="employment" role="tab" data-toggle="tab">Employment</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content" style="padding-top: 20px">
                    <div role="tabpanel" class="tab-pane active" id="personal">
                        This is Personal Information Tab
                    </div>
                    <div role="tabpanel" class="tab-pane" id="employment">
                        This is Employment Information Tab
                    </div>
                </div>
            </div>
            <asp:Button ID="Button1" Text="Submit" runat="server" CssClass="btn btn-primary" />
            <asp:HiddenField ID="TabName" runat="server" />
        </div>

        <script type="text/javascript">

        </script>

    </div>

<%--    </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
