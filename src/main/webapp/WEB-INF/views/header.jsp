<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<head>
<title>Mauritius Traffic Hazard Perception Test</title>

<spring:url value="/resources/css/hello.css" var="coreCss" />
<spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
<link href="<spring:url value='/resources/css/app.css' />" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
<script type="text/javascript" src="<spring:url value='/resources/js/jQuery.js'/>"></script>
</head>

<spring:url value="/" var="urlHome" />
<spring:url value="/tutorial" var="urlTutorial" />
<spring:url value="/test" var="urlTest" />
<spring:url value="/login" var="urlLogin" />
<spring:url value="/logout" var="urlLogout" />
<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
				<a class="navbar-brand" href="${urlHome}">Traffic Hazard</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#hazardNavbar" aria-controls="hazardNavbar" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>
			<div id="hazardNavbar" class="navbar-collapse collapse">
				<ul class="navbar-nav mr-auto">
			      <li class="nav-item active"><a class="nav-link" href="${urlHome}">Home</a></li>
			      <li class="nav-item"><a class="nav-link" href="${urlTutorial}">Tutorial</a></li>
			      <li class="nav-item"><a class="nav-link" href="${urlTest}">Test</a></li>
			      <li class="nav-item"><a class="nav-link" href="#">Page 3</a></li>
			    </ul>
			    <ul class="navbar-nav ml-auto">
			    	<li class="nav-item active">
			    	<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
				        <a class="nav-link" href="${urlLogin}">Login</a>
				    </sec:authorize>
				    <sec:authorize access="hasRole('ROLE_USER')">
				        <a class="nav-link" href="${urlLogout}">Logout</a>
				    </sec:authorize>
					</li>
					<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				        <c:if test = "${pageContext.response.locale.language == 'en'}">
					         English
					      </c:if>
					      <c:if test = "${pageContext.response.locale.language == 'fr'}">
					         Français
					      </c:if>
					      <c:if test = "${pageContext.response.locale.language == 'cr'}">
					         Créole
					      </c:if>
				          <span class="caret"></span>
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="?lang=en">English</a>
				          <a class="dropdown-item" href="?lang=fr">Français</a>
				          <a class="dropdown-item" href="?lang=cr">Créole</a>
				        </div>
				      </li>
				</ul>
			</div>
		</div>
</nav>
</header>