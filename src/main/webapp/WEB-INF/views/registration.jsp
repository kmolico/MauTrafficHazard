<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp" />

<div class="container">

	<c:choose>
		<c:when test="${userForm['new']}">
			<h1>Account Information</h1>
		</c:when>
		<c:otherwise>
			<h1>Account Information</h1>
		</c:otherwise>
	</c:choose>
	<br />

	<spring:url value="/users" var="userActionUrl" />

	<form:form class="form-horizontal" method="post"
                modelAttribute="userForm" action="${userActionUrl}">

		<form:hidden path="id" />

		<spring:bind path="name">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Username</label>
			<div class="col-sm-10">
				<form:input path="name" type="text" class="form-control"
                                id="name" placeholder="Username" />
				<form:errors path="name" class="control-label" />
			</div>
		  </div>
		</spring:bind>
		
		<spring:bind path="fname">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">First Name</label>
			<div class="col-sm-10">
				<form:input path="fname" type="text" class="form-control"
                                id="fname" placeholder="First Name" />
				<form:errors path="fname" class="control-label" />
			</div>
		  </div>
		</spring:bind>
		
		<spring:bind path="lname">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Last Name</label>
			<div class="col-sm-10">
				<form:input path="lname" type="text" class="form-control"
                                id="lname" placeholder="Last Name" />
				<form:errors path="lname" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="email">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Email</label>
			<div class="col-sm-10">
				<form:input path="email" class="form-control"
                                id="email" placeholder="Email" />
				<form:errors path="email" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="password">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Password</label>
			<div class="col-sm-10">
				<form:password path="password" class="form-control"
                                id="password" placeholder="password" />
				<form:errors path="password" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="confirmPassword">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">confirm Password</label>
			<div class="col-sm-10">
				<form:password path="confirmPassword" class="form-control"
                                id="password" placeholder="password" />
				<form:errors path="confirmPassword" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="address">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Address</label>
			<div class="col-sm-10">
				<form:textarea path="address" rows="5" class="form-control"
                                id="address" placeholder="address" />
				<form:errors path="address" class="control-label" />
			</div>
		  </div>
		</spring:bind>


		<spring:bind path="sex">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Sex</label>
			<div class="col-sm-10">
				<label class="radio-inline">
                                  <form:radiobutton path="sex" value="M" /> Male
				</label>
                                <label class="radio-inline">
                                  <form:radiobutton path="sex" value="F" /> Female
				</label> <br />
				<form:errors path="sex" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="license">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">License</label>
			<div class="col-sm-10">				
				<form:input path="license" type="text" class="form-control"
                                id="license" placeholder="License" />
				<form:errors path="license" class="control-label" />
			</div>
		  </div>
		</spring:bind>



		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			<c:choose>
			  <c:when test="${userForm['new']}">
			     <button type="submit" class="btn-lg btn-primary pull-right">Add
                             </button>
			  </c:when>
			  <c:otherwise>
			     <button type="submit" class="btn-lg btn-primary pull-right">Update
                             </button>
			  </c:otherwise>
			</c:choose>
		  </div>
		</div>
	</form:form>

</div>

<jsp:include page="footer.jsp" />
</body>
</html>