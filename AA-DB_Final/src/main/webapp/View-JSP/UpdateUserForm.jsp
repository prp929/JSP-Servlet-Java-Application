<%@ page import="FinalProject.Model.User" %>
<%@ page import="FinalProject.Repo.User_Repo" %><%--
  Created by IntelliJ IDEA.
  User: pezol
  Date: 4/13/2023
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User_Repo repo = new User_Repo();
    String un = session.getAttribute("username").toString();
    User user = repo.getUser(un);
%>
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


            <form action="<%=request.getContextPath()%>/user/alter" method="post">

                <div class="alert alert-success center" role="alert">
                    <p>${NOTIFICATION}</p>
                </div>

                <input  type="hidden" name="id" value="<%=user.getId()%>" />
                <input type="hidden" name="old-username" value="<%=un%>" />

                <div class="form-group m-3">
                    <label for="firstname">First Name:</label>
                    <input type="text" class="form-control" id="firstname" placeholder="First Name"
                           value="<%=user.getFirstName()%>" name="firstName" required>
                </div>

                <div class="form-group m-3">
                    <label for="lastname">Last Name:</label>
                    <input type="text" class="form-control" id="lastname" value="<%=user.getLastName()%>"
                           placeholder="last Name" name="lastName" required>
                </div>

                <div class="form-group m-3">
                    <label for="username">User Name:</label>
                    <input type="text" class="form-control" id="username" value="<%=user.getUsername()%>"
                           placeholder="User Name" name="username" required>
                </div>

                <div class="form-group m-3">
                    <label for="password">Enter New Password:</label>
                    <input type="password" class="form-control" id="password" value="<%=user.getPassword()%>"
                           placeholder="Password" name="password" required>
                </div>
                <div class="form-group m-3">
                    <label for="password">Confirm Password:</label>
                    <input type="password" class="form-control" id="new-password"
                           placeholder="New Password" name="new-password" required>
                </div>

                <div class="d-flex justify-content-between mx-5">
                    <button type="submit" class="btn btn-primary mb-5">Submit</button>
                    <a class="text-info" href="<%=request.getContextPath()%>/diaryEntries/listAll">Return to Entries</a>
                </div>
            </form>

        </div>
    </div>
</div>

<%@ include file="../Components/footer.jsp" %>
</body>
</html>


