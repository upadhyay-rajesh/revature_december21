
<body>

    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="brand" href="index.jsp">Admin Home</a>
                <div class="nav-collapse collapse">
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <%
                                String admin_name = (String) session.getAttribute("admin_name");
                                if (admin_name == null) {
                                    response.sendRedirect("login.jsp");
                                }

                            %>
                            <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> <%=admin_name%> <i class="caret"></i></a>


                            <ul class="dropdown-menu">
                                <li>
                                    <a tabindex="-1" href="change_password.jsp">Change Password</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a tabindex="-1" href="adminLogout.jsp">Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav">
                       
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>