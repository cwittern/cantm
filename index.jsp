<%--

	Index page containing a blog post index.
	
	
	@author Christian Wittern

example queries:
import "http://psi.ontopia.net/tolog/string/" as str
select $NAME from
instance-of($TOPIC, volume),
topic-name($TOPIC, $TN),
value($TN, $NAME),
str:starts-with($NAME, "T")
order by $NAME?



--%>
<%@ include file="/includes/global.jsp" %>
<template:insert template="/includes/template.jsp">
  <tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

    <%@ include file="/includes/tolog.jsp"%>
  
    <template:put name="content">
	tester
      <tolog:foreach query="instance-of( $post, exp)
                  limit 10 ?">

        <h2>
          <a href="post.jsp?id=<tolog:id var='post' />">
            <tolog:out var="post" />
          </a>
        </h2>

        <div class="excerpt">
          <a href="post.jsp?id=<tolog:id var='post' />">

          </a>
        </div>

      </tolog:foreach>
    </template:put>

  </tolog:context>
</template:insert>