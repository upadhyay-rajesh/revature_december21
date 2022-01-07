<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsAdvertisements"%>
<%@page import="com.entity.SnsExams"%>
<%@page import="com.entity.SnsUserDetail"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

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
<script src="vendors/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<style type="text/css">
li a {
	display: inline-block;
}

li a {
	display: block;
}
</style>
</head>

<%@include file="header.jsp"%>
<div class="container-fluid">
	<div class="row-fluid">
		<%@include file="sidebar.jsp"%>
		<!--/span-->
		<div class="span9" id="content">

			<div style="float: right">
				<a name="toppos"></a>
			</div>

			<div class="row-fluid">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Advertisement</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">


							<table cellpadding="0" cellspacing="0" border="0"
								class="table table-striped table-bordered" id="example2">
								<thead>
									<tr>
										<th>Title</th>
										<th>Date</th>
										<th>View</th>

									</tr>
								</thead>
								<tbody>
									<%
										SnsAdvertisements d = new SnsAdvertisements();
										SnsServiceUserInterface service = new SnsServiceUserImpl();
										ArrayList<SnsAdvertisements> p = service.addShowAll();
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


			<div class="row-fluid">

				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Important Exams</div>
						<div class="pull-right">
							<span class="badge badge-info"></span>
						</div>


					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<table cellpadding="0" cellspacing="0" border="0"
								class="table table-striped table-bordered" id="example1">
								<thead>
									<tr>
										<th>Exam Name</th>
										<th>Date</th>
										<th>View</th>

									</tr>
								</thead>
								<tbody>
									<%
										SnsExams d1 = new SnsExams();
										ArrayList<SnsExams> p1 = service.examShowAll();
										Iterator q1 = p1.iterator();

										String exam_name, exam_date, exam_description;

										while (q1.hasNext()) {

											d1 = (SnsExams) q1.next();
											exam_name = d1.getExam_name();
											exam_date = d1.getExam_date();
											exam_description = d1.getExam_description();
									%>
									<tr>

										<td align="center"><%=exam_name%></td>
										<td align="center"><%=exam_date%></td>


										<td align="center"><a
											href="exam_view.jsp?exam_name=<%=exam_name%>">View</a></td>

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


										<th>User Name</th>
										<th>User Pass</th>

										<th>User Status</th>
										<th>View</th>

									</tr>
								</thead>
								<tbody>
									<%
										SnsUserDetail h2 = new SnsUserDetail();
										ArrayList<SnsUserDetail> p2 = service.showAll();
										Iterator q2 = p2.iterator();
										String user_name, user_pass, user_type, user_profile, ustatus;

										while (q2.hasNext()) {

											h2 = (SnsUserDetail) q2.next();
											user_name = h2.getUser_name();
											user_pass = h2.getUser_pass();
											user_profile = h2.getUser_profile();
											ustatus = h2.getUstatus();
											if (ustatus.equals("active")) {
									%>
									<tr>

										<td align="center"><%=user_name%></td>
										<td align="center"><%=user_pass%></td>

										<td align="center"><%=ustatus%></td>
										<td align="center"><a
											href="active_user_view.jsp?user_name=<%=user_name%>">View</a></td>

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

			<div class="row-fluid">

				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Blocked Users</div>
						<div class="pull-right">
							<span class="badge badge-info"></span>

						</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<table cellpadding="0" cellspacing="0" border="0"
								class="table table-striped table-bordered" id="example3">
								<thead>
									<tr>


										<th>User Name</th>
										<th>User Pass</th>

										<th>User Status</th>
										<th>View</th>

									</tr>
								</thead>
								<tbody>
									<%
										SnsUserDetail h3 = new SnsUserDetail();
										ArrayList<SnsUserDetail> p3 = service.showAll();
										Iterator q3 = p3.iterator();
										String user_name1, user_pass1, user_type1, user_profile1, ustatus1;

										while (q3.hasNext()) {

											h3 = (SnsUserDetail) q3.next();
											user_name1 = h3.getUser_name();
											user_pass1 = h3.getUser_pass();
											user_profile1 = h3.getUser_profile();
											ustatus1 = h3.getUstatus();
											if (ustatus1.equals("blocked")) {
									%>
									<tr>

										<td align="center"><%=user_name1%></td>
										<td align="center"><%=user_pass1%></td>

										<td align="center"><%=ustatus1%></td>
										<td align="center"><a
											href="blocked_user_view.jsp?user_name=<%=user_name1%>">View</a></td>

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

			<div style="float: right">
				<a href="#toppos">Top</a>
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

</body>

</html>