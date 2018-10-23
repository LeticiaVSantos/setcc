<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String pathIndex = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="pt-br" class="no-js">
<head>
	<!-- Meta, Font e CSS -->
	<%@include file="WEB-INF/jspf/head.jspf"%>
	<!-- Site Title -->
	<title>Home - SETCC</title>
</head>
<body>

<% if (session.getAttribute("user") == null) { %>
<% response.sendRedirect(pathIndex + "/login.jsp"); %>
<% } else { %>

<!-- Menu -->
<%@include file="WEB-INF/jspf/menu.jspf" %>

<!-- start banner Area -->
<section class="banner-area" id="home">
	<div class="container">
		<div class="row fullscreen d-flex align-items-center justify-content-center">
			<div class="banner-content col-lg-6 col-md-6">
				<h1>
					Agilizando <br>
					a Entrega <br>
					de TCCs
				</h1>
				<p class="text-white text-uppercase">
					Vamos ajudar você a submeter o TCC de forma simples e rápida.
				</p>
				<a href="#comecando" class="primary-btn header-btn text-uppercase">Começar</a>
			</div>
			<div class="banner-img col-lg-6 col-md-6">
				<img class="img-fluid" src="img/banner-img.png" alt="">
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->


<!-- Start feature Area -->
<section class="feature-area section-gap" id="comecando">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col-md-12 pb-40 header-text text-center">
				<h1 class="pb-10 text-white">O Que Você Deseja Fazer?</h1>
				<p class="text-white">
					Escolha uma das opções abaixo para começar.
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="single-feature">
					<a href="#" class="title d-flex flex-row">
						<span class="lnr lnr-users"></span>
						<h4>Usuários</h4>
					</a>
					<p>
						Aqui você pode cadastrar um novo usuário, consultar a lista de usuários, fazer alterações e desativar um usuário.
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single-feature">
					<a href="#" class="title d-flex flex-row">
						<span class="lnr lnr-sun"></span>
						<h4>Períodos</h4>
					</a>
					<p>
						Aqui você pode cadastrar, consultar, alterar ou desativar um período. Geralmente o padrão é Matutino, Vespertino e Noturno.
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single-feature">
					<a href="#" class="title d-flex flex-row">
						<span class="lnr lnr-graduation-hat"></span>
						<h4>Projetos</h4>
					</a>
					<p>
						Aqui é onde você pode submeter a sua monografia, artigo ou documentação para o seu orientador. O formato de documento aceito é o PDF.
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single-feature">
					<a href="#" class="title d-flex flex-row">
						<span class="lnr lnr-calendar-full"></span>
						<h4>Temporadas</h4>
					</a>
					<p>
						Aqui é possível cadastrar o intervalo de tempo do curso. Ex: Trimestral, Semestral, Anual.
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single-feature">
					<a href="#" class="title d-flex flex-row">
						<span class="lnr lnr-book"></span>
						<h4>Cursos</h4>
					</a>
					<p>
						Aqui você pode realizar a manutenção dos cursos disponiveis na FATEC Praia Grande.
						Ex: Análise e Desenvolvimento de Sistemas, Comércio Exterior e Gestão Empresarial.
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single-feature">
					<a href="#" class="title d-flex flex-row">
						<span class="lnr lnr-bubble"></span>
						<h4>Positive Reviews</h4>
					</a>
					<p>
						Usage of the Internet is becoming more common due to rapid advancement of technology and power.
					</p>
				</div>
			</div>

		</div>
	</div>
</section>
<!-- End feature Area -->

<% } %>

<!-- Footer -->
<%@include file="WEB-INF/jspf/footer.jspf"%>

<!-- JavaScript -->
<%@include file="WEB-INF/jspf/scripts.jspf"%>
</body>
</html>



