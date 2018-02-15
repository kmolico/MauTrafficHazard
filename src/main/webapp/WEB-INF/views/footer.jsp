<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

	<footer class="footer">
		<div class="container">
			<span class="text-muted">&copy; MDX 2018</span>
		</div>
	</footer>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<spring:url value="/resources/js/hello.js" var="coreJs" />
<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>


