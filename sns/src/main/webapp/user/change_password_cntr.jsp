<div id="product-post">
        <div class="container">

            <div id="single-blog" >
                <div class="container">
                    <div class="row">
                        <div class="product-item col-md-12">
                            <div class="row">
                                <div class="col-md-8"> 
                                    <div class="heading-section2">
                                        <h2 style="color:#f78e21">Change Password</h2>
                                    </div>
                                    <div class="heading-section1">
                                        <img src="images/under-heading.png" alt="" >
                                    </div>
                                    <div>&nbsp;</div>  
                                    <div class="heading-section3">
                                        <form method="post" action="../SnsUserController?method=pass_modification" id="profile_form">
                                            <div>
                                                <label>Old Password<span style="color: #EA5200">*</span></label>
                                                <div>
                                                    <input type="password" name="user_oldpass" class="required" >
                                                </div>
                                            </div>
                                            <div>&nbsp;</div>
                                            <div>
                                                <label>New Password<span style="color: #EA5200">*</span></label>
                                                <div>
                                                    <input type="password" name="user_newpass" id="password" class="required">
                                                </div>
                                            </div>
                                            <div>&nbsp;</div>
                                            <div>
                                                <label>Confirm Password<span style="color: #EA5200">*</span></label>
                                                <div>
                                                    <input type="password" name="user_cpass" class="required">
                                                </div>
                                            </div>
                                            <div>&nbsp;</div>                                
                                            <div class="heading-section4">
                                                <button type="submit" style="color:#f78e21">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button type="reset" style="color:#f78e21 ">Reset</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <%@include file="rightbar.jsp" %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>     
        </div>
    </div>
