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
    String caminho = request.getContextPath();
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

%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/jspf/favicon.jspf" %>

    <%@include file="/WEB-INF/jspf/cabecalho.jspf" %>

    <title>Lista - Usuários</title>
</head>
<body>
    <% if (session.getAttribute("user") == null) { %>
        <center><a href="<%=caminho%>/home.jsp"><img src="<%=caminho%>/Imagens/erro/tenor-you-shouldnt-have-come-here.gif" alt="EN: You Shouldn't Have Come Here"></a></center>
    <% } else { %>
        <%@include file="/WEB-INF/jspf/menu.jspf" %>

        <br>
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

    <%@include file="/WEB-INF/jspf/footer.jspf" %>
</body>
</html>
