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
            long id = Long.parseLong(request.getParameter("id"));
            User.removeUser(id);
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
    <title>Add - SETCC</title>
</head>
<body>
    <div>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
    </div>
    <br><br><br>
    <fieldset>
        <legend>Novo Usuário</legend>
        <form>
            Nome: <input type="text" name="name"/>
            Login/E-mail: <input type="email" name="email"/>
            Senha: <input type="password" name="pass"/>
            Tipo de Usuário:
            <select name="tipo">
                <option value="Aluno">Aluno</option>
                <option value="Administrador">Administrador</option>
                <option value="Professor">Professor</option>
            </select>
            <input type="submit" name="formNewUser" value="add"/>
        </form>
    </fieldset>
    <hr>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Login/E-mail</th>
                <th scope="col">Tipo de Usuário</th>
                <th scope="col">Comando</th>
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
                            <input type="hidden" name="id" value="<%= u.getId() %>"/>
                            <input type="submit" name="formDeleteUser" value="Remover"/>
                        </form>
                    </td>
                </tr>
            <% } %>
            </tbody>
    </table>
</body>
</html>
