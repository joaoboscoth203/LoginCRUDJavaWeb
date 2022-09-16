<%@page import="DAO.UsuarioDAO"%>
<jsp:useBean id="u" class="CrudBean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i = UsuarioDAO.updateUsuario(u);
response.sendRedirect("viewusuarios.jsp");
%>