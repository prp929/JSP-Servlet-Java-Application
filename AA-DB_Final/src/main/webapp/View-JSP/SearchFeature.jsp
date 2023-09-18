<%@ page import="java.util.ArrayList" %>
<%@ page import="FinalProject.Model.DiaryEntry" %><%--
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

        <h3 class="text-center m-3 noYoverflow text-light text-uppercase font-weight-bold">
          Search Your Entries </h3>
      <hr>
      <br>
      <div>


        <div class="container searchContainer">
          <div class="search card card-body">

            <form action="${pageContext.request.contextPath}/SearchServlet"  method="post" >

              <input  type="hidden" name="username" value="<%=session.getAttribute("username").toString()%>"/>

              <fieldset class="form-group text-secondary">
                <label>Search Parameters: </label> <input type="text"
                                                          class="form-control"
                                                          name="criteria" placeholder="Enter some text">
              </fieldset>

              <fieldset class="form-group text-secondary">
                <label>Bookmark</label><select class="form-control"
                                               name="isBookmarked">
                <option value="false">Search For Entries</option>
                <option value="true">See Bookmarked Entries</option>
              </select>
              </fieldset>

              <div class="d-flex justify-content-between mx-5">
                <input class="btn btn-info" type = "submit" value = "Search" />
                <a class="text-info" href="<%=request.getContextPath()%>/diaryEntries/listAll">Return to Entries</a>
              </div>

            </form>

            <div class="results">
              <table id="tbl2" class="table table-bordered bg-light border rounded overflow-auto">
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
                <%
                  ArrayList<DiaryEntry> list = null;
                  if(session.getAttribute("results") != null) {
                    list = (ArrayList<DiaryEntry>) session.getAttribute("results");
                  }
                  if(list != null){
                    for(DiaryEntry entry : list){ %>
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
                <% } }; %>
                </tbody>
              </table>
            </div>


          </div>


        </div>



      </div>
    </div>
  </div>

  <%@include file="../Components/footer.jsp" %>

</div>
</div>
</body>
</html>
