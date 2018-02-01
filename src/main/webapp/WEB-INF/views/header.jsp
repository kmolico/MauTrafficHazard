<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
<title>Mauritius Traffic Hazard Perception Test</title>

<spring:url value="/resources/css/hello.css" var="coreCss" />
<spring:url value="/resources/css/bootstrap.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
<link href="<spring:url value='/resources/css/app.css' />" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
<script type="text/javascript" src="resources/js/jQuery.js"></script>
</head>

<spring:url value="/" var="urlHome" />
<spring:url value="/tutorial" var="urlTutorial" />
<spring:url value="/test" var="urlTest" />
<spring:url value="/login" var="urlLogin" />
<spring:url value="/logout" var="urlLogout" />

<nav class="navbar navbar-inverse ">
	<div class="container">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${urlHome}">Traffic Hazard</a>
			</div>
			<ul class="nav navbar-nav">
		      <li class="active"><a href="${urlHome}">Home</a></li>
		      <li><a href="${urlTutorial}">Tutorial</a></li>
		      <li><a href="${urlTest}">Test</a></li>
		      <li><a href="#">Page 3</a></li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		    	<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
			        <li class="active"><a href="${urlLogin}">Login</a></li>
			    </sec:authorize>
			    <sec:authorize access="hasRole('ROLE_USER')">
			        <li class="active"><a href="${urlLogout}">Logout</a></li>
			    </sec:authorize>
				
			</ul>
	    </div>

	</div>
</nav>