<%--
	JSP for forwarding requests to proper destination.
	
	Example code for http://www.topicobserver.com/blog/semantic-web/tm/2009/web-application-development-with-ontopia-part-3/
	
	@author Trond K. Pettersen
--%>
<%@ include file="/includes/global.jsp"%>

<tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

<%@ include file="/includes/tolog.jsp"%>

<tolog:set var="topic" reqparam="id"/>
<c:set var="destination" value="default.jsp" />

<tolog:choose>
	<tolog:when query="instance-of( %topic%, blog:Post) ?">
		<%-- this is a blog post, so forward to the post JSP --%>
		<c:set var="destination" value="post.jsp" />
	</tolog:when>
	<tolog:when query="instance-of( %topic%, sioc:Container) ?">
		<%-- this is a category, so forward to the category JSP --%>
		<c:set var="destination" value="category.jsp" />
	</tolog:when>
	<tolog:when query="instance-of( %topic%, tm:Subject) ?">
		<%-- this is a tag, so forward to the tag JSP --%>
		<c:set var="destination" value="tag.jsp" />
	</tolog:when>
    <tolog:when query="instance-of( $type, %topic% )?">
		<%-- this is a topic type, so forward to the generic type.jsp --%>
        <c:set var="destination" value="type.jsp" />
    </tolog:when> 
    <tolog:otherwise>
		<%-- nothing special; choose the default view --%>
        <c:set var="destination" value="default.jsp" />
    </tolog:otherwise>
</tolog:choose>
<c:redirect url="${destination}?id=${param.id}" />

</tolog:context>
