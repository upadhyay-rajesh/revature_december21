package com.facebookweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.facebookweb.entity.FacebookUser;
import com.facebookweb.service.FacebookServiceInterface;
import com.facebookweb.utility.ServiceFactory;


public class LoginProfileServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("pass");
		
		FacebookUser fb=new FacebookUser();
		fb.setEmail(email);
		fb.setPassword(password);
		
		FacebookServiceInterface fs=ServiceFactory.createobject();
		boolean b=fs.loginprofileService(fb);
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.println("<html><body>");
			if(b) {
				out.println("Welcome "+email);
				out.println("<br><a href=TimeLineServlet>TimeLine</a>");
				out.println("<br><a href=ViewProfileServlet>View Profile</a>");
				out.println("<br><a href=DeleteProfileServlet>delete profile</a>");
				out.println("<br><a href=EditProfileServlet>edit profile</a>");
				out.println("<br><a href=SearchProfileServlet>search profile</a>");
				
			}
			else {
				out.println("Invalid id and password <a href=Signin.html>Try Again</a>");
			}
	}

}



















