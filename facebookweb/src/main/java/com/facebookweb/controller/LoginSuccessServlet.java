package com.facebookweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginSuccessServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		//ServletContext sc=getServletContext();
		HttpSession sc=request.getSession(true);
		Object oo=sc.getAttribute("em");
		String email=oo.toString();
		
		out.println("<html><body>");
				out.println("Welcome "+email);
				out.println("<br><a href=TimeLineServlet>TimeLine</a>");
				out.println("<br><a href=ViewProfileServlet>View Profile</a>");
				out.println("<br><a href=DeleteProfileServlet>delete profile</a>");
				out.println("<br><a href=EditProfileServlet>edit profile</a>");
				out.println("<br><a href=SearchProfileServlet>search profile</a>");
				
				Cookie cc=new Cookie("bharat", "Azmer");
				response.addCookie(cc);
				
		out.println("</body></html>");
	}

}
