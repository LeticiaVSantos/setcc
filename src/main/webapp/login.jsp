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
    <br/>
    <center>
        <div class="card" style="width: 40rem;">
            <div class="card-body">
                <form method="post">

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Login</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="login" placeholder="Login">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Senha</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="passwordHash" placeholder="Senha">
                        </div>
                    </div>
                    <table>
                        <tr>
                            <td>
                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <input type="submit" name="formLogin" value="Entrar" class="btn btn-primary" role="button"/>
                                    </div>
                                </div>
                            </td>

                        </tr>
                    </table>

                    <a href="#"> Esqueceu sua senha?</a><br/>
                    <a href="<%=path%>/roles/guest/cadastroGuestUser.jsp"> Cadastre-se</a>

                </form>
            </div>
        </div>
    </center>
<%}%>

<%@include file="/WEB-INF/jspf/footer.jspf" %>
</body>
</html>
