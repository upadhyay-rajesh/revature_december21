<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsUserProfileDetail"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html class="no-js">

<head>
<title>Admin Home Page</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen">
<link href="vendors/easypiechart/jquery.easy-pie-chart.css"
	rel="stylesheet" media="screen">
<link href="assets/styles.css" rel="stylesheet" media="screen">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<%@include file="header.jsp"%>

<div class="container-fluid">
	<div class="row-fluid">
		<%@include file="sidebar.jsp"%>

		<!--/span-->
		<div class="span9" id="content">

			<%
				String user_name = request.getParameter("user_name");

				SnsServiceUserInterface serviceProf = new SnsServiceUserImpl();
				SnsUserProfileDetail z = new SnsUserProfileDetail();
				z.setUser_name(user_name);
				ArrayList<SnsUserProfileDetail> w = serviceProf.userProfileView(z);
				Iterator e = w.iterator();
				String user_firstname, user_lastname, user_gender, user_birthdate, user_address, user_homecity,
						user_currentcity, user_email, user_mob, user_profileimage, user_highschool, user_college, user_exp,
						user_skills;
				if (e.hasNext()) {
					z = (SnsUserProfileDetail) e.next();
					user_firstname = z.getUser_firstname();
					user_lastname = z.getUser_lastname();
					user_gender = z.getUser_gender();
					user_birthdate = z.getUser_birthdate();
					user_address = z.getUser_address();
					user_homecity = z.getUser_homecity();
					user_currentcity = z.getUser_currentcity();
					user_email = z.getUser_email();
					user_mob = z.getUser_mob();
					user_profileimage = z.getUser_profileimage();
					user_highschool = z.getUser_highschool();
					user_college = z.getUser_college();
					user_exp = z.getUser_exp();
					user_skills = z.getUser_skills();
			%>
			<div class="row-fluid">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">View Profile Details</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<!-- BEGIN FORM-->
							<form id="form_sample_1" class="form-horizontal" method="post">
								<fieldset>
									<div class="alert alert-error hide">
										<button class="close" data-dismiss="alert"></button>
										You have some form errors. Please check below.
									</div>
									<div class="alert alert-success hide">
										<button class="close" data-dismiss="alert"></button>
										Your form validation is successful!
									</div>

									<div class="control-group">
										<label class="control-label"> First Name<span>*</span></label>
										<div class="controls">
											<input type="text" name="user_firstname"
												value="<%=user_firstname%>" class="required m-wrap"
												data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Last Name<span>*</span></label>
										<div class="controls">
											<input type="text" name="user_lastname"
												value="<%=user_lastname%>" class="required m-wrap"
												data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Gender <span>*</span></label>
										<div class="controls">
											<input type="text" name="user_gender"
												value="<%=user_gender%>" class="required m-wrap"
												data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Date of Birth <span>*</span></label>
										<div class="controls">
											<input type="text" name="user_birthdate"
												value="<%=user_birthdate%>" class="required m-wrap"
												data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Address</label>
										<div class="controls">
											<textarea type="text" name="user_address"
												class="required m-wrap" data-required="1" class=" m-wrap"
												readonly><%=user_address%></textarea>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Home City</label>
										<div class="controls">
											<input type="text" name="user_homecity"
												value="<%=user_homecity%>" class="required m-wrap"
												data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Current City<span>*</span></label>
										<div class="controls">
											<input type="text" name="user_currentcity"
												value="<%=user_currentcity%>" class="required m-wrap"
												data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Email<span>*</span></label>
										<div class="controls">
											<input type="text" name="user_email" value="<%=user_email%>"
												class="required email m-wrap " data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Mobile Number</label>
										<div class="controls">
											<input type="text" name="user_mob" value="<%=user_mob%>"
												data-required="1" class=" m-wrap" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> High School </label>
										<div class="controls">
											<input type="text" name="user_highschool"
												value="<%=user_highschool%>" data-required="1"
												class=" m-wrap" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> College </label>
										<div class="controls">
											<input type="text" name="user_college"
												value="<%=user_college%>" data-required="1" class=" m-wrap"
												readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Experience</label>
										<div class="controls">
											<input type="text" name="user_exp" value="<%=user_exp%>"
												data-required="1" class=" m-wrap" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Skills </label>
										<div class="controls">
											<input type="text" name="user_skills"
												value="<%=user_skills%>" data-required="1" class=" m-wrap"
												readonly />
										</div>
									</div>

									<div class="form-actions">
											<a href="showactiveuser.jsp">Back</a>									
									</div>
								</fieldset>
							</form>
							<%
								}
							%>
							<!-- END FORM-->
						</div>
					</div>
				</div>
				<!-- /block -->
			</div>

		</div>
	</div>
	<hr>
	<footer>
		<p>&copy; SNS</p>
	</footer>
</div>
<!--/.fluid-container-->
<link href="vendors/datepicker.css" rel="stylesheet" media="screen">
<link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
<link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

<link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet"
	media="screen">

<script src="vendors/jquery-1.9.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="vendors/jquery.uniform.min.js"></script>
<script src="vendors/chosen.jquery.min.js"></script>
<script src="vendors/bootstrap-datepicker.js"></script>

<script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
<script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

<script type="text/javascript"
	src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="assets/form-validation.js"></script>

<script src="assets/scripts.js"></script>
<script>
	jQuery(document).ready(function() {
		FormValidation.init();
	});
</script>

</body>

</html>

