<%--
  Created by IntelliJ IDEA.
  User: Rafael
  Date: 12/10/2018
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="br.com.fatecpg.setcc.User"%>

<%
    String path = request.getContextPath();
    String errorMessage = null;

    if(request.getParameter("formLogin") != null){
        String login = request.getParameter("login");
        String pass = request.getParameter("passwordHash");
        User u = User.getUser(login, pass);
        if(u == null){
            errorMessage = "Usuário e/ou senha inválido(s)";
        }else{
            session.setAttribute("user", u);
            response.sendRedirect(path + "/home.jsp");
        }
    }

    if(request.getParameter("formLogoff") != null){
        session.removeAttribute("user");
        response.sendRedirect(path + "/home.jsp");
    }
%>

<html>
<head>
    <title>SETCC</title>

    <%@include file="WEB-INF/jspf/favicon.jspf" %>

    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

    <link href="css/css.css" rel="stylesheet"/>
</head>
<body>
<%if(session.getAttribute("user") == null){%>
<div class="limiter">
    <div class="container-login100" style="background-image: url('/Imagens/bg-01.jpg')">
        <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
            <form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-53">
						Iniciar Sessão
					</span>


                <div class="p-t-31 p-b-9">
						<span class="txt1">
                            Login
						</span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Username is required">
                    <input class="input100" type="text" name="login" placeholder="Exe.: Teste@teste.com" maxlength="40" required >
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-13 p-b-9">
						<span class="txt1">
                            Senha
						</span>

                </div>
                <div class="wrap-input100 validate-input" data-validate = "Password is required">
                    <input type="password" class="input100" name="passwordHash" placeholder="****" maxlength="40" required >
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn m-t-17">
                    <button type="submit" name="formLogin" class="login100-form-btn" value="Entrar"> Entrar </button>

                </div>

                <div class="w-full text-center p-t-55">
						<span class="txt2">
                            <a href="#">Esqueceu a senha?</a>
						</span>
                    <br/>

                    <a href="<%=path%>/roles/guest/cadastroGuestUser.jsp" class="txt2 bo1">
                        Cadastre-se
                    </a>
                </div>

            </form>
        </div>
    </div>
</div>
<%}%>


</body>
</html>
