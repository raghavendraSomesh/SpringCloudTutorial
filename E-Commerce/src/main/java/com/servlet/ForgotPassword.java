package com.servlet;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;

import com.entity.User;
import com.helper.FactoryProvider;

public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ForgotPassword() {
		super();
		// TODO Auto-generated constructor stub
	}
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		RequestDispatcher dispatcher = null;
		int otpValue = 0;
		HttpSession mysession = request.getSession();
		org.hibernate.Session sess = FactoryProvider.getFactory().openSession();
		Query q = sess.createQuery("from User where userEmail=:x");
		q.setParameter("x", email);
        User result=(User) q.uniqueResult();
		if (result != null) {
			Random rand = new Random();
			otpValue = rand.nextInt(999999);

			String to = email;
			// Get Session Object
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ayush.barrownzgroup@gmail.com", "pbxhhhrefflagegf");
				}
			});
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("OTP FOR UPDATING YOUR PASSWORD");
				message.setText("OTP to update your Password is: " + otpValue);
				// send message
				Transport.send(message);
				System.out.println("Message Sent Successfully");
			} catch (Exception e) {
				e.printStackTrace();
			}
			dispatcher = request.getRequestDispatcher("Otp.jsp");
			request.setAttribute("message", "OTP is sent to your Email.");
			mysession.setAttribute("otp", otpValue);
			mysession.setAttribute("email", email);
			dispatcher.forward(request, response);
		} else {
			mysession.setAttribute("message", "This email is not Registered !");
			response.sendRedirect("ForgotPassword.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
