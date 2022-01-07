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
									<h2 style="color: #f78e21">My Notes</h2>
								</div>
								<div class="heading-section1">
									<img src="images/under-heading.png" alt="">
								</div>
								<div>&nbsp;</div>
								<div class="all-comments">
									<div class="view-comments">
										<div class="comments">
											<%
												String u_name = (String) session.getAttribute("user_name");
												SnsUserMessages msg = new SnsUserMessages();
												msg.setMsg_sender(u_name);

												SnsServiceUserInterface serviceNote = new SnsServiceUserImpl();
												ArrayList<SnsUserMessages> arr = serviceNote.userMessageViewFile(msg);

												/*PAGING CODE STARTS */
												int no = arr.size(); //total records
												int record = 6; //records per page
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
												String msg_file;
												int msg_id;

												for (int jk = lower; jk <= upper; jk++) {
													msg = (SnsUserMessages) arr.get(jk);
													msg_file = msg.getMsg_file();
													msg_id = msg.getMsg_id();

													String orig_filename = "";
													if (msg_file != null) {
														int it = msg_file.indexOf("_");
														orig_filename = msg_file.substring(it + 1);
											%>
											<div class="comment-body"
												style="padding: 7px; margin-left: 50px">
												<div class="heading-section3">
													<div>&nbsp;</div>
													<div style="color: #000">
														<%
															if (msg_file.endsWith("pdf")) {
														%>
														<div class="author-thumb" class="comment-body1">
															<a
																href="../SnsUserController?method=download_file&fname=<%=msg_file%>&pathname=<%=u_name%>"
																style="position: static; color: #006dcc; width: 0px; margin-left: -20px">Download</a>
															<a
																href="../SnsUserController?method=delete_file&fname=<%=msg_file%>&sender_name=<%=u_name%>&msg_idd=<%=msg_id%>"
																style="position: static; color: #006dcc; width: 0px; margin-left: 100px">Delete</a><img
																src="images/pdf.png" alt="" width="25" height="25"
																style="margin-left: 200px"> &nbsp;&nbsp; <b><%=orig_filename%></b>
														</div>
														<%
															} else if (msg_file.endsWith("txt")) {
														%>
														<div class="author-thumb" class="comment-body1">
															<a
																href="../SnsUserController?method=download_file&fname=<%=msg_file%>&pathname=<%=u_name%>"
																style="position: static; color: #006dcc; width: 0px; margin-left: -20px">Download</a><a
																href="../SnsUserController?method=delete_file&fname=<%=msg_file%>&sender_name=<%=u_name%>&msg_idd=<%=msg_id%>"
																style="position: static; color: #006dcc; width: 0px; margin-left: 100px">Delete</a><img
																src="images/text.png" alt="" width="25" height="25"
																style="margin-left: 200px"> &nbsp;&nbsp; <b><%=orig_filename%></b>
														</div>
														<%
															} else if (msg_file.endsWith("docx")) {
														%>
														<div class="author-thumb">
															<a
																href="../SnsUserController?method=download_file&fname=<%=msg_file%>&pathname=<%=u_name%>"
																style="position: static; color: #006dcc; width: 0px; margin-left: -20px">Download</a><a
																href="../SnsUserController?method=delete_file&fname=<%=msg_file%>&sender_name=<%=u_name%>&msg_idd=<%=msg_id%>"
																style="position: static; color: #006dcc; width: 0px; margin-left: 100px">Delete</a><img
																src="images/docx.png" alt="" width="25" height="25"
																style="margin-left: 200px">&nbsp;&nbsp;<b><%=orig_filename%></b>
														</div>
														<%
															}
														%>
													</div>
													<div>&nbsp;</div>
													<div>&nbsp;</div>
												</div>
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

												<a href="my_notes.jsp?page=<%=is%>"><b><%=is%></b></a>
												<%
													}
												%>
											</div>
										</div>
									</div>
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
