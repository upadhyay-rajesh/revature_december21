<%@include file="homepage_sidebar.jsp"%>

<div id="heading">
    <%@include file="homepage_header.jsp"%>
    
    <%@include file="send_message_center.jsp"%>


    <div class="row" id="footer">
        <div class="col-md-12 text-center">
            <div>&nbsp;</div>
             <div>&nbsp;</div>
        </div>
    </div>

</div>
<script src="js/jquery-1.9.1.js"></script>
<script>


    function abc(x)
    {
        $("#"+x).click(function ()
        {
            $("#"+x+"r").toggle(5);
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


</body>
</html>