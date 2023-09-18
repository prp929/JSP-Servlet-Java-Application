<%--
  Created by IntelliJ IDEA.
  User: pezol
  Date: 4/13/2023
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <%@ include file="styles-header.jsp" %>
</head>

<body class="bg-dark">
<%--<%@ include file="../Components/unverified-header.jsp" %>--%>
<div class="container d-flex justify-content-center ">
<div class="m-5 col-md-8 col-md-offset-3 overflow-hidden border border-secondary bg-light rounded" >
    <h1 class="text-center noYoverflow mt-5">Login Form</h1>
    <div class="container m-3 border-solid">
    <form action="<%=request.getContextPath()%>/login" method="post">

<%--        <div class="alert alert-success center" role="alert"> </div>--%>
<%--            <c:if test="${not empty msg}">--%>
<%--                <script>--%>
<%--                    window.addEventListener("load",function(){--%>
<%--                        <div class="alert alert-success center" role="alert">--%>
<%--                        <%="${msg}" %>--%>
<%--                        </div>--%>
<%--                    })--%>
<%--                </script>--%>
<%--            </c:if>--%>



        <div class="form-group m-3">
            <label for="username">User Name:</label> <input type="text" class="form-control" id="username"
                                                            placeholder="User Name" name="username" required>
        </div>

        <div class="form-group m-3">
            <label for="password">Password:</label> <input type="password" class="form-control" id="password"
                                                           placeholder="Password" name="password" required>
        </div>

        <div class="d-flex justify-content-between mx-5">
            <button type="submit" class="btn btn-primary mb-5">Submit</button>
            <a href="${pageContext.request.contextPath}/index.jsp">Return to Home Page</a>
        </div>
    </form>
    </div>
</div>
</div>
<%@ include file="../Components/footer.jsp" %>
</body>

</html>
