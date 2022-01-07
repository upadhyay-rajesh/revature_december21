 <html class="no-js">

    <head>
        <meta charset="utf-8">
        <title>Quemates</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <script src="js/jquery-1.9.1.js"></script>
        <link rel="stylesheet" href="css/bootstrapindex.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/font-awesomelogin.css">
        <link rel="stylesheet" href="css/templatemo_style.css">
        <link rel="stylesheet" href="css/templatemo_misc.css">
        <link rel="stylesheet" href="css/flexslider.css">
        <link rel="stylesheet" href="css/testimonails-slider.css">
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/style.css" />
      
        <script src="js/modernizr.custom.63321.js"></script>
       
        <script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>

        <script src="fancybox/jquery-migrate-1.2.1.js"></script>
        <script type="text/javascript" src="fancybox/jquery.fancybox-1.3.4.pack.js"></script>
        <link rel="stylesheet" href="fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
       <script>
            $(document).ready(function ($) {

                $('.mypop').fancybox({type: 'iframe', width: 1000, height: 950, scrolling: 'no'});
                window.addEventListener("message", function (event) {
                    //$(".sx").html(event.data);		
                    if (event.origin === 'user_type.jsp')
                    {

                        if (event.data === 'closeframe')
                            $.fancybox.close();
                    }
                }, false);
                
                $('.forgot').fancybox({type: 'iframe', width: 1000, height: 950, scrolling: 'no'});
                window.addEventListener("message", function (event) {
                    //$(".sx").html(event.data);		
                    if (event.origin === 'forgot_password.jsp')
                    {

                        if (event.data === 'closeframe')
                            $.fancybox.close();
                    }
                }, false);
                
                
            });
        </script>


    </head>
    <body>
        
        <header>

            <div id="main-header">
                <div class="container" style="margin-top: -20px;position: static">
                    <div class="row">
                        <div class="col-md-3" style="margin-top: 10px">
                            <div class="logo">
                                <a href="index.jsp"><img src="images/logo.png" width="220px" height="80px" style="margin-left: 50px;margin-top: 20px" title="SNS" alt="SNS" ></a>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="main-menu"></div>
                        </div>
                        <div class="col-md-3">
                            <div class="search-box" style="margin-left:-100px;margin-top: -10px">  
                                <section class="main">
                                    <form class="form-5 clearfix" action="SnsUserController?method=check_user" method="post">
                                        <p>
                                            <input style="margin-top:-0.5px" type="text" id="login" name="user_name" placeholder="Username">
                                            <input style="margin-top:-0.5px" type="password" name="user_pass" id="password" placeholder="Password"> 
                                        </p>
                                        <button type="submit" name="submit">
                                            <i class="icon-arrow-right"></i>
                                            <span>Sign in</span></button>
                                        <strong><a href="basic_registration_form.jsp" class="mypop" >REGISTER </a><a href="forgot_password.jsp" class="forgot">FORGOT PASSWORD </a></strong>
                                    </form>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>