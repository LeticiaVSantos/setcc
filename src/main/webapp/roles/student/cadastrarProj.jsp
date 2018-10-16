
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String caminho = request.getContextPath();
%>
<html>
<head>

    <%@include file="../../WEB-INF/jspf/favicon.jspf" %>

    <%@include file="../../WEB-INF/jspf/cabecalho.jspf" %>

    <title>Cadastrar - Projeto</title>
</head>
<body>
    <% if (session.getAttribute("user") == null) { %>
    <center><a href="<%=caminho%>/home.jsp"><img src="<%=caminho%>/Imagens/erro/tenor-you-shouldnt-have-come-here.gif" alt="EN: You Shouldn't Have Come Here"></a></center>
    <% } else { %>
        <%@include file="/WEB-INF/jspf/menu.jspf" %>

        <br>
        <center>
            <div class="card" style="width: 60rem;">
                <form>

                    <div class="form-group col-md-5">
                        <label>Tema do Projeto</label>
                        <input type="text" class="form-control" name="nome" placeholder="Insira o tema do projeto">
                    </div>

                    <div class="form-group col-md-5">
                        <label>Integrantes</label>
                        <% for (User u: User.getUsers()) { %>
                        <% if (u.getTipoDeUsuario().equals("Aluno")) { %>
                        <input type="checkbox" class="form-control" name="integrantes" value="<%=u.getId()%>"> <%=u.getName()%> <br>
                        <% } %>
                        <% } %>
                    </div>

                    <div class="form-group col-md-5">
                        <label>Professor Orientador</label>
                        <% for (User u: User.getUsers()) { %>
                        <% if (u.getTipoDeUsuario().equals("Professor")) { %>
                        <input type="radio" class="form-control" name="professor" value="<%=u.getId()%>"> <%=u.getName()%> <br>
                        <% } %>
                        <% } %>
                    </div>

                    <div class="form-group col-md-5">
                        <label>PDF do TCC</label>
                        <input type="file" class="form-control" name="pdfTCC">
                    </div>

                    <%--<div class="form-group col-md-5">
                        <label>Curso</label>
                        <select class="form-control">
                            <option selected>Análise e Desenvolvimento de Sistemas</option>
                            <option>Comércio Exterior</option>
                            <option>Gestão Empresarial</option>
                            <option>Processos Químicos</option>
                        </select>
                    </div>--%>

                    <button type="submit" class="btn btn-primary">Cadastrar</button>

                </form>
            </div>
        </center>
        <br/>
    <% } %>

    <%@include file="/WEB-INF/jspf/footer.jspf" %>
</body>
</html>
