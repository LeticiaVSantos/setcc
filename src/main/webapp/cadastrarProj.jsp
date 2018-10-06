
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%@include file="WEB-INF/jspf/favicon.jspf" %>

    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

    <title>Cadastrar - Projeto</title>
</head>
<body>

    <%@include file="WEB-INF/jspf/menu.jspf" %>

    <br>
    <center>
        <div class="card" style="width: 60rem;">
            <form>

                <div class="form-group col-md-5">
                    <label for="exampleInputProjeto">Tema do Projeto</label>
                    <input type="text" class="form-control" id="exampleInputProjeto" placeholder="Insira o tema do projeto">
                </div>

                <div class="form-group col-md-5">
                    <label for="exampleInputAluno">Integrantes</label>
                    <input type="text" class="form-control" id="exampleInputAluno" placeholder="Insira os integrantes">
                </div>

                <div class="form-group col-md-5">
                    <label for="exampleInputOrientador">Professor Orientador</label>
                    <input type="text" class="form-control" id="exampleInputOrientador" placeholder="Insira o orientador do projeto">
                </div>

                <div class="form-group col-md-5">
                    <label for="inputUser">Curso</label>
                    <select id="inputUser" class="form-control">
                        <option selected>Análise e Desenvolvimento de Sistemas</option>
                        <option>Comércio Exterior</option>
                        <option>Gestão Empresarial</option>
                        <option>Processos Químicos</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Cadastrar</button>

            </form>
        </div>
    </center>
    <br/>

</body>
</html>
