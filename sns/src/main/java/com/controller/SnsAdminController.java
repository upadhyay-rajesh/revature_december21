package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.SnsAdmin;
import com.entity.SnsAdvertisements;
import com.entity.SnsExams;
import com.service.SnsServiceAdminImpl;
import com.service.SnsServiceAdminInterface;
import com.service.SnsServiceUserImpl;
import com.service.SnsServiceUserInterface;

//@WebServlet(urlPatterns = "/SnsAdminController")
public class SnsAdminController extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ss = request.getParameter("method");
		SnsServiceAdminInterface serviceAdmin = new SnsServiceAdminImpl();
		SnsServiceUserInterface serviceUser = new SnsServiceUserImpl();

		if (ss.equals("verifyAdmin")) {

			String admin_name = request.getParameter("admin_name");
			String admin_pass = request.getParameter("admin_pass");

			SnsAdmin x = new SnsAdmin();
			x.setAdmin_name(admin_name);
			x.setAdmin_pass(admin_pass);
			ArrayList<SnsAdmin> p = serviceAdmin.login(x);
			if (p.size() > 0) {
				HttpSession session = request.getSession(true);
				session.setAttribute("admin_name", admin_name);
				session.setAttribute("admin_pass", admin_pass);
				response.sendRedirect("admin/index.jsp");
			} else {
				response.sendRedirect("admin/login.jsp");
			}

		}

		if (ss.equals("pass_modification")) {

			String user_oldpass = request.getParameter("user_oldpass");
			String user_newpass = request.getParameter("user_newpass");
			HttpSession session = request.getSession(true);
			String admin_pass = (String) session.getAttribute("admin_pass");
			String admin_name = (String) session.getAttribute("admin_name");

			if (user_oldpass.equals(admin_pass)) {
				SnsAdmin lb = new SnsAdmin();
				lb.setAdmin_name(admin_name);
				lb.setAdmin_pass(user_newpass);
				serviceAdmin.change_password(lb);
				response.sendRedirect("admin/adminLogout.jsp");
			} else {
				response.sendRedirect("admin/change_password.jsp");
			}

		}

		if (ss.equals("save_advertisement")) {

			String add_title = request.getParameter("add_title");
			String add_date = request.getParameter("add_date");

			String add_description = request.getParameter("add_description");

			SnsAdvertisements lb = new SnsAdvertisements();
			lb.setAdd_title(add_title);
			lb.setAdd_date(add_date);
			lb.setAdd_description(add_description);

			int c = serviceUser.addSave(lb);

			if (c > 0) {
				response.sendRedirect("admin/advertisement.jsp");
			} else {
				response.sendRedirect("admin/add_advertisement.jsp");
			}

		}

		if (ss.equals("advertisement_delete")) {

			String add_title = request.getParameter("add_title");
			SnsAdvertisements x = new SnsAdvertisements();
			x.setAdd_title(add_title);
			int c = serviceUser.addDelete(x);
			if (c > 0) {
				response.sendRedirect("admin/advertisement.jsp");
			} else {
				response.sendRedirect("admin/advertisement.jsp");
			}

		}

		if (ss.equals("exam_delete")) {

			String exam_name = request.getParameter("exam_name");
			SnsExams x = new SnsExams();
			x.setExam_name(exam_name);
			int c = serviceUser.examDelete(x);
			if (c > 0) {
				response.sendRedirect("admin/exams.jsp");
			} else {
				response.sendRedirect("admin/exams.jsp");
			}

		}

		if (ss.equals("save_exam")) {

			String exam_name = request.getParameter("exam_name");
			String exam_date = request.getParameter("exam_date");

			String exam_description = request.getParameter("exam_description");

			SnsExams lb = new SnsExams();
			lb.setExam_name(exam_name);
			lb.setExam_date(exam_date);
			lb.setExam_description(exam_description);

			int c = serviceUser.examSave(lb);

			if (c > 0) {
				response.sendRedirect("admin/exams.jsp");
			} else {
				response.sendRedirect("admin/add_exam.jsp");
			}

		}

		if (ss.equals("")) {

		}
		
		if (ss.equals("")) {

		}
		
		if (ss.equals("")) {

		}
	}

}
