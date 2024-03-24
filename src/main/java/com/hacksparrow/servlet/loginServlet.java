package com.hacksparrow.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hacksparrow.services.UserServices;


@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Uname = request.getParameter("uemail");
		String Upass = request.getParameter("upwd");
		UserServices userService = new UserServices();
		if(userService.isUser(Uname,Upass)) {
			response.sendRedirect("mainpage.jsp");
		}else {
			response.sendRedirect("login.jsp?error=true");
		}

	}

}
