<%@page import="java.util.Random"%>
<%@page import="org.hibernate.Transaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.Product"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@include file="components/all_cs_js_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.abc{
box-shadow: 0 0.5rem 2rem rgba(-69,0,0,0.5)!important;}
</style>
</head>
<body>
	<%
	int rate = 0;
	Session sess = FactoryProvider.getFactory().openSession();
	int pid = Integer.parseInt(request.getParameter("pid"));
	Query q = sess.createQuery("from Product where pId=:i");
	q.setParameter("i", pid);
	Product p = (Product) q.uniqueResult();
	Random rand = new Random();
	rate = rand.nextInt(1000);
	%>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid background pt-5">
	<div class="container abc bg-white">
		<div class="row ">
			<div class="col-12 col-md-6 col-lg-6 ">
				<div class="p-4 mx-auto text-center">
					<img src="assets/images/Products/<%=p.getpPhoto()%>"
						class="img-fluid">
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-6 ">
				<div class="p-4">
					<h5 class="custom-bg text-white ps-2 py-2">
						Category :
						<%=p.getCategory().getCategoryTitle()%></h5>
					<h2><%=p.getpName()%></h2>
					<h3>
						&#8377;
						<%=p.getPriceAfterDiscount()%>
						<span class="discount">with <%=p.getpDiscount()%>%off
						</span>
					</h3>
					<div class="">
						<img src="assets/images/rate.jpeg" class="w-25">
					</div>
					<P><%=rate%>
						reviews
					</P>
					<h4 class="mt-3">Product Details</h4>
					<p><%=p.getpDesc()%></p>
					<div class="mt-3">
						<a href="AddToCart?id=<%=p.getpId()%>"><button
								class="btn btn-success text-white">Add to Cart</button></a> &emsp; <img
							src="assets/images/deliver.jpg" class="w-50">
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%
	sess.close();
	%>
	<%@include file="components/footer.jsp"%>
</body>
</html>