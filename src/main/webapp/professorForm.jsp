<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.fatecpg.setcc.Course" %>
<%@ page import="br.com.fatecpg.setcc.CourseProfessor" %>

<%
    String pathForm = request.getContextPath();
    /*String error = null;*/

    if (request.getParameter("formNewCourseProfessor") != null) {


        try {
            CourseProfessor.addCourseProfessor();
            response.sendRedirect(pathForm + "/userList.jsp");
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
    <title>Cadastro de Usuários - SETCC</title>
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
    Cadastro de Usuários
</h1>
<p class="text-white link-nav"><a href="index.jsp">Home </a> <span class="lnr lnr-arrow-right"></span> <a href="professorForm.jsp"> Cadastro de Usuários</a></p>
<%@include file="WEB-INF/jspf/banner-page-down.jspf"%>
<!-- Banner page up - end -->

<div class="container-contact100"><!-- Formulário de Cadastro -->
    <div class="wrap-contact100">
        <form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Cadastrar Novo Usuário
				</span>

            <label class="label-input100" for="curso">Cursos Lecionados *</label>
            <div class="wrap-input100 validate-input">
                <select id="curso" class="input100" name="curso">
                    <% for (Course c: Course.getCourses()) { %>
                    <option value="<%=c.getId()%>"><%=c.getNameCourse()%></option>
                    <% } %>
                </select>
                <span class="focus-input100"></span>
            </div>

            <div class="container-contact100-form-btn">
                <button type="submit" class="contact100-form-btn" name="formNewCourseProfessor">
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



