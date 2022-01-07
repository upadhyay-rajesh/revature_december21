<%-- 
    Document   : exams
    Created on : May 13, 2015, 3:23:46 PM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsExams"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Important Exams</title>
</head>
<body>
	<div style="margin-left: 380px">
		<h2>Important Exams</h2>
	</div>
	<table cellpadding="0" cellspacing="0" border="1" width="800px"
		style="margin-top: 50px; margin-left: 85px">
		<thead>
			<tr>
				<th width="170px">Exam Name</th>
				<th width="130px">Date</th>
				<th>Description</th>

			</tr>
		</thead>
		<tbody>
			<%
				SnsExams d = new SnsExams();
				SnsServiceUserInterface serviceExam = new SnsServiceUserImpl();
				ArrayList<SnsExams> p = serviceExam.examShowAll();
				Iterator q = p.iterator();

				String exam_name, exam_date, exam_description;

				while (q.hasNext()) {

					d = (SnsExams) q.next();
					exam_name = d.getExam_name();
					exam_date = d.getExam_date();
					exam_description = d.getExam_description();
			%>
			<tr>
				<td align="center"><%=exam_name%></td>
				<td align="center"><%=exam_date%></td>
				<td align="center"><%=exam_description%></td>

			</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>
