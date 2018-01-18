<%@ Page Title="Gráficos" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Graficos.aspx.vb" Inherits="WebApplication_MTFS.Graficos" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Import Namespace="WebApplication_MTFS" %>
<%@ Import Namespace="Microsoft.AspNet.Identity" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
    rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $('[id*=oGvResumenArea]').footable();
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
                <asp:DropDownList ID="DropDownListEquipos" runat="server" DataTextField="Nombre_Equipo" DataValueField="Id_equipo" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
<%--                <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"/>--%>
<%--                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
                <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control"/>--%>
            </div>
            <div class="col-md-10">
                <asp:Button runat="server" OnClick="Operacion_Click" Text="Ver Gráficos" CssClass="btn btn-default" />
            </div>

            <div class="col-md-offset-2 col-md-10">

                <asp:GridView ID="oGvResumenArea" runat="server" AutoGenerateColumns="False" CssClass="footable">
                    <Columns>
<%--                        <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" />--%>
                        <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" />
                        <asp:BoundField DataField="UNIDAD" HeaderText="UNIDAD" />
                        <asp:BoundField DataField="VALOR" DataFormatString="{0:F2}" HeaderText="VALOR" ItemStyle-HorizontalAlign="Right" />
                    </Columns>
                </asp:GridView>
            </div>
<%--            <asp:GridView ID="GridView1" CssClass="footable" runat="server" AutoGenerateColumns="false"
                Style="max-width: 500px">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Dia" />
                    <asp:BoundField DataField="Id" HeaderText="Hora" />
                    <asp:BoundField DataField="Country" HeaderText="Paciente" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" />
                </Columns>
            </asp:GridView>--%>


<%--            <asp:GridView ID="GridView2" CssClass="footable" runat="server" AutoGenerateColumns="false"
                Style="max-width: 500px">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Dia" />
                    <asp:BoundField DataField="Id" HeaderText="Hora" />
                    <asp:BoundField DataField="Country" HeaderText="Paciente" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" />
                </Columns>
            </asp:GridView>--%>

        </div>
    </ContentTemplate>
    </asp:UpdatePanel>


    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
	<ContentTemplate>
        <div class="form-group">
            <div class="col-md-10">
<%--                <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"/>--%>
<%--                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
                <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control"/>--%>
            </div>
            <div class="col-md-offset-2 col-md-10">
            </div>

            <div class="col-md-offset-2 col-md-10">




            </div>
            <asp:Chart ID="Chart1" runat="server" Width="500px">
                <Series>
                    <asp:Series Name="Series1" ChartType="Line"></asp:Series>
                    <asp:Series Name="max" ChartType="Line"></asp:Series>
                    <asp:Series Name="min" ChartType="Line"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>


        </div>
    </ContentTemplate>
    </asp:UpdatePanel>


    </div>


</asp:Content>
