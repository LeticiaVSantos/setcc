<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String pathLogin = request.getContextPath();
    /*String errorMessage = null;*/

    if(request.getParameter("formLogin") != null){
        String login = request.getParameter("username");
        String pass = request.getParameter("pass");
        User u = User.getUser(login, pass);
        if(u == null){
            /*errorMessage = "Usuário e/ou senha inválido(s)";*/
        }else{
            session.setAttribute("user", u);
            response.sendRedirect(pathLogin + "/index.jsp");
        }
    }

    if(request.getParameter("formLogoff") != null){
        session.removeAttribute("user");
        response.sendRedirect(pathLogin + "/login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="pt-br" class="no-js">
<head>
    <!-- Meta, Font e CSS -->
    <%@include file="WEB-INF/jspf/head.jspf"%>
    <!-- CSS Login -->
    <%@include file="WEB-INF/jspf/head-login.jspf"%>
    <!-- Site Title -->
    <title>Login - SETCC</title>
</head>
<body>

<%if(session.getAttribute("user") == null){%>

<!-- Menu -->
<%@include file="WEB-INF/jspf/menu.jspf" %>

<!-- start banner Area -->
<section class="banner-area" id="home">
    <div class="container">
        <div class="row fullscreen d-flex align-items-center justify-content-center">
            <div class="banner-content col-lg-6 col-md-6">
                <h1>
                    Entre no <br>
                    Sistema para <br>
                    Submeter o seu TCC
                </h1>
                <p class="text-white text-uppercase">
                    <%--Vamos ajudar você a submeter o TCC de forma simples e rápida.--%>
                </p>
                <a href="#entrar" class="primary-btn header-btn text-uppercase">Iniciar Sessão</a>
            </div>
            <div class="banner-img col-lg-6 col-md-6">
                <img class="img-fluid" src="img/banner-img.png" alt="">
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->


<div class="limiter" id="entrar"><!-- Formulário de Sessão -->
    <div class="container-login100" style="background-image: url('images/bg-01_login.jpg');">
        <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
            <form class="login100-form validate-form flex-sb flex-w" method="post">
					<span class="login100-form-title p-b-53">
						Iniciar Sessão
					</span>

                <div class="p-t-31 p-b-9">
						<span class="txt1">
							E-mail
						</span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Insira um e-mail @fatec.sp.gov.br ou @fatecpg.com.br">
                    <input class="input100" type="text" name="username" placeholder="Ex: majortom@fatec.sp.gov.br">
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-13 p-b-9">
						<span class="txt1">
							Senha
						</span>

                    <a href="#" class="txt2 bo1 m-l-5">
                        Esqueceu a senha?
                    </a>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Insira a sua senha">
                    <input class="input100" type="password" name="pass" placeholder="******************">
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn m-t-17">
                    <input type="submit" class="login100-form-btn" name="formLogin" value="Entrar">
                </div>

                <div class="w-full text-center p-t-55">
						<span class="txt2">
							Não possui cadastro?
						</span>

                    <a href="<%=pathLogin%>/guestUserForm.jsp" class="txt2 bo1">
                        Cadastrar-se
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<%}%>

<!-- Footer -->
<%@include file="WEB-INF/jspf/footer.jspf"%>

<!-- JavaScript Login -->
<%@include file="WEB-INF/jspf/scripts-login.jspf"%>
<!-- JavaScript -->
<%@include file="WEB-INF/jspf/scripts.jspf"%>
</body>
</html>



