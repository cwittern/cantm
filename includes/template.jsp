<%--
	The application's template file.
	
	Example code for http://www.topicobserver.com/blog/semantic-web/tm/2009/web-application-development-with-ontopia-part-3/
	
	@author Trond K. Pettersen
--%>
<%@ include file="/includes/global.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Topic page</title>
    <link rel="stylesheet" type="text/css" href="style/blog.css" media="screen" />
  </head>
  <body>
    <nav>
      <ul>
		<li><a href="index.jsp">Home</a></li>
		<li><a href="type.jsp?id=sioc:Container">Archive</a></li>
		<li><a href="search.jsp">Search</a></li>
	  </ul>
    </nav>
    <div id="content">
	  <h1><a href="index.jsp">Start</a></h1>
      <template:get name="content" />
    </div>
	<div id="footer">
		<p>Getting started slowly...</p>
	</div>
  </body>
</html>