<%--
  Created by IntelliJ IDEA.
  User: jackson
  Date: 29/09/14
  Time: 22:59
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="layout">
    <asset:stylesheet src="style" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<section class="content1">
    <h1>Filtro</h1>
    <section class="search">
        <g:form class="form1" action="search">
            <label>Busca</label>
            <g:textField name="q" value="${q}"/>
            <g:select name="order" from="${orders}" value="${order}" onchange="this.form.submit()" noSelection="['':'Ordem']"/>
            <g:select name="family" from="${families}" value="${family}" onchange="this.form.submit()" noSelection="['':'Família']"/>
            <g:select name="subfamily" from="${subfamilies}" value="${subfamily}" onchange="this.form.submit()" noSelection="['':'Subfamilia']"/>
        </g:form>
    </section>
    <h1 class="no-border">Lista de Insetos</h1>
    <table class="table1">
        <thead>
        <tr>
            <th>Espécie</th>
            <th>Ordem</th>
            <th>Família</th>
            <th>Subfamilia</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${insects}" status="i" var="insectInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show"
                            id="${insectInstance.id}">${insectInstance.species} <i class="fa fa-arrow-circle-right"></i></g:link></td>
                <td>${insectInstance?.orderInsect}</td>
                <td>${insectInstance?.family}</td>
                <td>${insectInstance?.subfamily}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${insectInstanceCount ?: 0}"/>
    </div>
</section>
</body>
</html>