<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>HOME</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="js/jquery-1.9.1.js"></script>
        <script src="fancybox/jquery-migrate-1.2.1.js"></script>
        <script type="text/javascript" src="fancybox/jquery.fancybox-1.3.4.pack.js"></script>
        <link rel="stylesheet" href="fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/bootstrap.css">  
        <link rel="stylesheet" href="css/templatemo_style.css">
        <script>
            function abc()
            {
                parent.$.fancybox.close();
            }
        </script>
    </head>
    <body>

        <div id="heading">
            <div id="product-post">
                <div class="container">               
                    <div class="row">
                        <div class="col-md-8"> 
                            <div>&nbsp;</div>
                            <div>&nbsp;</div>
                            <div>&nbsp;</div>
                            <div>&nbsp;</div>
                            <div class="heading-section2">
                                <div>&nbsp;</div>
                                <div>&nbsp;</div>
                                <h2 style="color:#f78e21;margin-left:-15px">Password Recovery</h2>
                            </div>
                            <div class="heading-section1" style="color:#f78e21;margin-left:-15px" >
                                <img src="images/under-heading.png" alt="" >
                            </div>
                            <div>&nbsp;</div>  
                            <div class="heading-section3">
                                <%
                                    String user_pass = (String) session.getAttribute("user_pass");
                                %>
                                <div>
                                    <label style="margin-left: 190px;font-size: 18px"><b>Your Password is : <%=user_pass%><b></label>
                                    
                                </div>
                            </div>
                        </div>
                    </div>                          
                </div>
            </div>
        </div>
    </body>
</html>
