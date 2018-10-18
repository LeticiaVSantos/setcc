<%--
  Created by IntelliJ IDEA.
  User: darko
  Date: 20/09/2018
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="br.com.fatecpg.setcc.User" %>
<%@ page import="br.com.fatecpg.setcc.Period" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String caminho = request.getContextPath();
    String error = null;

    if (request.getParameter("formNewPeriod") != null) {
        String name = request.getParameter("name");

        try {
            Period.addPeriod(name);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }

    if (request.getParameter("formDeleteUser") != null) {
        try {
            long idRM = Long.parseLong(request.getParameter("idRM"));
            Period.removePeriod(idRM);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>

    <title>Cadastro - Períodos</title>

    <%@include file="../../WEB-INF/jspf/favicon.jspf"%>


</head>
<body>
    <% if (session.getAttribute("user") == null) { %>
        <div align="center"><a href="<%=caminho%>/home.jsp"><img src="<%=caminho%>/Imagens/erro/tenor-you-shouldnt-have-come-here.gif" alt="EN: You Shouldn't Have Come Here"></a></div>
    <% } else { %>
        <%@include file="/WEB-INF/jspf/menu.jspf" %>
        <br>

        <br>
        <div align="center">
            <div class="card" style="width: 60rem;">
                <form>

                    <div class="form-group col-md-5">
                        <label>Período</label>
                        <input required type="text" name="name" class="form-control"  placeholder="Ex: Vespertino">
                    </div>

                    <input type="submit" name="formNewPeriod" value="Adicionar" class="btn btn-success"/>

                    <br/>

                </form>
            </div>
        </div>
    <br>


    <div class="limiter">
        <div class="container-table100">
            <div class="wrap-table100">
                <div class="table100 ver3 m-b-110">
                    <table data-vertable="ver3">
                        <thead>
                        <tr class="row100 head">
                            <th class="column100 column1" data-column="column1">ID</th>
                            <th class="column100 column2" data-column="column2">Período</th>
                            <th class="column100 column3" data-column="column3">Apagar</th>
                            <th class="column100 column4" data-column="column4">Alterar</th>

                        </tr>
                        </thead>
                        <% for(Period p: Period.getPeriods()) { %>
                        <tbody>
                        <tr class="row100">
                            <td class="column100 column1" data-column="column1"><%= p.getId() %></td>
                            <td class="column100 column2" data-column="column2"><%= p.getNamePeriod() %></td>
                            <td class="column100 column3" data-column="column3">
                                <form>
                                    <input type="hidden" name="idRM" value="<%= p.getId() %>"/>
                                    <input type="submit" name="formDeleteUser" value="Remover" class="genric-btn warning circle"/>
                                </form>
                            </td>
                            <td class="column100 column4" data-column="column4">
                                <form action="alterarPeriod.jsp">
                                    <input type="hidden" name="idALT" value="<%= p.getId() %>"/>
                                    <input type="hidden" name="nomePeriodALT" value="<%= p.getNamePeriod() %>"/>
                                    <input  type="submit" value="Alterar" class="genric-btn primary circle"/>
                                </form>
                            </td>

                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
              <% } %>


</body>
</html>
