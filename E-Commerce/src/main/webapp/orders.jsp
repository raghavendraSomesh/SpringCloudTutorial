<%@page import="java.util.Date"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Product"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@include file="components/all_cs_js_file.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "Login to access this Page");
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>You & Me Shop</title>
<style>
.banner {
	height: 280px;
	width: 100%;
}

.underline {
	margin: -65px;
}
</style>
</head>
<body>

	<%@include file="components/navbar.jsp"%>
	<div class="">
		<img src="assets/images/orders.png" class="img-fluid banner">
		<hr>
	</div>
	<%
	Session sess = FactoryProvider.getFactory().openSession();
	ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart != null) {
		request.setAttribute("cart_list", cart);
	}
	Query q = sess.createQuery("from Order where userId=:x");
	q.setParameter("x", user.getUserId());
	List<Order> order = q.list();
	if (!order.isEmpty()) {
	%>
	<div class="container my-5">
		<%@include file="msg.jsp"%>
		<div class="text-center ">
			<h1 class="m-0">Orders</h1>
			<img src="assets/images/underline.png" class="underline">
		</div>
		<table class="table text-center my-5">
			<tr class="custom-bg text-white">
				<th>Date</th>
				<th>Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total Price</th>
				<th>Cancel</th>
				<th>Order Status</th>
			</tr>
			<%
			for (Order o : order) {
				Query q2 = sess.createQuery("from Product where pId=:a");
				q2.setParameter("a", o.getPid());
				List<Product> pro = q2.list();
				for (Product p222 : pro) {
					int final_price = 0;
					int tPrice = 0;
					int dp = p222.getPriceAfterDiscount();
					int quan = o.getQuantity();
					tPrice = dp * quan;
					final_price = final_price + tPrice;
			%>
			<tr>
				<td><%=o.getDate()%></td>
				<td><%=p222.getpName()%></td>
				<td>&#8377; <%=dp%></td>
				<td><%=o.getQuantity()%></td>
				<td>&#8377; <%=final_price%></td>
				<td><a href="DeleteOrder?orderId=<%=o.getOrderId()%>"><button
							class="btn btn-danger">Cancel</button></a></td>
				<td><button class="btn btn-success"><%=o.getStatus()%></button></td>
			</tr>
			<%
			}
			}
			} else {
			%>
			<h4 class="text-center my-5 py-5">You have not ordered anything yet!</h4>
			<%
			}
			sess.close();
			%>
		</table>
	</div>
	<%@include file="components/footer.jsp"%>
</body>
</html>