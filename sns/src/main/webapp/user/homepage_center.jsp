<%@page import="com.entity.SnsUserMessages"%>
<%@page import="com.entity.SnsUserFriends"%>
<%@page import="com.entity.SnsUserProfileDetail"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
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
								<form action="../SnsUserController?method=user_pub_msg_save"
									method="post" enctype="multipart/form-data"
									class="facebook-share-box">
									<div class="share">

										<div class="panel panel-default"
											style="border-color: #fff; box-shadow: none">
											<div class="panel-heading"
												style="padding: 1px 15px; color: #000;  border-color: #fff">
												<i class="fa fa-file"></i>Ask Any Query??
											</div>
											<div class="panel-body" style="padding: 0px">
												<div class="">
													<textarea name="message" cols="40" rows="10"
														id="status_message" class="form-control message"
														style="height: 62px; overflow: hidden;"
														placeholder="What do you need help with ?"></textarea>
												</div>
											</div>
											<div class="panel-footer" style="background-color: #fff">
												<div class="row">
													<input type="file" name="profile_image" id="i2"
														style="display: none">
													<div class="col-md-7">
														<div class="form-group" style="margin-bottom: 0px;">
															<div class="btn-group">
																<button type="button" class="btn btn-default" id="i3">
																	<i class="fa fa-file"></i> Files
																</button>
																<button type="button" class="btn btn-default" id="i1">
																	<i class="fa fa-camera"></i> Photo
																</button>
															</div>
														</div>
													</div>
													<div class="col-md-5">
														<div class="form-group" style="margin-bottom: 0px;">
															<select name="privacy" style="width: 100px"
																class="form-control privacy-dropdown pull-left input-sm hidden">
																<option value="1" selected="selected">Public</option>

															</select> &nbsp;<input style="width: 100px; float: right"
																type="submit" name="submit" value="Post"
																class="btn btn-primary">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</form>
								<div>&nbsp;</div>
								<%
									SnsUserMessages o = new SnsUserMessages();
									SnsServiceUserInterface serviceHome = new SnsServiceUserImpl();
									ArrayList frnzz = (ArrayList) session.getAttribute("frnz");
									TreeSet<SnsUserMessages> u = serviceHome.post_query(frnzz);
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

										String msg; // if msg is pri
										if (msg_sender.equals(msg_receiver)) {
											msg = "";
										} else {
											msg = "posted on " + msg_receiver + "\'s QueBoard";
										}

										if (msg_type.equals("1")) { // if msg is public
											SnsUserProfileDetail l = new SnsUserProfileDetail();
											l.setUser_name(msg_sender);
											ArrayList<SnsUserProfileDetail> v = serviceHome.userProfileView(l);
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
											<span style="color: #000;" class="date"><%=msg_sender%>
												&nbsp;</span><%=msg%><br> <span
												style="float: right; margin-top: -50px; color: #000"
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
													href="../SnsUserController?method=download_file&fname=<%=msg_file%>&pathname=<%=user_nam%>"
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

											<form action="../SnsUserController?method=user_save_reply" method="post"
												id="msg_reply">
												<div id="<%=msg_id%>r" style="display: none">
													<textarea name="message" cols="40" rows="10"
														class="form-control message"
														style="height: 62px; overflow: hidden;"
														placeholder="Enter Reply.."></textarea>
													<input type="text" name="msg_id" style="display: none"
														value="<%=msg_id%>"> <input type="text"
														name="msg_reciever" style="display: none"
														value="<%=msg_receiver%>">
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
													TreeSet<SnsUserMessages> ru = serviceHome.post_query(frnzz);
													Iterator r = ru.iterator();
													String msg_sender_r, msg_receiver_r, msg_date_r, msg_content_r, msg_type_r, msg_status_r;
													int msg_reply_code_r, msg_id_r;

													while (r.hasNext()) {

														ro = (SnsUserMessages) r.next();
														//out.print("hi");
														msg_sender_r = ro.getMsg_sender();
														msg_receiver_r = ro.getMsg_receiver();
														msg_date_r = ro.getMsg_date();
														msg_content_r = ro.getMsg_content();
														msg_id_r = ro.getMsg_id();
														msg_type_r = ro.getMsg_type();
														msg_reply_code_r = ro.getMsg_reply_code();

														SnsUserProfileDetail rl = new SnsUserProfileDetail();
														rl.setUser_name(msg_sender_r);
														ArrayList<SnsUserProfileDetail> rv = serviceHome.userProfileView(rl);
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
											<%--<a href="#" class="hidden-xs">Reply</a> --%>
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