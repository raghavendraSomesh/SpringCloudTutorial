package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.entity.Category;
import com.entity.Product;
import com.helper.FactoryProvider;

@MultipartConfig
public class ProductOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductOperation() {
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
		PrintWriter out = response.getWriter();
		String op = request.getParameter("operation");
		if (op.trim().equals("addCategory")) {
			String title = request.getParameter("txt_title");
			String desc = request.getParameter("txt_desc");
			try {
				Session sess = FactoryProvider.getFactory().openSession();
				Transaction tx = sess.beginTransaction();
				Category c1 = new Category();
				c1.setCategoryTitle(title);
				c1.setCategoryDescription(desc);
				int id = (int) sess.save(c1);
				tx.commit();
				sess.close();
				HttpSession session = request.getSession();
				session.setAttribute("message", "Category Added Successfully!");
				response.sendRedirect("admin.jsp");
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (op.trim().equals("addProduct")) {
			Session sess = FactoryProvider.getFactory().openSession();
			Transaction tx = sess.beginTransaction();
			String name = request.getParameter("txt_name");
			int categoryId = Integer.parseInt(request.getParameter("txt_category"));
			String description = request.getParameter("txt_desc");
			int quantity = Integer.parseInt(request.getParameter("txt_quantity"));
			int price = Integer.parseInt(request.getParameter("txt_price"));
			int discount = Integer.parseInt(request.getParameter("txt_discount"));
			Part photo = request.getPart("txt_photo");
			try {
				Product p = new Product();
				p.setpName(name);
				p.setpDesc(description);
				p.setpQuantity(quantity);
				p.setpPrice(price);
				p.setpDiscount(discount);
				p.setpPhoto(photo.getSubmittedFileName());
				Category c1 = sess.get(Category.class, categoryId);
				p.setCategory(c1);
				sess.save(p);
				tx.commit();
			    //finding path to upload photo
				String path = request.getRealPath("assets");
				System.out.println(path);
				path = path + "\\images\\Products\\" + photo.getSubmittedFileName();
				System.out.println(path);
				// uploading code
				try {
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = photo.getInputStream();
					// reading code
					byte data[] = new byte[is.available()];
					is.read(data);
					// writing data
					fos.write(data);
					fos.close();
				} catch (Exception ep) {
					System.out.println(ep);
				}
				sess.close();
				HttpSession session = request.getSession();
				session.setAttribute("message", "Product Added Successfully!");
				response.sendRedirect("admin.jsp");
				return;
			} catch (Exception e) {
			}
		}
	}
}