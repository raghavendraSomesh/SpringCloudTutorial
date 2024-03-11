package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import com.entity.Cart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete_FromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Delete_FromCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		if(id>0) {
			ArrayList<Cart> c1 = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			if(c1!=null) {
				for(Cart c:c1) {
					if(c.getpId()==id) {
						c1.remove(c1.indexOf(c));
						response.sendRedirect("cart.jsp");
						break;
					}
				}
			}
		}
		else {
			response.sendRedirect("cart.jsp");
		}
	}

}
