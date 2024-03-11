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
	height: 90vh;
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid background p-4">
		<div class="row">
			<div class="col-3 p-0"></div>
			<div class="col-6">
				<div class="pt-2 mt-0">
					<div class=" text-center">
						<img src="assets/images/login.jpeg" class="img-fluid" alt="logo"
							width=250" >
					</div>
					<%@include file="msg.jsp"%>
					<form method="post" action="LoginServlet" autocomplete="off">
						<div class="mb-3">
							<label for="email" class="form-label text-white">Email
								address</label> <input type="email" class="form-control" id="email"
								name="txt_email">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label text-white">Password</label>
							<input type="password" class="form-control" id="password"
								name="txt_password">
						</div>

						<input type="submit" value="Login"
							class="btn btn-lg bg-success fw-bold w-100 mt-2 loginbtn"
							style="padding-left: 2.5rem; padding-right: 2.5rem;"> <a
							href="ForgotPassword.jsp"
							class=" pt-1 mb-0 mt-3 float-end fw-bold">Forgot password?</a>


					</form>
				</div>
			</div>
		
		</div>

	</div>
</body>
</html>
