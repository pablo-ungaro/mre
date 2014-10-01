<%--
  Created by IntelliJ IDEA.
  User: jackson
  Date: 29/09/14
  Time: 23:00
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Insetos MRE"/></title>
    <asset:stylesheet src="application" />
    <g:layoutHead/>
</head>
<body >
<section class="page" id="page">
    <header>
        MRE Insetos
    </header>
    <nav class="menu">
        <nav>
            <li>
                <g:link class="link-index" url="/mre"><i class="fa fa-fw fa-dashboard"> </i> Home</g:link>
            </li>
            <li>
                <g:link class="link-search" controller="insect" action="search"><i class="fa fa-fw fa-file"> </i>Insetos</g:link></li>
        </nav>
    </nav>
    <section class="content">
        <g:layoutBody/>
    </section>
    <footer></footer>
</section>
<script>
    var element = document.getElementById('content_search');
    if (element) {
        document.getElementById("page").className = "page search-page";
    } else {
        document.getElementById("page").className = "page index-page";
    }
</script>
</body>
</html>