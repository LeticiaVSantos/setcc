<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.fatecpg.setcc.Professor" %>
<%@ page import="br.com.fatecpg.setcc.Student" %>
<%
    String pathList = request.getContextPath();
    /*String error = null;*/
    boolean alterTable = false;

    if (request.getParameter("formAlterTable") != null) {
        alterTable = true;
    }

    if (request.getParameter("formUpdateUser") != null) {
        long id = Long.parseLong(request.getParameter("idALT"));
        String name = request.getParameter("nameALT");
        String login = request.getParameter("emailALT");
        String papel = request.getParameter("roleALT");

        try {
            User.altUser(id, name, login, papel);

            response.sendRedirect(pathList + "userList.jsp");
        } catch (Exception e) {
            /*error = e.getMessage();*/
        }
    }

    if (request.getParameter("formDeleteUser") != null) {
        try {
            long idRM = Long.parseLong(request.getParameter("idRM"));
            String papel = request.getParameter("papel");
            if (papel.equals("Aluno")) Student.removeStudent(idRM);
            if (papel.equals("Professor")) Professor.removeProfessor(idRM);
            User.removeUser(idRM);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            /*error = e.getMessage();*/
        }
    }

%>
<!DOCTYPE html>
<html lang="pt-br" class="no-js">
<head>
    <!-- Meta, Font e CSS -->
    <%@include file="WEB-INF/jspf/head.jspf"%>
    <!-- CSS Table -->
    <%@include file="WEB-INF/jspf/head-table.jspf"%>
    <!-- Site Title -->
    <title>Lista de Usuários - SETCC</title>
</head>
<body>

<% if (session.getAttribute("user") == null) { %>
<% response.sendRedirect(pathList + "/login.jsp"); %>
<% } else { %>

<!-- Menu -->
<%@include file="WEB-INF/jspf/menu.jspf" %>

<!-- Banner page up - begin -->
<%@include file="WEB-INF/jspf/banner-page-up.jspf"%>
<h1 class="text-white">
    Lista de Usuários
</h1>
<p class="text-white link-nav"><a href="index.jsp">Home </a> <span class="lnr lnr-arrow-right"></span> <a href="userList.jsp"> Lista de Usuários</a></p>
<%@include file="WEB-INF/jspf/banner-page-down.jspf"%>
<!-- Banner page up - end -->


<div class="limiter"><!-- Lista de Usuários -->
    <div class="container-table100">
        <div class="wrap-table100">
            <div class="table100 ver3 m-b-110">
                <table data-vertable="ver3">
                    <thead>
                    <%if(!alterTable) {%>
                    <tr class="row100 head">
                        <th class="column100 column2" data-column="column2">ID</th>
                        <th class="column100 column1" data-column="column1">Nome</th>
                        <th class="column100 column3" data-column="column3">E-mail</th>
                        <th class="column100 column4" data-column="column4">Papel</th>
                        <th class="column100 column5" data-column="column5">Alterar</th>
                        <th class="column100 column6" data-column="column6">Apagar</th>
                    </tr>
                    </thead>
                    <% for(User u: User.getUsers()) { %>
                    <tbody>
                    <tr class="row100">
                        <td class="column100 column2" data-column="column2"><%= u.getId() %></td>
                        <td class="column100 column1" data-column="column1"><%= u.getName() %></td>
                        <td class="column100 column3" data-column="column3"><%= u.getLogin() %></td>
                        <td class="column100 column4" data-column="column4"><%= u.getTipoDeUsuario() %></td>
                        <td class="column100 column5" data-column="column5">
                            <form action="<%=pathList%>/userList.jsp#jumpAlt" method="post">
                                <input type="hidden" name="idALT" value="<%= u.getId() %>"/>
                                <input type="hidden" name="nameALT" value="<%= u.getName() %>"/>
                                <input type="hidden" name="emailALT" value="<%= u.getLogin() %>"/>
                                <input type="hidden" name="roleALT" value="<%= u.getTipoDeUsuario() %>"/>
                                <input type="submit" name="formAlterTable" value="Alterar" class="genric-btn success"/>
                            </form>
                        </td>
                        <td class="column100 column6" data-column="column6">
                            <form>
                                <input type="hidden" name="idRM" value="<%= u.getId() %>"/>
                                <input type="hidden" name="papel" value="<%= u.getTipoDeUsuario() %>"/>
                                <input type="submit" name="formDeleteUser" value="Remover" class="genric-btn danger"/>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                    <% } else { %>
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-12 pb-40 header-text text-center">
                            <h1 id="jumpAlt" class="pb-10 text-dark">Alterando Informações de <%= request.getParameter("nameALT") %></h1>
                        </div>
                    </div>
                    <tr class="row100 head">
                        <th class="column100 column2" data-column="column2">ID</th>
                        <th class="column100 column1" data-column="column1">Nome</th>
                        <th class="column100 column3" data-column="column3">E-mail</th>
                        <th class="column100 column4" data-column="column4">Papel</th>
                        <th class="column100 column5" data-column="column5">Alterar</th>
                    </tr>
                    </thead>
                    <%--<% for(User u: User.getUsers()) { %>--%>
                    <tbody>
                    <tr class="row100">
                            <form action="<%=pathList%>/userList.jsp" method="post">
                            <td class="column100 column2" data-column="column2">
                                <%= request.getParameter("idALT") %>
                                <input type="hidden" name="idALT" value="<%= request.getParameter("idALT") %>"/>
                            </td>
                            <td class="column100 column1" data-column="column1">
                                <input id="name" class="input100" type="text" name="nameALT" value="<%= request.getParameter("nameALT") %>">
                            </td>
                            <td class="column100 column3" data-column="column3">
                                <input class="input100" type="text" name="emailALT" value="<%= request.getParameter("emailALT") %>">
                            </td>
                            <td class="column100 column4" data-column="column4">
                                <%= request.getParameter("roleALT") %>
                                <input type="hidden" name="roleALT" value="<%= request.getParameter("roleALT") %>"/>
                            </td>
                            <td class="column100 column5" data-column="column5">
                                <input type="submit" name="formUpdateUser" value="Salvar Alterações" class="genric-btn success"/>
                            </td>
                        </form>
                    </tr>
                    <%--<% } %>--%>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<% } %>

<!-- Footer -->
<%@include file="WEB-INF/jspf/footer.jspf"%>

<!-- JavaScript Table -->
<%@include file="WEB-INF/jspf/scripts-table.jspf"%>
<!-- JavaScript -->
<%@include file="WEB-INF/jspf/scripts.jspf"%>
</body>
</html>



