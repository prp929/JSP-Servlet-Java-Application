<%@ page import="java.util.ArrayList" %> ><%--
  Created by IntelliJ IDEA.
  User: pezol
  Date: 4/13/2023
  Time: 12:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Business Section</title>
    <%@ include file="../View-JSP/styles-header.jsp" %>
</head>

<body class="bg-dark">
<div id="page-container">
    <div class="row" >
        <div class="container w-75" id="content-wrap" >

            <h3 class="text-center m-3 noYoverflow text-light text-uppercase font-weight-bold">
                Search Company Information </h3>
            <hr>
            <br>
            <div>


                <div class="container searchContainer">
                    <div class="search card card-body">

                        <form action="${pageContext.request.contextPath}/EconIndicatorSearchServlet"  method="post">

                            <fieldset class="form-group text-secondary">
                                <label>Search Parameters: </label> <input type="text"
                                                                          class="form-control"
                                                                          name="criteria" placeholder="Enter some text">
                            </fieldset>

                            <fieldset class="form-group d-flex justify-content-start" >
                                <label class="mx-3">1. Select a Indicator </label>
                                <select name="tableName" class="mx-3">
                                    <option value="ahe">Average Hourly Earnings of All Private Employees</option>
                                    <option value="infl">Inflation</option>
                                    <option value="gdp">Gross Domestic Product</option>
                                    <option value="emp">All Employees (per 1000 employees)</option>
                                    <option value="pce">Personal Consumption Expenditures (index) </option>
                                    <option value="vix">Volatility (index)</option>
                                </select>
                            </fieldset>
                            <hr>

                            <label class="mx-3">2. Select a Corresponding set of values: </label>
                            <br> <br>


                            <div class="form-group d-flex justify-content-start pl-5" >
                                <label> Company Info Option: </label>
                                <fieldset>
                                    <select name="colName1" id="colName1" class="mx-3">
                                        <option value="1">Date</option>
                                        <option value="2">Numeric Value</option>
                                    </select>
                                </fieldset>
                            </div>

                            <%-- ****************************************************************************************************--%>

                            <div class="d-flex justify-content-between mx-5">
                                <input class="btn btn-info" type = "submit" value = "Search" />
                                <a class="text-info" href="<%=request.getContextPath()%>/index.jsp">Return to Home</a>
                            </div>

                        </form>
                        <br><br>
                        <label>Results:</label>
                        <hr>
                        <div class="results">

                            <% ArrayList<String> list = null; int i = 0;
                                if(session.getAttribute("econResults") != null) {
                                    list = (ArrayList<String>) session.getAttribute("econResults");
                                    list.add( 1, "Your search returned " + (list.size()-1) +" results. " );

                                } if(list != null) { %>
                            <h3 class="noYoverflow"><%= list.get(1) %></h3>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <% String[] ar= list.get(0).split(",");  for(String f : ar){ %>
                                    <th>
                                        <%= f %>
                                    </th>
                                    <% } %>
                                </tr>
                                </thead>
                                <tbody>
                                <%  i=2; list.remove(0); list.remove(0);
                                    for(String str : list){ %>
                                <tr>
                                    <% String[] arr= str.split(",");  for(String f : arr){ %>
                                    <td>
                                        <%= f %>
                                    </td>
                                    <% } %>
                                </tr>
                                <% ++i; } %>


                                <% } %>
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
