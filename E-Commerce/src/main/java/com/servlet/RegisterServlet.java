package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.entity.User;
import com.helper.FactoryProvider;
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		try {
			String name=request.getParameter("txt_name");
			String email=request.getParameter("txt_email");
			String password=request.getParameter("txt_password");
			String phone=request.getParameter("txt_phone");
			String address=request.getParameter("txt_address");
			User user=new User(name,email,password,phone,"users.jpeg",address,"User");
			Session session=FactoryProvider.getFactory().openSession();
			Transaction t=session.beginTransaction();
			int userId=(int)session.save(user);
			t.commit();
			session.close();
			HttpSession sess=request.getSession();
			sess.setAttribute("message","Registration Successfull");
			response.sendRedirect("login.jsp");
			return; 
		}catch(Exception E){}
	}

}
