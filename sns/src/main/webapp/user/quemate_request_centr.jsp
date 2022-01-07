<%@page import="com.entity.SnsUserProfileDetail"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="com.entity.SnsUserFriends"%>
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
										<h4>QueMate Requests</h4>
									</div>
								</div>
								<div class="divide-line">
									<img src="images/div-line.png" alt="" />
								</div>
								<div class="all-comments">
									<div class="view-comments">
										<div class="comments">

											<div class="author-thumb">
												<%
													SnsUserFriends fr = new SnsUserFriends();
													String name = (String) session.getAttribute("user_name");

													SnsServiceUserInterface serviceReq = new SnsServiceUserImpl();
													ArrayList<SnsUserFriends> pyy = serviceReq.userFriendCheckRequests(name);
													Iterator cr = pyy.iterator();
													String frnd_from = "", frnd_date = "", frnd_status = "";
													int frnd_id;
													int flag = 0;
													while (cr.hasNext()) {
														flag = 1;
														fr = (SnsUserFriends) cr.next();
														frnd_from = fr.getFrnd_from();
														frnd_date = fr.getFrnd_date();
														frnd_status = fr.getFrnd_status();
														frnd_id = fr.getFrnd_id();

														SnsUserProfileDetail lbbb = new SnsUserProfileDetail();
														ArrayList<SnsUserProfileDetail> u = serviceReq.userProfileSearch(frnd_from, name);
														Iterator k = u.iterator();
														String user_firstname = "", user_pimage = "", user_nam = "", user_lastname = "";
														if (k.hasNext()) {

															lbbb = (SnsUserProfileDetail) k.next();
															user_firstname = lbbb.getUser_firstname();
															user_lastname = lbbb.getUser_lastname();
															user_pimage = lbbb.getUser_profileimage();
															user_nam = lbbb.getUser_name();
												%>

												<img
													src="../document/<%=user_nam%>/profilePhoto/<%=user_pimage%>"
													width="70" height="70" alt="">
											</div>

											<div class="comment-body" style="padding: 7px">

												<h6><%=user_firstname%>
													&nbsp;<%=user_lastname%></h6>
												<span style="color: #000" class="date"><%=frnd_from%></span><br>
												<span class="date" style="color: #000"><%=frnd_date%></span>

												<span id='<%=frnd_id%>'><a
													href="javascript:abc('<%=frnd_id%>')" class="hidden-xs"
													style="margin-top: -10px; width: 200px; height: 25px">Accept
														Request</a> <a href="javascript:abc1('<%=frnd_id%>')"
													class="hidden-xs" style="margin-top: 25px; height: 25px">Ignore</a></span>
												<%
													}
													}
													if (flag == 0) {
												%>
												<h3>No Requests</h3>
												<%
													}
												%>

											</div>

										</div>
									</div>


								</div>
								<div class="divide-line">
									<img src="images/div-line.png" alt="" />
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
