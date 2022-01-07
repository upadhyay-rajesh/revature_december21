

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Photo</title>
    </head>
    <body>
        <form action="../SnsUserController?method=change_profilephoto" method="post" enctype="multipart/form-data" name="form1">
            <input type="file" name="image" id="image">
            <input type="submit" name="button" value="Submit">
        </form>
    </body>
</html>
