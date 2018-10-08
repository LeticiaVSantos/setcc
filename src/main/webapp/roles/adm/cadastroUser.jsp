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

    if (request.getParameter("formNewUser") != null) {
        String name = request.getParameter("name");
        String login = request.getParameter("email");
        String passwordHash = String.valueOf(request.getParameter("pass").hashCode());
        String tipoDeUsuario = request.getParameter("tipo");



        try {
            User.addUser(name, login, passwordHash, tipoDeUsuario);
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

    <title>Cadastro - Usuários</title>
</head>
<body>
    <% if (session.getAttribute("user") == null) { %>
        <center><a href="<%=caminho%>/home.jsp"><img src="<%=caminho%>/Imagens/erro/tenor-you-shouldnt-have-come-here.gif" alt="EN: You Shouldn't Have Come Here"></a></center>
    <% } else { %>
        <%@include file="/WEB-INF/jspf/menu.jspf" %>
        <form action="<%=caminho%>/roles/adm/cadastroUser.jsp" method="post">
            <legend>Papel: </legend>
            <select required name="papel" class="form-control">
                <option value="Administrador">Administrador</option>
                <option value="Professor">Professor</option>
                <option value="Aluno">Aluno</option>
            </select>
            <input type="submit" value="OK">
        </form>
        <br>
        <%
            User u = new User();
            if (request.getParameter("papel") != null) {
                u.setTipoDeUsuario(request.getParameter("papel"));
                if (!u.getTipoDeUsuario().isEmpty()) {
        %> <!--.equals("Aluno")-->

        <br>
        <div align="center">
            <div class="card" style="width: 60rem;">
                <form>

                    <div class="form-group col-md-5">
                        <label>Nome</label>
                        <input required type="text" name="name" class="form-control"  placeholder="Insira o nome do usuário">
                    </div>

                    <div class="form-group col-md-5">
                        <label>Endereço de email</label>
                        <input required type="email" name="email" class="form-control" placeholder="Insira o email do usuário">
                    </div>

                    <div class="form-group col-md-5">
                        <label>Senha</label>
                        <input required type="password" name="pass" class="form-control" placeholder="Insira a senha">
                    </div>

                    <% if (u.getTipoDeUsuario().equals("Aluno")) { %>
                    RA Aluno: <div class="form-group col-md-5"><input required type="text" name="alunoRA" class="form-control" placeholder="1290581822013"></div>
                    <% } %>
                    <% if (u.getTipoDeUsuario().equals("Professor")) { %>
                    RA Professor: <div class="form-group col-md-5"><input required type="text" name="professorRA" class="form-control" placeholder="1290581822013"></div>
                    <% } %>

                    <input type="hidden" name="tipo" value="<%=u.getTipoDeUsuario()%>">
                    <input type="submit" name="formNewUser" value="Adicionar" class="btn btn-success"/>

                    <br/>

                </form>
            </div>
        </div>
    <br>
    <% } %>
    <% } %>
    <% } %>

    <%@include file="/WEB-INF/jspf/footer.jspf" %>
</body>
</html>