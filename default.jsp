<%--
	Default JSP for displaying information (occurrences and associations) about topic instances.
	Used where no specialized view exists.
	
	Example code for http://www.topicobserver.com/blog/semantic-web/tm/2009/web-application-development-with-ontopia-part-3/
	
	@author Trond K. Pettersen
--%>
<%@ include file="/includes/global.jsp"%>

<tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

<%@ include file="/includes/tolog.jsp"%>

<tolog:set var="topic" reqparam="id"/>

<template:insert template="/includes/template.jsp">

<template:put name="content">
    
	<div class="main">
		<h2><tolog:out var="topic" escape="false" /></h2>
		<tolog:if query="instance-of( %topic%, $type )? ">
			<div class="types">
				Types:
				<ul>
					<tolog:foreach query="instance-of( %topic%, $type )?">
						<li>	
							<a href="type.jsp?id=<tolog:id var='type' />">
								<tolog:out var="type" />
							</a>
						</li>
					</tolog:foreach>
				</ul>
			</div>
		</tolog:if>
		
		<tolog:foreach query="occurrence( %topic%, $occ ), type( $occ, $type) ?">
			<p>
				<strong><tolog:out var="type" /></strong>: <tolog:out var="occ" />
			</p>
		</tolog:foreach>

		<tolog:if query="instance-of( $instance, %topic% )? ">
			<div class="types">
				Instances:
				<ul>
					<tolog:foreach query="instance-of( $instance, %topic% )?">
						<li><tolog:out var="instance" /></li>
					</tolog:foreach>
				</ul>
			</div>
		</tolog:if>
	</div>
		
	<%@include file="/includes/related.jsp" %>
    
</template:put>

</template:insert>
</tolog:context>
