package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helper.FactoryProvider; 
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		
		PrintWriter out=response.getWriter();
		Session sess=FactoryProvider.getFactory().openSession();
		Transaction tx=sess.beginTransaction();
		String password=request.getParameter("password");
		String c_password=request.getParameter("confirmPassword");
		try {
		if(password.equals(c_password)) {
			
			Query q=sess.createQuery("update User set userPassword =:x where userEmail =:y");
			response.setContentType("text/html");
			q.setParameter("x", password);
			q.setParameter("y", email);
			int result=q.executeUpdate();
			tx.commit();
			if(result>0) {
				session.setAttribute("message","Password Updated !");
				response.sendRedirect("login.jsp");
			}
		}
		else {
			session.setAttribute("message","Password & Confirm Password Didn't Matched !");
			response.sendRedirect("newPassword.jsp");
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
