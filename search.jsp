<%--
	JSP for search and search result listing.
	
	Example code for http://www.topicobserver.com/blog/semantic-web/tm/2009/web-application-development-with-ontopia-part-3/
	
	@author Trond K. Pettersen
--%>
<%@ include file="/includes/global.jsp" %>
<template:insert template="/includes/template.jsp">
  <tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

    <%@ include file="/includes/tolog.jsp"%>
  
    <template:put name="content">
	
		<h2>Search</h2>
		<p>Not implemented,</p>
      
    </template:put>

  </tolog:context>
</template:insert>