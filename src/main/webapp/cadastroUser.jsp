<%--
  Created by IntelliJ IDEA.
  User: darko
  Date: 20/09/2018
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="br.com.fatecpg.setcc.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String error = null;

    if (request.getParameter("formDeleteUser") != null) {
        try {
            long idRM = Long.parseLong(request.getParameter("idRM"));
            User.removeUser(idRM);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }

    if (request.getParameter("formNewUser") != null) {
        String name = request.getParameter("name");
        String login = request.getParameter("email");
        String passwordHash = String.valueOf(request.getParameter("pass").hashCode());
        String tipoDeUsuario = request.getParameter("tipo");

        try {
            User.addUser(name, login, passwordHash, tipoDeUsuario);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="WEB-INF/jspf/favicon.jspf" %>

    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

    <title>Cadastro - Usuários</title>
</head>
<body>
<% if (session.getAttribute("user") == null) { %>
    <center><a href="home.jsp"><img src="Imagens/erro/tenor-you-shouldnt-have-come-here.gif" alt="EN: You Shouldn't Have Come Here"></a></center>
<% } else { %>
    <%@include file="WEB-INF/jspf/menu.jspf" %>

    <br>
    <div align="center">
        <div class="card" style="width: 60rem;">
            <form>

                <div class="form-group col-md-5">
                    <label>Nome</label>
                    <input required type="text" name="name" class="form-control"  placeholder="Insira o nome do usuário">
                </div>

                <div class="form-group col-md-5">
                    <label>Endereço de email</label>
                    <input required type="email" name="email" class="form-control" placeholder="Insira o email do usuário">
                </div>

                <div class="form-group col-md-5">
                    <label>Senha</label>
                    <input required type="password" name="pass" class="form-control" placeholder="Insira a senha">
                </div>

                <div class="form-group col-md-5">
                    <label>Usuário</label>
                    <select required name="tipo" class="form-control">
                        <option value="Administrador" selected>Administrador</option>
                        <option value="Professor">Professor</option>
                        <option value="Aluno">Aluno</option>
                    </select>
                </div>

                <input type="submit" name="formNewUser" value="add" class="btn btn-success"/>

                <br/>

            </form>
        </div>
    </div>

    <hr>
    <table class="table table-hover" >
        <thead>
        <tr class="table-active">
            <th scope="col">ID</th>
            <th scope="col">Nome</th>
            <th scope="col">Login/E-mail</th>
            <th scope="col">Tipo de Usuário</th>
            <th scope="col">Apagar</th>
        </tr>
        </thead>
        <% for(User u: User.getUsers()) { %>
        <tbody>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getLogin() %></td>
            <td><%= u.getTipoDeUsuario() %></td>
            <td>
                <form>
                    <input type="hidden" name="idRM" value="<%= u.getId() %>"/>
                    <input type="submit" name="formDeleteUser" value="Remover" class="btn btn-danger"/>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <br/>
<% } %>
</body>
</html>
