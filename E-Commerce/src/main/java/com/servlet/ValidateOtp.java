package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ValidateOtp() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		int value=Integer.parseInt(request.getParameter("otp"));
		int otp=(int)session.getAttribute("otp");
		String email=(String)session.getAttribute("email");
		RequestDispatcher dispatcher=null;
		if(value==otp) {
			request.setAttribute("email",email);
			dispatcher=request.getRequestDispatcher("newPassword.jsp");
			dispatcher.forward(request, response);
		}
		else {
			session.setAttribute("message", "Wrong Otp");
			dispatcher=request.getRequestDispatcher("Otp.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
