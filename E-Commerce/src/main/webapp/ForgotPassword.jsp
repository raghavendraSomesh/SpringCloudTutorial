<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="components/all_cs_js_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>You & Me Shop</title>
<style>
.abc{
box-shadow: 0 0.5rem 1rem rgba(-69,0,0,0.5)!important;}

.banner {
	height: 280px;
	width: 100%;
}
</style>
</head>
<body>
<div class="">
		<img src="assets/images/forgot.png" class="img-fluid banner">
	</div>
<div class="my-4">
<h4 class="text-center text-danger">Enter Your Registered E-mail Id and we will send you an OTP.</h4>
</div>
<div class="parent">
<div class="forgot abc">
<%@include file="msg.jsp" %>
<form action="ForgotPassword" method="post" autocomplete="off">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" name="email">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  <div class="float-end pt-3">
  <a href="login.jsp" class="text-primary">Back to Login</a>
  </div>
</form>
</div>
</div>
</body>
</html>