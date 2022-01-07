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

								<div>&nbsp;</div>
								<div class="comments-title">
									<div class="comment-section">
										<h3>QueMates Search Result</h3>
									</div>
								</div>
								<div class="divide-line">
									<img src="images/div-line.png" alt="" />
								</div>
								<div class="all-comments">
									<div class="view-comments">
										<div class="comments">
											<%
												String n = (String) session.getAttribute("search");
												String username = (String) session.getAttribute("user_name");

												SnsServiceUserInterface serviceSearch = new SnsServiceUserImpl();
												SnsUserProfileDetail o = new SnsUserProfileDetail();
												ArrayList<SnsUserProfileDetail> u = serviceSearch.userProfileSearch(n, username);
												Iterator k = u.iterator();
												int flag = 0;
												String user_firstname, user_profileimage, user_nam, user_lastname;
												while (k.hasNext()) {
													flag = 1;

													o = (SnsUserProfileDetail) k.next();
													user_firstname = o.getUser_firstname();
													user_lastname = o.getUser_lastname();
													user_profileimage = o.getUser_profileimage();
													user_nam = o.getUser_name();

													SnsUserFriends fr = new SnsUserFriends();
													fr.setFrnd_to(user_nam);
													fr.setFrnd_from(username);
													String status = serviceSearch.userFriendCheck(fr);
											%>
											<div class="author-thumb">
												<img
													src="../document/<%=user_nam%>/profilePhoto/<%=user_profileimage%>"
													width="70" height="70" alt="">
											</div>

											<div class="comment-body" style="padding: 7px">
												<h6><%=user_firstname%>
													&nbsp;<%=user_lastname%></h6>
												<span style="color: #000" class="date"><%=user_nam%></span><br>
												<%
													if (status.equals("add quemate")) {
												%>
												<span id='<%=user_nam%>'><a
													href="javascript:abc('<%=user_nam%>')" class="hidden-xs"
													style="margin-top: -10px; width: 200px; height: 25px">Add
														QueMate</a></span>
												<%
													} else {
												%>
												<span style="color: #000" id='<%=user_nam%>'><%=status%></span>
												<%
													}
												%>
											</div>
											<div>&nbsp;</div>


											<span style="width: 250px; height: 70px; color: #000">
												<img src="images/<%=user_profileimage%>" width="70"
												height="70"> <span style="color: #000"><%=user_firstname%>
													&nbsp;<%=user_lastname%></span> <span style="color: #000"><%=user_nam%></span>
												<%
													if (status.equals("add quemate")) {
												%> <span id='<%=user_nam%>'><a
													href="javascript:abc('<%=user_nam%>')" class="hidden-xs"
													style="margin-top: -10px; width: 200px; height: 25px">Add
														QueMate</a></span> <%
 	} else {
 %> <span style="color: #000" id='<%=user_nam%>'><%=status%></span> <%
 	}
 %>
											</span>
											<%
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