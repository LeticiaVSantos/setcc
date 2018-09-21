<%--
  Created by IntelliJ IDEA.
  User: darko
  Date: 20/09/2018
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="br.com.fatecpg.setcc.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
        long passwordHash = request.getParameter("pass").hashCode();
        String tipoDeUsuario = request.getParameter("tipo");

        User.addUser(name, login, passwordHash, tipoDeUsuario);

        try {
            User.addUser(name, login, passwordHash, tipoDeUsuario);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
%>
<html>
<head>
    <title>Usuários - SETCC</title>
</head>
<body>
    <h1>Usuários</h1>
    <% if (false) { %> <!-- session.getAttribute("user") == null -->
        <h2>É preciso estar autenticado para acessar este recurso</h2>
    <% } else { %>
        <%
            User user = (User) session.getAttribute("user");
            if (!user.getTipoDeUsuario().equals("Admnistrador")) {
        %>
        <h2>Você não tem permissão para acessar este recurso!</h2>
        <% } else { %>
        <% if (error != null) { %>
        <h3><%= error %></h3>
        <% } %>

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

        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Login/E-mail</th>
                <th>Tipo de Usuário</th>
                <th>Comando</th>
            </tr
            <% for(User u: User.getUsers()) { %>
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
        </table>
    <% } %>
    <% } %>
</body>
</html>
