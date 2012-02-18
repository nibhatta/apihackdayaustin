
<%@ page import="com.apihackday.Survey" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-survey" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-survey" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'survey.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="surveyType" title="${message(code: 'survey.surveyType.label', default: 'Survey Type')}" />
					
						<th><g:message code="survey.event.label" default="Event" /></th>
					
						<g:sortableColumn property="isClosed" title="${message(code: 'survey.isClosed.label', default: 'Is Closed')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${surveyInstance.id}">${fieldValue(bean: surveyInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: surveyInstance, field: "surveyType")}</td>
					
						<td>${fieldValue(bean: surveyInstance, field: "event")}</td>
					
						<td><g:formatBoolean boolean="${surveyInstance.isClosed}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${surveyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
