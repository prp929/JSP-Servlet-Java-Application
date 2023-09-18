<%@ page import="java.util.ArrayList" %>
<%@ page import="FinalProject.Model.DiaryEntry" %>
<%@ page import="FinalProject.Repo.Entry_Repo" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: pezol
  Date: 4/13/2023
  Time: 12:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Diary Entry List</title>
  <%@ include file="styles-header.jsp" %>
</head>

<body class="bg-dark">
<%@include file="../Components/verified-header.jsp"%>
<div id="page-container">
  <div class="row" >
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
    <div class="container" id="content-wrap" >

      <div class="container text-left d-flex justify-content-between">
        <h3 class="text-center m-3 noYoverflow text-light text-uppercase font-weight-bold">Your Diary Entries</h3>
       <a href="${pageContext.request.contextPath}/diaryDo/diaryForm/-1"
                                  class="btn btn-info align-self-center">Create Entry</a>

      </div>
      <hr>
      <br>



      <div>
      <table id="tbl" class="table table-bordered bg-light border rounded overflow-auto">
        <thead>
        <tr>
          <th>Title</th>
          <th>Bookmarked</th>
          <th>Description</th>
          <th>Contents</th>
          <th>Entry Date</th>
          <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <%
          Entry_Repo repo = new Entry_Repo();
          ArrayList<DiaryEntry> list =
                repo.selectUserEntries(session.getAttribute("username").toString());
          Collections.sort(list); Collections.reverse(list);
        %>

        <% for(DiaryEntry entry : list) { %>

        <tr>

          <td> <%=entry.getTitle() %> </td>
          <td><%=entry.getBookmarked()%></td>
          <td> <%=entry.getDescription() %> </td>
          <td> <%=entry.getContents() %> </td>
          <td> <%=entry.getEntry_date() %> </td>

          <td>
            <a href="${pageContext.request.contextPath}/diaryDo/diaryForm/<%=entry.getId()%>"
               class="text-info">Edit</a>
            <a href="${pageContext.request.contextPath}/diaryDo/delete/<%=entry.getId()%>"
               class="text-info">Delete</a>
          </td>

        </tr>
        <% } %>
        </tbody>
      </table>
      </div>
    </div>
  </div>

  <%@include file="../Components/footer.jsp" %>

</div>
</div>
</body>
</html>
</html>

