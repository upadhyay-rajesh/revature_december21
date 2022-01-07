
<%@include file="homepage_sidebar.jsp"%>

<div id="heading">
    <%@include file="homepage_header.jsp"%>
    
    <%@include file="change_password_cntr.jsp"%>
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
    $(document).ready(function ()
    {
        $("#profile_form").validate({
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
</body>
</html>
