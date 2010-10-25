<%--
	JSP for outputting links to related topics.
	Assumes that the ID of the source topic is held within an URL query param of name `id'.
	
	
	@author Christian Wittern
--%>
<%@ include file="/includes/global.jsp"%>
<tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

  <tolog:set var="currentTopic" reqparam="id" />
  
  <portlets:related topic="currentTopic" var="headings">
  
	<%-- don't want to output surrounding div unless there are related topics --%>
  	<c:if test="${ fn:length(headings) gt 0 }">
	  <div class="related">
	</c:if>
  
    <c:forEach items="${headings}" var="heading">

	  <c:if test="${fn:length(heading.children) gt 0}">
		<h3><c:out value="${heading.title}" escapeXml="false" /></h3>
        <ul>
      </c:if>
	
      <c:forEach items="${heading.children}" var="assoc">
		<li>
		  <a href="forwarder.jsp?id=${assoc.player.objectId}">
			<%-- outputs the name of the topic whose ID equals that of accoc.player.objectID. --%>
			<tolog:out query=" $x = @${assoc.player.objectId} ?" />
		  </a>
		</li>
      </c:forEach>
	  
      <c:if test="${ fn:length(heading.children) gt 0 }">
        </ul>
      </c:if>
	  
    </c:forEach>
	
	<c:if test="${ fn:length(headings) gt 0 }">
	  </div>
	</c:if>
	
  </portlets:related>
  
</tolog:context>