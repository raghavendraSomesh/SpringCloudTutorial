<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.*"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User user1 = (User) session.getAttribute("current-user");
ArrayList<Cart> c1 = (ArrayList<Cart>) session.getAttribute("cart-list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark custom-bg fixed-top">
		<div class="container-fluid px-3">
			<a class="navbar-brand" href="index.jsp"><img
				src="assets/images/images.jpg" alt="logo" class="img-fluid logo"
				height="50px" width="80px"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					</li>
					<%
					if(c1==null){
					%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="cart.jsp">Cart</a></li>

					</li>
					<%
					}
					else{
						%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="cart.jsp">Cart<span
							class="badge bg-danger ms-1 p-1"><%=c1.size() %></span></a></li>

					</li>
					<%
						
					}
					%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="orders.jsp">Orders</a></li>

					</li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Wishlist</a></li>

					</li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="support.jsp">Support</a></li>

					</li>



				</ul>
				<%
				if(user1==null){
				%>

				<form class="d-flex">
					<input class="form-control me-3 mt-1 ms-2 w-100" type="search"
						placeholder="Search" aria-label="Search">
				</form>


				<div class="d-flex">
					<a href="login.jsp"><button
							class=" btn btn-success px-3 py-2 text-white xyz">Login</button></a> <a
						href="register.jsp"><button
							class="btn btn-primary px-3 py-2 ms-3 text-white xyz">Register</button></a>
				</div>
				<%
				}
				else{
					%>
					<form class="d-flex">
					<input class="form-control me-3 mt-1 ms-2 w-100" type="search"
						placeholder="Search" aria-label="Search">
				</form>
				<div class="d-flex">
					<a href="#"><button
							class=" btn btn-success px-3 py-2 text-white xyz "><%=user1.getUserName() %></button></a>
					<a href="LogoutServlet"><button
							class="btn btn-primary px-3 py-2 ms-3 text-white xyz">Logout</button></a>

				</div>

				<%
				}
				%>

			</div>
		</div>
	</nav>
</body>
</html>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
%>