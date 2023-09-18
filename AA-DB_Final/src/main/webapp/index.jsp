<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title> Index-JSP </title>
    <%@ include file="View-JSP/styles-header.jsp" %>
    <link rel="stylesheet" href="Style/landingPage.css">
</head>
<body class="bg-dark">
<section class="showcase">
    <header>
        <h2 class="logo noYoverflow" >Trader's Diary</h2>
        <div class="toggle"></div>
    </header>

    <div class="text">
        <h2 class="noYoverflow">Never Stop</h2>
        <h3 class="noYoverflow">Recording What Matters</h3>
        <p>Say goodbye to disorganized notes, forgotten trades, and missed opportunities.
            With our digital diary, you can keep all of your trading activity in one convenient and
            easy-to-use platform.
            Our diary is designed specifically for stock traders, with features such as customizable trading
            templates, real-time market data integration, and trade history tracking. You can quickly and easily
            enter your trades, record your thoughts and observations, and monitor your portfolio performance.</p>
        <a href="${pageContext.request.contextPath}/user/register"
           class="m-3">Begin Your Journey</a>
        <a href="${pageContext.request.contextPath}/login"
        class="m-3">Continue Your Journey</a>
    </div>
</section>
<div class="menu pl-2 bg-light">
    <ul>
        <h3 class="logo noYoverflow font-weight-bold" >Your Market Resource</h3>
        <hr>
        <li><a href="DB_Search_Functions/BusinessSectionSearch.jsp">Business Section</a></li>
        <li><a href="DB_Search_Functions/CompanyStocksSearch.jsp">Company Stocks</a></li>
        <li><a href="DB_Search_Functions/CompanyInfoSearch.jsp">Company Information</a></li>
        <li><a href="DB_Search_Functions/EcoIndicatorsSearch.jsp">Economic Indicators</a></li>
    </ul>
</div>

<script>
    const menuToggle = document.querySelector('.toggle')
    const showcase = document.querySelector('.showcase')
    menuToggle.addEventListener('click', ()=>{
        menuToggle.classList.toggle('active');
        showcase.classList.toggle('active');
    })
</script>
</body>
</html>


