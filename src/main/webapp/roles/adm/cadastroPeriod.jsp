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
    <%@include file="/WEB-INF/jspf/favicon.jspf" %>

    <%@include file="/WEB-INF/jspf/cabecalho.jspf" %>

    <title>Cadastro - Períodos</title>
</head>
<body>
    <% if (session.getAttribute("user") == null) { %>
        <center><a href="<%=caminho%>/home.jsp"><img src="<%=caminho%>/Imagens/erro/tenor-you-shouldnt-have-come-here.gif" alt="EN: You Shouldn't Have Come Here"></a></center>
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

    <br>
    <hr>
    <table class="table table-hover" >
        <thead>
        <tr class="table-active">
            <th scope="col">ID</th>
            <th scope="col">Período</th>
            <th scope="col">Apagar</th>
            <th scope="col">Alterar</th>
        </tr>
        </thead>
        <% for(Period p: Period.getPeriods()) { %>
        <tbody>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getNamePeriod() %></td>
            <td>
                <form>
                    <input type="hidden" name="idRM" value="<%= p.getId() %>"/>
                    <input type="submit" name="formDeleteUser" value="Remover" class="btn btn-danger"/>
                </form>
            </td>
            <td>
                <form action="alterarPeriod.jsp">
                    <input type="hidden" name="idALT" value="<%= p.getId() %>"/>
                    <input type="hidden" name="nomePeriodALT" value="<%= p.getNamePeriod() %>"/>
                    <input  type="submit" value="Alterar" class="btn btn-primary"/>
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
