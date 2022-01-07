<%@page import="com.entity.SnsUserProfileDetail"%>
<%@page import="com.service.SnsServiceUserInterface"%>
<%@page import="com.service.SnsServiceUserImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@include file="homepage_sidebar.jsp"%>

<div id="heading">
	<%@include file="homepage_header.jsp"%>
	<div id="product-post">
		<div class="container">

			<div id="single-blog">
				<div class="container">
					<div class="row">
						<div class="product-item col-md-12">
							<div class="row">
								<div class="col-md-8">
									<div class="heading-section2">
										<h2 style="color: #f78e21">Edit Profile</h2>
									</div>
									<%
										String user_nameProf = (String) session.getAttribute("user_name");

										SnsServiceUserInterface serviceProf = new SnsServiceUserImpl();
										SnsUserProfileDetail z = new SnsUserProfileDetail();
										z.setUser_name(user_name);
										ArrayList<SnsUserProfileDetail> w = serviceProf.userProfileView(z);
										Iterator e = w.iterator();
										String user_firstname, user_lastname, user_gender, user_birthdate, user_address, user_homecity,
												user_currentcity, user_email, user_mob, user_profileimage, user_highschool, user_college, user_exp,
												user_skills;
										if (e.hasNext()) {
											z = (SnsUserProfileDetail) e.next();
											user_firstname = z.getUser_firstname();
											user_lastname = z.getUser_lastname();
											user_gender = z.getUser_gender();
											user_birthdate = z.getUser_birthdate();
											user_address = z.getUser_address();
											user_homecity = z.getUser_homecity();
											user_currentcity = z.getUser_currentcity();
											user_email = z.getUser_email();
											user_mob = z.getUser_mob();
											user_profileimage = z.getUser_profileimage();
											user_highschool = z.getUser_highschool();
											user_college = z.getUser_college();
											user_exp = z.getUser_exp();
											user_skills = z.getUser_skills();
									%>
									<div class="heading-section1">
										<img src="images/under-heading.png" alt="">
									</div>
									<!-- -->

									<div>&nbsp;</div>
									<div class="heading-section3">
										<form method="post" action="../SnsUserController?method=profile_modify"
											id="profile_form">
											<div>
												<label>First Name<span style="color: #EA5200">*</span></label>
												<div>
													<input type="text" name="user_firstname"
														value="<%=user_firstname%>" class="required">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>Last Name<span style="color: #EA5200">*</span></label>
												<div>
													<input type="text" name="user_lastname"
														value="<%=user_lastname%>" class="required">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>Gender<span style="color: #EA5200">*</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												Male<input type="radio" name="user_gender" value="male"
													<%=user_gender.equalsIgnoreCase("male") ? "checked" : ""%>
													style="width: auto; margin-left: 10px" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												Female<input type="radio" name="user_gender" value="female"
													<%=user_gender.equalsIgnoreCase("female") ? "checked" : ""%>
													style="width: auto; margin-left: 10px">
											</div>
											<div>&nbsp;</div>
											<div>
												<label>Date of Birth<span style="color: #EA5200">*</span></label>
												<div>
													<input type="date" name="user_birthdate"
														value="<%=user_birthdate%>" class="required">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>Address</label>
												<div>
													<input type="text" value="<%=user_address%>"
														name="user_address">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>Home City</label>
												<div>
													<input type="text" name="user_homecity"
														value="<%=user_homecity%>">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>Current City<span style="color: #EA5200">*</span></label>
												<div>
													<input type="text" name="user_currentcity"
														value="<%=user_currentcity%>" class="required">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>Email<span style="color: #EA5200">*</span></label>
												<div>
													<input type="text" name="user_email"
														value="<%=user_email%>" class="required email">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>Mobile Number</label>
												<div>
													<input type="text" value="<%=user_mob%>" name="user_mob">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>High School</label>
												<div>
													<input type="text" value="<%=user_highschool%>"
														name="user_highschool">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>College name</label>
												<div>
													<input type="text" value="<%=user_college%>"
														name="user_college">
												</div>
											</div>
											<div>&nbsp;</div>
											<div>
												<label>Experience</label>
												<div>
													<input type="text" value="<%=user_exp%>" name="user_exp">
												</div>
											</div>
											<div>&nbsp;</div>

											<div>
												<label>Skills</label>
												<div>
													<input type="text" value="<%=user_skills%>"
														name="user_skills">
												</div>
											</div>
											<div>&nbsp;</div>
											<%
												}
											%>
											<div class="heading-section4">
												<button type="submit" style="color: #f78e21">Save</button>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="reset" style="color: #f78e21">Reset</button>
											</div>
										</form>
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

	<div class="row" id="footer">
		<div class="col-md-12 text-center">
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		</div>
	</div>

</div>




<script src="js/vendor/jquery-1.10.2.min.js"></script>
<script src="js/min/plugins.min.js"></script>
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/vendor/jquery-1.9.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#profile_form").validate({
			rules : {
				"user_firstname" : {
					minlength : 3,
					maxlength : 15
				},
				"user_lastname" : {
					minlength : 3,
					maxlength : 15
				},
				"user_currentcity" : {
					minlength : 3,
					maxlength : 10
				}

			},
			messages : {}

		});

	});
</script>
</body>
</html>
