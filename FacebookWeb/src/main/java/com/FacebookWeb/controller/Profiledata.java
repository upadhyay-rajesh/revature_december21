package com.FacebookWeb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FacebookWeb.entity.FacebookUser;
import com.FacebookWeb.service.FacebookServiceInterface;
import com.FacebookWeb.utility.ServiceFactory;
import com.google.gson.Gson;

/**
 * Servlet implementation class Profiledata
 */
public class Profiledata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		HttpSession s=request.getSession(true);
		
		String email=s.getAttribute("userid").toString();
		
		System.out.println(email+"fsf");
		
		FacebookUser fbu=new FacebookUser();
		fbu.setEmail(email);
		FacebookServiceInterface facebookservice=ServiceFactory.createObject();
		FacebookUser fbuData=facebookservice.loadProfile(fbu);
		
		System.out.println();
		
		request.setAttribute("fbuser", fbuData);
		RequestDispatcher rd=getServletContext().getRequestDispatcher("/profile.jsp");
		rd.forward(request, response);
	
		
	}

}
