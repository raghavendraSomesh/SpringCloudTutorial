
<%
String message = (String) session.getAttribute("message");
if (message != null) {
%>
<div class="alert alert-dark alert-dismissible fade show text-center"
	role="alert" id="notification">
	<strong><%=message%></strong>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
session.removeAttribute("message");
}
%>

<script>
	// Get the notification element
	var notification = document.getElementById('notification');

	// Function to remove the notification after 2 seconds
	function removeNotification() {
		notification.remove();
	}

	// Set timeout to remove the notification after 2 seconds
	setTimeout(removeNotification, 1500);
</script>
