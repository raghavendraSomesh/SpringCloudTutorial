package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


import com.entity.Order;
import com.helper.FactoryProvider;

public class DeleteOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteOrder() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Session sess=FactoryProvider.getFactory().openSession();
		HttpSession session=request.getSession();
		Transaction tx=sess.beginTransaction();
		int order_id=Integer.parseInt(request.getParameter("orderId"));
		 Order order=(Order)sess.get(Order.class,order_id);
		if(order_id>0 && !order.getStatus().equals("Delivered")){
			/* sess.delete(order); */
			Query q=sess.createQuery("update Order set status='Cancelled' where orderId=:x");
			q.setParameter("x",order_id);
			int result=q.executeUpdate();
			 tx.commit();
			 if(result>0) {
				 session.setAttribute("message", "Order Cancelled Successfully!");
				 response.sendRedirect("orders.jsp");
			 }
			sess.close();
			
	}
		else {
			session.setAttribute("message","Your Product has been Delivered.");
			response.sendRedirect("orders.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
