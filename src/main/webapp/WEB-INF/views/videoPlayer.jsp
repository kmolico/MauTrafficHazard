<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp" />

<spring:url value="/getTutorialVideo" var="getTutorialVideo" />
<spring:url value="/getNextVideo" var="getNextVideo" />
<spring:url value="/getResult" var="getResult" />

<c:url var="home" value="/" scope="request" />

<c:set var="hazards" value="${videoObject.listTimeFrame}"/>
<c:forEach var="hazard" items="${hazards}">
	<spring:message var="hazDesc" code='${hazard.hazardDesc}'/>
	<c:set var="hazardDesc" value="${hazardDesc}${ hazDesc}">
	</c:set>
</c:forEach>


<script>
$(document).ready(function(){
	var videoDetails = ${videoDetails};
	var testMode = ${testMode};
	var remainingVideo = ${remainingVideo};
	var reviewMode = false;
	var flagTime = [];
	var flagCount = 0;
	var vid = document.getElementById("tutorial");
	var remainingClicks = 5;
	
	
	$('#start_icon').click(function() {
		$('#video_overlay').hide();
		$("#tutorial").get(0).play();
	});
	$('#review_icon').click(function() {
		reviewMode = true;
		$('#score_overlay').hide();
		$(".reviewFrame").remove();
		//$('#video_overlay').show();
		var totalWidth = $("#custom-seekbar").width();
		$.each(videoDetails.listTimeFrame, function( index, hazard ) {
			//$.each(flagTime, function(index, item) {
				var startTime = hazard.hazardStart;
			    var percentage1 = (100 / vid.duration) * startTime;
			    var endTime = hazard.hazardEnd;
			    var percentage = (100 / vid.duration) * endTime;
			    var interval = (percentage-percentage1)/5;
			    
			    
			    $('#custom-seekbar').append('<span id="'+"frame1"+index+'" class="reviewFrame" style="background-color:#0f0"></span>');
			    $("#frame1"+index).css("left", percentage1+"%");  
			    $("#frame1"+index).css("width", interval+"%");
			    
			    $('#custom-seekbar').append('<span id="'+"frame2"+index+'" class="reviewFrame" style="background-color:#af0"></span>');
			    $("#frame2"+index).css("left", percentage1+interval+"%");  
			    $("#frame2"+index).css("width", interval+"%");
			    
			    $('#custom-seekbar').append('<span id="'+"frame3"+index+'" class="reviewFrame" style="background-color:#ff0"></span>');
			    $("#frame3"+index).css("left", percentage1+(2*interval)+"%");  
			    $("#frame3"+index).css("width", (interval)+"%");
			    
			    $('#custom-seekbar').append('<span id="'+"frame4"+index+'" class="reviewFrame" style="background-color:#f60"></span>');
			    $("#frame4"+index).css("left", percentage1+(3*interval)+"%");  
			    $("#frame4"+index).css("width", (interval)+"%");
			    
			    $('#custom-seekbar').append('<span id="'+"frame5"+index+'" class="reviewFrame" style="background-color:#f00"></span>');
			    $("#frame5"+index).css("left", percentage1+(4*interval)+"%");  
			    $("#frame5"+index).css("width", (interval)+"%");
			    
			    
			//});
		});
		$("#hazardDesc").text('${hazardDesc}');
		
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
	  $("#custom-seekbar #seek").css("width", percentage+"%");
	};

	/* $("#custom-seekbar").on("click", function(e){
	    var offset = $(this).offset();
	    var left = (e.pageX - offset.left);
	    var totalWidth = $("#custom-seekbar").width();
	    var percentage = ( left / totalWidth );
	    var vidTime = vid.duration * percentage;
	    vid.currentTime = vidTime;
	}); */
	
	$("#tutorial").on("click", function(e){
		if(!reviewMode){
			remainingClicks = remainingClicks - 1;
			if(remainingClicks >= 0){
				/* $("#remainingClick").text(remainingClicks); */
				var currentTime = vid.currentTime;
			    var percentage = (100 / vid.duration) * currentTime;
			    var totalWidth = $("#custom-seekbar").width();
			    var left = (totalWidth / 100) * percentage;
			    
			    flagCount = flagCount + 1;
			    flagTime.push(currentTime);
			    var imageId = "flag"+flagCount;
			    $('#flag-container').append('<img style="position:absolute;" id='+imageId+' width="4%" height="100%" src="<%=request.getContextPath() %>/resources/images/Redflag.png"/>');
			    $('#'+imageId).css("left", percentage-1 +"%");
			}
		}
	});
	
	$('#tutorial').on('ended',function(){
		var totalScore = 0;
		$.each(videoDetails.listTimeFrame, function( index, hazard ) {
			$.each(flagTime, function(index, item) {
				var score = calcScore(item, hazard.hazardStart, hazard.hazardEnd);
				totalScore = totalScore + score;
				if(testMode){
					//async save score
					saveScore(hazard.hazardId, score);
				}
				if(score > 0){
					return false;
				}
				
			});
			
		});
		$('#score').text(totalScore + "/" + (videoDetails.listTimeFrame.length * 5));
		if(testMode){
			if(remainingVideo == 0){
				$('#result_overlay').show();
			}
			else{
				$('#next_overlay').show();
			}
		}
		else{
			$('#score_overlay').show();
		}
		
	});
	
	function reset(){
		flagCount = 0;
		flagTime = [];
		firstClick = false;
		$('#flag-container').empty();
		$(".reviewFrame").remove();
		reviewMode = false;
		remainingClicks = 5;
		/* $("#remainingClick").text(remainingClicks); */
		$("#hazardDesc").empty();
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
	
	function saveScore(hazardId, score){
		$.ajax({
			type: "POST",
			url: "${home}test/saveScore", 
			data : {hazardId : hazardId, score : score},
			success: function (data) {
				console.log(data);
	        },
	        error: function (e) {
	        	console.log("ERROR: ", e);
	        }
		});
	}
	
	$('#next_icon').click(function() {
		reset();
		$('#next_overlay').hide();
		$("#tutorial").get(0).play();
	});

});	
</script>


<body>
	
	<div id="mainWrapper">
		<div class="container">
		<div class="responsiveH2"><%-- <spring:message code="video.player.label.remaining.click" text="Remaining Clicks: "/><span id="remainingClick">5</span> --%></div>
			<div id="video-frame">
				<div class="card">
					<div id="video_overlay" class="vidready">
						<div class="icon" id="start_icon"><spring:message code="button.start.text" text="Start"/></div>
					</div>
					<div id="score_overlay" class="vidready" style="display:none">
						<div id="result"><spring:message code="video.player.label.score" text="Your Score:"/><span id="score"></span></div>
						<div class="icon" id="retry_icon"><spring:message code="button.retry.text" text="Retry"/></div>
						<div class="icon" id="review_icon"><spring:message code="button.review.text" text="Review"/></div>
						<div class="icon" id="back_icon"><spring:message code="button.back.text" text="Back"/></div>
					</div>
					<div id="next_overlay" class="vidready" style="display:none">
						<a href="${getNextVideo}"><div class="icon" id="next_icon"><spring:message code="button.next.text" text="Next"/></div></a>
					</div>
					<div id="result_overlay" class="vidready" style="display:none">
						<a href="${getResult}"><div class="icon" id="result_icon"><spring:message code="button.view.result.text" text="View Result"/></div></a>
					</div>
					<div>
						<video id="tutorial" width="100%" preload="auto"> 
						  <source id="videoSource" src="${getTutorialVideo}" type="video/mp4">
						</video>
					</div>
					
					<div id="flag-container">
					</div>	
					<div id="custom-seekbar">
					  	<span id="seek"></span>
					</div>			
				</div>
			</div>
			<div>
				<p class="text-info hazard_desc" id="hazardDesc"></p>
			</div>
		</div>
	</div>
</body>
</html>