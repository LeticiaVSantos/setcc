<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%@include file="WEB-INF/jspf/favicon.jspf" %>

    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

    <title>Projeto TCC</title>
</head>
<body>

    <%@include file="WEB-INF/jspf/menu.jspf" %>
    <% if (session.getAttribute("user") != null) { %>
        <hr>
        <div class="form-group row">
            <div class="col-sm-10">
                <a href="testUser.jsp" class="btn btn-primary" role="button">Cadastrar [TESTE]</a>
            </div>
        </div>
    <% } %>
</body>
</html>
