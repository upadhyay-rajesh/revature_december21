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
<script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>


</head>

<%@include file="header.jsp"%>

<div class="container-fluid">
	<div class="row-fluid">
		<%@include file="sidebar.jsp"%>
		<div class="span9" id="content">

			<!--/span-->
			<%
				String add_id = request.getParameter("add_id");
				String add_title = request.getParameter("add_title");
				String add_date = request.getParameter("add_date");
				String add_description = request.getParameter("add_description");
				SnsAdvertisements x = new SnsAdvertisements();
				x.setAdd_id(Integer.parseInt(add_id));
				x.setAdd_title(add_title);
				x.setAdd_date(add_date);
				x.setAdd_description(add_description);
				SnsServiceUserInterface serviceAdd = new SnsServiceUserImpl();
				int c = serviceAdd.addModify(x);

				if (c != 0) {
			%>

			<div class="row-fluid">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>Success</h4>
					The operation completed successfully
				</div>

			</div>

			<%
				} else {
			%>

			<div class="row-fluid">
				<div class="alert alert-error">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>ERROR</h4>
					There is some error.
				</div>

			</div>
			<%
				}
			%>
		</div>





	</div>
</div>
<hr>
<footer>
	<p>&copy; SNS</p>
</footer>
</div>

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
</body>