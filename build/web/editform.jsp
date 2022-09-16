<%-- 
    Document   : editform
    Created on : 16/09/2022, 08:57:33
    Author     : joaobosco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edição de Usuário</title>
    </head>
    <body>
        <%@page import="CrudBean.Usuario, DAO.UsuarioDAO" %>
        
        <%
            String id = request.getParameter("id");
            Usuario usuario = UsuarioDAO.getRegistroById(Integer.parseInt(id));
        %>
        
        <div align=center>
            <h1>Edição do Usuário</h1>
            
            <form action="editusuario.jsp" method="post">
                <input type="hidden" name="id" value="<%=usuario.getId()%>"/>
                <table>
                    <tr>
                        <td>Nome: </td>
                        <td><input type="text" name="nome" value="<%=usuario.getNome()%>"/></td>
                    </tr>
                    <tr>
                        <td>Senha: </td>
                        <td><input type="password" name="senha" value="<%=usuario.getSenha()%>"/></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="email" name="email" value="<%=usuario.getEmail()%>"/></td>
                    </tr>
                    <tr>
                        <td>Sexo: </td>
                        <td><input type="radio" name="sexo" value="M>"/>Masculino
                            <input type="radio" name="sexo" value="F>"/>Feminino
                        </td>
                    </tr>
                    <tr>
                        <td>País: </td>
                        <td>
                            <select name="pais">
                                <option>Argentina</option>
                                <option>Brasil</option>
                                <option>EUA</option>
                                <option>Portugal</option>
                                <option>Outro</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Editar Usuário"></input></td>
                    </tr>
                </table>
            </form>
        </div>
        
    </body>
</html>
