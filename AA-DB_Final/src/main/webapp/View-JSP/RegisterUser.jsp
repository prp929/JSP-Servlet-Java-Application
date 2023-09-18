<%--
  Created by IntelliJ IDEA.
  User: pezol
  Date: 4/13/2023
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register User</title>
    <%@ include file="styles-header.jsp" %>
</head>
<body class="bg-dark">
<div class="container d-flex justify-content-center ">
    <div class="m-5 col-md-8 col-md-offset-3 overflow-hidden border border-secondary bg-light rounded" >
        <h1 class="text-center noYoverflow mt-5">User Registry Form</h1>
        <div class="container m-3 border-solid">
            <form action="<%=request.getContextPath()%>/user/insert" method="post">
                <div class="form-group m-3">
                    <label for="firstname">First Name:</label> <input type="text" class="form-control" id="firstname"
                                                                      placeholder="First Name" name="firstName" required>
                </div>

                <div class="form-group m-3">
                    <label for="lastname">Last Name:</label> <input type="text" class="form-control" id="lastname"
                                                                    placeholder="last Name" name="lastName" required>
                </div>

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
