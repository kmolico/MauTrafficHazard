<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp" />

<spring:url value="/getTutorialVideo" var="getTutorialVideo" />


<script>
$(document).ready(function(){
	var videoDetails = ${videoDetails};
	
	var flagTime = [];
	var flagCount = 0;
	var vid = document.getElementById("tutorial");
	
	$('#start_icon').click(function() {
		$('#video_overlay').hide();
		$("#tutorial").get(0).play();
	});
	$('#review_icon').click(function() {
		$('#score_overlay').hide();
		//$('#video_overlay').show();
		$("#tutorial").get(0).play();
	});
	
	$('#retry_icon').click(function() {
		reset();
		$('#score_overlay').hide();
		$('#video_overlay').show();
	});
	
	$('#back_icon').click(function() {
		reset();
		window.history.back();
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
	});
	
	$("#tutorial").on("click", function(e){
			var currentTime = vid.currentTime;
		    var percentage = (100 / vid.duration) * currentTime;
		    var totalWidth = $("#custom-seekbar").width();
		    var left = (totalWidth / 100) * percentage;
		    
		    flagCount = flagCount + 1;
		    flagTime.push(currentTime);
		    var imageId = "flag"+flagCount;
		    $('#flag-container').append('<img style="position:absolute;" id='+imageId+' width="4%" height="100%" src="<%=request.getContextPath() %>/resources/images/Redflag.png"/>');
		    $('#'+imageId).offset({left: $('#'+imageId).offset().left + left - 8});
		
	});
	
	$('#tutorial').on('ended',function(){
		var totalScore = 0;
		$.each(videoDetails.listTimeFrame, function( index, hazard ) {
			$.each(flagTime, function(index, item) {
				totalScore = totalScore + calcScore(item, hazard.start, hazard.end);
			});
		});
		$('#score').text(totalScore + "/" + (videoDetails.listTimeFrame.length * 5));
		//$('#videoSource').attr('src','${urlVideo2}');
		//$('#tutorial').load();
		$('#score_overlay').show();
	});
	
	function reset(){
		flagCount = 0;
		flagTime = [];
		firstClick = false;
		$('#flag-container').empty();
	}
	
	function calcScore(actual, start, end){
		if(actual >= start && actual <= end){
			var timeBeforeZero = end-actual;
			var interval = (end-start)/5;
			var score = timeBeforeZero / interval;
			return Math.ceil(score);
		}
		else{
			return 0;
		}
		
	}

});
</script>

<body>
	<div id="mainWrapper">
		<div class="container">
	
			<h2>Hazard Perception tutorial</h2>
			<p class="text-info">This tutorial has 5 clips, each with 1 developing hazard.</p>
			<p class="text-info">Tap or click the video when you feel you are encountering a developing hazard. This is something that would cause you to take some form of action, such as changing speed or direction. A red flag will appear at the bottom of the screen to show your response.</p>
			<p class="text-info">You will score 5 points for each developing hazard. The earlier you recognise and respond to the hazard, the more points you will receive.</p>
			<div id="video-frame">
				<div class="card">
					<div id="video_overlay" class="vidready">
						<div class="icon" id="start_icon">Start</div>
					</div>
					<div id="score_overlay" class="vidready" style="display:none">
						<div id="result">Your Score: <span id="score"></span></div>
						<div class="icon" id="retry_icon">Retry</div>
						<div class="icon" id="review_icon">Review</div>
						<div class="icon" id="back_icon">Back</div>
					</div>
					<div>
						<video id="tutorial" width="100%" preload="auto" controls> 
						  <source id="videoSource" src="${getTutorialVideo}" type="video/mp4">
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