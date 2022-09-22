<%@page import="DAO.UsuarioDAO" %>
<jsp:useBean id="u" class="CrudBean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = UsuarioDAO.salvarUsuario(u);
    
    if(i > 0) {
        response.sendRedirect("addusuario-success.jsp");
    } else {
        response.sendRedirect("addusuario.jsp");
    }
%>