<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp" />
	<head>
		<style>
			table {
			    font-family: arial, sans-serif;
			    border-collapse: collapse;
			    width: 100%;
			}
			
			td, th {
			    border: 1px solid #dddddd;
			    text-align: left;
			    padding: 8px;
			}
			
			tr:nth-child(even) {
			    background-color: #dddddd;
			}
		</style>
	</head>
	<body>
		<div id="mainWrapper">
			<div class="container">
				<c:choose>
					<c:when test="${outcome eq 'PASS'}">
						<h2>Congratulations, you have successfully passed the test.</h2>
					</c:when>
					<c:otherwise>
						<h2>Sorry you failed the test. Please take another attempt.</h2>
					</c:otherwise>
				</c:choose>
				<h3>You scored ${totalScore} out of <c:out value="${5 * fn:length(resultList)}"/></h3>
				
				<table>
					<tr>
						<th>Video</th>
						<th>Hazard</th>
						<th>Score</th>
					</tr>
					<c:forEach items="${resultList}" var="result">
						<tr>
						    <td>${result.videoId}</td>
						    <td>${result.hazardId}</td>
						    <td>${result.score}</td>
						  </tr>
					</c:forEach>
					<tr>
					    <td colspan ="3" style="align:center">Please click <a href="https://goo.gl/forms/I8IufZkgQig6BOEY2" target="_blank">&nbsp;here&nbsp;</a> to take a quick survey.</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>
