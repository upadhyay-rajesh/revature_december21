<%@page import="com.entity.SnsUserDetail"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsUserFriends"%>

<div class="container">
	<h4 style="width: 268px; height: 19px">
		<span style="width: 268px; height: 19px"> <%
 	SnsUserFriends nr = new SnsUserFriends();
 	String currentUser = (String) session.getAttribute("user_name");
 	String user_name = currentUser;

 	SnsServiceUserInterface service = new SnsServiceUserImpl();
 	ArrayList<SnsUserFriends> py = service.userFriendCheckRequests(currentUser);
 	ArrayList<String> frnz = service.userFriendCheckFriends(currentUser); // get all users frnz(the one who is logged in)
 	frnz.add(currentUser); // add yourself into it so that ur posts are visible to u as well
 	session.setAttribute("frnz", frnz);
 	int i = py.size();
 %> <a href="quemate_request.jsp"><i class="fa fa-user"></i></a> <%
 	if (i > 0) {
 %> <i style="color: white;"><b><%=i%></b></i> <%
 	}
 %> &nbsp;&nbsp; <a href="personl_message.jsp"><i
				class="fa fa-envelope"></i></a> &nbsp;&nbsp;
		</span>
	</h4>


	<form name="form" method="get"
		action="../SnsUserController?method=user_search_result"
		class="search-box">

		<input id="search" name="search" type="text" /> <input type="submit"
			id="search-button" />

	</form>
	<%
		String user_profile;
		if (currentUser == null) {
			response.sendRedirect("index.jsp");
		}
		SnsUserDetail x = new SnsUserDetail();
		x.setUser_name(currentUser);
		ArrayList<SnsUserDetail> p = service.view(x);
		Iterator q = p.iterator();
		if (q.hasNext()) {
			x = (SnsUserDetail) q.next();

			user_profile = x.getUser_profile();

			if (user_profile.equals("yes")) {

			} else {
				response.sendRedirect("destroy.jsp");
			}
		}
	%>
	<div style="width: 150px; float: right">
		<div class="btn-group"
			style="float: left; margin-top: -41px; margin-left: -65px">

			<button type="button" data-toggle="dropdown"
				class="btn btn-default dropdown-toggle"><%=currentUser%><i
					class="fa fa-home"></i> <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="edit_profile.jsp">Edit Profile</a></li>
				<li><a href="change_password.jsp">Change Password</a></li>
				<li class="divider"></li>
				<li><a href="destroy.jsp">Logout</a></li>
			</ul>
		</div>
	</div>
	<div style="float: right; margin-top: -69px; margin-right: -9px">
		<a href="homepage.jsp"><img src="images/logo.png" width=110px
			" height="30px" title="SNS" alt="SNS"></a>
	</div>
</div>