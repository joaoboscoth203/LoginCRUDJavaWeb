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
        
           
        <header>    
                    <div class="logo">
                        <img src="img/logo-header-fortaleza.png" class="logo-img">
                       <a class="acesso-informação" href="http://www.fortaleza.ce.gov.br">Prefeitura de Fortaleza</a>
                    </div>
                        
                        <ul class="mobile-hide">
                            <li>
                                <a href="viewusuarios.jsp">Home</a>
                            </li>
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
                            <li>
                                <a href="index.html">Sair</a>
                            </li>
                        </ul>
        </header>           
               
            
        
        <div class="conteudo">            
            <div class="conteudo-interno">
                <h1>Lista de usuários</h1>
                <div class="div1">                    
                    <% 
                    List<Usuario> list = UsuarioDAO.getAllUsuario();
                    request.setAttribute("list", list);
                    %>

                    <table class="bordered striped centered highlight responsive-table" align="center">
                        <tr><th>ID</th><th>NOME</th><th>SENHA</th><th>EMAIL</th><th>SEXO</th><th>PAÍS</th><th>EDITAR</th><th>EXCLUIR</th></tr>
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
                    <a href="addusuarioform.jsp">Adicionar novo Usuário</a>
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
                        <tr><th>EMPLOYEE ID</th><th>FIRST NAME</th><th>LAST NAME</th><th>BIRTH DATE</th><th>SEX</th><th>SALARY</th><th>SUPER ID</th><th>BRANCH ID</th></tr>
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
                        <tr><th>BRANCH ID</th><th>BRANCH NAME</th><th>MGR ID</th><th>MGR START DATE</th></tr>
                        <c:forEach items="${list3}" var="branch">
                            <tr>
                                <td>${branch.getBranch_id()}</td>
                                <td>${branch.getBranch_name()}</td>
                                <td>${branch.getMgr_id()}</td>
                                <td>${branch.getMgr_start_date()}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>

                </div>
            </div>        
        </div>
        <div class="footer">
            <footer id="footer"><img src="img/footer_amc.png" alt="logo-portal" />
		<h2 id="autarquia">
				Autarquia Municipal de Trânsito e Cidadania - AMC <br /> Av.
				Desembargador Gonzaga, 1630 - Cidade dos Funcionarios - Fortaleza -
				CE - CEP - 60.823-012 - Tel: +55 (85) 3452.5811
		</h2>
            </footer> 
        </div>
                           
    </body>
</html>




