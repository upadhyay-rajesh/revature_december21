<%@page import="java.util.TreeSet"%>
<%@include file="homepage_sidebar.jsp"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
 
<div id="heading">
    <%@include file="homepage_header.jsp"%>
    <%@include file="homepage_center.jsp"%>

    <div class="row" id="footer">
        <div class="col-md-12 text-center">
            <div>&nbsp;</div>
             <div>&nbsp;</div>
        </div>
    </div>

</div>

<script>


    function abc(x)
    {
        $("#" + x).click(function ()
        {
            $("#" + x + "r").toggle(5);
            return false;
        });

    }
</script>
<script>
    $(document).ready(function ()
    {
        $("#i1").on("click", function ()
        {
            $("#i2").trigger("click");
        });

        $("#i3").on("click", function ()
        {
            $("#i2").trigger("click");
        });



    });
</script>

<script src="js/vendor/jquery-1.10.2.min.js"></script>
<script src="js/min/plugins.min.js"></script>
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>