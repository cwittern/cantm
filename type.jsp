<%--
	Generic JSP for displaying information about topic types.
	
	Example code for http://www.topicobserver.com/blog/semantic-web/tm/2009/web-application-development-with-ontopia-part-3/
	
	@author Trond K. Pettersen
--%>
<%@ include file="/includes/global.jsp"%>

<template:insert template="includes/template.jsp">

<tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

	<%@ include file="/includes/tolog.jsp" %>

	<tolog:set var="topic" query="$x = ${param.id}?" />

	<template:put name="content">
		<h2><tolog:out var="topic" /></h2>
		<ul class="pager instances">
			<tolog:foreach query='instance-of( $instance, %topic% ) order by $instance asc?'>
				<li>
					<a href="forwarder.jsp?id=<tolog:id var='instance' />">
					  <tolog:out var="instance" />
					</a>
				</li>
			</tolog:foreach>
		</ul>
	</template:put>

</tolog:context>

</template:insert>