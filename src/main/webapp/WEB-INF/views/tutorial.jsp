<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp" />

<spring:url value="/17060012/tutorial" var="urlVideo1" />
<spring:url value="/10020003/tutorial" var="urlVideo2" />

<script>
$(document).ready(function(){
	var flagCount = 0;
	var vid = document.getElementById("tutorial");
	var firstClick = false;
	
	$('#video_overlay').click(function() {
		$('#video_overlay').hide();
		$("#tutorial").get(0).play();
		firstClick = true;
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
	
	$("#video-frame").on("click", function(e){
		if(firstClick == false){
		    var percentage = (100 / vid.duration) * vid.currentTime;
		    var totalWidth = $("#custom-seekbar").width();
		    var left = (totalWidth / 100) * percentage;
		    
		    flagCount = flagCount + 1;
		    var imageId = "flag"+flagCount;
		    $('#flag-container').append('<img style="position:absolute;" id='+imageId+' width="30px" height="30px" src="<%=request.getContextPath() %>/resources/images/Redflag.png"/>');
		    $('#'+imageId).offset({left: $('#'+imageId).offset().left + left - 8});
		}
		else{
			firstClick = false;
		}
		
	});
	
	$('#tutorial').on('ended',function(){
		reset();
		$('#videoSource').attr('src','${urlVideo2}');
		$('#tutorial').load();
		$('#video_overlay').show();
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
	
			<h1>Hello, the tutorial will start shortly..</h1>
			<div id="video-frame">
				<div class="embed-responsive embed-responsive-4by3">
					<div id="video_overlay" class="vidready">
						<div id="icon">Click to start</div>
					</div>
					<div>
						<video id="tutorial" width="100%" preload="auto"> 
						  <source id="videoSource" src="${urlVideo1}" type="video/mp4">
						</video>
					</div>
					<div id="flag-container">
					</div>	
					<div id="custom-seekbar">
					  	<span></span>
					</div>			
				</div>
			</div>
			
	
		</div>
	</div>
<jsp:include page="footer.jsp" />

</body>
</html>