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
	
			<h1><spring:message code="test.info.hello" text="Hello"/> ${user}, <br/>
			<spring:message code="test.info.text1" text="Default text"/><br/>
			<spring:message code="test.info.text2" text="Default text"/></h1>
			<c:choose>
				<c:when test="${videoCount eq 0}">
					<a href="<c:url value="/test/load" />">
						<div class="icon" id="start_test_icon"><spring:message code="button.agree.start" text="Agree and Start"/></div>
					</a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value="/test/load" />">
						<div class="icon" id="start_test_icon"><spring:message code="button.resume" text="Resume"/></div>
					</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
<%-- <jsp:include page="footer.jsp" /> --%>

</body>
</html>