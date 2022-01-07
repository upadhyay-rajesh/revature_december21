<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsAdvertisements"%>
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
				String add_title = request.getParameter("add_title");
				SnsAdvertisements x = new SnsAdvertisements();
				x.setAdd_title(add_title);
				SnsServiceUserInterface serviceAdd = new SnsServiceUserImpl();
				ArrayList<SnsAdvertisements> p = serviceAdd.addView(x);
				Iterator q = p.iterator();

				String add_date, add_description;
				int add_id;
				while (q.hasNext()) {

					x = (SnsAdvertisements) q.next();
					add_id = x.getAdd_id();
					add_date = x.getAdd_date();
					add_description = x.getAdd_description();
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
							<form action="advertisement_modify.jsp" id="form_sample_1"
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
										<label class="control-label">Title<span>*</span></label>
										<div class="controls">
											<input name="add_title" type="text" value="<%=add_title%>"
												class="required m-wrap" data-required="1" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Date <span>*</span></label>
										<div class="controls">
											<input type="date" name="add_date" value="<%=add_date%>"
												class="required m-wrap" data-required="1" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Description</label>
										<div class="controls">
											<textarea type="text" name="add_description"
												class="required m-wrap" data-required="1" class=" m-wrap"><%=add_description%></textarea>
											<input type="text" name="add_id" value="<%=add_id%>"
												class="required m-wrap" data-required="1"
												style="display: none" />
										</div>
									</div>
									<div class="form-actions">
										<button type="submit" class="btn">Modify</button>
										<button type="reset" class="btn">Clear</button>

										<td align="center"><button>
												<a href="advertisement.jsp">Back</a>
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

