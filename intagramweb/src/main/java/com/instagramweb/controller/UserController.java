package com.instagramweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ch = request.getParameter("choice");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//InstagramServiceInterface instaservice=ServiceFactory.createObject();
		
		out.println("<html><body>");
		
		if(ch.equals("countryList")) {
			out.println("<select id=c1 name=cou  onchange=loadState()>");
				out.println("<option value=india>India</option><option value=us>US</option><option value=uk>UK</option>");
			out.println("</select>");
		}
		
		if(ch.equals("sateCheck")) {
			String p=request.getParameter("cc");
			if(p.equals("india")) {
			out.println("<select id=s1 name=st  onchange=loadCity()>");
				out.println("<option value=karnataka>Karnataka</option><option value=delhi>Delhi</option><option value=andhra>Andhra Pradesh</option>");
			out.println("</select>");
			}
			if(p.equals("us")) {
				out.println("<select id=s1 name=st  onchange=loadCity()>");
					out.println("<option value=alaska>Alaska</option><option value=newyork>NewYork</option>");
				out.println("</select>");
				}
			if(p.equals("uk")) {
				out.println("<select id=s1 name=st  onchange=loadCity()>");
					out.println("<option value=germeny>Germeny</option>");
				out.println("</select>");
				}
		}
		
		
		if (ch.equals("passwordCheck")) {
			
			String p=request.getParameter("pass");
			if(p.length()<4) {
				out.println("<font color=red>minimum length should be 4</font>");
			}
			else {
				if(p.length()>=4 && p.length()<=6) {
					out.println("<font color=blue>week password</font>");
				}
				if(p.length()>=7 && p.length()<=10) {
					out.println("<font color=pink>medium password</font>");
				}
				if(p.length()>=11) {
					out.println("<font color=green>strong password</font>");
				}
			}
		}
		
		if (ch.equals("emailCheck")) {
			
			String p=request.getParameter("email");
			if(p.equals("abc@yahoo.com")) {
				out.println("<font color=red>email already registered</font>");
			}
			else {
				out.println("<font color=green>valid mail</font>");
			}
		}

		if (ch.equals("createProfile")) {
			
			//InstagramUser iu=new InstagramUser();
			//int i=instaservice.createProfile(iu);
		}
		if (ch.equals("loginProfile")) {
		//	InstagramUser iu1=new InstagramUser();
		//	boolean i=instaservice.loginProfile(iu);
		}
		if (ch.equals("viewProfile")) {

		}
		if (ch.equals("editProfile")) {

		}
		if (ch.equals("searchProfile")) {

		}
		if (ch.equals("viewAllProfile")) {

		}
		if (ch.equals("deleteProfile")) {

		}
		if (ch.equals("uploadPhoto")) {

		}
		if (ch.equals("likedislikeComment")) {

		}
		if (ch.equals("sendmail")) {

		}
		if (ch.equals("friendRequest")) {

		}
		if (ch.equals("timeLine")) {

		}

		out.println("</body></html>");
	}

}
