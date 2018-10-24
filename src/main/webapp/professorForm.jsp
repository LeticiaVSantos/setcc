<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.fatecpg.setcc.Course" %>
<%@ page import="br.com.fatecpg.setcc.CourseProfessor" %>
<%@ page import="br.com.fatecpg.setcc.Professor" %>

<%
    String pathForm = request.getContextPath();
    /*String error = null;*/
    boolean ocultar = false;
    Long quantidadeCursos = (long)3;
    Long[] arrayCourse = null;

    if (request.getParameter("qtdCursos") != null) {
        quantidadeCursos = Long.parseLong(request.getParameter("qtdCursos"));
        arrayCourse = new Long[quantidadeCursos.intValue()];
        ocultar = true;
    }



    if (request.getParameter("formNewCourseProfessor") != null) {

        for (int i = 0; i < quantidadeCursos.intValue(); i++) {
            arrayCourse[i] = Long.parseLong(request.getParameter("curso"+i));
        }

        Long idUser;
        Long idProfessor = null;
        /*Long idCourse = Long.parseLong(request.getParameter("curso"));*/
        String login = request.getParameter("email");

        for (User u : User.getUsers()) {
            if (u.getLogin().equals(login)) {
                idUser = Long.parseLong(u.getId().toString());

                for (Professor p : Professor.getProfessors()) {
                    if(p.getIdUser().equals(idUser)) {
                        idProfessor = Long.parseLong(p.getId().toString());
                        break;
                    }
                }

                break;
            }
        }

        try {
            for (int i = 0; i < arrayCourse.length; i++) {
                CourseProfessor.addCourseProfessor(idProfessor, arrayCourse[i]);
            }
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

<% if (false) { %> <%--session.getAttribute("user") == null--%>
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

<%if(!ocultar) {%>
<div class="container-contact100"><!-- Verificar tipo de Usuário -->
    <div class="wrap-contact100">
        <form class="contact100-form validate-form rs1" action="<%=pathForm%>/professorForm.jsp" method="post">
            <span class="contact100-form-title">
                Selecione a Quantidade de Cursos Lecionados
                <p>Ex: Análise e Desenvolvimento de Sistemas, Comércio Exterior etc.</p>
            </span>

            <label class="label-input100" for="quantidadeCursos">Quantidade</label>
            <div class="wrap-input100 validate-input">
                <select id="quantidadeCursos" class="input100" name="qtdCursos" class="form-control">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
                <span class="focus-input100"></span>
            </div>

            <div class="container-contact100-form-btn">
                <input type="hidden" name="email" value="<%=request.getParameter("email")%>">
                <button type="submit" class="contact100-form-btn" name="cursos">
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

<div class="container-contact100"><!-- Formulário de Cadastro -->
    <div class="wrap-contact100">
        <form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Cadastrar Novo Usuário
				</span>

            <label class="label-input100" for="curso">Cursos Lecionados *</label>
            <div class="wrap-input100 validate-input">
                <% for (int i = 0; i < quantidadeCursos; i++) { %>
                <select id="curso" class="input100" name="curso<%=i%>">
                    <% for (Course c: Course.getCourses()) { %>
                    <option value="<%=c.getId()%>"><%=c.getNameCourse()%></option>
                    <% } %>
                </select>
                <% } %>
                <span class="focus-input100"></span>
            </div>

            <div class="container-contact100-form-btn">
                <input type="hidden" name="email" value="<%=request.getParameter("email")%>">
                <input type="hidden" name="qtdCursos" value="<%=request.getParameter("qtdCursos")%>">
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

<% } %>

<!-- Footer -->
<%@include file="WEB-INF/jspf/footer.jspf"%>

<!-- JavaScript Form -->
<%@include file="WEB-INF/jspf/scripts-form.jspf"%>
<!-- JavaScript -->
<%@include file="WEB-INF/jspf/scripts.jspf"%>
</body>
</html>



