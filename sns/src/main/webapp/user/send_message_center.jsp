
<div id="product-post">
    <div class="container">

        <div id="single-blog" >
            <div class="container">
                <div class="row">
                    <div class="product-item col-md-12">
                        <div class="row">
                            <div class="col-md-8"> 
                                <div class="heading-section2">
                                    <h2 style="color:#f78e21">Send Message</h2>
                                </div>
                                <div class="heading-section1">
                                    <img src="images/under-heading.png" alt="" >
                                </div>
                                <%
                                    String rname = request.getParameter("rname");
                                %>
                                <form action="../SnsUserController?method=user_pri_msg_save" method="post" enctype="multipart/form-data" class="facebook-share-box">
                                    <div class="share">

                                        <div class="panel panel-default" style="border-color: #fff; box-shadow: none">

                                            <div class="panel-body" style="padding:0px">
                                                <div class="">
                                                    <textarea name="message" cols="40" rows="10" id="status_message" class="form-control message" style="height: 62px; overflow: hidden;" placeholder="Send message......"></textarea> 
                                                </div>
                                            </div>
                                            <div class="panel-footer" style="background-color: #fff">
                                                <div class="row">
                                                    <input type="file" name="profile_image" id="i2" style="display:none">
                                                    <input type="text"  name="rname" style="display:none" value="<%=rname%>">
                                                    <div class="col-md-7">
                                                        <div class="form-group" style="margin-bottom: 0px;">
                                                            <div class="btn-group">
                                                                <button type="button" class="btn btn-default" id="i3"><i class="fa fa-file"></i> Files</button>
                                                                <button type="button" class="btn btn-default" id="i1"><i class="fa fa-camera"></i> Photo</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <div class="form-group" style="margin-bottom: 0px;">
                                                            <select name="privacy" style="width:100px" class="form-control privacy-dropdown pull-left input-sm hidden">
                                                                <option value="2" selected="selected">Private</option>

                                                            </select>                                    
                                                            &nbsp;<input style="width:100px; float:right" type="submit" name="submit" value="Send" class="btn btn-primary">                               
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                                <div>&nbsp;</div>

                            </div>

                            <%@include file="rightbar.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>     
</div>