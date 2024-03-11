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

import com.entity.User;
import com.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
			String email = request.getParameter("txt_email");
			String password = request.getParameter("txt_password");
			Session session = FactoryProvider.getFactory().openSession();
			Transaction t = session.beginTransaction();
			Query q = session.createQuery("from User where userEmail=:e and userPassword=:p");
			q.setParameter("e", email);
			q.setParameter("p", password);
			User u = (User) q.uniqueResult();
			HttpSession sess = request.getSession();
			t.commit();
			session.close();
			if(u == null){
				sess.setAttribute("message", "Wrong Email or Password");
				response.sendRedirect("login.jsp");
				return;
			}
			else {
				sess.setAttribute("current-user", u);
				if(u.getUserType().equals("User")) {
					response.sendRedirect("index.jsp");
				}
				else{
					response.sendRedirect("admin.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
