<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html class="no-js">

    <head>
        <title>Profile Details</title>
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

    <body>  


        <div class="row-fluid">


            <!--/span-->
            <div class="span9" id="content">

                <div class="row-fluid">
                    <!-- block -->
                    <div class="block1" style="margin-left: 150px;margin-right: -90px;margin-top: -30px">
                        <div class="navbar navbar-inner block-header">
                            <div class="muted pull-left">Save Your Profile </div>
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <!-- BEGIN FORM-->
                                
                                <form action="../SnsUserController?method=profile_details" method="post" id="form_sample_1" class="form-horizontal">
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
                                            <label class="control-label"> First Name<span >*</span></label>
                                            <div class="controls">
                                                <input type="text" name="user_firstname" class="required span6 m-wrap" data-required="1" />
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label"> Last Name<span >*</span></label>
                                            <div class="controls">
                                                <input type="text" name="user_lastname" class="required span6 m-wrap" data-required="1" />
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label"> Gender</label>
                                            <div class="controls">
                                             Male<input type="radio" name="user_gender" value="male" style="width:auto;margin-left:10px" checked>&nbsp; Female<input type="radio" name="user_gender" value="female" style="width:auto;margin-left:10px">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label"> Date of Birth<span >*</span></label>
                                            <div class="controls">
                                                <input type="date" name="user_birthdate" class="required span6 m-wrap" data-required="1" />
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label"> Current City<span >*</span></label>
                                            <div class="controls">
                                                <input type="text" name="user_currentcity" class="required span6 m-wrap" data-required="1" />
                                            </div>
                                        </div>
                                       
                                        <div class="control-group">
                                            <label class="control-label"> Email<span >*</span></label>
                                            <div class="controls">
                                                <input type="text" name="user_email" class="required email span6 m-wrap" data-required="1" />
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-primary" style="margin-left: 80px">Save</button>
                                            <button type="reset" class="btn">Reset</button>
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

            jQuery(document).ready(function () {
                FormValidation.init();
            });

        </script>
    </body>

</html>