package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Support;
import com.helper.FactoryProvider;

public class SupportData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SupportData() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		Session sess=FactoryProvider.getFactory().openSession();
		Transaction t=sess.beginTransaction();
		HttpSession session=request.getSession();
		String name=request.getParameter("txt_name");
		String email=request.getParameter("txt_email");
		String issue=request.getParameter("txt_issue");
		String phone=request.getParameter("txt_phone");
		Support sup=new Support(name,email,issue,phone);
		int result=(int)sess.save(sup);
		t.commit();
		if(result>0) {
			session.setAttribute("message", "Request Sent Successfully !");
			response.sendRedirect("support.jsp");
		}
		else {
			session.setAttribute("message", "Something Went Wrong !");
			response.sendRedirect("support.jsp");
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
