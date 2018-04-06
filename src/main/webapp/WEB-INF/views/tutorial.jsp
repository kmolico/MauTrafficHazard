<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp" />

<spring:url value="/17060012/tutorial" var="urlVideo1" />
<spring:url value="/10020003/tutorial" var="urlVideo2" />
<spring:url value="/getTutorialVideo" var="getTutorialVideo" />


<script>
$(document).ready(function(){
	var flagCount = 0;
	var vid = document.getElementById("tutorial");
	
	$('#video_overlay #icon').click(function() {
		$('#video_overlay').hide();
		$("#tutorial").get(0).play();
	});
	
	$('#next_overlay #icon').click(function() {
		$('#next_overlay').hide();
		$('#video_overlay').show();
	});
	
	vid.ontimeupdate = function(){
	  var percentage = ( vid.currentTime / vid.duration ) * 100;
	  $("#custom-seekbar span").css("width", percentage+"%");
	};

	$("#custom-seekbar").on("click", function(e){
	    var offset = $(this).offset();
	    var left = (e.pageX - offset.left);
	    var totalWidth = $("#custom-seekbar").width();
	    var percentage = ( left / totalWidth );
	    var vidTime = vid.duration * percentage;
	    vid.currentTime = vidTime;
	});//click() 
	
	$("#tutorial").on("click", function(e){
		    var percentage = (100 / vid.duration) * vid.currentTime;
		    var totalWidth = $("#custom-seekbar").width();
		    var left = (totalWidth / 100) * percentage;
		    
		    flagCount = flagCount + 1;
		    var imageId = "flag"+flagCount;
		    $('#flag-container').append('<img style="position:absolute;" id='+imageId+' width="30px" height="30px" src="<%=request.getContextPath() %>/resources/images/Redflag.png"/>');
		    $('#'+imageId).offset({left: $('#'+imageId).offset().left + left - 8});
		
	});
	
	$('#tutorial').on('ended',function(){
		reset();
		$('#videoSource').attr('src','${urlVideo2}');
		$('#tutorial').load();
		$('#next_overlay').show();
	});
	
	function reset(){
		flagCount = 0;
		firstClick = false;
		$('#flag-container').empty();
	}

});
</script>

<body>
	<div id="mainWrapper">
		<div class="container">
	
			<h2><spring:message code="tutorial.title" text="Default Hazard Perception Test"/></h2>
			<p class="text-info"><spring:message code="tutorial.info.line.1" text="Default Hazard Perception Test"/></p>
			<p class="text-info"><spring:message code="tutorial.info.line.2" text="Default Hazard Perception Test"/></p>
			<p class="text-info"><spring:message code="tutorial.info.line.3" text="Default Hazard Perception Test"/></p>
			
			<div class="card-deck">
				<c:forEach items="${listVideos}" var="video">
					<a href="<c:url value="/tutorial/${video.videoId}" />">
						  <div class="card">
						  	<img class="card-img-top" src="<c:url value="${video.thumbnailUrl}" />" alt="Beginner">
						    <div class="card-img-overlay" style="display:none; background-color:#00000085"></div>
						    <div class="card-block">
						      <h4 class="card-title">${video.difficultyDesc}</h4>
						      <p class="card-text">Hazard perception test 1</p>
						      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
						    </div>
						  </div>
					</a>
				</c:forEach>
			</div>
			
	
		</div>
	</div>
<jsp:include page="footer.jsp" />

</body>
</html>