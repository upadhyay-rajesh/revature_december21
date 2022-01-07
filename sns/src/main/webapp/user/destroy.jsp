<%
    HttpSession x=request.getSession(true);
        x.invalidate();
       response.sendRedirect("index.jsp");
    %>
