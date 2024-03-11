<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="components/all_cs_js_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>You and Me Shop</title>
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
		<img src="assets/images/support2.jpg" class="img-fluid banner">
	</div>
	<div class="container my-4">
	<%@include file="msg.jsp"%>
		<div class="text-center ">
			<h2 class="m-0">Contact For Customer Support</h2>
			<img src="assets/images/underline.png" class="underline">
		</div>
		<div class="row my-5">
			<div class="col-6">
				<div class="">
					<img src="assets/images/cus2.jpeg" class="img-fluid w-100">
				</div>
			</div>
			<div class="col-6">
				<div class="">
					<form action="SupportData" onsubmit="validation()" autocomplete="off">
					<div class="mb-3">
							<label for="name" class="form-label">Name
								</label> <input type="text" class="form-control"
								id="name" name="txt_name">
								<div class="text-danger" id="name_msg"></div>
							
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email
								address</label> <input type="email" class="form-control"
								id="email" name="txt_email" >
								<div class="text-danger" id="email_msg"></div>
							
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label">Phone
								Number</label> <input type="number" class="form-control"
								id="phone" name="txt_phone">
								<div class="text-danger" id="phone_msg"></div>
							
						</div>
						<div class="mb-3">
							<label for="issue" class="form-label">Enter your Issue </label>
							<input type="text" class="form-control"
								id="issue" name="txt_issue">
								<div class="text-danger" id="issue_msg"></div>
						</div>
					<div class="text-center">
						<input type="submit" class="btn btn-primary w-100 form-control mt-2" value="Submit">
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@include file="components/footer.jsp"%>
		<script>
function validation(){
	 var name = document.getElementById("name").value;
     var email = document.getElementById("email").value;
     var phone = document.getElementById("phone").value;
     var issue = document.getElementById("issue").value;
     
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
     if (issue.length == 0) {
         document.getElementById("issue").style.border = "1px solid red";
         document.getElementById("issue_msg").innerHTML = "*Please Fill this Field";
         event.preventDefault();
     }
     else {
             document.getElementById("issue_msg").innerHTML = " ";
             document.getElementById("issue").style.border = "1px solid #ced4da";
             
         }
}
</script>
</body>
</html>