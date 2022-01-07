<%-- 
    Document   : exams
    Created on : May 13, 2015, 3:23:46 PM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsAdvertisements"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Important Advertisements</title>
</head>
<body>
	<div style="margin-left: 380px">
		<h2>Recent Notifications</h2>
	</div>
	<table cellpadding="0" cellspacing="0" border="1" width="800px"
		style="margin-top: 50px; margin-left: 85px">
		<thead>
			<tr>
				<th width="170px">Title</th>
				<th>Description</th>

			</tr>
		</thead>
		<tbody>
			<%
				SnsAdvertisements d = new SnsAdvertisements();
				SnsServiceUserInterface serviceAdd = new SnsServiceUserImpl();
				ArrayList<SnsAdvertisements> p = serviceAdd.addShowAll();
				Iterator q = p.iterator();

				String add_title, add_description;

				while (q.hasNext()) {

					d = (SnsAdvertisements) q.next();
					add_title = d.getAdd_title();
					add_description = d.getAdd_description();
			%>
			<tr>
				<td align="center"><%=add_title%></td>
				<td align="center"><%=add_description%></td>

			</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>
