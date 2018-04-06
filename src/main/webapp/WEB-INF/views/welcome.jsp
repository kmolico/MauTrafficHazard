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
			<h2><spring:message code="home.title" text="Default Hazard Perception Test"/></h2>
			<div style="margin:5% 0">
				<span style="font-weight:bold; font-size:18px"><spring:message code="home.para1.bold" text="Default Hazard Perception Test"/></span>
				<span style="font-size:16px"><spring:message code="home.para1.text" text="Default Hazard Perception Test"/></span>	
			</div>
			
			<h4><spring:message code="home.para2.bold" text="Default Hazard Perception Test"/></h4>
			<span style="font-size:16px"><spring:message code="home.para2.text" text="Default Hazard Perception Test"/></span>	
			
			<div style="margin:5% 0">
				<h4><spring:message code="home.para3.bold" text="Default Hazard Perception Test"/></h4>
				<span style="font-size:16px"><spring:message code="home.para3.text" text="Default Hazard Perception Test"/></span>	
			</div>
			
		</div>
	</div>
<jsp:include page="footer.jsp" />

</body>
</html>