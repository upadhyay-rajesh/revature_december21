package com.FacebookWeb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.FacebookWeb.entity.FacebookLogin;
import com.FacebookWeb.entity.FacebookPostdata;
import com.FacebookWeb.entity.FacebookUser;
import com.FacebookWeb.service.FacebookServiceInterface;
import com.FacebookWeb.utility.ServiceFactory;

/**
 * Servlet implementation class Signup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		FacebookServiceInterface fs=ServiceFactory.createObject();
		
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
				String city=request.getParameter("city");
						String age=request.getParameter("age");
						System.out.println(email+name+gender+city+age);
		
		System.out.println("signup");
		FacebookUser fb=new FacebookUser();
		fb.setEmail(email);
		fb.setName(name);
		fb.setGender(gender);
		fb.setCity(city);
		fb.setAge(age);
		fb.setPhoto("false");
		

//		List<FacebookPostdata>fbpl=new ArrayList<FacebookPostdata>();
//		fb.setFbpost(fbpl);
		
		
		FacebookLogin fbl=new FacebookLogin();
		fbl.setEmail(email);
		fbl.setPassword(request.getParameter("password"));

		int i=fs.createProfileService(fb,fbl);
		if(i==1) {
			out.println("created profile");
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/signin.html");
			rd.include(request, response);
		}else {
			out.println("Email Already Registered");
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/signin.html");
			rd.include(request, response);
		}
	}

}
