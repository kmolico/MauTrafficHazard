<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp" />

<div class="container">

	<c:if test="${not empty msg}">
		<div class="alert alert-${css} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>${msg}</strong>
		</div>
	</c:if>

	<h1>User Detail</h1>
	<br />

	<div class="row">
		<label class="col-sm-2">Username</label>
		<div class="col-sm-10">${user.name}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">First Name</label>
		<div class="col-sm-10">${user.fname}</div>
	</div>
	
	<div class="row">
		<label class="col-sm-2">Last Name</label>
		<div class="col-sm-10">${user.lname}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Email</label>
		<div class="col-sm-10">${user.email}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Address</label>
		<div class="col-sm-10">${user.address}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Gender</label>
		<div class="col-sm-10">${user.sex}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">License</label>
		<div class="col-sm-10">${user.license}</div>
	</div>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>