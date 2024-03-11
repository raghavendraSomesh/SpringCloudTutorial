package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import com.entity.Cart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class incre_decre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public incre_decre() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		String action=request.getParameter("action");
		ArrayList<Cart> c1 = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
		
		if(action!=null && id>1) {
			if(action.equals("inc")) {
				for(Cart c:c1) {
					if(c.getpId()==id) {
						int quantity=c.getQuantity();
						quantity++;
						c.setQuantity(quantity);
						response.sendRedirect("cart.jsp");
					}
				}
			}
			if(action.equals("dec")) {
				for(Cart c:c1) {
					if(c.getpId()==id && c.getQuantity()>0) {
						int quantity=c.getQuantity();
						quantity--;
						c.setQuantity(quantity);
						break;
					}
				}
				response.sendRedirect("cart.jsp");
			}
			
			
		}
		else {
			response.sendRedirect("cart.jsp");
		}
	}
	

}
