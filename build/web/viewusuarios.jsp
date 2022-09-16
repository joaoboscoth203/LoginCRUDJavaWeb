<%-- 
    Document   : viewusuarios
    Created on : 15 de set. de 2022, 10:48:44
    Author     : joaobosco
--%>


<%@page import="DAO.UsuarioDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualiza��o de Usu�rios</title>
    </head>
    <body>
        <%@page import="CrudBean.Usuario, java.util.*, DAO.UsuarioDAO"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        
        <div align=center>
            <h1>Lista de usu�rios</h1>
            <% 
            List<Usuario> list = UsuarioDAO.getAllUsuarios();
            request.setAttribute("list", list);
            %>

            <table border ="2">
                <tr><th>ID</th><th>Nome</th><th>Senha</th><th>Email</th><th>Sexo</th><th>Pa�s</th><th>Editar</th><th>Excluir</th></tr>
                <c:forEach items="${list}" var="usuario">
                    <tr>
                        <td>${usuario.getId()}</td>
                        <td>${usuario.getNome()}</td>
                        <td>${usuario.getSenha()}</td>
                        <td>${usuario.getEmail()}</td>
                        <td>${usuario.getSexo()}</td>
                        <td>${usuario.getPa�s()}</td>
                        <td><a href="editform.jsp?id=${usuario.getId()}">Editar</a></td>
                        <td><a href="#">Excluir</a></td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <a href="#">Adicionar novo Usu�rio</a>
        </div>
    </body>
</html>




