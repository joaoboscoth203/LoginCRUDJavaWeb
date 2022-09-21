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
        <link rel="stylesheet" href="style.css">
        <title>Edição de Usuário</title>
    </head>
    <body>
        <%@page import="CrudBean.Usuario, DAO.UsuarioDAO" %>
        
        <%
            String id = request.getParameter("id");
            Usuario usuario = UsuarioDAO.getRegistroById(Integer.parseInt(id));
        %>
        
        <header>    
                    <div class="logo">
                        <img src="img/logo-header-fortaleza.png"class="logo-img">
                       <a class="acesso-informação" href="http://www.fortaleza.ce.gov.br">Prefeitura de Fortaleza</a>
                    </div>
                        
                        <ul class="mobile-hide">
                            <li>
                                <a href="http://acessoainformacao.fortaleza.ce.gov.br/">Acesso à informação</a>
                            </li>
                            <li>
                                <a href="http://transparencia.fortaleza.ce.gov.br/">Transparência</a>
                            </li>
                            <li>
                                <a href="http://catalogodeservicos.fortaleza.ce.gov.br/portal">Serviços</a>
                            </li>
                            <li>
                                <a href="http://legislacao.fortaleza.ce.gov.br/">Legislação</a>
                            </li>
                        </ul>
        </header> 
        
        
        <div class="div1" align=center>
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
                        <td><input type="radio" name="sexo" value="M" checked/>Masculino
                            <input type="radio" name="sexo" value="F"/>Feminino
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
