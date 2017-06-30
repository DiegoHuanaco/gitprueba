<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ViewSwitcher.ascx.vb" Inherits="WebApplication_MTFS.ViewSwitcher" %>
<div id="viewSwitcher">
    <%: CurrentView %> view | <a href="<%: SwitchUrl %>">Switch to <%: AlternateView %></a>
</div>
