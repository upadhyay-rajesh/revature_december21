
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Profile Detail</title>
<meta name="description" content="">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/homenormalize.css">
<link rel="stylesheet" href="css/homefont-awesome.css">
<link rel="stylesheet" href="css/homebootstrap.min.css">
<link rel="stylesheet" href="css/hometemplatemo-style.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/templatemo_style.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/testimonails-slider.css">
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/vendor/jquery-1.10.2.min.js"></script>
<script src="js/vendor/jquery-1.9.1.js"></script>
<script src="js/min/plugins.min.js"></script>
</head>
<body>

	<div id="heading">
		<div id="product-post">
			<div class="container">

				<div id="single-blog">
					<div class="container">
						<div class="row">
							<div class="product-item col-md-12">
								<div class="row">
									<div class="col-md-8">
										<div class="heading-section2">
											<h2 style="color: #f78e21">Save your Profile</h2>
										</div>
										<div class="heading-section1">
											<img src="images/under-heading.png" alt="">
										</div>
										<div>&nbsp;</div>
										<div class="heading-section3">
											<form method="post"
												action="../SnsUserController?method=required_profile_details"
												id="profile_form">
												<div>
													<label>First Name<span style="color: #EA5200">*</span></label>
													<div>
														<input type="text" name="user_firstname" class="required">
													</div>
												</div>
												<div>&nbsp;</div>
												<div>
													<label>Last Name<span style="color: #EA5200">*</span></label>
													<div>
														<input type="text" name="user_lastname" class="required">
													</div>
												</div>
												<div>&nbsp;</div>
												<div>
													<label>Gender<span style="color: #EA5200">*</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													Male<input type="radio" name="user_gender" value="male"
														style="width: auto; margin-left: 10px" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													Female<input type="radio" name="user_gender" value="female"
														style="width: auto; margin-left: 10px">
												</div>
												<div>&nbsp;</div>
												<div>
													<label>Date of Birth<span style="color: #EA5200">*</span></label>
													<div>
														<input type="date" name="user_birthdate" class="required">
													</div>
												</div>
												<div>&nbsp;</div>
												<div>
													<label>Current City<span style="color: #EA5200">*</span></label>
													<div>
														<input type="text" name="user_currentcity"
															class="required">
													</div>
												</div>
												<div>&nbsp;</div>
												<div>
													<label>Email<span style="color: #EA5200">*</span></label>
													<div>
														<input type="text" name="user_email"
															class="required email">
													</div>
												</div>

												<div>&nbsp;</div>

												<div>&nbsp;</div>
												<div class="heading-section4">
													<button type="submit" style="color: #f78e21">Save</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="reset" style="color: #f78e21">Reset</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="footer">
			<div class="col-md-12 text-center">
				<div>&nbsp;</div>
				<div>&nbsp;</div>
			</div>
		</div>

	</div>




	<script src="js/vendor/jquery-1.10.2.min.js"></script>
	<script src="js/min/plugins.min.js"></script>
	<script src="js/jquery-1.9.1.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/vendor/jquery-1.9.1.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#profile_form").validate({
				rules : {
					"user_firstname" : {
						minlength : 3,
						maxlength : 15
					},
					"user_lastname" : {
						minlength : 3,
						maxlength : 15
					},
					"user_currentcity" : {
						minlength : 3,
						maxlength : 10
					}

				},
				messages : {

				}

			});

		});
	</script>
</body>
</html>
