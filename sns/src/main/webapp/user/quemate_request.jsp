<%@include file="homepage_sidebar.jsp"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>


<div id="heading">
	<%@include file="homepage_header.jsp"%>
	<%@include file="quemate_request_centr.jsp" %>

	<div class="row" id="footer">
		<div class="col-md-12 text-center">
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		</div>
	</div>

</div>
<script src="js/vendor/jquery-1.10.2.min.js"></script>
<script src="js/min/plugins.min.js"></script>
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
	function abc(x) {

		//AJAX CALL STARTS
		$.ajax({
			type : 'GET',
			url : '../SnsUserController?method=accept_request',
			data : 'user=' + x,
			success : function(result) {
				$("#" + x).html(result);
			}
		});
		//AJAX CALL ENDS
	}
</script>
<script>
	function abc1(x) {

		//AJAX CALL STARTS
		$.ajax({
			type : 'GET',
			url : '../SnsUserController?method=ignore_request',
			data : 'user=' + x,
			success : function(result) {
				$("#" + x).html(result);
			}
		});
		//AJAX CALL ENDS
	}
</script>

</body>
</html>
