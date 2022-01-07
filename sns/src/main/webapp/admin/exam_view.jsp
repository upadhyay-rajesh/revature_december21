<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsExams"%>
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
				String exam_name = request.getParameter("exam_name");
				SnsExams x = new SnsExams();
				x.setExam_name(exam_name);
				SnsServiceUserInterface serviceExam = new SnsServiceUserImpl();
				ArrayList<SnsExams> p = serviceExam.examView(x);
				Iterator q = p.iterator();

				String exam_nam, exam_date, exam_description;
				int exam_id;
				while (q.hasNext()) {

					x = (SnsExams) q.next();
					exam_id = x.getExam_id();
					exam_nam = x.getExam_name();
					exam_date = x.getExam_date();
					exam_description = x.getExam_description();
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
							<form action="exam_modify.jsp" id="form_sample_1"
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
										<label class="control-label">Exam Name<span>*</span></label>
										<div class="controls">
											<input name="exam_name" type="text" value="<%=exam_name%>"
												class="required m-wrap" data-required="1" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Date <span>*</span></label>
										<div class="controls">
											<input type="text" name="exam_date" value="<%=exam_date%>"
												class="required m-wrap" data-required="1" />

										</div>
									</div>
									<div class="control-group">
										<label class="control-label"> Description</label>
										<div class="controls">
											<textarea type="text" name="exam_description"
												class="required m-wrap" data-required="1" class=" m-wrap"><%=exam_description%></textarea>
											<input type="text" name="exam_id" value="<%=exam_id%>"
												class="required m-wrap" data-required="1"
												style="display: none" />
										</div>
									</div>
									<div class="form-actions">
										<button type="submit" class="btn">Modify</button>
										<button type="reset" class="btn">Clear</button>

										<td align="center"><button>
												<a href="exams.jsp">Back</a>
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

