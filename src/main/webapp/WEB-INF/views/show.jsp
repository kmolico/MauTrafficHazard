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

	<h2><spring:message code="registration.account.info" text="Account Information "/></h2>
	<br />

	<div class="row">
		<label class="col-sm-2"><spring:message code="registration.username" text="Username" var="username"/></label>
		<div class="col-sm-10">${user.name}</div>
	</div>

	<div class="row">
		<label class="col-sm-2"><spring:message code="registration.firstname" text="First Name" var="fname"/></label>
		<div class="col-sm-10">${user.fname}</div>
	</div>
	
	<div class="row">
		<label class="col-sm-2"><spring:message code="registration.lastname" text="Last Name" var="lname"/></label>
		<div class="col-sm-10">${user.lname}</div>
	</div>

	<div class="row">
		<label class="col-sm-2"><spring:message code="registration.email" text="Email" var="email"/></label>
		<div class="col-sm-10">${user.email}</div>
	</div>

	<div class="row">
		<label class="col-sm-2"><spring:message code="registration.address" text="Address" var="address"/></label>
		<div class="col-sm-10">${user.address}</div>
	</div>

	<div class="row">
		<label class="col-sm-2"><spring:message code='registration.gender' text='Gender'/></label>
		<div class="col-sm-10">${user.sex}</div>
	</div>

	<div class="row">
		<label class="col-sm-2"><spring:message code="registration.driving.license" text="Driving License" var="license"/></label>
		<div class="col-sm-10">${user.license}</div>
	</div>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>