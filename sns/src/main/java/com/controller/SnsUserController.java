package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

import com.entity.SnsUserDetail;
import com.entity.SnsUserFriends;
import com.entity.SnsUserMessages;
import com.entity.SnsUserProfileDetail;
import com.service.SnsServiceUserImpl;
import com.service.SnsServiceUserInterface;

//@WebServlet(urlPatterns = "/SnsUserController")
public class SnsUserController extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ss = request.getParameter("method");
		SnsServiceUserInterface service = new SnsServiceUserImpl();
		// System.out.println(ss);
		if (ss.equals("user_registration")) {

			String user_name = request.getParameter("user_name");
			String user_pass = request.getParameter("user_pass");
			String user_squestion = request.getParameter("user_squestion");
			String user_sanswer = request.getParameter("user_sanswer");

			SnsUserDetail lb = new SnsUserDetail();
			lb.setUser_name(user_name);
			lb.setUser_pass(user_pass);
			lb.setUser_profile("no");
			lb.setUstatus("active");
			lb.setUser_squestion(user_squestion);
			lb.setUser_sanswer(user_sanswer);

			int c = service.save(lb);
			if (c > 0) {
				HttpSession session = request.getSession(true);
				session.setAttribute("user_name", user_name);
				response.sendRedirect("user/save_profile_form.jsp");
			}

		}

		if (ss.equals("profile_details")) {

			HttpSession session = request.getSession(true);
			String user_name = (String) session.getAttribute("user_name");
			String user_firstname = request.getParameter("user_firstname");
			String user_lastname = request.getParameter("user_lastname");
			String user_gender = request.getParameter("user_gender");
			String user_birthdate = request.getParameter("user_birthdate");
			String user_currentcity = request.getParameter("user_currentcity");
			String user_email = request.getParameter("user_email");
			String user_profileimage = "blank.jpg";

			SnsUserProfileDetail lb = new SnsUserProfileDetail();
			lb.setUser_name(user_name);
			lb.setUser_firstname(user_firstname);
			lb.setUser_lastname(user_lastname);
			lb.setUser_gender(user_gender);
			lb.setUser_birthdate(user_birthdate);
			lb.setUser_currentcity(user_currentcity);
			lb.setUser_email(user_email);
			lb.setUser_profileimage(user_profileimage);

			int s = service.userProfileSave(lb);

			if (s > 0) {
				ServletContext c = this.getServletContext();
				String path = c.getRealPath("/");
				File f = new File(path + "/document/" + user_name + "/profilePhoto/");
				f.mkdirs();

				File f1 = new File(path + "/user/images/blank.jpg");
				File f2 = new File(path + "/document/" + user_name + "/profilePhoto/blank.jpg");
				f1.renameTo(f2);
			}

			SnsUserDetail su = new SnsUserDetail();
			su.setUser_name(user_name);
			service.change_profile_status(su);
			session.invalidate();
			response.sendRedirect("user/close_fancy.jsp");

		}

		if (ss.equals("password_recovery")) {

			String user_name = request.getParameter("user_name");
			String user_squestion = request.getParameter("user_squestion");
			String user_sanswer = request.getParameter("user_sanswer");

			SnsUserDetail lb = new SnsUserDetail();
			lb.setUser_name(user_name);
			lb.setUser_squestion(user_squestion);
			lb.setUser_sanswer(user_sanswer);
			String user_pass = service.get_password(lb);
			if (user_pass != null) {
				HttpSession session = request.getSession(true);
				session.setAttribute("user_pass", user_pass);
				response.sendRedirect("user/password_recovered.jsp");
			} else {
				response.sendRedirect("user/forgot_password.jsp");
			}

		}

		if (ss.equals("check_user")) {

			String user_name = request.getParameter("user_name");
			String user_pass = request.getParameter("user_pass");
			String ustatus = "active";

			SnsUserDetail lb = new SnsUserDetail();
			lb.setUser_name(user_name);
			lb.setUser_pass(user_pass);
			lb.setUstatus(ustatus);
			HttpSession session = request.getSession(true);
			session.setAttribute("user_name", user_name);
			session.setAttribute("user_pass", user_pass);
			int a = service.check(lb);

			if (a > 0) {
				SnsUserProfileDetail pd = new SnsUserProfileDetail();
				pd.setUser_name(user_name);
				int b = service.userProfileCheck(pd); // if profile is filled or
														// not

				if (b == 1) {
					response.sendRedirect("user/homepage.jsp");
				} else if (b == 0) {
					response.sendRedirect("user/edit_profile_comp.jsp");
				}
			} else {
				response.sendRedirect("user/destroy.jsp");
			}

		}

		if (ss.equals("required_profile_details")) {

			HttpSession session = request.getSession(true);
			String user_name = (String) session.getAttribute("user_name");
			String user_firstname = request.getParameter("user_firstname");
			String user_lastname = request.getParameter("user_lastname");
			String user_gender = request.getParameter("user_gender");
			String user_birthdate = request.getParameter("user_birthdate");
			String user_currentcity = request.getParameter("user_currentcity");
			String user_email = request.getParameter("user_email");
			String user_profileimage = "blank.jpg";

			SnsUserProfileDetail lb = new SnsUserProfileDetail();
			lb.setUser_name(user_name);
			lb.setUser_firstname(user_firstname);
			lb.setUser_lastname(user_lastname);
			lb.setUser_gender(user_gender);
			lb.setUser_birthdate(user_birthdate);
			lb.setUser_currentcity(user_currentcity);
			lb.setUser_email(user_email);
			lb.setUser_profileimage(user_profileimage);

			int s = service.userProfileSave(lb);

			if (s > 0) {
				ServletContext c = this.getServletContext();
				String path = c.getRealPath("/");
				File f = new File(path + "/document/" + user_name + "/profilePhoto/");
				f.mkdirs();

				File f1 = new File(path + "/user/images/blank.jpg");
				File f2 = new File(path + "/document/" + user_name + "/profilePhoto/blank.jpg");
				f1.renameTo(f2);
			}

			SnsUserDetail su = new SnsUserDetail();
			su.setUser_name(user_name);
			service.change_profile_status(su);
			session.invalidate();
			response.sendRedirect("user/index.jsp");

		}

		if (ss.equals("change_profilephoto")) {

			try {
				HttpSession session = request.getSession(true);
				String user_name = (String) session.getAttribute("user_name");
				ServletContext s = getServletContext();
				String path = s.getRealPath("/document/" + user_name + "/profilePhoto/");

				DiskFileUpload d = new DiskFileUpload();
				List x = d.parseRequest(request);
				FileItem f;

				String image = "";

				Iterator t1 = x.iterator();
				while (t1.hasNext()) {
					f = (FileItem) t1.next();

					String n = f.getName();
					if (n != null && n.length() > 0 && (n.endsWith("jpg") || (n.endsWith("jpeg")))) {
						File f1 = new File(n);
						image = System.currentTimeMillis() + f1.getName();
						File w = new File(path, image);
						f.write(w);

					}
				}

				SnsUserProfileDetail lb = new SnsUserProfileDetail();
				lb.setUser_name(user_name);
				lb.setUser_profileimage(image);
				service.userProfileChangeImage(lb);
				response.sendRedirect("user/homepage.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (ss.equals("accept_request")) {

			int frnd_id = Integer.parseInt(request.getParameter("user"));

			SnsUserFriends fr = new SnsUserFriends();
			fr.setFrnd_id(frnd_id);
			fr.setFrnd_status("quemates");
			int i = service.userFriendModify(fr);
			if (i == 1) {
				PrintWriter out = response.getWriter();
				out.print("quemates");
			}

		}

		if (ss.equals("ignore_request")) {

			String frnd_id = request.getParameter("user");

			SnsUserFriends fr = new SnsUserFriends();
			fr.setFrnd_id(Integer.parseInt(frnd_id));
			fr.setFrnd_status("quemates");
			int i = service.userFriendDelete(fr);
			if (i == 1) {
				PrintWriter out = response.getWriter();
				out.print("Removed");
			}

		}

		if (ss.equals("download_file")) {

			// Get file name and path
			String filename = request.getParameter("fname");
			String pathname = request.getParameter("pathname");
			String filepath = getServletContext().getRealPath("/document/" + pathname);

			try {
				// Set content type and header
				response.setContentType("APPLICATION/OCTET-STREAM");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

				// Create FileInputStream and read byte by byte
				File f = new File(filepath, filename);

				FileInputStream fileInputStream = new FileInputStream(f);

				int i;
				while ((i = fileInputStream.read()) != -1) {
					PrintWriter out = response.getWriter();
					out.write(i);
				}
				fileInputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		if (ss.equals("user_pri_save_reply")) {

			HttpSession session = request.getSession(true);
			String msg_content = request.getParameter("message");
			String msg_sender = (String) session.getAttribute("user_name");
			String msg_id = request.getParameter("msg_id");
			String msg_reciever = request.getParameter("msg_reciever");
			String msg_sndr = request.getParameter("msg_sender");

			String msg_recie = msg_reciever;
			if (msg_sender.equals(msg_reciever)) {
				msg_recie = msg_sndr;
				String msg_type = "2";
				Date date = new Date();
				SimpleDateFormat p = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a E");
				String msg_date = p.format(date);

				SnsUserMessages a = new SnsUserMessages();
				a.setMsg_content(msg_content);
				a.setMsg_receiver(msg_recie);
				a.setMsg_sender(msg_sender);
				a.setMsg_date(msg_date);
				a.setMsg_type(msg_type);
				a.setMsg_reply_code(Integer.parseInt(msg_id));
				int j = service.userMessageSave(a);
				if (j > 0) {
					response.sendRedirect("user/personl_message.jsp");
				}
			} else {
				String msg_type = "2";
				Date date = new Date();
				SimpleDateFormat p = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a E");
				String msg_date = p.format(date);

				SnsUserMessages a = new SnsUserMessages();
				a.setMsg_content(msg_content);
				a.setMsg_receiver(msg_recie);
				a.setMsg_sender(msg_sender);
				a.setMsg_date(msg_date);
				a.setMsg_type(msg_type);
				a.setMsg_reply_code(Integer.parseInt(msg_id));
				int j = service.userMessageSave(a);
				if (j > 0) {
					response.sendRedirect("user/personl_message.jsp");
				}
			}

		}

		if (ss.equals("user_search_result")) {

			String n = request.getParameter("search");
			HttpSession session = request.getSession(true);
			session.setAttribute("search", n);
			response.sendRedirect("user/user_search_result.jsp");

		}

		if (ss.equals("send_request")) {

			String req_to = request.getParameter("user");
			HttpSession session = request.getSession(true);
			String req_from = (String) session.getAttribute("user_name");

			Date date = new Date();
			SimpleDateFormat p = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a E");
			String msg_date = p.format(date);

			SnsUserFriends fr = new SnsUserFriends();
			fr.setFrnd_to(req_to);
			fr.setFrnd_from(req_from);
			fr.setFrnd_date(msg_date);
			fr.setFrnd_status("pending");
			int i = service.userFriendSave(fr);
			if (i == 1) {
				PrintWriter out = response.getWriter();
				out.print("pending");
			}

		}

		if (ss.equals("profile_modify")) {
			HttpSession session = request.getSession(true);
			String user_name = (String) session.getAttribute("user_name");
			String user_firstname = request.getParameter("user_firstname");
			String user_lastname = request.getParameter("user_lastname");
			String user_gender = request.getParameter("user_gender");
			String user_birthdate = request.getParameter("user_birthdate");
			String user_address = request.getParameter("user_address");
			String user_homecity = request.getParameter("user_homecity");
			String user_currentcity = request.getParameter("user_currentcity");
			String user_email = request.getParameter("user_email");
			String user_mob = request.getParameter("user_mob");

			String user_highschool = request.getParameter("user_highschool");
			String user_college = request.getParameter("user_college");
			String user_exp = request.getParameter("user_exp");
			String user_skills = request.getParameter("user_skills");

			SnsUserProfileDetail lb = new SnsUserProfileDetail();
			lb.setUser_name(user_name);
			lb.setUser_firstname(user_firstname);
			lb.setUser_lastname(user_lastname);
			lb.setUser_gender(user_gender);
			lb.setUser_birthdate(user_birthdate);
			lb.setUser_address(user_address);
			lb.setUser_homecity(user_homecity);
			lb.setUser_currentcity(user_currentcity);
			lb.setUser_email(user_email);
			lb.setUser_mob(user_mob);

			lb.setUser_highschool(user_highschool);
			lb.setUser_college(user_college);
			lb.setUser_exp(user_exp);
			lb.setUser_skills(user_skills);

			int i = service.userProfileModify(lb);
			if (i > 0) {
				response.sendRedirect("user/homepage.jsp");
			}

		}

		if (ss.equals("pass_modification")) {

			String user_oldpass = request.getParameter("user_oldpass");
			String user_newpass = request.getParameter("user_newpass");
			HttpSession session = request.getSession(true);
			String user_pass = (String) session.getAttribute("user_pass");
			String user_name = (String) session.getAttribute("user_name");

			if (user_oldpass.equals(user_pass)) {
				SnsUserDetail lb = new SnsUserDetail();
				lb.setUser_name(user_name);
				lb.setUser_pass(user_newpass);
				int i = service.change_password(lb);
				if (i > 0) {
					response.sendRedirect("user/homepage.jsp");
				}
			} else {
				response.sendRedirect("user/change_password.jsp");
			}

		}

		if (ss.equals("user_pub_msg_save")) {

			try {
				HttpSession session = request.getSession(true);
				String msg_sender = (String) session.getAttribute("user_name");

				ServletContext s = getServletContext();
				String path = s.getRealPath("/document/" + msg_sender + "/");

				DiskFileUpload d = new DiskFileUpload();
				List x = d.parseRequest(request);
				System.out.println("upload "+x.size());
				FileItem ft;

				String msg_reciever = msg_sender;

				String upload_image = "", msg_content = "", msg_type = "", upload_file = "";

				Iterator t1 = x.iterator();
				while (t1.hasNext()) {
					ft = (FileItem) t1.next();

					if (ft.isFormField()) {
						String a = ft.getFieldName();
						String b = ft.getString();

						if (a.equalsIgnoreCase("message")) {
							msg_content = b;
						} else if (a.equalsIgnoreCase("privacy")) {
							msg_type = b;
						}

					} else {
						String n = ft.getName();
						if (n != null && n.length() > 0 && (n.endsWith("jpg") || (n.endsWith("jpeg")))) {
							File f1 = new File(n);
							upload_image = System.currentTimeMillis() + "_" + f1.getName();
							File w = new File(path, upload_image);
							ft.write(w);

						} else if (n != null && n.length() > 0
								&& (n.endsWith("pdf") || n.endsWith("docx") || (n.endsWith("txt")))) {
							File f1 = new File(n);
							String filename = f1.getName();
							upload_file = System.currentTimeMillis() + "_" + filename;
							File w = new File(path, upload_file);
							ft.write(w);
						}
					}
				}

				Date date = new Date();
				SimpleDateFormat p = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a E");
				String msg_date = p.format(date);
				SnsUserMessages a = new SnsUserMessages();
				a.setMsg_content(msg_content);
				a.setMsg_receiver(msg_reciever);
				a.setMsg_sender(msg_sender);
				a.setMsg_date(msg_date);
				a.setMsg_type(msg_type);
				a.setMsg_reply_code(0);
				a.setMsg_image(upload_image);
				a.setMsg_file(upload_file);
				int i = service.userMessageSave(a);
				if (i > 0) {
					response.sendRedirect("user/homepage.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (ss.equals("user_save_reply")) {

			String msg_content = request.getParameter("message");
			HttpSession session = request.getSession(true);
			String msg_sender = (String) session.getAttribute("user_name");
			String msg_id = request.getParameter("msg_id");
			String msg_reciever = request.getParameter("msg_reciever");
			String msg_type = "1";
			Date date = new Date();
			SimpleDateFormat p = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a E");
			String msg_date = p.format(date);

			SnsUserMessages a = new SnsUserMessages();
			a.setMsg_content(msg_content);
			a.setMsg_receiver(msg_reciever);
			a.setMsg_sender(msg_sender);
			a.setMsg_date(msg_date);
			a.setMsg_type(msg_type);
			a.setMsg_reply_code(Integer.parseInt(msg_id));
			int j = service.userMessageSave(a);
			if (j > 0) {
				response.sendRedirect("user/homepage.jsp");
			}

		}

		if (ss.equals("delete_file")) {

			// Get file name and path
			String filename = request.getParameter("fname");
			String sender_name = request.getParameter("sender_name");
			String msg_id = request.getParameter("msg_idd");

			SnsUserMessages as = new SnsUserMessages();
			as.setMsg_sender(sender_name);
			as.setMsg_file(filename);
			as.setMsg_id(Integer.parseInt(msg_id));
			as.setMsg_reply_code(Integer.parseInt(msg_id));

			int i = service.userMessageDeleteFile(as);
			if (i > 0) {
				response.sendRedirect("user/my_notes.jsp");
			}

		}

		if (ss.equals("delete_image")) {

			// Get file name and path
			String filename = request.getParameter("fname");
			String sender_name = request.getParameter("sender_name");
			String msg_id = request.getParameter("msg_idd");

			SnsUserMessages as = new SnsUserMessages();
			as.setMsg_sender(sender_name);
			as.setMsg_file(filename);
			as.setMsg_id(Integer.parseInt(msg_id));
			as.setMsg_reply_code(Integer.parseInt(msg_id));

			int i = service.userMessageDeleteFile(as);
			if (i > 0) {
				response.sendRedirect("user/my_photos.jsp");
			}

		}

		if (ss.equals("user_pri_msg_save")) {

			try {
				HttpSession session = request.getSession(true);
				String msg_sender = (String) session.getAttribute("user_name");

				ServletContext s = getServletContext();
				String path = s.getRealPath("/document/" + msg_sender + "/");

				DiskFileUpload d = new DiskFileUpload();
				List x = d.parseRequest(request);
				FileItem ft;

				String upload_image = "", msg_content = "", msg_type = "", upload_file = "", msg_reciever = "";

				Iterator t1 = x.iterator();
				while (t1.hasNext()) {
					ft = (FileItem) t1.next();

					if (ft.isFormField()) {
						String a = ft.getFieldName();
						String b = ft.getString();

						if (a.equalsIgnoreCase("message")) {
							msg_content = b;
						} else if (a.equalsIgnoreCase("privacy")) {
							msg_type = b;
						} else if (a.equalsIgnoreCase("rname")) {
							msg_reciever = b;
						}

					} else {
						String n = ft.getName();
						if (n != null && n.length() > 0 && (n.endsWith("jpg") || (n.endsWith("jpeg")))) {
							File f1 = new File(n);
							upload_image = System.currentTimeMillis() + "_" + f1.getName();
							File w = new File(path, upload_image);
							ft.write(w);

						} else if (n != null && n.length() > 0
								&& (n.endsWith("pdf") || n.endsWith("docx") || (n.endsWith("txt")))) {
							File f1 = new File(n);
							String filename = f1.getName();
							upload_file = System.currentTimeMillis() + "_" + filename;
							File w = new File(path, upload_file);
							ft.write(w);
						}
					}
				}

				Date date = new Date();
				SimpleDateFormat p = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a E");
				String msg_date = p.format(date);
				SnsUserMessages a = new SnsUserMessages();
				a.setMsg_content(msg_content);
				a.setMsg_receiver(msg_reciever);
				a.setMsg_sender(msg_sender);
				a.setMsg_date(msg_date);
				a.setMsg_type(msg_type);
				a.setMsg_reply_code(0);
				a.setMsg_image(upload_image);
				a.setMsg_file(upload_file);
				int i = service.userMessageSave(a);
				if (i > 0) {
					response.sendRedirect("user/personl_message.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
}
