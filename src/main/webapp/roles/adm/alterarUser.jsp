<%--
  Created by IntelliJ IDEA.
  User: Rafael
  Date: 08/10/2018
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="br.com.fatecpg.setcc.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String caminho = request.getContextPath();
    String error = null;

    if (request.getParameter("formUpdateUser") != null) {
        String name = request.getParameter("name");
        String login = request.getParameter("email");
        String passwordHash = String.valueOf(request.getParameter("pass").hashCode());

        try {
            long idRM = Long.parseLong(request.getParameter("idRM"));
            User.altUser(idRM, name, login, passwordHash);

            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();

        }
    }

%>

<html>
<head>
    <%@include file="/WEB-INF/jspf/favicon.jspf" %>
    <%@include file="/WEB-INF/jspf/cabecalho.jspf" %>

    <title>Alterar Usuário</title>
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
                <% long idRM = Long.parseLong(request.getParameter("idRM"));
                User u = User.getId(idRM); %>

                <tr>
                    <div class="form-group col-md-5">
                        <label>Nome</label>
                        <input required type="text" name="name" class="form-control" value="<%=u.getName()%>">
                    </div>

                    <div class="form-group col-md-5">
                        <label>Endereço de email</label>
                        <input required type="email" name="email" class="form-control" value="<%=u.getLogin()%>">
                    </div>

                    <div class="form-group col-md-5">
                        <label>Senha</label>
                        <input required type="password" name="pass" class="form-control" value="<%=u.getPasswordHash()%>">
                    </div>

                    <input type="hidden" name="id" value="<%= u.getId() %>">

                    <input type="submit" name="formUpdateUser" value="Alterar"/>

                <br/>

            </form>
        </div>
    </div>
    <br>
    <% } %>

    <%@include file="/WEB-INF/jspf/footer.jspf" %>
</body>
</html>
