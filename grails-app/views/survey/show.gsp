
<%@ page import="com.apihackday.Survey" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		
		
		<script type="text/javascript">
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'container',
						plotBackgroundColor: null,
						plotBorderWidth: null,
						plotShadow: false
					},
					title: {
						text: '${surveyInstance?.name} '
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
						}
					},
					plotOptions: {
						pie: {
							allowPointSelect: true,
							cursor: 'pointer',
							dataLabels: {
								enabled: true,
								color: '#000000',
								connectorColor: '#000000',
								formatter: function() {
									return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
								}
							}
						}
					},
					series: [{
						type: 'pie',
						name: '${surveyInstance?.name}',
						data: [
							
							
						]
					}]
				});
			});



			function requestData() {
			    $.ajax({
			    	url: "${createLink(uri: '/twiliosurvey')}",
			        //url: '/api/survey/${surveyInstance?.id}',
			        
			        success: function(point) {
			            var series = chart.series[0],
			                shift = series.data.length > 20; // shift if the series is longer than 20

			            // add the point
			            chart.series[0].addPoint(point, true, shift);
			            
			            // call it again after one second
			            setTimeout(requestData, 1000);    
			        },
			        cache: false
			    });
			}
			requestData();

		</script>
		
	</head>
	<body>
		 
		<a href="#show-survey" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a  href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link  action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</li>
			</ul>
		</div>
<script type="text/javascript" src="${resource(dir: 'js', file: 'highcharts.js')}"></script>
<!--<script type="text/javascript" src="/js/modules/exporting.js"></script>-->

<div id="container" style="width: 800px; height: 400px; margin: 0 auto"></div>









		<div id="show-survey" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list survey">
			
				<g:if test="${surveyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="survey.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${surveyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${surveyInstance?.surveyType}">
				<li class="fieldcontain">
					<span id="surveyType-label" class="property-label"><g:message code="survey.surveyType.label" default="Survey Type" /></span>
					
						<span class="property-value" aria-labelledby="surveyType-label"><g:fieldValue bean="${surveyInstance}" field="surveyType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${surveyInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="survey.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${surveyInstance?.event?.id}">${surveyInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${surveyInstance?.isClosed}">
				<li class="fieldcontain">
					<span id="isClosed-label" class="property-label"><g:message code="survey.isClosed.label" default="Is Closed" /></span>
					
						<span class="property-value" aria-labelledby="isClosed-label"><g:formatBoolean boolean="${surveyInstance?.isClosed}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<!-- <g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${surveyInstance?.id}" />
					<g:link class="edit" action="edit" id="${surveyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form> -->
		</div>
	</body>
</html>
