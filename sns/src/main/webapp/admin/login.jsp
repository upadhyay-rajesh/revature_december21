<!DOCTYPE html>
<html>
  <head>
    <title>Admin Login</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
    
    <script src="js/vendors/modernizr-2.6.1-respond-1.1.0.min.js"></script>
  </head>
  <body id="login">
    <div class="container">

      <form class="form-signin" method="post" action="../SnsAdminController?method=verifyAdmin">
        <h2 class="form-signin-heading">Admin</h2>
        <input type="text" name="admin_name" class="input-block-level" placeholder="User Name">
        <input type="password" name="admin_pass" class="input-block-level" placeholder="Password">
      
          <input type="checkbox" value="remember-me"> Remember me</br></br>
      
        <button class="btn btn-large btn-primary" type="submit" >Sign in</button>
      </form>

    </div> <!-- /container -->
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>