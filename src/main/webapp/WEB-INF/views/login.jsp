<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<body>
<jsp:include page="header.jsp" />
<spring:url value="/users/register" var="urlRegister" />
<c:url var="loginUrl" value="/login" />

		<div id="mainWrapper">
		<div class="container">
		
			 <div class="row">
			<div class="col-md-6 mx-auto">
                    <span class="anchor" id="formLogin"></span>
			<!-- form card login -->
                    <div class="card rounded-0">
                        <div class="card-header">
                            <h3 class="mb-0">Login</h3>
                        </div>
                        <div class="card-body">
                            <form action="${loginUrl}" method="post" class="form" role="form" autocomplete="off" id="formLogin">
                            	<c:if test="${param.error != null}">
								<div class="alert alert-danger">
									<p>Invalid username and password.</p>
								</div>
								</c:if>
								<c:if test="${param.logout != null}">
									<div class="alert alert-success">
										<p>You have been logged out successfully.</p>
									</div>
								</c:if>
                                <div class="form-group">
                                    <label for="uname1">Username</label>
                                    <input type="text" class="form-control" name="ssoId" id="uname1" placeholder="Enter Username" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="password" class="form-control" id="pwd1" placeholder="Enter Password" required autocomplete="new-password">
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
                                
                                <button type="submit" class="btn btn-primary btn-block">Login</button>
                            </form>
                        </div>
                        <!--/card-block-->
                        <div>
							<a href="${urlRegister}" class="btn btn-link float-right">Register</a>
						</div>
                    </div>
                    <!-- /form card login -->
			</div>
			</div>
		</div>
		</div>
<jsp:include page="footer.jsp" />

</body>
</html>