<%@ page import="mre.Insect" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'insect.label', default: 'Insect')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-insect" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-insect" class="content scaffold-show" role="main">
    <g:form action="search">
        <g:textField name="q" value="${q}"/>

        <g:select name="order" from="${orders}" value="${order}" onchange="this.form.submit()" noSelection="['':'-Ordem-']"/>

        <g:select name="family" from="${families}" value="${family}" onchange="this.form.submit()" noSelection="['':'-Família-']"/>

        <g:select name="subfamily" from="${subfamilies}" value="${subfamily}" onchange="this.form.submit()" noSelection="['':'-Subfamilia-']"/>

    </g:form>
</div>

<div id="list-insect" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name" title="Espécie"/>

            <th>Ordem</th>

            <th>Família</th>

            <th>Subfamilia</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${insects}" status="i" var="insectInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${insectInstance.id}">${insectInstance.species}</g:link></td>

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
</div>

</body>
</html>
