<?php

session_start();
$empleado = $_SESSION['nombre'];

?>

<!DOCTYPE html>
<html lang="en">


	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="author" content="Jthemes"/>	
		<meta name="description" content="Testo - Pizza and Fast Food Landing Page Template"/>
		<meta name="keywords" content="Jthemes, Food, Fast Food, Restaurant, Pizzeria, Restaurant Menu, Pizza, Burger, Sushi, Steak, Grill, Snack">	
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				
  		<!-- TITULO URL -->
		<title>Testo - Pizza and Fast Food Landing Page Template</title>
							
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
		<link rel="icon" href="images/favicon.ico" type="image/x-icon">
		<link rel="apple-touch-icon" sizes="152x152" href="images/apple-touch-icon-152x152.png">
		<link rel="apple-touch-icon" sizes="120x120" href="images/apple-touch-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="76x76" href="images/apple-touch-icon-76x76.png">
		<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
		<link rel="icon" href="images/apple-touch-icon.png" type="image/x-icon">
	

		<!-- FUENTES DE GOOGLE -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Lilita+One&display=swap" rel="stylesheet">

		<!-- BOOTSTRAP CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
				
		<!-- FONT ICONOS -->
		<link href="https://use.fontawesome.com/releases/v5.11.0/css/all.css" rel="stylesheet" crossorigin="anonymous">		
		<link href="css/flaticon.css" rel="stylesheet">

		<!-- PLUGINS STYLESHEET -->
		<link href="css/menu.css" rel="stylesheet">
		<link href="css/magnific-popup.css" rel="stylesheet">	
		<link href="css/flexslider.css" rel="stylesheet">
		<link href="css/owl.carousel.min.css" rel="stylesheet">
		<link href="css/owl.theme.default.min.css" rel="stylesheet">
		<link href="css/jquery.datetimepicker.min.css" rel="stylesheet">
	
		<!-- PLANTILLA CSS -->
		<link href="css/style.css" rel="stylesheet">

		<!-- RESPONSIVE CSS -->
		<link href="css/responsive.css" rel="stylesheet">
	
	</head>
	<body>

		<!-- PRELOADER SPINNER
		============================================= -->
		<div id="loader-wrapper">
			<div id="loader">
				<div class="cssload-spinner">
					<div class="cssload-ball cssload-ball-1"></div>
					<div class="cssload-ball cssload-ball-2"></div>
					<div class="cssload-ball cssload-ball-3"></div>
					<div class="cssload-ball cssload-ball-4"></div>
				</div>
			</div>
		</div>

		<!-- HEADER-1
		============================================= -->
		<header id="header-1" class="header navik-header header-shadow center-menu-1 header-transparent">
			<div class="container">

				<!-- NAVEGACION MENU -->
				<div class="navik-header-container">
				
					<!-- LOGO IMAGE -->
	                <div class="logo" data-mobile-logo="images/logo-01.png" data-sticky-logo="images/logo-01.png">
	                	<a href="index.php"><img src="images/logo-01.png" alt="header-logo"/></a>
					</div>

					<!-- MENU PRINCIPAL -->
	                <nav class="navik-menu menu-caret navik-yellow">
	                	<ul class="top-list">	
							
							<!-- MENÚ DESPEGABLE -->
	                		<li><a href="mesas.php">ELEGIR MESA</a>
	                		</li>

							<!-- MENÚ DESPEGABLEU -->
	                		<li><a href="index.php">MENÚ</a>
	                		</li>
	                    </ul>
	                </nav>	<!--FINAL MENU PRINCIPAL -->
				</div>	<!--FINAL NAVEGACION MENU-->
			</div>     <!-- FINAL CONTENEDOR -->
		</header>	<!-- FINAL HEADER-1 -->

		<br>
		<br>
		<br>

			<!-- MENU-6
			============================================= -->
			<section id="menu-6" class="wide-70 menu-section division">
				<div class="container">

                    <!-- SECCIÓN TITULO -->
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="section-title mb-60 text-center">

                                <!-- titulo 	-->
                                <h2 class="h2-xl red-color">Elige una mesa </h2>

                                <!-- Texto -->
                                <p class="p-xl">Selecciona la mesa de tu preferencia para empezar a pedir tu comida!
                                </p>

                                <img class="centrado" src="images/mesas.jpg" usemap="#image-map" alt="" width="747" height="747">

                                <map name ="image-map">
                                    <area shape="rect" alt="" title="" coords="34,46,178,276" href="seleccionPedidos.php?numMesa=1&empleado=<?php echo $empleado?>" target="" />
                                    <area shape="rect" alt="" title="" coords="270,44,474,284" href="seleccionPedidos.php?numMesa=2&empleado=<?php echo $empleado?>" target="" />
                                    <area shape="rect" alt="" title="" coords="584,46,688,292" href="seleccionPedidos.php?numMesa=3&empleado=<?php echo $empleado?>" target="" />
                                    <area shape="rect" alt="" title="" coords="326,374,424,614" href="seleccionPedidos.php?numMesa=4&empleado=<?php echo $empleado?>" target="" />
                                    <area shape="rect" alt="" title="" coords="32,486,244,726" href="seleccionPedidos.php?numMesa=5&empleado=<?php echo $empleado?>" target="" />
                                    <area shape="rect" alt="" title="" coords="526,486,688,722" href="seleccionPedidos.php?numMesa=6&empleado=<?php echo $empleado?>" target="" />
                                </map>
                            </div>
                        </div>
                    </div>
                </div>	 <!-- Final row -->
                </div>	 <!-- Final contenedor -->
            </section>	<!-- Final BANNER-2 -->

			<!-- BANNER-3
			============================================= -->
			<section id="banner-3" class="bg-yellow banner-section division">
				<div class="container">
			 		<div class="row d-flex align-items-center">

			 			<!-- BANNER TEXTO -->
						<div class="col-md-7 col-lg-6">
							<div class="banner-3-txt coffee-color">

								<!-- Titulo  -->
								<h4 class="h4-xl">Descarga la aplicación y</h4>
								<h2>ahorra un 20%</h2>

								<!-- Store Badges -->
								<div class="stores-badge">

									<!-- AppStore -->
									<a href="#" class="store">
										<img class="appstore-original" src="images/appstore.png" alt="appstore-logo" />
									</a>
													
									<!-- Google Play -->
									<a href="#" class="store">
										<img class="googleplay-original" src="images/googleplay.png" alt="googleplay-logo" />
									</a>
												
								</div>
							</div>
						</div>


						<!-- BANNER IMAGE -->
						<div class="col-md-5 col-lg-6">
							<div class="banner-3-img">
								<img class="img-fluid" src="images/e-shop.png" alt="banner-image">
							</div>
						</div>
			 		</div>      <!-- Final row -->
				</div>	    <!-- Final contenedor -->		
			</section>	<!-- Final BANNER-3 -->

			<!-- GOOGLE MAPS
			============================================= -->
			<br>
			<br>
			<br>
			<br>
	 		<div id="gmap">
				<div class="google-map">
		 			<iframe src= "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6075.269492205362!2d-3.70837587463807!3d40.41694163584114!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd42287e1463b6cf%3A0x14a34120b9332d61!2sSol%2C%20Madrid!5e0!3m2!1ses!2ses!4v1645470524955!5m2!1ses!2ses" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>" width="600" height="450" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
	 			</div>
	 		</div>

			<!-- FOOTER-1
			============================================= -->
			<footer id="footer-1" class="footer division">
				<div class="container">
					<div class="row">

						<!-- FOOTER INFO -->
						<div class="col-md-5 col-lg-4 col-xl-4">
							<div class="footer-info mb-40">

								<!-- Footer Logo -->
								<div class="footer-logo"><img src="images/logo-01.png" alt="footer-logo"/></div>

								<!-- Footer Copyright -->
								<p>&copy; 2020 Testo. Todos los derechos reservados</p>

							</div>	
						</div>	

						<!-- FOOTER CONTACTO -->
						<div class="col-md-7 col-lg-4 col-xl-5">
							<div class="footer-contacts mb-40">
							
								<!-- Direccion -->
								<p class="p-xl mt-10">Madrid,</p>
								<p class="p-xl">Sol, CP 90036</p> 

								<!-- Contacto -->
								<p class="p-lg foo-email">Email: <a href="mailto:yourdomain@mail.com">testo@testomail.com</a></p>
								<p class="p-lg">Llámanos: <span class="yellow-color"><a href="tel:123456789">789-654-3210</a></span></p>

							</div>
						</div>

						<!-- FOOTER INSTAGRAM -->
						<div class="col-md-12 col-lg-4 col-xl-3">
							<div class="footer-img mb-40">

								<!-- Images -->
								<ul class="text-center clearfix">
									<li><a href="#" target="_blank"><img class="insta-img" src="images/instagram/insta1.JPG" alt="insta-img"></a></li>
									<li><a href="#" target="_blank"><img class="insta-img" src="images/instagram/insta2.JPG" alt="insta-img"></a></li>
									<li><a href="#" target="_blank"><img class="insta-img" src="images/instagram/insta3.JPG" alt="insta-img"></a></li>
									<li><a href="#" target="_blank"><img class="insta-img" src="images/instagram/insta5.JPG" alt="insta-img"></a></li>
									<li><a href="#" target="_blank"><img class="insta-img" src="images/instagram/insta6.jpg" alt="insta-img"></a></li>
									<li><a href="#" target="_blank"><img class="insta-img" src="images/instagram/insta4.jpg" alt="insta-img"></a></li>	
								</ul>
														
							</div>
						</div>	<!-- FINAL FOOTER IMAGEN -->


					</div>	  <!-- Final row -->
				</div>	   <!-- Final contenedor -->										
			</footer>	<!-- Final FOOTER-1 -->

		</div>	<!-- FINAL CONTENIDO DE PÁGINA -->


		<!-- SCRIPTS EXTERNOS
		============================================= -->	
		<script src="js/jquery-3.5.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>	
		<script src="js/modernizr.custom.js"></script>
		<script src="js/jquery.easing.js"></script>
		<script src="js/jquery.appear.js"></script>
		<script src="js/jquery.scrollto.js"></script>
		<script src="js/menu.js"></script>		
		<script src="js/materialize.js"></script>
		<script src="js/jquery.flexslider.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/jquery.magnific-popup.min.js"></script>
		<script src="js/contact-form.js"></script>
		<script src="js/comment-form.js"></script>	
		<script src="js/booking-form.js"></script>
		<script src="js/jquery.datetimepicker.full.js"></script>	
		<script src="js/jquery.validate.min.js"></script>
		<script src="js/jquery.ajaxchimp.min.js"></script>	
				
		<!-- Script Personalizado -->		
		<script src="js/custom.js"></script>
	</body>
</html>	