<%@page import="com.entity.SnsUserProfileDetail"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsUserMessages"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeSet"%>

<div id="product-post">
	<div class="container">

		<div id="single-blog">
			<div class="container">
				<div class="row">
					<div class="product-item col-md-12">
						<div class="row">
							<div class="col-md-8">
								<div class="comments-title">
									<div class="comment-section">
										<h3>Personal Messages</h3>
									</div>
								</div>
								<div class="divide-line">
									<img src="images/div-line.png" alt="" />
								</div>
								<div>&nbsp;</div>
								<%
									SnsUserMessages o = new SnsUserMessages();
									String u_name = (String) session.getAttribute("user_name");

									SnsServiceUserInterface serviceMsg = new SnsServiceUserImpl();
									ArrayList<SnsUserMessages> u = serviceMsg.userMessageView(u_name);
									Iterator k = u.iterator();
									String msg_sender, msg_receiver, msg_date, msg_content, msg_type, msg_status, msg_image, msg_file;
									int msg_id, msg_reply_code;
									while (k.hasNext()) {
										o = (SnsUserMessages) k.next();
										msg_sender = o.getMsg_sender();
										msg_receiver = o.getMsg_receiver();
										msg_date = o.getMsg_date();
										msg_content = o.getMsg_content();
										msg_id = o.getMsg_id();
										msg_type = o.getMsg_type();
										msg_reply_code = o.getMsg_reply_code();
										msg_image = o.getMsg_image();
										msg_file = o.getMsg_file();

										String orig_filename = "";
										if (msg_file != null) {
											int it = msg_file.indexOf("_");
											orig_filename = msg_file.substring(it + 1);
										}

										if (msg_type.equals("2")) { // if msg is private
											SnsUserProfileDetail l = new SnsUserProfileDetail();
											l.setUser_name(msg_sender);
											ArrayList<SnsUserProfileDetail> v = serviceMsg.userProfileView(l);
											Iterator b = v.iterator();
											String user_firstname, user_pimage, user_nam, user_lastname;
											if (b.hasNext()) {
												l = (SnsUserProfileDetail) b.next();
												user_firstname = l.getUser_firstname();
												user_lastname = l.getUser_lastname();
												user_pimage = l.getUser_profileimage();
												user_nam = l.getUser_name();
												if (msg_reply_code == 0) {
								%>

								<div class="view-comments">
									<div class="comments">

										<div class="author-thumb">
											<img
												src="../document/<%=user_nam%>/profilePhoto/<%=user_pimage%>"
												alt="" width="75" height="75">
										</div>

										<div class="comment-body" style="padding: 7px">

											<h6><%=user_firstname%>
												&nbsp;<%=user_lastname%></h6>
											<span style="color: #000;" class="date"><%=msg_sender%></span>
											<span style="float: right; margin-top: -50px; color: #000"
												class="date"><%=msg_date%></span>


											<p><%=msg_content%></p>
											<%
												if (msg_image != null) {
											%>
											<div class="author-thumb1">
												<img src="../document/<%=user_nam%>/<%=msg_image%>" alt=""
													style="width: 450px; height: 400px">
											</div>
											<%
												}
											%>
											<%
												if (msg_file != null) {
																	if (msg_file.endsWith("pdf")) {
											%>
											<div class="author-thumb" class="comment-body1">
												<img src="images/pdf.png" alt="" width="25" height="25">&nbsp;&nbsp;<%=orig_filename%>&nbsp;&nbsp;&nbsp;<a
													href="SnsUserController?method=download_file&fname=<%=msg_file%>&pathname=<%=user_nam%>"
													style="position: static; width: 0px; color: #006dcc">Download</a>
											</div>
											<%
												} else if (msg_file.endsWith("txt")) {
											%>
											<div class="author-thumb">
												<img src="images/text.png" alt="" width="25" height="25">&nbsp;&nbsp;<%=orig_filename%>&nbsp;&nbsp;&nbsp;<a
													href="SnsUserController?method=download_file&fname=<%=msg_file%>&pathname=<%=user_nam%>"
													style="position: static; width: 0px; color: #006dcc">Download</a>
											</div>
											<%
												} else if (msg_file.endsWith("docx")) {
											%>
											<div class="author-thumb">
												<img src="images/docx.png" alt="" width="25" height="25">&nbsp;&nbsp;<%=orig_filename%>&nbsp;&nbsp;&nbsp;<a
													href="SnsUserController?method=download_file&fname=<%=msg_file%>&pathname=<%=user_nam%>"
													style="position: static; width: 0px; color: #006dcc">Download</a>
											</div>
											<%
												}
																}
											%>

											<form
												action="SnsUserController?method=user_pri_save_reply"
												id="msg_reply">
												<div id="<%=msg_id%>r" style="display: none">
													<textarea name="message" cols="40" rows="10"
														class="form-control message"
														style="height: 62px; overflow: hidden;"
														placeholder="Enter Reply.."></textarea>
													<input type="text" name="msg_id" style="display: none"
														value="<%=msg_id%>"> <input type="text"
														name="msg_reciever" style="display: none"
														value="<%=msg_receiver%>"> <input type="text"
														name="msg_sender" style="display: none"
														value="<%=msg_sender%>">
													<button type="submit"
														style="background-color: #f78e21; color: #fff; margin-left: 520px; margin-top: 3px">Reply</button>
												</div>
											</form>
											<span id='<%=msg_id%>'><a
												href="javascript:abc('<%=msg_id%>')"
												style="margin-top: 10px" class="hidden-xs">Reply</a></span>
										</div>
									</div>
								</div>
								<%
													SnsUserMessages ro = new SnsUserMessages();
													ArrayList<SnsUserMessages> ru = serviceMsg.userMessageView(u_name);
													Iterator r = ru.iterator();
													String msg_sender_r, msg_receiver_r, msg_date_r, msg_content_r, msg_type_r, msg_status_r;
													int msg_reply_code_r, msg_id_r;
													while (r.hasNext()) {

														ro = (SnsUserMessages) r.next();
														msg_sender_r = ro.getMsg_sender();
														msg_receiver_r = ro.getMsg_receiver();
														msg_date_r = ro.getMsg_date();
														msg_content_r = ro.getMsg_content();
														msg_id_r = ro.getMsg_id();
														msg_type_r = ro.getMsg_type();
														msg_reply_code_r = ro.getMsg_reply_code();

														SnsUserProfileDetail rl = new SnsUserProfileDetail();
														rl.setUser_name(msg_sender_r);
														ArrayList<SnsUserProfileDetail> rv = serviceMsg.userProfileView(rl);
														Iterator rb = rv.iterator();
														String user_firstname_r, user_pimage_r, user_nam_r, user_lastname_r;
														if (rb.hasNext()) {
															rl = (SnsUserProfileDetail) rb.next();
															user_firstname_r = rl.getUser_firstname();
															user_lastname_r = rl.getUser_lastname();
															user_pimage_r = rl.getUser_profileimage();
															user_nam_r = rl.getUser_name();
															if (msg_id == (msg_reply_code_r)) {
								%>



								<div class="replyed-form">
									<div class="comments replyed" style="min-height: 80px">
										<div class="author-thumb" style="width: 50px; height: 50px">
											<img
												src="../document/<%=msg_sender_r%>/profilePhoto/<%=user_pimage_r%>"
												width=50 height=50 alt="">
										</div>
										<div class="comment-body"
											style="min-height: 70px; padding: 4px">
											<div>
												<b><%=msg_sender_r%></b>
											</div>
											<span class="date" style="color: #000"><%=msg_date_r%></span>
											<p><%=msg_content_r%></p>
										</div>
									</div>
								</div>
								<%
									}
														}
													}
								%>

								<div class="divide-line">
									<img src="images/div-line.png" alt="" />
								</div>
								<%
									}
											}
										}
									}
									
								%>


							</div>

							<%@include file="rightbar.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>