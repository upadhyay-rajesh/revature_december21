<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.SnsUserMessages"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<div id="product-post">
	<div class="container">

		<div id="single-blog">
			<div class="container">
				<div class="row">
					<div class="product-item col-md-12">
						<div class="row">
							<div class="col-md-8">
								<div class="heading-section2">
									<h2 style="color: #f78e21">My Photos</h2>
								</div>
								<div class="heading-section1">
									<img src="images/under-heading.png" alt="">
								</div>
								<div>&nbsp;</div>
								<%
									String u_name = (String) session.getAttribute("user_name");
									SnsUserMessages msg = new SnsUserMessages();
									msg.setMsg_sender(u_name);

									SnsServiceUserInterface servicePhoto = new SnsServiceUserImpl();
									ArrayList<SnsUserMessages> arr = servicePhoto.userMessageViewImage(msg);

									/*PAGING CODE STARTS */
									int no = arr.size(); //total records
									int record = 3; //records per page
									int pages = no / record; //numner of pages
									if (no % record != 0) {
										pages++;
									}

									int pg = 1;
									String ph = request.getParameter("page");
									if (ph != null) {
										pg = Integer.parseInt(ph);
									}

									int lower, upper;
									lower = (pg - 1) * record;
									upper = lower + record - 1;

									if (upper >= no) {
										upper = no - 1;
									}

									/*PAGING CODE ENDS */
									String msg_image, msg_sender, msg_file;
									int msg_id;

									for (int jk = lower; jk <= upper; jk++) {
										msg = (SnsUserMessages) arr.get(jk);
										msg_image = msg.getMsg_image();
										msg_sender = msg.getMsg_sender();
										msg_id = msg.getMsg_id();
										msg_file = msg.getMsg_file();
										if (msg_image != null) {
								%>
								<div class="heading-section3">
									<div class="author-thumb1">
										<img src="../document/<%=u_name%>/<%=msg_image%>" alt=""
											style="width: 450px; height: 400px"><a
											href="../SnsUserController?method=delete_image&fname=<%=msg_file%>&sender_name=<%=u_name%>&msg_idd=<%=msg_id%>"
											style="position: static; color: #006dcc; width: 0px; margin-left: 100px">Delete</a>
									</div>
									<div>&nbsp;</div>

								</div>
								<div class="divide-line">
									<img src="images/div-line.png" alt="" />
								</div>
								<div>&nbsp;</div>
								<%
									}
									}
								%>
								<div style="margin-left: 360px; color: #000">
									<%
										for (int is = 1; is <= pages; is++) {
									%>

									<a href="my_photos.jsp?page=<%=is%>"><b><%=is%></b></a>
									<%
										}
									%>
								</div>
							</div>
							<%@include file="rightbar.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
