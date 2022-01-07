<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsExams"%>
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
						<div class="muted pull-left">Important Exams</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<div class="table-toolbar">
								<div class="btn-group">
									<a href="add_exam.jsp"><button class="btn btn-success">
											Add New <i class="icon-plus icon-white"></i>
										</button></a>
								</div>

							</div>

							<table cellpadding="0" cellspacing="0" border="0"
								class="table table-striped table-bordered" id="example2">
								<thead>
									<tr>
										<th>Exam Name</th>
										<th>Date</th>
										<th>View</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<%
										SnsExams d1 = new SnsExams();
										SnsServiceUserInterface service = new SnsServiceUserImpl();
										ArrayList<SnsExams> p1 = service.examShowAll();
										Iterator q1 = p1.iterator();

										String exam_name, exam_date, exam_description;

										while (q1.hasNext()) {

											d1 = (SnsExams) q1.next();
											exam_name = d1.getExam_name();
											exam_date = d1.getExam_date();
											exam_description = d1.getExam_description();
									%>
									<tr class="gradeU">
										<td><%=exam_name%></td>
										<td><%=exam_date%></td>
										<td><a href="exam_view.jsp?exam_name=<%=exam_name%>">View</a></td>
										<td><a href="../SnsAdminController?method=exam_delete&exam_name=<%=exam_name%>">Delete</a></td>
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