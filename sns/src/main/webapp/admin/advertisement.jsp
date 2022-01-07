<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsAdvertisements"%>

<!DOCTYPE html>
<html>

<head>
<title>Tables</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen">
<link href="assets/styles.css" rel="stylesheet" media="screen">
<link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
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

			<div class="row-fluid">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Advertisement</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<div class="table-toolbar">
								<div class="btn-group">
									<a href="add_advertisement.jsp"><button
											class="btn btn-success">
											Add New <i class="icon-plus icon-white"></i>
										</button></a>
								</div>

							</div>

							<table cellpadding="0" cellspacing="0" border="0"
								class="table table-striped table-bordered" id="example2">
								<thead>
									<tr>
										<th>Title</th>
										<th>Date</th>
										<th>View</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<%
										SnsAdvertisements d = new SnsAdvertisements();
										SnsServiceUserInterface serviceAdd = new SnsServiceUserImpl();
										ArrayList<SnsAdvertisements> p = serviceAdd.addShowAll();
										Iterator q = p.iterator();

										String add_title, add_description, add_date;

										while (q.hasNext()) {

											d = (SnsAdvertisements) q.next();
											add_title = d.getAdd_title();
											add_date = d.getAdd_date();
											add_description = d.getAdd_description();
									%>
									<tr class="gradeU">
										<td><%=add_title%></td>
										<td><%=add_date%></td>
										<td><a
											href="advertisement_view.jsp?add_title=<%=add_title%>">View</a></td>
										<td><a
											href="../SnsAdminController?method=advertisement_delete&add_title=<%=add_title%>">Delete</a></td>
									</tr>
									<%
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
	<%@include file="footer.jsp"%>
</div>
<!--/.fluid-container-->

<script src="vendors/jquery-1.9.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


<script src="assets/scripts.js"></script>
<script src="assets/DT_bootstrap.js"></script>
<script>
	$(function() {

	});
</script>
</body>

</html>