<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.SnsUserDetail"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%
	String user_name;
	user_name = request.getParameter("user_name");

	SnsUserDetail d = new SnsUserDetail();
	d.setUser_name(user_name);
	SnsServiceUserInterface service = new SnsServiceUserImpl();
	String a = service.verifyUserName(d);
	out.print(a);
%>
