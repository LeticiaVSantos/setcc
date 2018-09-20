<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

    <title>Cadastro - Usuários</title>
</head>
<body>

<%@include file="WEB-INF/jspf/favicon.jspf" %>

<%@include file="WEB-INF/jspf/menu.jspf" %>

<br>
<br>
<br>
<center>
    <div class="card" style="width: 60rem;">
        <form>

            <div class="form-group col-md-5">
                <label for="exampleInputName">Nome</label>
                <input type="text" class="form-control" id="exampleInputName" placeholder="nome">
            </div>

            <div class="form-group col-md-5">
                <label for="exampleInputEmail1">Endereço de email</label>
                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="email">
            </div>

            <div class="form-group col-md-5">
                <label for="exampleInputPassword1">Senha</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Senha">
            </div>

            <div class="form-group col-md-5">
                <label for="inputUser">Usuário</label>
                <select id="inputUser" class="form-control">
                    <option selected>Administrador</option>
                    <option>Professor</option>
                    <option>Aluno</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Cadastrar</button>

        </form>
    </div>
</center>
</body>
</html>
