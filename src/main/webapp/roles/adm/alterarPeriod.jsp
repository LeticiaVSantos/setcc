<%--
  Created by IntelliJ IDEA.
  User: Rafael
  Date: 10/10/2018
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="br.com.fatecpg.setcc.Period" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String caminho = request.getContextPath();
    String error = null;

    if (request.getParameter("formUpdateUser") != null) {
        long id = Long.parseLong(request.getParameter("id"));
        String nome = request.getParameter("nomePeriod");

        try {
            Period.altPeriod(id, nome);

            response.sendRedirect(caminho + "/roles/adm/cadastroPeriod.jsp");
        } catch (Exception e) {
            error = e.getMessage();
        }
    }

%>

<html>
<head>
    <%@include file="/WEB-INF/jspf/favicon.jspf" %>
    <%@include file="/WEB-INF/jspf/cabecalho.jspf" %>

    <title>Alterar Período</title>
</head>
<body>
    <%@include file="/WEB-INF/jspf/menu.jspf" %>

    <% if (session.getAttribute("user") == null) { %>
        <center><a href="<%=caminho%>/home.jsp"><img src="<%=caminho%>/Imagens/erro/tenor-you-shouldnt-have-come-here.gif" alt="EN: You Shouldn't Have Come Here"></a></center>
    <% } else { %>

    <br/>
    <div align="center">
        <div class="card" style="width: 60rem;">
            <form>
                <tr></tr>
                <div class="form-group col-md-5">
                    <label>Período</label>
                    <input required type="text" name="nomePeriod" class="form-control" value="<%=request.getParameter("nomePeriodALT")%>">
                </div>

                <input type="hidden" name="id" value="<%=request.getParameter("idALT")%>">

                <input type="submit" name="formUpdateUser" value="Alterar" class="btn btn-primary"/>

                <br/>

            </form>
        </div>
    </div>
    <br>
    <% } %>

    <%@include file="/WEB-INF/jspf/footer.jspf" %>
</body>
</html>
