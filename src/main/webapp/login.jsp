<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%@include file="WEB-INF/jspf/favicon.jspf" %>

    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

    <title>Projeto TCC</title>
</head>
<body>

<br>
<br>

<center>


    <div class="card" style="width: 40rem;">
        <div class="card-body">
            <form>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Login</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="Login">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Senha</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" placeholder="Senha">
                    </div>
                </div>
                <table>
                    <tr>
                        <td>
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <a href="home.jsp" class="btn btn-primary" role="button">Entrar</a>
                                </div>
                            </div>
                        </td>

                        <td>

                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <a href="cadastroUser.jsp" class="btn btn-primary" role="button">Cadastrar</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>

                <a href="#"> Esqueceu sua senha?</a>

            </form>
        </div>
    </div>
</center>

</body>
</html>