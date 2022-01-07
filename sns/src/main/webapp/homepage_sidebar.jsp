<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.SnsUserProfileDetail"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>HOME</title>
<meta name="description" content="">

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-1.9.1.js"></script>
<script src="fancybox/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript"
	src="fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" href="fancybox/jquery.fancybox-1.3.4.css"
	type="text/css" media="screen" />
<script>
	$(document).ready(function($) {

		$('.exam').fancybox({
			type : 'iframe',
			width : 1000,
			height : 950,
			scrolling : 'yes'
		});
		window.addEventListener("message", function(event) {
			//$(".sx").html(event.data);		
			if (event.origin === 'exams.jsp') {

				if (event.data === 'closeframe')
					$.fancybox.close();
			}
		}, false);

		$('.adds').fancybox({
			type : 'iframe',
			width : 1000,
			height : 950,
			scrolling : 'yes'
		});
		window.addEventListener("message", function(event) {
			//$(".sx").html(event.data);		
			if (event.origin === 'exams.jsp') {

				if (event.data === 'closeframe')
					$.fancybox.close();
			}
		}, false);

	});
</script>

<link rel="stylesheet" href="css/homenormalize.css">
<link rel="stylesheet" href="css/homefont-awesome.css">
<link rel="stylesheet" href="css/homebootstrap.min.css">
<link rel="stylesheet" href="css/hometemplatemo-style.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/templatemo_style.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/testimonails-slider.css">



<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/vendor/jquery-1.10.2.min.js"></script>
<script src="js/min/plugins.min.js"></script>

<script>
	$(document).ready(function abc() {

		/*$('.mypop').fancybox({type: 'iframe', width: 1000, height: 950, scrolling: 'no'});
		 window.addEventListener("message", function (event) {
		 
		 if (event.origin === 'profilephoto.jsp')
		 {
		 
		 if (event.data === 'closeframe')
		 $.fancybox.close();
		 }
		 }, false);
		 
		 $("#photo1").on("click", function ()
		 {
		 $("#photo2").trigger("click");
		 });*/

		$("#image").click(function() {
			window.open("profilephoto.jsp", "_self");
		});

	});
</script>

</head>
<body>
	<%
		String user_name1 = (String) session.getAttribute("user_name");

		SnsUserProfileDetail lb = new SnsUserProfileDetail();
		lb.setUser_name(user_name1);

		SnsServiceUserInterface serviceSide = new SnsServiceUserImpl();
		ArrayList<SnsUserProfileDetail> data = serviceSide.userProfileView(lb);
		Iterator ik = data.iterator();
		String user_fname = "", user_lname = "", user_profileimg = "";
		if (ik.hasNext()) {
			lb = (SnsUserProfileDetail) ik.next();
			user_fname = lb.getUser_firstname();
			user_lname = lb.getUser_lastname();
			user_profileimg = lb.getUser_profileimage();
		}
	%>


	<!-- SIDEBAR -->
	<div class="sidebar-menu hidden-xs hidden-sm">
		<div class="top-section">
			<div class="profile-image">
				<img
					src="../document/<%=user_name1%>/profilePhoto/<%=user_profileimg%>"
					alt="<%=user_fname%>" width="160" height="160" id="image">
			</div>
			<button id="photo2" class="mypop" style="display: none">
				<a href="profilephoto.jsp"></a>
			</button>
			<h3 class="profile-title" style="margin-left: 20px">
				<b><%=user_fname%>&nbsp;<%=user_lname%></b>
			</h3>

		</div>
		<!-- top-section -->
		<div class="main-navigation">
			<ul class="navigation">
				<li><a href="homepage.jsp"><i class="fa fa-globe"></i>QueBoard</a></li>
				<li><a href="my_photos.jsp"><i class="fa fa-photo"></i>My
						Photos</a></li>
				<li><a href="my_notes.jsp"><i class="fa fa-pencil"></i>My
						Notes</a></li>
				<li><a href="quemates.jsp"><i class="fa fa-users"></i>QueMates</a></li>
			</ul>
		</div>
		<!-- .main-navigation -->
		<!-- .social-icons -->
	</div>
	<!-- .sidebar-menu -->