<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp" />
<div id="mainWrapper">
<div class="container">

	<c:choose>
		<c:when test="${userForm['new']}">
			<h2><spring:message code="registration.account.info" text="Account Information "/></h2>
		</c:when>
		<c:otherwise>
			<h2><spring:message code="registration.account.info" text="Account Information "/></h2>
		</c:otherwise>
	</c:choose>
	<br />

	<spring:url value="/users" var="userActionUrl" />

	<form:form class="form-horizontal" method="post"
                modelAttribute="userForm" action="${userActionUrl}">

		<form:hidden path="id" />

		<spring:bind path="name">
		<spring:message code="registration.username" text="Username" var="username"/>
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"><spring:message code="registration.username" text="Username"/></label>
			<div class="col-sm-10">
				<form:input path="name" type="text" class="form-control"
                                id="name" placeholder="${username }" />
				<form:errors path="name" class="col-form-label text-danger" />
			</div>
		  </div>
		</spring:bind>
		
		<spring:bind path="fname">
		<spring:message code="registration.firstname" text="First Name" var="fname"/>
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"><spring:message code="registration.firstname" text="First Name"/></label>
			<div class="col-sm-10">
				<form:input path="fname" type="text" class="form-control"
                                id="fname" placeholder="${fname }" />
				<form:errors path="fname" class="col-form-label text-danger" />
			</div>
		  </div>
		</spring:bind>
		
		<spring:bind path="lname">
		<spring:message code="registration.lastname" text="Last Name" var="lname"/>
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"><spring:message code="registration.lastname" text="Last Name"/></label>
			<div class="col-sm-10">
				<form:input path="lname" type="text" class="form-control"
                                id="lname" placeholder="${lname }" />
				<form:errors path="lname" class="col-form-label text-danger" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="email">
		<spring:message code="registration.email" text="Email" var="email"/>
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"><spring:message code="registration.email" text="Email"/></label>
			<div class="col-sm-10">
				<form:input path="email" class="form-control"
                                id="email" placeholder="${email }" />
				<form:errors path="email" class="col-form-label text-danger" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="password">
		<spring:message code="registration.password" text="Password" var="pwd"/>
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"><spring:message code="registration.password" text="Password"/></label>
			<div class="col-sm-10">
				<form:password path="password" class="form-control"
                                id="password" placeholder="${pwd }" />
				<form:errors path="password" class="col-form-label text-danger" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="confirmPassword">
		<spring:message code="registration.confirm.password" text="Confirm Password" var="confPwd"/>
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"><spring:message code="registration.confirm.password" text="Confirm Password"/></label>
			<div class="col-sm-10">
				<form:password path="confirmPassword" class="form-control"
                                id="password" placeholder="${confPwd }" />
				<form:errors path="confirmPassword" class="col-form-label text-danger" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="address">
		<spring:message code="registration.address" text="Address" var="address"/>
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"><spring:message code="registration.address" text="Address"/></label>
			<div class="col-sm-10">
				<form:textarea path="address" rows="5" class="form-control"
                                id="address" placeholder="${address }" />
				<form:errors path="address" class="col-form-label text-danger" />
			</div>
		  </div>
		</spring:bind>


		<spring:bind path="sex">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"><spring:message code='registration.gender' text='Gender'/></label>
			<div class="col-sm-10">
				<label class="radio-inline">
                                  <form:radiobutton path="sex" value="M" /> <spring:message code='registration.male' text='Male'/>
				</label>
                                <label class="radio-inline">
                                  <form:radiobutton path="sex" value="F" /> <spring:message code='registration.female' text='Female'/>
				</label> <br />
				<form:errors path="sex" class="col-form-label text-danger" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="license">
		<spring:message code="registration.driving.license" text="Driving License" var="license"/>	
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"><spring:message code="registration.driving.license" text="Driving License"/></label>
			<div class="col-sm-10">		
				<form:input path="license" type="text" class="form-control"
                                id="license" placeholder="${license}" />
				<form:errors path="license" class="col-form-label text-danger" />
			</div>
		  </div>
		</spring:bind>



		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			<c:choose>
			  <c:when test="${userForm['new']}">
			     <button type="submit" class="btn btn-primary float-right">Add
                             </button>
			  </c:when>
			  <c:otherwise>
			     <button type="submit" class="btn btn-primary float-right">Update
                             </button>
			  </c:otherwise>
			</c:choose>
		  </div>
		</div>
	</form:form>

</div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>