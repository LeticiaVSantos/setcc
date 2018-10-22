<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
	<html lang="pt-br" class="no-js">
	    <head>
            <!-- Meta, Font e CSS -->
            <%@include file="WEB-INF/jspf/head.jspf"%>
		</head>
		<body>

            <!-- Menu -->
            <%@include file="WEB-INF/jspf/menu.jspf" %>

            <!-- Banner page up - begin -->
			<%@include file="WEB-INF/jspf/banner-page-up.jspf"%>
                <h1 class="text-white">
                    About Us
                </h1>
                <p class="text-white link-nav"><a href="index.jsp">Home </a> <span class="lnr lnr-arrow-right"></span> <a href="about.jsp"> About Us</a></p>
			<%@include file="WEB-INF/jspf/banner-page-down.jspf"%>
            <!-- Banner page up - end -->

			<!-- Start about-video Area -->
			<section class="about-video-area section-gap">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-6 about-video-left">
							<h6 class="text-uppercase">Brand new app to blow your mind</h6>
							<h1>
								We’ve made a life <br>
								that will change you 
							</h1>
							<p>
								<span>We are here to listen from you deliver exellence</span>
							</p>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed doeiusmo d tempor incididunt ut labore et dolore magna aliqua.
							</p>
							<a class="primary-btn" href="#">Get Started Now</a>
						</div>
						<div class="col-lg-6 about-video-right justify-content-center align-items-center d-flex relative">
							<div class="overlay overlay-bg"></div>
							<a class="play-btn" href="https://www.youtube.com/watch?v=ARA0AxrnHdM"><img class="img-fluid mx-auto" src="img/play-btn.png" alt=""></a>
						</div>
					</div>
				</div>	
			</section>
			<!-- End about-video Area -->			

			<!-- Start home-about Area -->
			<section class="home-about-area">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-lg-6 home-about-left no-padding">
							<img class="mx-auto d-block img-fluid" src="img/about-img.png" alt="">
						</div>
						<div class="col-lg-6 home-about-right no-padding">
							<h1>Globally Connected <br>
							by Large Network</h1>
							<h5>
								We are here to listen from you deliver exellence
							</h5>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.
							</p>
							<a class="primary-btn text-uppercase" href="#">Get Details</a>
						</div>
					</div>
				</div>	
			</section>
			<!-- End home-about Area -->

			<!-- Start brand Area -->
			<section class="brand-area section-gap">
				<div class="container">
					<div class="row align-items-center">
						<div class="col single-brand">
							<img class="img-fluid" src="img/l1.png" alt="">
						</div>
						<div class="col single-brand">
							<img class="img-fluid" src="img/l2.png" alt="">
						</div>
						<div class="col single-brand">
							<img class="img-fluid" src="img/l3.png" alt="">
						</div>
						<div class="col single-brand">
							<img class="img-fluid" src="img/l4.png" alt="">
						</div>
						<div class="col single-brand">
							<img class="img-fluid" src="img/l5.png" alt="">
						</div>
					</div>
				</div>	
			</section>
			<!-- End brand Area -->

            <!-- Footer -->
            <%@include file="WEB-INF/jspf/footer.jspf"%>

            <!-- JavaScript -->
            <%@include file="WEB-INF/jspf/scripts.jspf"%>
		</body>
	</html>


