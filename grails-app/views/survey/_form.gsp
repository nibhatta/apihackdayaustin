<%@ page import="com.apihackday.Survey" %>



<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="survey.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${surveyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'surveyType', 'error')} required">
	<label for="surveyType">
		<g:message code="survey.surveyType.label" default="Survey Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="surveyType" min="1" max="2" required="" value="${fieldValue(bean: surveyInstance, field: 'surveyType')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="survey.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${com.apihackday.Event.list()}" optionKey="id" required="" value="${surveyInstance?.event?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'isClosed', 'error')} ">
	<label for="isClosed">
		<g:message code="survey.isClosed.label" default="Is Closed" />
		
	</label>
	<g:checkBox name="isClosed" value="${surveyInstance?.isClosed}" />
</div>

