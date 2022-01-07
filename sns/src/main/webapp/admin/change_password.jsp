
<!DOCTYPE html>
<html class="no-js">

    <head>
        <title>Admin Home Page</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>

    <%@include file="header.jsp"%>    

    <div class="container-fluid">
        <div class="row-fluid">
            <%@include file="sidebar.jsp"%>   

            <!--/span-->
            <div class="span9" id="content">

                <div class="row-fluid">
                    <!-- block -->
                    <div class="block">
                        <div class="navbar navbar-inner block-header">
                            <div class="muted pull-left">Change Password</div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <!-- BEGIN FORM-->
                                <form action="../SnsAdminController?method=pass_modification" id="form_sample_1" class="form-horizontal" method="post">
                                    <fieldset>
                                        <div class="alert alert-error hide">
                                            <button class="close" data-dismiss="alert"></button>
                                            You have some form errors. Please check below.
                                        </div>
                                        <div class="alert alert-success hide">
                                            <button class="close" data-dismiss="alert"></button>
                                            Your form validation is successful!
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Old Password<span >*</span></label>
                                            <div class="controls">
                                                <input name="user_oldpass" type="password" class="required m-wrap" data-required="1" />
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">New Password<span >*</span></label>
                                            <div class="controls">
                                                <input type="password" name="user_newpass" id="password" class="required m-wrap" data-required="1"/>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label"> Confirm Password<span >*</span></label>
                                            <div class="controls">
                                                <input type="password" name="user_cpass"  class="required m-wrap" data-required="1"/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-actions">
                                            <button type="submit" class="btn">Modify</button>
                                            
                                            <td align="center"><a href="index.jsp">Back</a></td>
                                            
                                            <button type="reset" class="btn">Clear</button>
                                        </div>
                                    </fieldset>
                                </form>
                    
                                <!-- END FORM-->
                            </div>
                        </div>
                    </div>
                    <!-- /block -->
                </div>

            </div>
        </div>
        <hr>
        <footer>
            <p>&copy; SNS</p>
        </footer>
    </div>
    <!--/.fluid-container-->
    <link href="vendors/datepicker.css" rel="stylesheet" media="screen">
    <link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
    <link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

    <link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

    <script src="vendors/jquery-1.9.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/jquery.uniform.min.js"></script>
    <script src="vendors/chosen.jquery.min.js"></script>
    <script src="vendors/bootstrap-datepicker.js"></script>

    <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
    <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

    <script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="assets/form-validation.js"></script>

    <script src="assets/scripts.js"></script>
    <script>
    $(document).ready(function ()
    {
        $("#form_sample_1").validate({
            rules:
                    {
                        "user_oldpass":
                                {
                                    minlength: 3,
                                    maxlength: 10
                                },
                        "user_newpass":
                                {
                                    minlength: 3,
                                    maxlength: 10
                                },
                        "user_cpass":
                                {
                                    equalTo: "#password"
                                }

                    },
            messages:
                    {
                        "user_cpass":
                                {
                                    equalTo: "Passwords MUST match"
                                }
                    }

        });

    });
</script>
    <script>

        $(document).ready(function () {
            FormValidation.init();
        });
        
</script>

</body>

</html>

