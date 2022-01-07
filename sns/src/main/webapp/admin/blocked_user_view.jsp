<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsUserDetail"%>
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
				SnsServiceUserInterface service = new SnsServiceUserImpl();
				SnsUserDetail h = new SnsUserDetail();
				h.setUser_name(user_name);
				ArrayList<SnsUserDetail> p = service.view(h);
				Iterator q = p.iterator();
				String user_pass, user_type, user_profile, ustatus, user_squestion, user_sanswer;

				if (q.hasNext()) {

					h = (SnsUserDetail) q.next();
					user_pass = h.getUser_pass();
					user_profile = h.getUser_profile();
					ustatus = h.getUstatus();
					user_squestion = h.getUser_squestion();
					user_sanswer = h.getUser_sanswer();
			%>
			<div class="row-fluid">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">View Details</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<!-- BEGIN FORM-->
							<form action="user_modify.jsp" id="form_sample_1"
								class="form-horizontal" method="post">
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
										<label class="control-label"> User Name<span>*</span></label>
										<div class="controls">
											<input type="text" name="user_name" value="<%=user_name%>"
												class="required span6 m-wrap" data-required="1" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Password<span>*</span></label>
										<div class="controls">
											<input type="text" name="user_pass" value="<%=user_pass%>"
												class="required span6 m-wrap" data-required="1" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Details Provided <span>*</span></label>
										<div class="controls">
											<input type="text" value="<%=user_profile%>"
												class="required m-wrap" data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Status<span>*</span></label>
										<div class="controls">
											<input type="text" value="<%=ustatus%>"
												class="required m-wrap" data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Security Question <span>*</span></label>
										<div class="controls">
											<input type="text" value="<%=user_squestion%>"
												class="required m-wrap span6" data-required="1" readonly />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Security Answer <span>*</span></label>
										<div class="controls">
											<input type="text" name="user_sanswer"
												value="<%=user_sanswer%>" data-required="1" class=" m-wrap" />
										</div>
									</div>




									<div class="form-actions">
										<button type="submit" class="btn">Modify</button>
										<button type="reset" class="btn">Clear</button>
										<td align="center"><button>
												<a
													href="blocked_user_profile_view.jsp?user_name=<%=user_name%>">View
													Profile</a>
											</button></td>
										<td align="center"><button>
												<a href="showblockeduser.jsp">Back</a>
											</button></td>
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

</script>
</body>

</html>

