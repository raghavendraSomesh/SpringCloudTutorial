package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Address;
import com.entity.Cart;
import com.entity.Order;
import com.entity.User;
import com.helper.FactoryProvider;

public class DeliveryDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeliveryDetails() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		Session sess=FactoryProvider.getFactory().openSession();
		HttpSession session=request.getSession();
		Transaction tx=sess.beginTransaction();
		PrintWriter out = response.getWriter();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart-list");
		User user = (User) request.getSession().getAttribute("current-user");
		int h_no=Integer.parseInt("hnumber");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String colony=request.getParameter("colony");
		int pincode=Integer.parseInt("pin");
		Address ad=new Address(); 
		ad.setHouse_no(h_no);
		ad.setCity(city);
		ad.setColony(colony);
		ad.setPincode(pincode);
		ad.setState(state);
		if (user != null && cart != null) {
				for (Cart c : cart) {
					Order order = new Order();
					int id = c.getpId();
					order.setPid(c.getpId());
					order.setUserId(user.getUserId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					order.setStatus("Not Delivered");
					sess.save(ad);
					int result = (int) sess.save(order);
					if (result > 0) {
						session.setAttribute("message", "Ordered Successfully with COD");
					} else {
						session.setAttribute("message", "");
					}
				}
				cart.clear();
				tx.commit();
				sess.close();
				response.sendRedirect("orders.jsp");
			}
			else {
				session.setAttribute("message", "Login to place an Order");
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
