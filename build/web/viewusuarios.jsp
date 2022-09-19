<%-- 
    Document   : viewusuarios
    Created on : 15 de set. de 2022, 10:48:44
    Author     : joaobosco
--%>


<%@page import="DAO.UsuarioDAO, DAO.EmployeeDAO, DAO.BranchDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Visualização de Usuários</title>
    </head>
    <body>
        <%@page import="CrudBean.Usuario, CrudBean.Employee, CrudBean.Branch, java.util.*, DAO.UsuarioDAO, DAO.EmployeeDAO, DAO.BranchDAO"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        
        <div class="header">
            <div id="header-fortaleza">
                <div class="header-fortaleza">
                    <a href="http://www.fortaleza.ce.gov.br">
                        <img class="logo-fortaleza" src="/img/logo-header-fortaleza.png" heigt="24">
                    </a>
                    <a class="acesso-informação" href="http://www.fortaleza.ce.gov.br">Prefeitura de Fortaleza</a>
                    <nav class="navigation-header-fortaleza">
                        
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
                    </nav>
                </div>
            </div>
        </div>
        <div class="conteudo">
            <div class="conteudo-interno">
                <h1>Lista de usuários</h1>
                <div class="div1">                    
                    <% 
                    List<Usuario> list = UsuarioDAO.getAllUsuario();
                    request.setAttribute("list", list);
                    %>

                    <table class="striped" align="center">
                        <tr><th>ID</th><th>Nome</th><th>Senha</th><th>Email</th><th>Sexo</th><th>País</th><th>Editar</th><th>Excluir</th></tr>
                        <c:forEach items="${list}" var="usuario">
                            <tr>
                                <td>${usuario.getId()}</td>
                                <td>${usuario.getNome()}</td>
                                <td>${usuario.getSenha()}</td>
                                <td>${usuario.getEmail()}</td>
                                <td>${usuario.getSexo()}</td>
                                <td>${usuario.getPais()}</td>
                                <td><a href="editform.jsp?id=${usuario.getId()}">Editar</a></td>
                                <td><a href="#">Excluir</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>
                    <a href="#">Adicionar novo Usuário</a>
                </div>
            </div>
            <div class="conteudo-interno">
                <h1>Funcionários</h1>
                <div class="div2">                    
                    <% 
                    List<Employee> list2 = EmployeeDAO.getAllEmployee();
                    request.setAttribute("list2", list2);
                    %>

                    <table align="center" class="striped">
                        <tr><th>emp_id</th><th>first_name</th><th>last_name</th><th>birth_date</th><th>Sex</th><th>salary</th><th>super_id</th><th>branch_id</th><th>Editar</th><th>Excluir</th></tr>
                        <c:forEach items="${list2}" var="employee">
                            <tr>
                                <td>${employee.getEmp_id()}</td>
                                <td>${employee.getFirst_name()}</td>
                                <td>${employee.getLast_name()}</td>
                                <td>${employee.getBirth_date()}</td>
                                <td>${employee.getSex()}</td>
                                <td>${employee.getSalary()}</td>
                                <td>${employee.getSuper_id()}</td>
                                <td>${employee.getBranch_id()}</td>
                                <td><a href="editform.jsp?id=${employe.getEmp_id()}">Editar</a></td>
                                <td><a href="#">Excluir</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>

                </div>
            </div>
            <div class="conteudo-interno">
                <h1>Filiais</h1>
                <div class="div1">                    
                    <% 
                    List<Branch> list3 = BranchDAO.getAllbranch();
                    request.setAttribute("list3", list3);
                    %>

                    <table align="center" class="striped">
                        <tr><th>branch_id</th><th>branch_name</th><th>mgr_id</th><th>mgr_start_date</th><th>Editar</th><th>Excluir</th></tr>
                        <c:forEach items="${list3}" var="branch">
                            <tr>
                                <td>${branch.getBranch_id()}</td>
                                <td>${branch.getBranch_name()}</td>
                                <td>${branch.getMgr_id()}</td>
                                <td>${branch.getMgr_start_date()}</td>                        
                                <td><a href="editform.jsp?id=${branch.getBranch_id()}">Editar</a></td>
                                <td><a href="#">Excluir</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>

                </div>
            </div>        
        </div>            
    </body>
</html>




