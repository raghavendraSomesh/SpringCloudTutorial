<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Product"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@include file="components/all_cs_js_file.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<html>
<head>
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
	<div class="banner">
		<img src="assets/images/cart.jpg" class="img-fluid banner">
		<hr class="m-0">
	</div>
	<%
	Session sess = null;
	Transaction tx = null;
	int final_price = 0;
	try {
		sess = FactoryProvider.getFactory().openSession();
		ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart-list");
		if (cart != null && cart.size() > 0) {
			List<Cart> cartProduct = new ArrayList<>();
			tx = sess.beginTransaction();
			for (Cart item : cart) {
		Query q = sess.createQuery("from Product where pId=:x");
		q.setParameter("x", item.getpId());
		Product p = (Product) q.uniqueResult();
		if (p != null) {
			Cart c = new Cart();
			c.setpId(p.getpId());
			c.setpName(p.getpName());
			c.setpPrice(p.getPriceAfterDiscount());
			c.setQuantity(item.getQuantity());
			c.setpPhoto(p.getpPhoto());
			cartProduct.add(c);
		}
			}
			request.setAttribute("cartProduct", cartProduct);
		}
	} catch (Exception e) {
		if (tx != null) {
			tx.rollback();
		}
		e.printStackTrace();
	} finally {
		if (sess != null) {
			sess.close();
		}
	}
	%>

	<div class="container mt-5">
		<%@include file="msg.jsp"%>
		<%
		List<Cart> cartProduct = (List<Cart>) request.getAttribute("cartProduct");
		if (cartProduct != null && cartProduct.size() > 0) {
		%>
		<div class="text-center ">
			<h1 class="m-0">Cart Items</h1>
			<img src="assets/images/underline.png" class="underline">
		</div>

		<table class="table  text-center mt-4">
			<tr class="custom-bg text-white">
				<th>Product</th>
				<th>Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total Price</th>
				<!-- 	<th>Buy Now</th> -->
				<th>Remove</th>
			</tr>
			<%
			for (Cart item : cartProduct) {
				int tPrice = 0;
				int pr = item.getPriceAfterDiscount();
				int q = item.getQuantity();
				tPrice = pr * q;
				final_price = final_price + tPrice;
			%>
			<tr>
				<td><img src="assets/images/Products/<%=item.getpPhoto()%>"
					class="img-fluid" alt="..."
					style="height: 80px; max-width: 100%; width: auto";></td>
				<td><%=item.getpName()%></td>
				<td>&#8377; <%=item.getPriceAfterDiscount()%></td>
				<td>
					<form action="OrderNow" class="form-inline" autocomplete="off">
						<input type="hidden" name="id" value="<%=item.getpId()%>"
							class="form-input">
						<div class="form-group  justify-content-between">
							<a class="btn btn-primary btn-sm mb-1 btn-decre"
								href="incre_decre?action=dec&id=<%=item.getpId()%>"><i
								class="fa-solid fa-minus"></i> </a> <input type="text"
								name="quantity" class="form-input w-25"
								value="<%=item.getQuantity()%>"> <a
								class="btn btn-primary btn-sm mb-1 btn-incre"
								href="incre_decre?action=inc&id=<%=item.getpId()%>"><i
								class="fa-solid fa-plus"></i></a>
						</div>
					</form>
				</td>

				<td>&#8377; <%=tPrice%></td>
				<%-- <td>
				<a href="OrderNow?id=<%=item.getpId() %>&quantity=<%=item.getQuantity()%>"><button class="btn btn-success">Buy Now</button></a></td> --%>
				<td><a href="Delete_FromCart?id=<%=item.getpId()%>"><button
							class="btn btn-danger">Remove</button></a></td>
			</tr>

			<%
			}
			%>
		</table>
		<div class="d-flex py-3 text-center justify-content-center">
			<h5 class="mt-2">
				Total Price of Cart Items : &#8377;
				<%=final_price%></h5>
			<!-- <a href="CheckOut"><button class="btn btn-success mx-3" >Check
					Out</button></a>  -->
			<button class="btn btn-success mx-3"
				onclick="myLoginCheck('exampleModal')" data-bs-toggle="modal"
				data-bs-target="#exampleModal">Check Out</button>
		</div>
		<%
		} else {
		%>
		<h4 class="text-center my-5">Your Cart is Empty!</h4>
		<%
		}
		%>

	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Enter Delivery
						Address</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%
					User user = (User) request.getSession().getAttribute("current-user");
					%>
					<form action="CheckOut" onsubmit="addressCheck()">

						<div class="mb-3">
							<label for="hnumber" class="form-label">House Number</label> <input
								type="number" class="form-control" id="hnumber" name="hnumber">
							<div class="text-danger" id="hnumber_msg"></div>
						</div>
						<div class="mb-3">
							<label for="colony" class="form-label">Colony</label> <input
								type="text" class="form-control" id="colony" name="colony">
							<div class="text-danger" id="colony_msg"></div>
						</div>
						<div class="mb-3">
							<label for="city" class="form-label">City</label> <input
								type="text" class="form-control" id="city" name="city">
							<div class="text-danger" id="city_msg"></div>
						</div>
						<div class="mb-3">
							<label for="state" class="form-label">State</label> <input
								type="text" class="form-control" id="state" name="state">
							<div class="text-danger" id="state_msg"></div>
						</div>
						<div class="mb-3">
							<label for="pin" class="form-label">Pincode</label> <input
								type="number" class="form-control" id="pin" name="pin">
							<div class="text-danger" id="pin_msg"></div>
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label">Contact Details</label> <input
								type="number" class="form-control" id="phone" name="phone">
							<div class="text-danger" id="phone_msg"></div>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							<button type="reset" class="btn btn-secondary">Reset</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
		<%@include file="components/footer.jsp"%>
	<script>
	function addressCheck(){
		 var hNumber = document.getElementById("hnumber").value;
		 var colony = document.getElementById("colony").value;
		 var city = document.getElementById("city").value;
		 var state = document.getElementById("state").value;
		 var pin = document.getElementById("pin").value;
		 var phone = document.getElementById("phone").value;
		 
		 if (hNumber.length == 0) {
	         document.getElementById("hnumber").style.border = "1px solid red";
	         document.getElementById("hnumber_msg").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("hnumber_msg").innerHTML = " ";
	             document.getElementById("hnumber").style.border = "1px solid #ced4da"; 
	     }
		 if (colony.length == 0) {
	         document.getElementById("colony").style.border = "1px solid red";
	         document.getElementById("colony_msg").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("colony_msg").innerHTML = " ";
	             document.getElementById("colony").style.border = "1px solid #ced4da";
	     }
		 
		 if (city.length == 0) {
	         document.getElementById("city").style.border = "1px solid red";
	         document.getElementById("city_msg").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("city_msg").innerHTML = " ";
	             document.getElementById("city").style.border = "1px solid #ced4da";
	     }
		 
		 if (state.length == 0) {
	         document.getElementById("state").style.border = "1px solid red";
	         document.getElementById("state_msg").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("state_msg").innerHTML = " ";
	             document.getElementById("state").style.border = "1px solid #ced4da";
	     }
		 
		 if (pin.length == 0) {
	         document.getElementById("pin").style.border = "1px solid red";
	         document.getElementById("pin_msg").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	    	 if (pin.length < 6 || phone.length > 6) {
	             document.getElementById("pin").style.border = "1px solid red";
	             document.getElementById("pin_msg").innerHTML = "*Enter a Proper 6 Digit Pincode";
	         }
	         else {
	             document.getElementById("pin").style.border = "1px solid #ced4da";
	             document.getElementById("pin_msg").innerHTML = "";
	         }
	     }
		 
		 if (phone.length == 0) {
	         document.getElementById("phone").style.border = "1px solid red";
	         document.getElementById("phone_msg").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	    	 if (phone.length < 10 || phone.length > 10) {
	             document.getElementById("phone").style.border = "1px solid red";
	             document.getElementById("phone_msg").innerHTML = "*Enter a Proper Phone Number";
	         }
	         else {
	             document.getElementById("phone").style.border = "1px solid #ced4da";
	             document.getElementById("phone_msg").innerHTML = "";
	         }
	     }

	}
	</script>
	</body>