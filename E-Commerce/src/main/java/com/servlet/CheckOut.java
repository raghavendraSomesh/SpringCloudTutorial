package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import com.entity.*;
import com.helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckOut() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart-list");
			User user = (User) request.getSession().getAttribute("current-user");

			if (user != null && cart != null) {
				Session sess = FactoryProvider.getFactory().openSession();
				Transaction tx = sess.beginTransaction();
			
				for (Cart c : cart) {
					Order order = new Order();
					int id = c.getpId();
					order.setPid(c.getpId());
					order.setUserId(user.getUserId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					order.setStatus("In Process");
					Address ad = new Address();
					int hNo = Integer.parseInt(request.getParameter("hnumber"));
					String city = request.getParameter("city");
					String state = request.getParameter("state");
					String colony = request.getParameter("colony");
					int pincode = Integer.parseInt(request.getParameter("pin"));
                    String phone=request.getParameter("phone");
					int result = (int) sess.save(order);
					                
					if (result > 0) {
						ad.setO_id(order.getOrderId());
						ad.setColony(colony);
						ad.setHouse_no(hNo);
						ad.setPincode(pincode);
						ad.setState(state);
						ad.setCity(city);
						ad.setPhone(phone);
						sess.save(ad);
						session.setAttribute("message", "Ordered Successfully with COD");
					} else {
						session.setAttribute("message", "");
					}
				}
				cart.clear();
				tx.commit();
				sess.close();
				response.sendRedirect("orders.jsp");
			} else {
				session.setAttribute("message", "Login to place an Order");
				response.sendRedirect("login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
