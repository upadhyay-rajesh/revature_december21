package com.facebooklive.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.facebooklive.entity.FacebookUser;
import com.facebooklive.entity.TimeLine;
import com.facebooklive.service.FacebookServiceInterface;
import com.facebooklive.utility.ServiceFactory;

public class UserServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m=request.getParameter("method");
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<html><body><center>");
		
		FacebookServiceInterface fs=ServiceFactory.createObject();
		
		if(m.equals("register")) {
			
			String name=request.getParameter("nm");
			String password=request.getParameter("pass");
			String email=request.getParameter("em");
			String gender=request.getParameter("g");
			String age=request.getParameter("age");
			
			FacebookUser fb=new FacebookUser();
			fb.setName(name);
			fb.setAge(age);
			fb.setEmail(email);
			fb.setGender(gender);
			fb.setPassword(password);
			
			int i=fs.createProfileService(fb);
			
			if(i>0) {
				out.println("<br><br><br><br><font size=5 color=blue><b>Profile created successfully</b></font>");
				out.println("<br>Your Username is "+email+"  and password is "+password);
				out.println("<br><a href=login.html>Continue...</a>");
			}
			else {
				out.println("could not create profile");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/register.html");
				rd.include(request, response);
			}
			
		}
		if(m.equals("login")) {
			
			String password=request.getParameter("pass");
			String email=request.getParameter("em");
			
			
			FacebookUser fb=new FacebookUser();
			fb.setPassword(password);
			fb.setEmail(email);
			
			
			int i=fs.loginProfileService(fb);
			
			if(i>0) {
				
				HttpSession hs=request.getSession(true);
				hs.setAttribute("userid", email);
				
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/UserServlet?method=UserHomePage");
				rd.forward(request, response);
			}
			else {
				out.println("Invalid id and password");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/login.html");
				rd.include(request, response);
			}
		}
		
		
		if(m.equals("UserHomePage")) {
			HttpSession hs=request.getSession(true);
			String email=hs.getAttribute("userid").toString();
			out.println("<table border=0>");
			out.println("<tr><td>Welcome "+email+" </td><td></td><td></td><td></td><td></td><td><a href=UserServlet?method=viewProfile><button>View Profile</button></a></td><td><a href=UserServlet?method=editProfile><button>Edit Profile</button></a></td><td><a href=UserServlet?method=searchProfile><button>Search Profile</button></a></td><td><a href=UserServlet?method=uploadphoto><button>upload photo</button></a></td><td><a href=UserServlet?method=deleteprofile><button>Delete Profile</button></a></td><td><a href=UserServlet?method=friendrequest><button>Friend Request</button></a></td></tr>");
			out.println("</table>");
			FacebookUser fb=new FacebookUser();
			
			fb.setEmail(email);
			List<TimeLine> tline=fs.timeLineService(fb);
			if(tline.size()>0) {
				out.println("<table border=0></table>");
				out.println("<table border=0>");
				for(TimeLine tt:tline) {
					if(tt.getReceiver_Id().equals(email)) {
					out.println("<tr><td>"+tt.getSender_id()+"</td><td><textarea cols=100 rows=5>"+tt.getMessage()+"</textarea></td></tr>");
					out.println("<tr><td></td><td><a href=UserServlet?method=like>Like ("+tt.getMessagelike()+")</a><a href=UserServlet?method=dislike>Dislike("+tt.getDislike()+")</a></td><td><a href=UserServlet?method=reply>reply</td></tr>");
				}
				}
			}
			else {
			
				out.println("<tr><td></td><td> no timeline message</td></tr>");
			}
			out.println("</table>");
		}
		
		if(m.equals("reply")) {
			
		}
		
		
		
		out.println("</center></body></html>");
	}

}
