<%@page import="com.entity.Product"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@include file="components/all_cs_js_file.jsp"%>
<html>
<head>
<title>You & Me Shop</title>
</head>
<style>
.banner {
	height: 280px;
	width: 100%;
}
.abc{
box-shadow: 0 0.5rem 1rem rgba(-69,0,0,0.5)!important;}
</style>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="">
		<img src="assets/images/banner.jpg" class="img-fluid banner">
			<hr class="m-0">
	</div>
	<div class="container mt-3">
		<%@include file="msg.jsp"%>
	</div>
	<div class="container-fluid mt-4">
		<div class="row">
			<!-- All Categories -->
			<div class="col-2">
				<%
				Session sess = FactoryProvider.getFactory().openSession();
				Query q1 = sess.createQuery("from Category");
				List<Category> clist = q1.list();
				%>
				<div class="list-group">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active custom-bg"
						aria-current="true"> All Product Categories</a>
				</div>
				<%
				for (Category c : clist) {
				%>
				<a href="index.jsp?category=<%=c.getCategoryId()%>"
					class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
				<%
				}
				%>
			</div>
			<!-- All Products -->
			<div class="col-10">
				<div class="row g-4">
					<%
					String category = request.getParameter("category");
					List<Product> plist = null;
					Query q2 = sess.createQuery("from Product");
					if (category == null || category.equals("all")) {
						plist = q2.list();
					} else {
						int categoryId = Integer.parseInt(category.trim());
						Query q3 = sess.createQuery("from Product as p where p.category.categoryId=:x ");
						q3.setParameter("x", categoryId);
						plist = q3.list();

						if (plist.size() == 0) {
					%>
					<h3 class="text-center">No Products in this Category!</h3>
					<%
					}
					}
					for (Product p : plist) {
					%>
					<div class="col-12 col-sm-12 col-md-6 col-xl-4">
						<a href="ProdDetails.jsp?pid=<%=p.getpId()%>"
							class="text-decoration-none">
							<div class=" abc text-center">
								<div class="p-3">
									<img src="assets/images/Products/<%=p.getpPhoto()%>"
										class="card-img-top img-fluid" alt="..."
										style="height: 200px; max-width: 100%; width: auto";>
								</div>
								<div class="card-body text-dark text-decoration-none">
									<h5 class="card-title"><%=p.getpName()%></h5>

									<h5 class="text-danger m-0">Special Price</h5>
									<h4 class="mt-2 mb-0">
										&#8377;<%=p.getPriceAfterDiscount()%>
										<span class="cut">&#8377;<%=p.getpPrice()%></span> <span
											class="discount"><%=p.getpDiscount()%>%off</span>
									</h4>
								</div>
								<div class="card-footer py-3">
									<a href="AddToCart?id=<%=p.getpId()%>"><button
											class="btn btn-success text-white">Add to Cart</button></a>
											<a href="ProdDetails.jsp?pid=<%=p.getpId()%>"><button
											class="btn custom-bg text-white">View Product</button></a>
								</div>
							</div>
						</a>
					</div>

					<%
					}
					sess.close();
					%>
				</div>
			</div>
		</div>
	</div>
		<%@include file="components/footer.jsp"%>
</body>
</html>
