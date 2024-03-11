package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.*;

public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddToCart() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try{
			PrintWriter out = response.getWriter();
			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setpId(id);
			cm.setQuantity(1);

			HttpSession sess = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) sess.getAttribute("cart-list");

			if (cart_list == null) {
				ArrayList<Cart> cartList = new ArrayList<Cart>();
				cartList.add(cm);
				sess.setAttribute("cart-list", cartList);
				sess.setAttribute("message","Product Added in the Cart");
				response.sendRedirect("index.jsp");
			} else {
				boolean exist = false;
				for (Cart c : cart_list) {
					if (c.getpId() == id) {
						exist = true;
						sess.setAttribute("message","This product already exists in the cart.");
						response.sendRedirect("cart.jsp");
					}
									}
				if (!exist) {
					cart_list.add(cm);
					sess.setAttribute("message","Product Added in the Cart");
					response.sendRedirect("index.jsp");
				}
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
