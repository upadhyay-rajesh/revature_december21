package com.facebookweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.facebookweb.entity.FacebookUser;
import com.facebookweb.service.FacebookServiceInterface;
import com.facebookweb.utility.ServiceFactory;


public class CreateProfileServlet extends HttpServlet {
	//main task of servlet is to take request via request object of HttpServletRequest and to return response via object of HttpServletResponse
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String password=request.getParameter("pass");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		
		FacebookUser fb=new FacebookUser();
		fb.setName(name);
		fb.setEmail(email);
		fb.setAddress(address);
		fb.setPassword(password);
		
		FacebookServiceInterface fs=ServiceFactory.createobject();
		
		int i=fs.createProfileService(fb);
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.println("<html><body>");
		if(i>0) {
			//how to share attribute on container
			ServletContext sc=getServletContext();
			sc.setAttribute("mm", address);
			
			out.println(name+" your profile created successfully ");
			out.println("<br>your password is "+password);
			out.println("<br>User Name  is "+email);
			out.println("<br><a href=Signin.html>click here to continue...</a>");
			
		}
		else {
			out.println("could not create profile");
		}
		out.println("</body></html>");
	}

}
