<%@page import="com.helper.FactoryProvider"%>
<%@include file="components/all_cs_js_file.jsp"%>
<html>
<head>
<title>You & Me Shop</title>
<style>
.background {
	background-image: url("assets/images/bg.png");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: auto;
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid background p-4">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<%@include file="msg.jsp"%>
				<div class="p-4">
					<div class=" text-center">
						<img src="assets/images/register.jpeg" class="img-fluid"
							alt="logo" width="200">
					</div>
					<form method="post" action="RegisterServlet"
						onsubmit="validation()" autocomplete="off">
						<div class="mb-3">
							<label for="name" class="form-label text-white">Name</label> <input
								type="text" class="form-control" id="name" name="txt_name">
							<div id="name_msg" class="text-danger"></div>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label text-white">Email
								address</label> <input type="email" class="form-control" id="email"
								name="txt_email">
							<div id="email_msg" class="text-danger"></div>
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label text-white">Phone</label> <input
								type="number" class="form-control" id="phone" name="txt_phone">
							<div id="phone_msg" class="text-danger"></div>
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label text-white">Address</label>
							<input type="text" class="form-control" name="txt_address"
								id="address">
							<div id="address_msg" class="text-danger"></div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label text-white">Password</label>
							<input type="password" class="form-control" id="password"
								name="txt_password">
							<div id="password_msg" class="text-danger"></div>
						</div>
						<div class="mb-3">
							<label for="cpassword" class="form-label text-white">Confirm
								Password</label> <input type="password" class="form-control"
								id="cpassword" name="txt_cpassword">
							<div id="cpassword_msg" class="text-danger"></div>
						</div>
						<input type="submit" value="Register"
							class="btn btn-lg bg-success fw-bold w-100 mt-3 loginbtn"
							style="padding-left: 2.5rem; padding-right: 2.5rem;">
					</form>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
	<script>
function validation(){
	 var name = document.getElementById("name").value;
     var email = document.getElementById("email").value;
     var phone = document.getElementById("phone").value;
     var address = document.getElementById("address").value;
     var password = document.getElementById("password").value;
     var cpassword = document.getElementById("cpassword").value;
     if (name.length == 0) {
         document.getElementById("name").style.border = "1px solid red";
         document.getElementById("name_msg").innerHTML = "*Please Fill this Field";
         event.preventDefault();
     }
     else {
         if (!isNaN(name)) {
             document.getElementById("name_msg").innerHTML = "*Numbers not Allowed";
             event.preventDefault();
         } else {
             document.getElementById("name_msg").innerHTML = " ";
             document.getElementById("name").style.border = "1px solid #ced4da";
         }
     }

     if (email == null || email == "") {
         document.getElementById("email").style.border = "1px solid red";
         document.getElementById("email_msg").innerHTML = "*Please Fill this Field";
         event.preventDefault();
     }
     else {
         document.getElementById("email_msg").innerHTML = "";
         document.getElementById("email").style.border = "1px solid #ced4da";
     }
     if (phone == null || phone == "") {
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
     if (address.length == 0) {
         document.getElementById("address").style.border = "1px solid red";
         document.getElementById("address_msg").innerHTML = "*Please Fill this Field";
         event.preventDefault();
     }
     else {
             document.getElementById("address_msg").innerHTML = " ";
             document.getElementById("address").style.border = "1px solid #ced4da";
             
         }
     
     if (password == null || password == "") {
         document.getElementById("password_msg").innerHTML = "*Please Fill this Field";
         document.getElementById("password").style.border = "1px solid red";
         event.preventDefault();
     }
     else {
         if (password.length < 8 || password.length > 10) {
             document.getElementById("password").style.border = "1px solid red";
             document.getElementById("password_msg").innerHTML = "Password must be between 8-10 characters";
             event.preventDefault();
         }
         else {
             document.getElementById("password").style.border = "1px solid #ced4da";
             document.getElementById("password_msg").innerHTML = "";
         }

     }
     if (cpassword == null || cpassword == "") {
         document.getElementById("cpassword").style.border = "1px solid red";
         document.getElementById("cpassword_msg").innerHTML = "*Please Fill this Field";
         event.preventDefault();
     }
     else {
         if (cpassword != password) {
             document.getElementById("cpassword").style.border = "1px solid red";
             document.getElementById("cpassword_msg").innerHTML = "*Password Didnt Matched";
             event.preventDefault();
         }
         else {
             document.getElementById("cpassword").style.border = "1px solid #ced4da";
             document.getElementById("cpassword_msg").innerHTML = "";
         }
     }
}
</script>
</body>
</html>
