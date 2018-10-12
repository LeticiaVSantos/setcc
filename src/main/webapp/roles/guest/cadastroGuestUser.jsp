<%--
  Created by IntelliJ IDEA.
  User: darko
  Date: 20/09/2018
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="br.com.fatecpg.setcc.*" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.OutputStreamWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String caminho = request.getContextPath();
    String error = null;

    if (request.getParameter("formNewUser") != null) {
        String name = request.getParameter("name");
        String login = request.getParameter("email");

        char charLogin [] = login.toCharArray();
        boolean flag = false;
        String validador =null;
        for (char letra: charLogin){
            if(letra == '@' || flag == true){
                if(!flag) {
                    validador = String.valueOf(letra);
                    flag = true;
                }
                validador = validador + String.valueOf(letra);
            }
        }
        if(!validador.equals("@@fatec.sp.gov.br")){
            error = "E-mail inválido! Cadastre-se com o seu e-mail institucional.";
        } else {

        String passwordHash = String.valueOf(request.getParameter("pass").hashCode());
        String tipoDeUsuario = request.getParameter("tipo");
        String alunoRA = null; if (request.getParameter("alunoRA") != null) alunoRA = request.getParameter("alunoRA");
        String professorCD = null; if (request.getParameter("professorCD") != null) professorCD = request.getParameter("professorCD");
        Long periodo = null; if (request.getParameter("periodo") != null) periodo = Long.parseLong(request.getParameter("periodo"));
        try {
            User.addUser(name, login, passwordHash, tipoDeUsuario);

            if (tipoDeUsuario.equals("Aluno")) {

                Long idUser = null;

                for (User u: User.getUsers()){
                    if (u.getLogin().equals(login)){
                        idUser = Long.parseLong(u.getId().toString());
                        break;
                    }
                }

                try {
                    Student.addStudent(alunoRA, idUser, periodo);
                } catch (Exception e) {
                    error = e.getMessage();
                }
            } else if (tipoDeUsuario.equals("Professor")){
                Long idUser = null;

                for (User u: User.getUsers()){
                    if (u.getLogin().equals(login)){
                        idUser = Long.parseLong(u.getId().toString());
                        break;
                    }
                }

                try {
                    Professor.addProfessor(professorCD, idUser);
                } catch (Exception e) {
                    error = e.getMessage();
                }
            }

            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/jspf/favicon.jspf" %>

    <%@include file="/WEB-INF/jspf/cabecalho.jspf" %>

    <title>Cadastro - SETCC</title>
</head>
<body>
        <%@include file="/WEB-INF/jspf/menu.jspf" %>
        <% if(error != null){ %>
        <script>alert ("<%= error %>");</script>
        <%}%>
        <div align="center">
        <div class="limiter">
            <div style="background-image: url('/Imagens/bg-01.jpg')">
        <form class="login100-form validate-form flex-sb flex-w col-md-5" action="<%=caminho%>/roles/guest/cadastroGuestUser.jsp" method="post">
            <legend>Papel: </legend>
            <select required name="papel" class="form-control col-md-5" >
                <option value="Aluno">Aluno</option>
                <option value="Professor">Professor</option>
            </select>
            <input type="submit" value="OK" class="btn btn-primary">
        </form>
        <br>

        <%
            User u = new User();
            if (request.getParameter("papel") != null) {
                u.setTipoDeUsuario(request.getParameter("papel"));
                if (!u.getTipoDeUsuario().isEmpty()) {
        %>

        <br>

            <div class="card" style="width: 60rem;">
                <form>

                    <div class="wrap-input100 validate-input col-md-5">
                        <label>Nome</label>
                        <input required type="text" name="name" class="form-control"  placeholder="Insira o nome do usuário">
                    </div>

                    <div class="wrap-input100 validate-input col-md-5">
                        <label>Endereço de email</label>
                        <input required type="email" name="email" class="form-control" placeholder="Insira o email do usuário">
                    </div>

                    <div class="wrap-input100 validate-input col-md-5">
                        <label>Senha</label>
                        <input required type="password" name="pass" class="form-control" placeholder="Insira a senha">
                    </div>

                    <% if (u.getTipoDeUsuario().equals("Aluno")) { %>
                    RA Aluno: <div class="wrap-input100 validate-input col-md-5"><input required type="text" name="alunoRA" class="form-control" placeholder="1290581822013"></div>
                    <legend>Período: </legend>
                    <select required name="periodo" class="form-control">
                    <% for (Period p: Period.getPeriods()) { %>
                        <option value="<%=p.getId()%>"><%=p.getNamePeriod()%></option>
                    <% } %>
                    </select>
                    <% } %>
                    <% if (u.getTipoDeUsuario().equals("Professor")) { %>
                    RA Professor: <div class="wrap-input100 validate-input col-md-5"><input required type="text" name="professorCD" class="form-control" placeholder="1290581822013"></div>
                    <% } %>

                    <input type="hidden" name="tipo" value="<%=u.getTipoDeUsuario()%>">
                    <input type="submit" name="formNewUser" value="Adicionar" class="btn btn-success"/>

                    <br/>

                </form>
            </div>

    <br>
    <% } %>
    <% } %>

            </div>
        </div>
        </div>
</body>
</html>
