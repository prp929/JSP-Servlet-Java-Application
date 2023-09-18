<%--
  Created by IntelliJ IDEA.
  User: pezol
  Date: 4/13/2023
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Error</title>
  <%@ include file="../View-JSP/styles-header.jsp" %>
</head>
<body class="container">
  <h1>Error</h1>
 <h3>ERROR PAGE </h3>
  <%!
      private Throwable exception;
  %><% if(response.getStatus() == 500){ %>
  <font color="red">Error: <%=exception.getMessage() %></font><br>
  <%}else {%>
  Hi There, error code is <%=response.getStatus() %><br>
  Please go to <a href="${pageContext.request.contextPath}/index.jsp">home page</a>
  <%}
  %>
</body>
</html>
