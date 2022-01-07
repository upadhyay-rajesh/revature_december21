<%@page import="com.entity.SnsUserFriends"%>
<%@page import="com.entity.SnsUserProfileDetail"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
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
										<h3>QueMates</h3>
									</div>
								</div>
								<div class="divide-line">
									<img src="images/div-line.png" alt="" />
								</div>
								<div class="all-comments">
									<div class="view-comments">
										<div class="comments">
											<%
												SnsServiceUserInterface serviceMates = new SnsServiceUserImpl();
												SnsUserFriends f = new SnsUserFriends();
												String useName = (String) session.getAttribute("user_name");
												ArrayList<SnsUserFriends> g = serviceMates.userFriendIfFriends(useName);
												Iterator cr = g.iterator();
												int flag = 0;
												String frnd_from, frnd_date, frnd_status;
												int frnd_id;
												while (cr.hasNext()) {
													flag = 1;
													f = (SnsUserFriends) cr.next();
													frnd_from = f.getFrnd_from();
													frnd_date = f.getFrnd_date();
													frnd_status = f.getFrnd_status();
													frnd_id = f.getFrnd_id();

													SnsUserProfileDetail o = new SnsUserProfileDetail();
													ArrayList<SnsUserProfileDetail> u = serviceMates.userProfileSearch(frnd_from, useName);
													Iterator k = u.iterator();
													String user_firstname, user_pimage, user_nam, user_lastname;
													if (k.hasNext()) {

														o = (SnsUserProfileDetail) k.next();
														user_firstname = o.getUser_firstname();
														user_lastname = o.getUser_lastname();
														user_pimage = o.getUser_profileimage();
														user_nam = o.getUser_name();
											%>

											<div class="author-thumb">

												<img
													src="../document/<%=user_nam%>/profilePhoto/<%=user_pimage%>"
													width="70" height="70" alt="">
											</div>

											<div class="comment-body" style="padding: 7px">

												<h6><%=user_firstname%>
													&nbsp;<%=user_lastname%></h6>
												<span style="color: #000" class="date"><%=user_nam%></span><br>
												<a role="button" href="send_message.jsp?rname=<%=user_nam%>"
													style="margin-top: -6px; width: 180px; margin-right: 30px">Send
													Message</a>
												<%
													//session.setAttribute("receiver",user_nam);
												%>
											</div>
											<div class="divide-line">
												<img src="images/div-line.png" alt="" />
											</div>
											<%
												}
												}
												if (flag == 0) {
											%>
											<h4>No QueMates</h4>
											<%
												}
											%>

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
