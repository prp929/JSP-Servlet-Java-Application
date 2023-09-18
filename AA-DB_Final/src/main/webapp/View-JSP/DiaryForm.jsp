<%@ page import="FinalProject.Model.DiaryEntry" %>
<%@ page import="FinalProject.Repo.Entry_Repo" %><%--
  Created by IntelliJ IDEA.
  User: pezol
  Date: 4/13/2023
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Diary Form</title>
    <%@ include file="styles-header.jsp" %>
</head>

<body class="bg-dark">
<%@include file="../Components/verified-header.jsp"%>

<div class="container col-md-5" id="page-container">
    <div class="card">
        <div class="card-body diaryForm" id="content-wrap">
            <%
                String n = session.getAttribute("username").toString();
                DiaryEntry d = new DiaryEntry(n);
                String title, r = request.getServletPath();
                Entry_Repo repo = new Entry_Repo();
                Integer id = Integer.parseInt( request.getPathInfo().substring(1, request.getPathInfo().length() ));
                if(id > 0){
                    d = repo.selectEntry(id);
                    title = "Update Entry: " + d.getTitle() ;
                } else {
                    title = "New Entry" ;
                }
            %>

            <form action="${pageContext.request.contextPath}/diaryDo/update/<%=d.getId()%>" method="post">
                <caption>
                    <h2 class="noYoverflow text-dark font-weight-bold">
                        <%=title%>
                    </h2>
                </caption>

                <% if(d != null){ %>
                <input  type="hidden" name="id" value="<%=d.getId()%>" />
                <% } %>
                <input type="hidden" name="username" value="<%=d.getUsername()%>" />

                <fieldset class="form-group text-secondary">
                    <label>Entry Title</label> <input type="text"
                                                     value="<%=d.getTitle()%>" class="form-control"
                                                     name="title" required="required" minlength="5">
                </fieldset>

                <fieldset class="form-group text-secondary">
                    <label>Brief Description</label> <input type="text"
                                                           value="<%=d.getDescription()%>"
                                                           class="form-control"
                                                           name="description" minlength="5">
                </fieldset>

                <fieldset class="form-group text-secondary">
                    <label>Bookmark</label> <select class="form-control"
                                                       name="isBookmarked">
                    <option value="true">I know I'll come back to this entry soon</option>
                    <option value="false">I can just search and find this entry</option>
                </select>
                </fieldset>

                <fieldset class="form-group text-secondary">
                    <label>Entry Date</label> <input type="date"
                                                           value="<%=d.getEntry_date()%>"
                                                           class="form-control"
                                                           name="entry_date" required="required">
                </fieldset>

                <fieldset class="form-group text-secondary">
                    <label>Your Entry</label>
                    <textarea class="form-control" placeholder="Make your entry here"
                              rows="7" name="contents" required="required">
                        <%=d.getContents()%>
                    </textarea>
                </fieldset>


                <div class="d-flex justify-content-between mx-5">
                    <button type="submit" class="btn btn-info mb-5">Save</button>
                    <a class="text-info" href="<%=request.getContextPath()%>/diaryEntries/listAll">Return to Entries</a>
                </div>


            </form>
        </div>
    </div>

    <%@ include file="../Components/footer.jsp" %>
</div>
</body>
</html>
</html>

