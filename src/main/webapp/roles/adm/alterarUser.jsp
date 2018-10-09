<%--
  Created by IntelliJ IDEA.
  User: Rafael
  Date: 08/10/2018
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="br.com.fatecpg.setcc.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String caminho = request.getContextPath();
    String error = null;

    if (request.getParameter("formUpdateUser") != null) {
        long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String login = request.getParameter("email");
        String papel = request.getParameter("papel");

        try {
            User.altUser(id, name, login, papel);

            response.sendRedirect(caminho + "/roles/adm/listaUser.jsp");
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
                <tr></tr>
                    <div class="form-group col-md-5">
                        <label>Nome</label>
                        <input required type="text" name="name" class="form-control" value="<%=request.getParameter("nomeALT")%>">
                    </div>

                    <div class="form-group col-md-5">
                        <label>Endereço de email</label>
                        <input required type="email" name="email" class="form-control" value="<%=request.getParameter("loginALT")%>">
                    </div>

                    <div class="form-group col-md-5">
                        <label>Tipo de Usuário</label>
                        <select required name="papel" class="form-control">
                            <option value="Administrador">Administrador</option>
                            <option value="Professor">Professor</option>
                            <option value="Aluno">Aluno</option>
                        </select>
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
