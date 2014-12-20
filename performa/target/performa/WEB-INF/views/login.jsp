<%@ include file="/includes/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="BootstrapStyler">

<title>Sign In - Intersect</title>

<!-- Fonts -->
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,400,300,700">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic">

<!-- Bootstrap core CSS -->
<link
	href='<c:url value="/bootstrap/css/bootstrap.min.css?v=3.1.0"></c:url>'
	rel="stylesheet">

<!-- Font Awesome CSS -->
<link
	href='<c:url value="/fonts/font-awesome/css/font-awesome.min.css?v=4.0.3"></c:url>'
	rel="stylesheet">

<!-- IcoMoon CSS -->
<link href='<c:url value="/fonts/icomoon/style.css?v=1.0"></c:url>'
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href='<c:url value="/css/styler/style.css"></c:url>'
	rel="stylesheet" type="text/css">
<link href='<c:url value="/css/styler/error.css"></c:url>'
	rel="stylesheet" type="text/css">

<!-- Sign In and Sign Up page styling -->
<link href='<c:url value="/css/styler/signin.css"></c:url>'
	rel="stylesheet">


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>

<body>
	<div class="container">
		<div class="row">
			<div
				class="col-md-4 col-md-push-4 col-xs-10 col-xs-push-1 col-sm-8 col-sm-push-2">
				<h1 class="brand brand-big align-center">
					<a href="index.html"> <img src="img/logo-big.png"><br>
					</a>
				</h1>
			</div>
		</div>
		<div class="row">
			<div
				class="col-md-4 col-md-push-4 col-xs-10 col-xs-push-1 col-sm-8 col-sm-push-2">
				<section id="middle">

					<div id="content" class="signin-page">

						<div class="panel-group" id="signin-page">

							<div class="panel panel-outline panel-no-padding">
								<div id="signin" class="panel-collapse collapse in">
									<div class="panel-heading">
										<h3 class="panel-title">Sign In</h3>
									</div>
									<div class="panel-body">
										
										<c:if test="${not empty error}">
											<div class="error">${error}</div>
										</c:if>
										<c:if test="${not empty msg}">
											<div class="msg">${msg}</div>
										</c:if>
										<form name='f'  action='<c:url value="/login" />'
											method='POST' id="form-login" class="form-horizontal">
											<div class="form-group">
												<div class="col-xs-12">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-user"></i></span> <input type="text"
															id="username" name="username"
															class="form-control input-lg" placeholder="Username">
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-xs-12">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-key"></i></span> <input type="password"
															id="password" name="password"
															class="form-control input-lg" placeholder="Password">

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12" align="right">
													<span class="input-group-btn"> <input type="hidden"
														name="${_csrf.parameterName}" value="${_csrf.token}" />
														<button class="btn btn-lg btn-primary" type="submit">Sign
															In</button>
													</span>
												</div>
											</div>
										</form>
									</div>
									<!-- /.panel-body -->
								</div>
								<!-- /.panel-collapse -->
							</div>
							<!-- /.panel -->
						</div>
						<!-- /.panel-group -->



					</div>
					<!-- /#content -->

				</section>
			</div>
			<!-- /.col-md-10 -->

		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<div class="modal fade" tabindex="-1" role="dialog" id="tnc-modal">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Terms &amp;
						Conditions</h4>
				</div>
				<div class="modal-body">
					<h4>Praesent commodo cursus magna</h4>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
						Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
						nibh, ut fermentum massa justo sit amet risus. Etiam porta sem
						malesuada magna mollis euismod. Praesent commodo cursus magna, vel
						scelerisque nisl consectetur et. Sed posuere consectetur est at
						lobortis. Integer posuere erat a ante venenatis dapibus posuere
						velit aliquet. Nullam quis risus eget urna mollis ornare vel eu
						leo.</p>

					<h4>Nullam quis risus eget urna</h4>
					<p>Maecenas sed diam eget risus varius blandit sit amet non
						magna. Integer posuere erat a ante venenatis dapibus posuere velit
						aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Sed posuere consectetur est at lobortis. Nulla vitae elit libero,
						a pharetra augue.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Disagree</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Agree
						and Proceed Registration</button>
				</div>
			</div>
		</div>
	</div>

	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-xs-6">
					<ul class="list-inline">
						<li>&copy; <a href="index.html">Intersect</a></li>
					</ul>
				</div>
				<div class="col-xs-6">
					<ul class="list-inline social-network">
						<li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter-square"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
						<li><a href="#"><i class="fa fa-github-square"></i></a></li>
					</ul>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</footer>

	<!-- jQuery -->
	<script src='<c:url value="/js/libs/jquery-1.11.0.min.js"></c:url>'></script>

	<!-- Bootstrap core JavaScript -->
	<script
		src='<c:url value="/bootstrap/js/bootstrap.min.js?v=3.1.0"></c:url>'></script>


</body>
</html>