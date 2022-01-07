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
<script src="vendors/modernizr-2.6.1-respond-1.1.0.min.js"></script>
</head>

<%@include file="header.jsp"%>

<div class="container-fluid">
	<div class="row-fluid">
		<%@include file="sidebar.jsp"%>

		<!--/span-->
		<div class="span9" id="content">


			<div class="row-fluid">

				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Active Users</div>
						<div class="pull-right">
							<span class="badge badge-info"></span>

						</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<table cellpadding="0" cellspacing="0" border="0"
								class="table table-striped table-bordered" id="example">
								<thead>
									<tr>

										<th>#</th>
										<th>User Name</th>
										<th>User Pass</th>
										<th>User Profile</th>
										<th>User Status</th>
										<th>View</th>
										<th>block</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<%
										SnsUserDetail h = new SnsUserDetail();
										SnsServiceUserInterface service = new SnsServiceUserImpl();
										ArrayList<SnsUserDetail> p = service.showAll();
										Iterator q = p.iterator();
										String user_name, user_pass, user_type, user_profile, ustatus;

										while (q.hasNext()) {

											h = (SnsUserDetail) q.next();
											user_name = h.getUser_name();
											user_pass = h.getUser_pass();
											user_profile = h.getUser_profile();
											ustatus = h.getUstatus();
											if (ustatus.equals("active")) {
									%>
									<tr>
										<td align="center"></td>
										<td align="center"><%=user_name%></td>
										<td align="center"><%=user_pass%></td>
										<td align="center"><%=user_profile%></td>
										<td align="center"><%=ustatus%></td>
										<td align="center"><a
											href="active_user_view.jsp?user_name=<%=user_name%>">View</a></td>
										<td align="center"><a
											href="block.jsp?user_name=<%=user_name%>">block</a></td>
										<td align="center"><a
											href="userdelete.jsp?user_name=<%=user_name%>">Delete</a></td>
									</tr>

									<%
										}
										}
									%>

								</tbody>
							</table>
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
<script src="vendors/jquery-1.9.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="assets/scripts.js"></script>
<link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
<link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

<link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet"
	media="screen">
<script src="vendors/datatables/js/jquery.dataTables.min.js"></script>
<script src="assets/DT_bootstrap.js"></script>
<script>
	$(function() {

	});
</script>
<script>
	$(function() {
		// Easy pie charts
		$('.chart').easyPieChart({
			animate : 1000
		});
	});
</script>
</body>

</html>