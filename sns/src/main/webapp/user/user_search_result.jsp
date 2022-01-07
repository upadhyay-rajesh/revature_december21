<%@include file="homepage_sidebar.jsp"%>
<div id="heading">
	<%@include file="homepage_header.jsp"%>
	<%@include file="user_search_result_centr.jsp"%>



	<div class="row" id="footer">
		<div class="col-md-12 text-center">
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		</div>
	</div>



</div>

<script src="js/jquery-1.9.1.js"></script>
<script>
	function abc(x) {

		//AJAX CALL STARTS
		$.ajax({
			type : 'GET',
			url : '../SnsUserController?method=send_request',
			data : 'user=' + x,
			success : function(result) {
				$("#" + x).html(result);
			}
		});
		//AJAX CALL ENDS
	}
</script>

<script src="js/vendor/jquery-1.10.2.min.js"></script>
<script src="js/vendor/jquery-1.9.1.js"></script>
<script src="js/min/plugins.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
