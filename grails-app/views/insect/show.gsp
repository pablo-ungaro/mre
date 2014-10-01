<<<<<<< HEAD
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
<section class="content1" id="content_search">
    <h1>Inseto: ${insect.species}</h1>
    <section class="showMe">
        <ul>
            <li>Família: <b>${insect.family?:'N/D'}</b></li>
            <li>Subfamília: <b>${insect.subfamily?:'N/D'}</b></li>
            <li>Geneses: <b>${insect.genus?:'N/D'}</b></li>
            <li>Espécie: <b>${insect.species?:'N/D'}</b></li>
            <li>Super-Família: <b>${insect.superfamily?:'N/D'}</b></li>
            <li>Ordem: <b>${insect.orderInsect?:'N/D'}</b></li>
            <li>Autor: <b>${insect.author?:'N/D'}</b></li>
            <li>Distribuição: <b>${insect.distribution?:'N/D'}</b></li>
            <li>Notas: <b>${insect.notes?:'N/D'}</b></li>
        </ul>
    </section>
</section>
</body>
</html>