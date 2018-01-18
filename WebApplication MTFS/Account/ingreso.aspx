<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ingreso.aspx.vb" Inherits="WebApplication_MTFS.ingreso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
 <div class="col-sm-2 col-md-2">
   <ul class="nav nav-pills nav-stacked">
  <li class="active"><a href="#">Menu</a></li>
  <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Acceso
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li id="ingreso">ingreso</li>
      <li id="rol">Rol</li>
      <li id="modulo">Modulos</li>
    </ul>
  </li>
  <li><a href="#">Menu 2</a></li>
  <li><a href="#">Menu 3</a></li>
</ul>
 </div>
 <div class="col-sm-10 col-md-10">
     <div class="panel panel-default">
      <div class="panel-heading">Panel de Acceso</div>
      <div class="panel-body" style="height: 390px;">formulario
          <div id="contenido">
         
         </div>

      </div>
         
    </div>
 </div>
 </div>   
     <script>
         document.getElementById("modulo").onclick = function () { ajaxfunc("Htmlmodulo.html") };
         document.getElementById("rol").onclick = function () { ajaxfunc("Htmlrol.html") };
         document.getElementById("ingreso").onclick = function () { ajaxfunc("Htmlrolmod.html") };

         function myFunction() {
             // document.getElementById("rol").innerHTML = "YOU CLICKED ME!";
             alert("hola");
         }
         function ajaxfunc(archivo ) {
             var xhttp;
          
             xhttp = new XMLHttpRequest();
             xhttp.onreadystatechange = function () {
                 if (this.readyState == 4 && this.status == 200) {
                     document.getElementById("contenido").innerHTML = this.responseText;
                 }
             };
             xhttp.open("GET", archivo, true);
             xhttp.send();
         }
    </script>
</asp:Content>
