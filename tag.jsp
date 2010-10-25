<%--
	JSP for displaying information about tags.
	
	Example code for http://www.topicobserver.com/blog/semantic-web/tm/2009/web-application-development-with-ontopia-part-3/
	
	@author Trond K. Pettersen
--%>
<%@ include file="/includes/global.jsp"%>

<template:insert template="/includes/template.jsp">

<tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

	<%@ include file="/includes/tolog.jsp" %>

	<tolog:set var="tag" reqparam="id" />

	<template:put name="content">
		<h2><tolog:out var="tag" /></h2>
		<p>
			Posts tagged <tolog:out var="tag" />.
		</p>
		<ul class="pager tags">
			<tolog:foreach query="dc:subject( %tag% : dctm:value, $post : dctm:resource ) order by $post asc?">
				<li>
					<a href="forwarder.jsp?id=<tolog:id var='post' />">
					  <tolog:out var="post" />
					</a>
				</li>
			</tolog:foreach>
		</ul>
	</template:put>

</tolog:context>

</template:insert>