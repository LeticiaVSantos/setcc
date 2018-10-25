<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.fatecpg.setcc.*" %>
<%
    String pathList = request.getContextPath();
    /*String error = null;*/
    boolean alterTable = false;

    if (request.getParameter("formAlterTable") != null) {
        alterTable = true;
    }

    if (request.getParameter("formUpdateProject") != null) {
        long id = Long.parseLong(request.getParameter("idALT"));
        String tema = request.getParameter("nameALT");
        long integrantes = Long.parseLong(request.getParameter("integrantesALT"));
        long orientador = Long.parseLong(request.getParameter("orientadorALT"));
        long season = Long.parseLong(request.getParameter("seasonALT"));
        String pdf = request.getParameter("pdfALT");

        try {
            Project.altProject(id, tema, integrantes, orientador, season, pdf);

            response.sendRedirect(pathList + "/projectList.jsp");
        } catch (Exception e) {
            /*error = e.getMessage();*/
        }
    }

    if (request.getParameter("formDeleteProject") != null) {
        try {
            long idRM = Long.parseLong(request.getParameter("idRM"));
            Period.removePeriod(idRM);
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
    <title>Lista de Períodos - SETCC</title>
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
    Lista de Projetos
</h1>
<p class="text-white link-nav"><a href="index.jsp">Home </a> <span class="lnr lnr-arrow-right"></span> <a href="projectList.jsp"> Lista de Projetos</a></p>
<%@include file="WEB-INF/jspf/banner-page-down.jspf"%>
<!-- Banner page up - end -->


<div class="limiter"><!-- Lista de Projetos -->
    <div class="container-table100">
        <div class="wrap-table100">
            <div class="table100 ver3 m-b-110">
                <table data-vertable="ver3">
                    <thead>
                    <%if(!alterTable) {%>
                    <tr class="row100 head">
                        <th class="column100 column2" data-column="column2">ID</th>
                        <th class="column100 column1" data-column="column1">Tema</th>
                        <th class="column100 column1" data-column="column1">Integrantes</th>
                        <th class="column100 column1" data-column="column1">Orientador</th>
                        <th class="column100 column1" data-column="column1">Data de Entrega</th>
                        <th class="column100 column1" data-column="column1">Arquivo</th>
                        <th class="column100 column5" data-column="column3">Alterar</th>
                        <th class="column100 column6" data-column="column4">Apagar</th>
                    </tr>
                    </thead>
                    <% for(Project p: Project.getProjects()) { %>
                    <tbody>
                    <tr class="row100">
                        <td class="column100 column2" data-column="column2"><%= p.getId() %></td>
                        <td class="column100 column1" data-column="column1"><%= p.getName() %></td>
                        <td class="column100 column1" data-column="column1"><%= p.getIdStudent() %></td>
                        <td class="column100 column1" data-column="column1"><%= p.getIdProfessor() %></td>
                        <td class="column100 column1" data-column="column1"><%= p.getIdSeason() %></td>
                        <td class="column100 column1" data-column="column1"><%= p.getPdfProject() %></td>
                        <td class="column100 column5" data-column="column3">
                            <form action="<%=pathList%>/periodList.jsp#jumpAlt" method="post">
                                <input type="hidden" name="idALT" value="<%= p.getId() %>"/>
                                <input type="hidden" name="nameALT" value="<%= p.getName() %>"/>
                                <input type="submit" name="formAlterTable" value="Alterar" class="genric-btn success"/>
                            </form>
                        </td>
                        <td class="column100 column6" data-column="column6">
                            <form>
                                <input type="hidden" name="idRM" value="<%= p.getId() %>"/>
                                <input type="submit" name="formDeleteProject" value="Remover" class="genric-btn danger"/>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                    <% } else { %>
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-12 pb-40 header-text text-center">
                            <form class="contact100-form validate-form">
                            <h1 id="jumpAlt" class="contact100-form-title">Alterando Informações</h1>

                    <tr class="row100 head">
                        <th class="column100 column2" data-column="column2">ID</th>
                        <th class="column100 column1" data-column="column1">Tema</th>
                        <th class="column100 column1" data-column="column1">Integrantes</th>
                        <th class="column100 column1" data-column="column1">Orientador</th>
                        <th class="column100 column1" data-column="column1">Temporada de Entrega</th>
                        <th class="column100 column1" data-column="column1">Arquivo</th>
                        <th class="column100 column5" data-column="column3">Alterar</th>
                    </tr>
                    </thead>
                    <%--<% for(User u: User.getUsers()) { %>--%>
                    <tbody>
                    <tr class="row100">
                            <form action="<%=pathList%>/projectList.jsp" method="post">
                            <td class="column100 column2" data-column="column2">
                                <%= request.getParameter("idALT") %>
                                <input type="hidden" name="idALT" value="<%= request.getParameter("idALT") %>"/>
                            </td>

                            <td class="column100 column1" data-column="column1">
                                <input id="name" class="input100" type="text" name="temaALT" value="<%= request.getParameter("temaALT") %>">
                            </td>

                                <td class="column100 column1" data-column="column1">
                                    <% for (User u: User.getUsers()) { %>
                                    <% if (u.getTipoDeUsuario().equals("Aluno")) {%>
                                    <input class="input100" type="checkbox" name="integranteALT" value="<%=u.getId()%>"> <%=u.getName()%><br/>
                                    <% } %>
                                    <% } %>
                                </td>

                                <td class="column100 column1" data-column="column1">
                                    <% for (User u: User.getUsers()) { %>
                                    <% if (u.getTipoDeUsuario().equals("Professor")) {%>
                                    <input class="input100" type="checkbox" name="orientadorALT" value="<%=u.getId()%>"> <%=u.getName()%><br/>
                                    <% } %>
                                    <% } %>
                                </td>

                                <td class="column100 column1" data-column="column1">
                                    <select id="season" class="input100" name="seasonALT">
                                        <% for (Season s: Season.getSeasons()) { %>
                                        <option value="<%=s.getId()%>"><%=s.getDeadlineProjeto()%></option>
                                        <% } %>
                                    </select>
                                </td>

                                <td class="column100 column1" data-column="column1">
                                    <input class="input100" type="text" name="pdfALT" value="<%= request.getParameter("pdfALT") %>">
                                </td>

                            <td class="column100 column5" data-column="column3">
                                <input type="submit" name="formUpdateProject" value="Salvar Alterações" class="genric-btn success"/>
                            </td>
                        </form>
                    </tr>
                    <%--<% } %>--%>
                    <% } %>
                    </tbody>
                </table>
            </form>
            </div>
        </div>
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



