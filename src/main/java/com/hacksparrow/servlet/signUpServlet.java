package com.hacksparrow.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hacksparrow.services.signupService;


@WebServlet("/signUp")
public class signUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String uemail = request.getParameter("uemail");
		String ugender = request.getParameter("ugender");
		signupService sinServ = new signupService();
		if(sinServ.enterUSer(uname,upwd,uemail,ugender)) {
			response.sendRedirect("login.jsp");
		}else {
			response.sendRedirect("Sinup.jsp");
		}
	}

}
