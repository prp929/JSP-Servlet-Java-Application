<%--
  Created by IntelliJ IDEA.
  User: pezol
  Date: 4/13/2023
  Time: 5:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
  <nav id="header" class="navbar navbar-expand-md navbar-dark">
    <div>
      <a href="#" class="navbar-brand"> Diary Application </a>
    </div>

    <ul class="navbar-nav mx-5">
      <li><a href="<%=request.getContextPath()%>/diaryEntries/listAll"
             class="nav-link">Entries</a></li>
      <li><a href="<%=request.getContextPath()%>/user/update"
             class="nav-link">Update User Info</a></li>
      <li><a href="<%=request.getContextPath()%>/searchEntries"
             class="nav-link">Search Entries</a></li>
    </ul>

    <ul class="navbar-nav navbar-collapse justify-content-end">
      <li><a href="<%=request.getContextPath()%>/logout"
             class="nav-link">Logout</a></li>
    </ul>


  </nav>
</header>
