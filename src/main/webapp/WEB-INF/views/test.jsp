<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp" />

<body>
	<div id="mainWrapper">
		<div class="container">
	
			<h1>Hello ${user}, <br/>your test will begin shortly.. <br/>Click on the start button below to start your test.</h1>
			<c:choose>
				<c:when test="${videoCount eq 0}">
					<a href="<c:url value="/test/load" />">
						<div class="icon" id="start_test_icon">Agree and Start</div>
					</a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value="/test/load" />">
						<div class="icon" id="start_test_icon">Resume</div>
					</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
<%-- <jsp:include page="footer.jsp" /> --%>

</body>
</html>