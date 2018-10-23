<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.fatecpg.setcc.Season" %>

<%
    String pathForm = request.getContextPath();
    /*String error = null;*/

    if (request.getParameter("formNewSeason") != null) {
        String inicio = request.getParameter("inicio");
        String fim = request.getParameter("fim");
        String deadline = request.getParameter("deadline");

        try {
            Season.addSeason(inicio, fim, deadline);
            response.sendRedirect(pathForm + "/seasonList.jsp");
        } catch (Exception e) {
            /*error = e.getMessage();*/
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
    <title>Cadastro de Temporadas - SETCC</title>
</head>
<body>

<% if (session.getAttribute("user") == null) { %>
<% response.sendRedirect(pathForm + "/login.jsp"); %>
<% } else { %>

<!-- Menu -->
<%@include file="WEB-INF/jspf/menu.jspf" %>

<!-- Banner page up - begin -->
<%@include file="WEB-INF/jspf/banner-page-up.jspf"%>
<h1 class="text-white">
    Cadastro de Temporadas
</h1>
<p class="text-white link-nav"><a href="index.jsp">Home </a> <span class="lnr lnr-arrow-right"></span> <a href="periodForm.jsp"> Cadastro de Temporada</a></p>
<%@include file="WEB-INF/jspf/banner-page-down.jspf"%>
<!-- Banner page up - end -->

<div class="container-contact100"><!-- Formulário de Cadastro -->
    <div class="wrap-contact100">
        <form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Cadastrar Nova Temporada
				</span>

            <label class="label-input100" for="name">Início da Temporada *</label>
            <div class="wrap-input100 validate-input">
                <input id="name" class="input100" type="date" name="inicio">
                <span class="focus-input100"></span>
            </div>

            <label class="label-input100" for="name1">Término da Temporada *</label>
            <div class="wrap-input100 validate-input">
                <input id="name1" class="input100" type="date" name="fim">
                <span class="focus-input100"></span>
            </div>

            <label class="label-input100" for="name2">Prazo Final para a Entrega dos Projetos *</label>
            <div class="wrap-input100 validate-input">
                <input id="name2" class="input100" type="date" name="deadline">
                <span class="focus-input100"></span>
            </div>

            <div class="container-contact100-form-btn">
                <button type="submit" class="contact100-form-btn" name="formNewSeason">
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



