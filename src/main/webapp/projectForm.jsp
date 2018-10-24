<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ page import="br.com.fatecpg.setcc.Project" %>
<%@ page import="br.com.fatecpg.setcc.User" %>
 <%
    String pathForm = request.getContextPath();
    /*String error = null;*/

    if (request.getParameter("formNewProject") != null) {
        String tema = request.getParameter("tema");
        Byte[] pdfTCC = setBytes(request.getParameter("pdfTCC"));

        try {
            Project.addProject(name);
            response.sendRedirect(pathForm + "/projectList.jsp");
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
    <title>Cadastro de Projeto - SETCC</title>
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
    Cadastro de Projeto
</h1>
<p class="text-white link-nav"><a href="index.jsp">Home </a> <span class="lnr lnr-arrow-right"></span> <a href="projectForm.jsp"> Cadastro de Projeto</a></p>
<%@include file="WEB-INF/jspf/banner-page-down.jspf"%>
<!-- Banner page up - end -->

<div class="container-contact100"><!-- Formulário de Cadastro -->
    <div class="wrap-contact100">
        <form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Cadastrar Novo Projeto
				</span>

            <label class="label-input100" for="tema">Tema *</label>
            <div class="wrap-input100 validate-input">
                <input id="tema" class="input100" type="text" name="tema">
                <span class="focus-input100"></span>
            </div>

            <label class="label-input100" for="aluno">Integrantes *</label>
            <div class="wrap-input100 validate-input">
                <input id="aluno" class="input100" type="text" name="aluno">
                <span class="focus-input100"></span>
            </div>

            <label class="label-input100" for="professor">Orientador *</label>
            <div class="wrap-input100 validate-input">
                <input id="professor" class="input100" type="text" name="professor">
                <span class="focus-input100"></span>
            </div>

            <label class="label-input100" for="pdf">Projeto *</label>
            <div class="wrap-input100 validate-input">
                <input id="pdf" class="input100" type="file" name="pdfTCC">
                <span class="focus-input100"></span>
            </div>

            <div class="container-contact100-form-btn">
                <button type="submit" class="contact100-form-btn" name="formNewProject">
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



