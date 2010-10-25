<%--
	JSP for displaying information about categories.
	
	Example code for http://www.topicobserver.com/blog/semantic-web/tm/2009/web-application-development-with-ontopia-part-3/
	
	@author Trond K. Pettersen
--%><%@ include file="/includes/global.jsp"%>

<template:insert template="/includes/template.jsp">

<tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

	<%@ include file="/includes/tolog.jsp" %>

	<tolog:set var="category" reqparam="id" />

	<template:put name="content">
		<h2><tolog:out var="category" /></h2>
		<p>
			Posts contained in the <tolog:out var="category" /> category.
		</p>
		<ul class="pager categories">
			<tolog:foreach query='sioc:container_of( %category% : i"http://psi.ontopedia.net/Container", $post : i"http://psi.ontopedia.net/Containee" ) order by $post asc?'>
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