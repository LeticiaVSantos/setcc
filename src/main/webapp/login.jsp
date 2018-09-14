<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
            <input type="email" class="form-control" placeholder="Login">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Senha</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" placeholder="Senha">
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10">
            <button type="submit" class="btn btn-primary">Entrar</button>
        </div>
    </div>

</form>
    </div>
</div>
</center>

</body>
</html>