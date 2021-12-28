package com.facebookweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.facebookweb.entity.FacebookUser;
import com.facebookweb.service.FacebookServiceInterface;
import com.facebookweb.utility.ServiceFactory;


public class LoginProfileServlet extends HttpServlet {
	
	
	public void init(ServletConfig sf) {
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("pass");
		
		//ServletContext sc=getServletContext();
		//Object oo=sc.getAttribute("mm");
		//String a=oo.toString();
		
		FacebookUser fb=new FacebookUser();
		fb.setEmail(email);
		fb.setPassword(password);
		
		FacebookServiceInterface fs=ServiceFactory.createobject();
		boolean b=fs.loginprofileService(fb);
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.println("<html><body>");
			if(b) {
				
				//ServletContext sc=getServletContext();
				HttpSession sc=request.getSession(true);
				sc.setAttribute("em", email);
				sc.setAttribute("pw", password);
				
				sc.setMaxInactiveInterval(2);
				
				RequestDispatcher rd=getServletContext().getRequestDispatcher("LoginSuccessServlet");
				rd.forward(request, response);
				
				//response.sendRedirect("Signin.html");
				
			}
			else {
				out.println("<font color=red size=5>Invalid id and password</font>");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/Signin.html");
				rd.include(request, response);
			}
			out.println("</body></html>");
	}

}



















