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
    <%@include file="../../WEB-INF/jspf/cabecalho.jspf"%>

    <%@include file="../../WEB-INF/jspf/cabecalho.jspf" %>

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
        <form class="login100-form validate-form flex-sb flex-w col-md-5" action="<%=caminhoCSS%>/roles/guest/cadastroGuestUser.jsp" method="post">
            <legend>Papel: </legend>
            <select required name="papel" class="txt1 form-control col-md-5" >
                <option value="Aluno">Aluno</option>
                <option value="Professor">Professor</option>
            </select>
            <input type="submit" value="OK" class="btn btn-primary">
        </form>


        <%
            User u = new User();
            if (request.getParameter("papel") != null) {
                u.setTipoDeUsuario(request.getParameter("papel"));
                if (!u.getTipoDeUsuario().isEmpty()) {
        %>


        <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
            <div class="wrapper wrapper--w790">
                <div class="card card-5">
                    <div class="card-heading">
                        <h2 class="title">Cadastro</h2>
                    </div>
                    <div class="card-body">
                        <form method="POST">

                            <div class="form-row">
                                <div class="name">Nome</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input required type="text" name="name" class="input--style-5" placeholder="Insira o nome do usuário">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="name">Email</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input required type="email" name="email" class="input--style-5" placeholder="Insira o email do usuário">
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="name">Senha</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input required type="password" name="pass" class="input--style-5" placeholder="Insira a senha">
                                    </div>
                                </div>
                            </div>

                            <% if (u.getTipoDeUsuario().equals("Aluno")) { %>
                            <div class="form-row">
                                <div class="name">RA Aluno</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input required type="text" name="alunoRA" class="input--style-5" placeholder="1290581822013">
                                    </div>
                                </div>
                            </div>


                            <div class="form-row">
                                <div class="name">Período</div>
                                <div class="value">
                                    <div class="input-group">
                                        <div class="rs-select2 js-select-simple select--no-search">
                                            <select required name="periodo">
                                                <% for (Period p: Period.getPeriods()) { %>
                                                <option value="<%=p.getId()%>"><%=p.getNamePeriod()%></option>
                                                <% } %>
                                            </select>
                                            <div class="select-dropdown"></div>
                                            <% } %>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <% if (u.getTipoDeUsuario().equals("Professor")) { %>
                            <div class="form-row">
                                <div class="name">RA Professor</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input required type="text" name="professorCD" class="input--style-5" placeholder="1290581822013">
                                    </div>
                                </div>
                            </div>
                            <% } %>

                            <div>
                                <input type="hidden" name="tipo" value="<%=u.getTipoDeUsuario()%>">
                                <imput type="submit" name="formNewUser" value="Adicionar" class="btn btn--radius-2 btn--red"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

                <% } %>
                <% } %>

            </div>
           </div>
        </div>

</body>
</html>
