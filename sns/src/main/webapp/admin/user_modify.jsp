<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsUserDetail"%>
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
				String user_pass = request.getParameter("user_pass");
				String user_name = request.getParameter("user_name");
				String user_sanswer = request.getParameter("user_sanswer");
				SnsServiceUserInterface service = new SnsServiceUserImpl();
				SnsUserDetail lb = new SnsUserDetail();
				lb.setUser_name(user_name);
				lb.setUser_pass(user_pass);
				lb.setUser_sanswer(user_sanswer);

				int c = service.modify(lb);

				session.invalidate();
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