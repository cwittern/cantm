<%--
	JSP for displaying information about blog posts.
	
	Example code for http://www.topicobserver.com/blog/semantic-web/tm/2009/web-application-development-with-ontopia-part-3/
	
	@author Trond K. Pettersen
--%>
<%@ include file="/includes/global.jsp"%>
<template:insert template="/includes/template.jsp">
  <tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

    <%@ include file="/includes/tolog.jsp"%>
  
    <tolog:set var="post" reqparam="id" />

    <template:put name="content">

      <div class="main post">
        <h2><tolog:out var="post" /></h2>
        <p class="pub-date">
          Published on <tolog:out query='{ tobs:publish-date( %post%, $date ) | $date = "unknown" }?' />.
        </p>
        <div class="excerpt">
          <tolog:out query="tobs:excerpt( %post%, $descr )? " escape="false" />
        </div>
        <div class="body">
          <tolog:out query="tobs:body( %post%, $body )?" escape="false" />
        </div>
      </div>

      <%@ include file="/includes/related.jsp" %>

    </template:put>
  </tolog:context>
</template:insert>