<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="components/all_cs_js_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="my-5">
<h1 class="text-center text-danger">Update Password?</h1>
<h4 class="text-center mt-4">.</h4>
</div>
<div class="parent">
<div class="forgot">
<%@include file="msg.jsp"%>
<form action="UpdatePassword" method="post" onsubmit="return crossCheckPass()">
  <div class="mb-3">
    <label for="password" class="form-label">Enter Your New Password</label>
    <input type="password" class="form-control" id="ps1" name="password">
  </div>
  <div class="mb-3">
    <label for="confirmPassword" class="form-label">Re-enter Your Password</label>
    <input type="password" class="form-control" id="ps2" name="confirmPassword">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</body>
<script lang="JavaScript" type="text/javascript">
		function  crossCheckPass()
			{
				if(document.getElementById("ps1").value != document.getElementById("ps2").value)
					{
					
						alert("Password Mismatch!");
						
						return false;
					}
				else
					{
					
						return true;
					}
			
			}

</script>
</html>
