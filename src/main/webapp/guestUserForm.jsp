<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.fatecpg.setcc.*" %>
<%
    String pathForm = request.getContextPath();
    String error = null;
    boolean ocultar = false;

    User pU = new User();
    if (request.getParameter("papel") != null) {
        pU.setTipoDeUsuario(request.getParameter("papel"));
        if (!pU.getTipoDeUsuario().isEmpty()) ocultar = true;
    }

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
        if(!validador.equals("@@fatec.sp.gov.br")  && !validador.equals("@@fatecpg.com.br")){
            error = "E-mail inválido! Insira um e-mail @fatec.sp.gov.br ou @fatecpg.com.br.";
        } else {

            String passwordHash = String.valueOf(request.getParameter("pass").hashCode());
            String tipoDeUsuario = request.getParameter("tipo");
            String alunoRA = null;
            if (request.getParameter("alunoRA") != null) alunoRA = request.getParameter("alunoRA");
            String professorCD = null;
            if (request.getParameter("professorCD") != null) professorCD = request.getParameter("professorCD");
            Long curso = null;
            if (request.getParameter("curso") != null) curso = Long.parseLong(request.getParameter("curso"));
            Long periodo = null;
            if (request.getParameter("periodo") != null) periodo = Long.parseLong(request.getParameter("periodo"));
            try {
                User.addUser(name, login, passwordHash, tipoDeUsuario);

                if (tipoDeUsuario.equals("Aluno")) {

                    Long idUser = null;

                    for (User u : User.getUsers()) {
                        if (u.getLogin().equals(login)) {
                            idUser = Long.parseLong(u.getId().toString());
                            break;
                        }
                    }

                    try {
                        Student.addStudent(alunoRA, idUser, periodo, curso);
                    } catch (Exception e) {
                        /*error = e.getMessage();*/
                    }
                } else if (tipoDeUsuario.equals("Professor")) {
                    Long idUser = null;

                    for (User u : User.getUsers()) {
                        if (u.getLogin().equals(login)) {
                            idUser = Long.parseLong(u.getId().toString());
                            break;
                        }
                    }

                    try {
                        Professor.addProfessor(professorCD, idUser);
                    } catch (Exception e) {
                        /*error = e.getMessage();*/
                    }
                }

                if(error == null) response.sendRedirect(pathForm + "/login.jsp#entrar");
                /*else response.sendRedirect(request.getRequestURI());*/
            } catch (Exception e) {
                /*error = e.getMessage();*/
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="pt-br" class="no-js">
<head>
    <!-- Meta, Font e CSS -->
    <%@include file="WEB-INF/jspf/head.jspf"%>
    <!-- CSS Form -->
    <%@include file="WEB-INF/jspf/head-form.jspf"%>
    <!-- Site Title -->
    <title>Cadastro de Usuários - SETCC</title>
</head>
<body>

<!-- Menu -->
<%@include file="WEB-INF/jspf/menu.jspf" %>

<% if(error != null){ %>
<script>alert ("<%= error %>");</script>
<%}%>

<!-- start banner Area -->
<section class="banner-area" id="home">
    <div class="container">
        <div class="row fullscreen d-flex align-items-center justify-content-center">
            <div class="banner-content col-lg-6 col-md-6">
                <h1>
                    Aqui você <br>
                    Pode se cadastrar <br>
                    Para acessar o sistema
                </h1>
                <p class="text-white text-uppercase">
                    <%--Vamos ajudar você a submeter o TCC de forma simples e rápida.--%>
                </p>
                <a href="#cadastrar" class="primary-btn header-btn text-uppercase">Iniciar Cadastro</a>
                <br><br>
                <a href="<%=pathForm%>/login.jsp#entrar" class="primary-btn header-btn text-uppercase">Já sou cadastrado!</a>
            </div>
            <div class="banner-img col-lg-6 col-md-6">
                <img class="img-fluid" src="img/banner-img.png" alt="">
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<%if(!ocultar) {%>
<div id="cadastrar" class="container-contact100"><!-- Verificar tipo de Usuário -->
    <div class="wrap-contact100">
        <form class="contact100-form validate-form rs1" action="<%=pathForm%>/guestUserForm.jsp#continuarCadastro" method="post">
            <span class="contact100-form-title">
                Comece Selecionando o Papel do Usuário
            </span>

            <label class="label-input100" for="papel">Papel</label>
            <div class="wrap-input100 validate-input">
                <select id="papel" class="input100" name="papel" class="form-control">
                    <option value="Aluno">Aluno</option>
                    <option value="Professor">Professor</option>
                </select>
                <span class="focus-input100"></span>
            </div>

            <div class="container-contact100-form-btn">
                <button type="submit" class="contact100-form-btn">
						<span>
							Selecionar
							<i class="zmdi zmdi-arrow-right m-l-8"></i>
						</span>
                </button>
            </div>
        </form>
    </div>
</div>
<%} else {%>

<div id="continuarCadastro" class="container-contact100"><!-- Formulário de Cadastro -->
    <div class="wrap-contact100">
        <form class="contact100-form validate-form" method="post">
				<span class="contact100-form-title">
					Agora Informe Seus Dados para Cadastro
				</span>

            <label class="label-input100" for="name">Nome *</label>
            <div class="wrap-input100 validate-input">
                <input id="name" class="input100" type="text" name="name" placeholder="Ex: David Robert Jones" value="<%if(request.getParameter("name") != null) { %> <%=request.getParameter("name")%> <% } %>">
                <span class="focus-input100"></span>
            </div>

            <label class="label-input100" for="email">E-mail *</label>
            <div class="wrap-input100 validate-input">
                <input id="email" class="input100" type="text" name="email" placeholder="Ex: majortom@fatec.sp.gov.br">
                <span class="focus-input100"></span>
            </div>

            <label class="label-input100" for="password">Senha *</label>
            <div class="wrap-input100 validate-input">
                <input id="password" class="input100" type="password" name="pass" placeholder="************">
                <span class="focus-input100"></span>
            </div>

            <% if (pU.getTipoDeUsuario().equals("Aluno")) { %>
            <label class="label-input100 validate-input" for="raAluno">RA *</label>
            <div class="wrap-input100">
                <input required id="raAluno" class="input100" type="text" name="alunoRA" placeholder="Ex: 1290481822001" value="<%if(request.getParameter("alunoRA") != null) { %> <%=request.getParameter("alunoRA")%> <% } %>">
                <span class="focus-input100"></span>
            </div>

            <label class="label-input100" for="curso">Curso *</label>
            <div class="wrap-input100 validate-input">
                <select id="curso" class="input100" name="curso">
                    <% for (Course c: Course.getCourses()) { %>
                    <option value="<%=c.getId()%>"><%=c.getNameCourse()%></option>
                    <% } %>
                </select>
                <span class="focus-input100"></span>
            </div>

            <label class="label-input100" for="periodo">Período *</label>
            <div class="wrap-input100 validate-input">
                <select id="periodo" class="input100" name="periodo">
                    <% for (Period p: Period.getPeriods()) { %>
                    <option value="<%=p.getId()%>"><%=p.getNamePeriod()%></option>
                    <% } %>
                </select>
                <span class="focus-input100"></span>
            </div>
            <% } %>

            <% if (pU.getTipoDeUsuario().equals("Professor")) { %>
            <label class="label-input100 validate-input" for="cdProfessor">Cód. Professor*</label>
            <div class="wrap-input100">
                <input required id="cdProfessor" class="input100" type="text" name="professorCD" placeholder="Ex: 1290481822001" value="<%if(request.getParameter("professorCD") != null) { %> <%=request.getParameter("professorCD")%> <% } %>">
                <span class="focus-input100"></span>
            </div>
            <% } %>

            <input type="hidden" name="papel" value="<%=request.getParameter("papel")%>">
            <input type="hidden" name="tipo" value="<%=pU.getTipoDeUsuario()%>">

            <div class="container-contact100-form-btn">
                <button type="submit" class="contact100-form-btn" name="formNewUser">
						<span>
							Cadastrar
							<i class="zmdi zmdi-arrow-right m-l-8"></i>
						</span>
                </button>
            </div>
        </form>
    </div>
</div>

<% } %>

<!-- Footer -->
<%@include file="WEB-INF/jspf/footer.jspf"%>

<!-- JavaScript Form -->
<%@include file="WEB-INF/jspf/scripts-form.jspf"%>
<!-- JavaScript -->
<%@include file="WEB-INF/jspf/scripts.jspf"%>
</body>
</html>



