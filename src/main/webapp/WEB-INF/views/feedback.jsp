<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp" />
<div id="mainWrapper">
<div class="container">

<spring:url value="/feedback/save" var="saveFeedback" />

<div class="feedbackInfo">
	<div>
		<h3>Development of an Interactive an Interactive Tool to Assess Hazard Perception Skills of Drivers in Mauritius</h3>
	</div>
	<div>
		<span class="text-info">This research study involves the development of an interactive tool to assess the hazard
			perception skills of drivers in Mauritius. In particular, the results of this study are expected to
			highlight more specific actions towards reducing the number of road accidents within the
			island.
		</span>
	</div>
	
	<div>
		<h5>OATH OF CONFIDENTIALITY</h5>
	</div>
	<div>
		<span class="text-info">This is to certify that any information (written, verbal or other form) obtained during the
			performance of this test will remain confidential. This includes all the information about the
			participants, the institutions and any other confidential information being asked throughout
			this survey. We understand that any unauthorized release or carelessness in the handling of
			this survey questionnaire is considered a breach of the duty to maintain confidentiality. Any
			breach of duty in maintaining confidentiality is liable to any legal action arising from such
			breach.
		</span>
	</div>
	
	<div>
		<h5>PLEASE NOTE</h5>
	</div>
	<div>
		<ul>
			  <li><span class="text-info">You are not required to identify yourself and your responses shall not reveal your identification.</span></li>
			  <li><span class="text-info">Feel free to seek any clarification and ask any question(s) regarding the research project from the investigator.</span></li> 
			  <li><span class="text-info">All responses will be treated in strict confidentiality and will be used solely for academic research purposes.</span></li> 
			  <li><span class="text-info">Completing this questionnaire should take approximately 5 to 8 minutes.</span></li> 
		</ul>	
	</div>
</div>

<form:form class="form-horizontal" method="post" modelAttribute="feedbackForm" action="${saveFeedback}">
<fieldset>
<form:hidden path="feedbackId" />

	<div>
		<h6>SECTION 1: Prioritization of Hazards</h6>
	</div>
	<div>
		<span class="text-info">Please respond to each of the following statement on a scale of 1 to 5 by selecting one of the
			numbers (1 being you strongly disagree and 5 being you strongly agree).
		</span>
	</div>
	
	<div class="bg-info row">
		<div class="col-5">1.1 Road Conditions</div>
		<div class="col">Strongly Disagree</div>
		<div class="col">Disagree</div>
		<div class="col">Neutral</div>
		<div class="col">Agree</div>
		<div class="col">Strongly Agree</div>
	</div>
	
	<div>
		<span class="text-primary"><strong>How far do you agree with the current road conditions?</strong></span>
	</div>
	
<!-- Multiple Radios (inline) -->
  <form:errors path="q111" cssClass="col-form-label text-danger" />
<div class="form-group row">
	<div class="col-5"><label class="col control-label" for="111">1. Bad road pavement surface</label></div>
  

    <div class="col"><label class="radio-inline" for="111-0">
      <form:radiobutton path="q111" id="111-0" value="1"/>
      1
    </label> 
    </div>
    <div class="col"><label class="radio-inline" for="111-1">
      <form:radiobutton path="q111" id="111-1" value="2"/>
      2
    </label> 
    </div>
    <div class="col"><label class="radio-inline" for="111-2">
      <form:radiobutton path="q111" id="111-2" value="3"/>
      3
    </label> 
    </div>
    <div class="col"><label class="radio-inline" for="111-3">
      <form:radiobutton path="q111" id="111-3" value="4"/>
      4
    </label> 
    </div>
    <div class="col"><label class="radio-inline" for="111-4">
      <form:radiobutton path="q111" id="111-4" value="5"/>
      5
    </label></div>
</div>

<form:errors path="q112" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row row">
  <div class="col-5"><label class="col control-label" for="112">2. Pot holes on the road</label></div>
  
   
    <div class="col"><label class="radio-inline" for="112-0">
      <form:radiobutton path="q112" id="112-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="112-1">
      <form:radiobutton path="q112" id="112-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="112-2">
      <form:radiobutton path="q112" id="112-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="112-3">
      <form:radiobutton path="q112" id="112-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="112-4">
      <form:radiobutton path="q112" id="112-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q113" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="113">3. Poorly maintained roadside trees</label></div>

   
    <div class="col"><label class="radio-inline" for="113-0">
      <form:radiobutton path="q113" id="113-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="113-1">
      <form:radiobutton path="q113" id="113-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="113-2">
      <form:radiobutton path="q113" id="113-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="113-3">
      <form:radiobutton path="q113" id="113-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="113-4">
      <form:radiobutton path="q113" id="113-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q114" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="114">4. Missing traffic signals</label></div>

   
    <div class="col"><label class="radio-inline" for="114-0">
      <form:radiobutton path="q114" id="114-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="114-1">
      <form:radiobutton path="q114" id="114-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="114-2">
      <form:radiobutton path="q114" id="114-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="114-3">
      <form:radiobutton path="q114" id="114-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="114-4">
      <form:radiobutton path="q114" id="114-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q115" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="115">5. Road debris/obstacles (E.g. litter, rocks, branches)</label></div>

   
    <div class="col"><label class="radio-inline" for="115-0">
      <form:radiobutton path="q115" id="115-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="115-1">
      <form:radiobutton path="q115" id="115-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="115-2">
      <form:radiobutton path="q115" id="115-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="115-3">
      <form:radiobutton path="q115" id="115-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="115-4">
      <form:radiobutton path="q115" id="115-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q116" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="116">6. Narrow and congested roads</label></div>

   
    <div class="col"><label class="radio-inline" for="116-0">
      <form:radiobutton path="q116" id="116-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="116-1">
      <form:radiobutton path="q116" id="116-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="116-2">
      <form:radiobutton path="q116" id="116-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="116-3">
      <form:radiobutton path="q116" id="116-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="116-4">
      <form:radiobutton path="q116" id="116-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q117" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="117">7. Unmarked speed breakers</label></div>

   
    <div class="col"><label class="radio-inline" for="117-0">
      <form:radiobutton path="q117" id="117-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="117-1">
      <form:radiobutton path="q117" id="117-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="117-2">
      <form:radiobutton path="q117" id="117-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="117-3">
      <form:radiobutton path="q117" id="117-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="117-4">
      <form:radiobutton path="q117" id="117-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q118" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="118">8. Improper road lightings</label></div>

   
    <div class="col"><label class="radio-inline" for="118-0">
      <form:radiobutton path="q118" id="118-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="118-1">
      <form:radiobutton path="q118" id="118-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="118-2">
      <form:radiobutton path="q118" id="118-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="118-3">
      <form:radiobutton path="q118" id="118-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="118-4">
      <form:radiobutton path="q118" id="118-4" value="5"/>
      5
    </label></div>
</div>

	
	<div class="bg-info row">
		<div class="col-5">1.2 Animal and Weather Conditions</div>
		<div class="col">Strongly Disagree</div>
		<div class="col">Disagree</div>
		<div class="col">Neutral</div>
		<div class="col">Agree</div>
		<div class="col">Strongly Agree</div>
	</div>
	
	<div>
		<span class="text-primary"><strong>How far do you agree with the following?</strong></span>
	</div>

  <form:errors path="q121" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="121">1. There is often sudden crossing of animals on our roads</label></div>

   
    <div class="col"><label class="radio-inline" for="121-0">
      <form:radiobutton path="q121" id="121-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="121-1">
      <form:radiobutton path="q121" id="121-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="121-2">
      <form:radiobutton path="q121" id="121-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="121-3">
      <form:radiobutton path="q121" id="121-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="121-4">
      <form:radiobutton path="q121" id="121-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q122" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="122">2. Our road is very slippery during rainy conditions</label></div>

   
    <div class="col"><label class="radio-inline" for="122-0">
      <form:radiobutton path="q122" id="122-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="122-1">
      <form:radiobutton path="q122" id="122-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="122-2">
      <form:radiobutton path="q122" id="122-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="122-3">
      <form:radiobutton path="q122" id="122-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="122-4">
      <form:radiobutton path="q122" id="122-4" value="5"/>
      5
    </label></div>
</div>

<div class="bg-info row">
		<div class="col-5">1.3 Human Related Actions</div>
		<div class="col">Strongly Disagree</div>
		<div class="col">Disagree</div>
		<div class="col">Neutral</div>
		<div class="col">Agree</div>
		<div class="col">Strongly Agree</div>
	</div>
	
	<div>
		<span class="text-primary"><strong>How far do you agree with the following?</strong></span>
	</div>

  <form:errors path="q131" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="131">1. Motocyclists do not keep inline and swerves</label></div>

   
    <div class="col"><label class="radio-inline" for="131-0">
      <form:radiobutton path="q131" id="131-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="131-1">
      <form:radiobutton path="q131" id="131-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="131-2">
      <form:radiobutton path="q131" id="131-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="131-3">
      <form:radiobutton path="q131" id="131-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="131-4">
      <form:radiobutton path="q131" id="131-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q132" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="132">2. Motorcyclists overtaking on the left</label></div>

   
    <div class="col"><label class="radio-inline" for="132-0">
      <form:radiobutton path="q132" id="132-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="132-1">
      <form:radiobutton path="q132" id="132-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="132-2">
      <form:radiobutton path="q132" id="132-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="132-3">
      <form:radiobutton path="q132" id="132-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="132-4">
      <form:radiobutton path="q132" id="132-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q133" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="133">3. Sudden crossing of pedestrians</label></div>

   
    <div class="col"><label class="radio-inline" for="133-0">
      <form:radiobutton path="q133" id="133-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="133-1">
      <form:radiobutton path="q133" id="133-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="133-2">
      <form:radiobutton path="q133" id="133-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="133-3">
      <form:radiobutton path="q133" id="133-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="133-4">
      <form:radiobutton path="q133" id="133-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q134" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="134">4. Pedestrians not abiding to road rules and regulations</label></div>

   
    <div class="col"><label class="radio-inline" for="134-0">
      <form:radiobutton path="q134" id="134-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="134-1">
      <form:radiobutton path="q134" id="134-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="134-2">
      <form:radiobutton path="q134" id="134-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="134-3">
      <form:radiobutton path="q134" id="134-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="134-4">
      <form:radiobutton path="q134" id="134-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q135" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="135">5. Vehicle suddenly emerging abruptly from junctions</label></div>

   
    <div class="col"><label class="radio-inline" for="135-0">
      <form:radiobutton path="q135" id="135-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="135-1">
      <form:radiobutton path="q135" id="135-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="135-2">
      <form:radiobutton path="q135" id="135-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="135-3">
      <form:radiobutton path="q135" id="135-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="135-4">
      <form:radiobutton path="q135" id="135-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q136" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="136">6. Faulty overtaking by vehicles</label></div>

   
    <div class="col"><label class="radio-inline" for="136-0">
      <form:radiobutton path="q136" id="136-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="136-1">
      <form:radiobutton path="q136" id="136-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="136-2">
      <form:radiobutton path="q136" id="136-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="136-3">
      <form:radiobutton path="q136" id="136-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="136-4">
      <form:radiobutton path="q136" id="136-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q137" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="137">7. Heavy vehicles not using crawler/shoulder lanes</label></div>

   
    <div class="col"><label class="radio-inline" for="137-0">
      <form:radiobutton path="q137" id="137-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="137-1">
      <form:radiobutton path="q137" id="137-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="137-2">
      <form:radiobutton path="q137" id="137-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="137-3">
      <form:radiobutton path="q137" id="137-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="137-4">
      <form:radiobutton path="q137" id="137-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q138" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="138">8. Parked vehicle door opening</label></div>

   
    <div class="col"><label class="radio-inline" for="138-0">
      <form:radiobutton path="q138" id="138-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="138-1">
      <form:radiobutton path="q138" id="138-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="138-2">
      <form:radiobutton path="q138" id="138-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="138-3">
      <form:radiobutton path="q138" id="138-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="138-4">
      <form:radiobutton path="q138" id="138-4" value="5"/>
      5
    </label></div>
</div>

<div class="bg-info row">
		<div class="col-5">1.3 Hazard Significance</div>
		<div class="col">Strongly Disagree</div>
		<div class="col">Disagree</div>
		<div class="col">Neutral</div>
		<div class="col">Agree</div>
		<div class="col">Strongly Agree</div>
	</div>
	
	<div>
		<span class="text-primary"><strong>Which of the following road hazard category is more significant and causes greater collisions risk:</strong></span>
	</div>
	
  <form:errors path="q141" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="141">1. Road conditions</label></div>

   
    <div class="col"><label class="radio-inline" for="141-0">
      <form:radiobutton path="q141" id="141-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="141-1">
      <form:radiobutton path="q141" id="141-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="141-2">
      <form:radiobutton path="q141" id="141-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="141-3">
      <form:radiobutton path="q141" id="141-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="141-4">
      <form:radiobutton path="q141" id="141-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q142" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="142">2. Animals</label></div>

   
    <div class="col"><label class="radio-inline" for="142-0">
      <form:radiobutton path="q142" id="142-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="142-1">
      <form:radiobutton path="q142" id="142-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="142-2">
      <form:radiobutton path="q142" id="142-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="142-3">
      <form:radiobutton path="q142" id="142-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="142-4">
      <form:radiobutton path="q142" id="142-4" value="5"/>
      5
    </label></div>
</div>


  <form:errors path="q143" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="143">3. Weather conditions</label></div>

   
    <div class="col"><label class="radio-inline" for="143-0">
      <form:radiobutton path="q143" id="143-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="143-1">
      <form:radiobutton path="q143" id="143-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="143-2">
      <form:radiobutton path="q143" id="143-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="143-3">
      <form:radiobutton path="q143" id="143-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="143-4">
      <form:radiobutton path="q143" id="143-4" value="5"/>
      5
    </label></div>
</div>

  <form:errors path="q144" cssClass="col-form-label text-danger" />
<!-- Multiple Radios (inline) -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="144">4. Human related actions</label></div>

   
    <div class="col"><label class="radio-inline" for="144-0">
      <form:radiobutton path="q144" id="144-0" value="1"/>
      1
    </label> </div>
    <div class="col"><label class="radio-inline" for="144-1">
      <form:radiobutton path="q144" id="144-1" value="2"/>
      2
    </label> </div>
    <div class="col"><label class="radio-inline" for="144-2">
      <form:radiobutton path="q144" id="144-2" value="3"/>
      3
    </label> </div>
    <div class="col"><label class="radio-inline" for="144-3">
      <form:radiobutton path="q144" id="144-3" value="4"/>
      4
    </label> </div>
    <div class="col"><label class="radio-inline" for="144-4">
      <form:radiobutton path="q144" id="144-4" value="5"/>
      5
    </label>
    </div>
</div>

<div>
		<h6>SECTION 2: Mitigating Road Hazards</h6>
	</div>
	<div>
		<span class="text-info">Please respond to the following questions by ticking in the boxes wherever required. 
		</span>
	</div>
	
  <form:errors path="q21" cssClass="col-form-label text-danger" />
<!-- Multiple Checkboxes -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="21">2.1 Whose responsibility is it to report road hazards? Please tick all that apply.</label></div>

  <div class="col">
  <div class="checkbox">
    <label for="21-0">
      <form:checkbox path="q21" id="21-0" value="1"/>
      Citizens and road users
    </label>
	</div>
  <div class="checkbox">
    <label for="21-1">
      <form:checkbox path="q21" id="21-1" value="2"/>
      Non-Governmental organizations
    </label>
	</div>
  <div class="checkbox">
    <label for="21-2">
      <form:checkbox path="q21" id="21-2" value="3"/>
      Media
    </label>
	</div>
  <div class="checkbox">
    <label for="21-3">
      <form:checkbox path="q21" id="21-3" value="4"/>
      Activists
    </label>
  </div>
</div>
</div>

  <form:errors path="q22" cssClass="col-form-label text-danger" />
<!-- Multiple Checkboxes -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="22">2.2 For each category of road hazards, to whom should it be addressed? Please tick all that apply.</label></div>

  <div class="col">
  <div class="checkbox">
    <label for="22-0">
      <form:checkbox path="q22" id="22-0" value="1"/>
      Non-Governmental organizations
    </label>
	</div>
  <div class="checkbox">
    <label for="22-1">
      <form:checkbox path="q22" id="22-1" value="2"/>
      The government
    </label>
	</div>
  <div class="checkbox">
    <label for="22-2">
      <form:checkbox path="q22" id="22-2" value="3"/>
      Media
    </label>
	</div>
  <div class="checkbox">
    <label for="22-3">
      <form:checkbox path="q22" id="22-3" value="4"/>
      Insurance agencies
    </label>
	</div>
  </div>
</div>

  <form:errors path="q23" cssClass="col-form-label text-danger" />
<!-- Multiple Checkboxes -->
<div class="form-group row">
  <div class="col-5"><label class="col control-label" for="23">2.3 For each category of road hazards, what could be done to mitigate the hazards? Please tick all that apply.</label></div>

  <div class="col">
  <div class="checkbox">
    <label for="23-0">
      <form:checkbox path="q23" id="23-0" value="1"/>
      Road Development
    </label>
	</div>
  <div class="checkbox">
    <label for="23-1">
      <form:checkbox path="q23" id="23-1" value="2"/>
      Regular Maintenance
    </label>
	</div>
  <div class="checkbox">
    <label for="23-2">
      <form:checkbox path="q23" id="23-2" value="3"/>
      Enforced Policies
    </label>
	</div>
  <div class="checkbox">
    <label for="23-3">
      <form:checkbox path="q23" id="23-3" value="4"/>
      Training on hazard perception skills
    </label>
	</div>
  </div>
</div>

</fieldset>

<div class="form-group">
		  <div >
			     <button style="margin-bottom: 5%" type="submit" class="btn btn-primary float-right">Submit
                             </button>
		  </div>
		</div>
</form:form>

</div>
</div>

</body>
</html>
