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
	
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("pass");
		
		String ss=request.getRequestURI();
		/*
		 *   <context-param>
  	 			<param-name>abc</param-name>
   				<param-value>Revature</param-value>
   			</context-param>
   			
   			//ServletContext sc=getServletContext();
			/sc.setAttribute("abc","Revature");
		 */
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
				//httpsession will create session and by default will store session id inside client machine cookies.
				//cookies are the small program used to store information on client machine and every cookie can store upto 4 mb data.
				//if cookies are disable on client machine then how server will maintain session?
				//via url rewriting concept.
				//how?
				//response.encodeUrl(ss+"?JSESSIONID="+sc.getId());
				
			
				HttpSession sc=request.getSession(true);
				sc.setAttribute("em", email);
				sc.setAttribute("pw", password);
				
				sc.setMaxInactiveInterval(2);
				//response.encodeUrl(ss+"?JSESSIONID="+sc.getId());
				
				RequestDispatcher rd1=getServletContext().getRequestDispatcher("/LoginSuccessServlet");
				rd1.forward(request, response);
				
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



















