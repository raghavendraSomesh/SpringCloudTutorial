<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Category"%>
<%@page import="com.entity.User"%>
<%@page import="com.helper.FactoryProvider"%>
<%@include file="components/all_cs_js_file.jsp"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("message", "Login to Access this Page");
	return;
} else {
	if (user.getUserType().equals("User")) {
		response.sendRedirect("login.jsp");
		session.setAttribute("message", "You can't access this Page.");
		return;
	} else {
	}
}
%>
<%
						Session sess=FactoryProvider.getFactory().openSession();
									Query q1=sess.createQuery("from Category");
									List<Category>list=q1.list();
%>
<html>
<head>
<title>You & Me Shop</title>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container mt-5 ">
		<%@include file="msg.jsp"%>

		<div class="row">
			<div class="col-4">
				<div class="text-center p-3 shadow box">
					<img src="assets/images/categories.png" class="img-fluid">
					<h3>Total Products</h3>
					<%
					Query q2=sess.createQuery("select count(pId) from Product");  
					Long countP=(long)q2.uniqueResult();
					%>
					<h3><%=countP%></h3>
				</div>
			</div>
			<div class="col-4 ">
				<div class="text-center p-3 shadow box">
					<div class="">
						<img src="assets/images/categories.png" class="img-fluid">
					</div>

					<h3>Total Category</h3>
					<%
					Query q3=sess.createQuery("select count(categoryId) from Category");  
					Long countC=(long)q3.uniqueResult();
					%>
					<h3><%=countC %></h3>
				</div>
			</div>
			<div class="col-4">
				<div class="text-center p-3 shadow box">
					<div class="">
						<img src="assets/images/categories.png" class="img-fluid">
					</div>
					<h3>Total Users</h3>
					<%
					Query q4=sess.createQuery("select count(userName) from User");  
					Long countU=(long)q4.uniqueResult();
					%>
					<h3><%=countU %></h3>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-6">
				<div class=" text-center p-3 shadow box" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="">
						<img src="assets/images/categories.png" class="img-fluid">
					</div>
					<h3>Add Category</h3>
				</div>
			</div>
			<div class="col-6">
				<div class=" text-center p-3 shadow box" data-bs-toggle="modal"
					data-bs-target="#exampleModal2">
					<div class="">
						<img src="assets/images/categories.png" class="img-fluid">
					</div>
					<h3>Add Product</h3>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal Add Category-->

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">ADD CATEGORY</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post" action="ProductOperation">
						<input type="hidden" value="addCategory" name="operation">
						<div class="mb-3">
							<label for="title" class="form-label">Title</label> <input
								type="text" class="form-control" id="title" name="txt_title">

						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Description</label>
							<textarea class="form-control" name="txt_desc"></textarea>
						</div>
						<div class="text-center">
							<input type="reset" class="btn btn-secondary"
								data-bs-dismiss="modal"> <input type="submit"
								class="btn btn-primary" value="Submit">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Add Product-->
	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel2" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel2">ADD PRODUCT</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body p-3">
					<form method="post" action="ProductOperation"
						enctype="multipart/form-data" onsubmit="productValidation()" class="p-2">
						<input type="hidden" value="addProduct" name="operation">
						<div class="mb-3">
							<label for="name" class="form-label">Product Name</label> <input
								type="text" class="form-control" id="name" name="txt_name">
							<div class="text-danger" id="msg_name"></div>
						</div>
						<div class="mb-3">
							<label for="category" class="form-label">Category</label> <select
								name="txt_category" id="category" class="form-control w-100">
								<option selected value="">--Select Category--</option>
								<!--  Query q1=sess.createQuery("from Category");
									List<Category>list=q1.list();
									Ooper likh di gyi hai ye do lines -->
								<%
							  for(Category c:list){
							   %>
								<option value=<%=c.getCategoryId() %>><%=c.getCategoryTitle()%></option>
								<% 
							  }
							  %>
							</select>
							<div class="text-danger" id="msg_category"></div>
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Description</label>
							<textarea class="form-control" name="txt_desc" id="description"></textarea>
							<div class="text-danger" id="msg_description"></div>
						</div>
						<div class="mb-3">
							<label for="quantity" class="form-label">Quantity</label> <input
								type="number" class="form-control" id="quantity"
								name="txt_quantity">
							<div class="text-danger" id="msg_quantity"></div>
						</div>
						<div class="mb-3">
							<label for="price" class="form-label">Price</label> <input
								type="text" class="form-control" id="price" name="txt_price">
							<div class="text-danger" id="msg_price"></div>
						</div>
						<div class="mb-3">
							<label for="discount" class="form-label">Discount</label> <input
								type="text" class="form-control" id="discount"
								name="txt_discount">
<div class="text-danger" id="msg_discount"></div>
						</div>
						<div class="mb-3">
							<label for="photo" class="form-label">Photo</label>
							 <input
								type="file" class="form-control" id="photo" name="txt_photo">
								<div class="text-danger" id="msg_photo"></div>
						</div>
						<div class="text-center">
							<input type="reset" class="btn btn-secondary"
								data-bs-dismiss="modal"> <input type="submit"
								class="btn btn-primary" value="Submit">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	function productValidation(){
		var name =document.getElementById("name").value;
		var category =document.getElementById("category").value;
		var description =document.getElementById("description").value;
		var quantity =document.getElementById("quantity").value;
		var price =document.getElementById("price").value;
		var discount =document.getElementById("discount").value;
		var photo =document.getElementById("photo");
		if(name.length == 0){
	         document.getElementById("name").style.border = "1px solid red";
	         document.getElementById("msg_name").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("msg_name").innerHTML = " ";
	             document.getElementById("name").style.border = "1px solid #ced4da";
	     }
		if(category.length == 0){
	         document.getElementById("category").style.border = "1px solid red";
	         document.getElementById("msg_category").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("msg_category").innerHTML = " ";
	             document.getElementById("category").style.border = "1px solid #ced4da";
	     }
		if(description.length == 0){
	         document.getElementById("description").style.border = "1px solid red";
	         document.getElementById("msg_description").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("msg_description").innerHTML = " ";
	             document.getElementById("description").style.border = "1px solid #ced4da";
	     }
		if(quantity.length == 0){
	         document.getElementById("quantity").style.border = "1px solid red";
	         document.getElementById("msg_quantity").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("msg_quantity").innerHTML = " ";
	             document.getElementById("quantity").style.border = "1px solid #ced4da";
	     }
		if(price.length == 0){
	         document.getElementById("price").style.border = "1px solid red";
	         document.getElementById("msg_price").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("msg_price").innerHTML = " ";
	             document.getElementById("price").style.border = "1px solid #ced4da";
	     }
		if(discount.length == 0){
	         document.getElementById("discount").style.border = "1px solid red";
	         document.getElementById("msg_discount").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("msg_discount").innerHTML = " ";
	             document.getElementById("discount").style.border = "1px solid #ced4da";
	     }
		if(!photo.files || photo.files.length === 0){
	         document.getElementById("photo").style.border = "1px solid red";
	         document.getElementById("msg_photo").innerHTML = "*Please Fill this Field";
	         event.preventDefault();
	     }
	     else {
	             document.getElementById("msg_photo").innerHTML = " ";
	             document.getElementById("photo").style.border = "1px solid #ced4da";
	     }
	}
	</script>
</body>
</html>
