<%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 30/05/2022
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="../includes/navbar.jsp"></jsp:include>
    <title>Title</title>
</head>
<body>
<div class="background"></div>
<div class="wrapper">
    <h1 class="mb-5 titles">Form di registrazione</h1>
    <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Informazioni nuovo utente</h4>
        <c:url var="url" value="/addUser"/>
        <form:form action="${url}" method="post" modelAttribute="user" class="form-horizontal">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="firstName">Nome</label>
                    <form:input path="name" type="text" class="form-control" placeholder="Federico"
                                id="firstName"/>
                    <div class="has-errors">
                        <form:errors path="name" class="has-errors"/>
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="lastName">Cognome</label>
                    <form:input path="surname" type="text" class="form-control" placeholder="Mandis"
                                id="lastName"/>
                    <div class="has-errors">
                        <form:errors path="surname" class="has-errors"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="email">Email</label>
                    <form:input path="email" type="email" class="form-control" placeholder="you@example.com"
                                id="email"/>
                    <div class="has-errors">
                        <form:errors path="email" class="has-errors"/>
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="Password">Password</label>
                    <form:input path="password" type="password" class="form-control" id="Password"
                                placeholder="Password"/>
                    <div class="has-errors">
                        <form:errors path="email" class="has-errors"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="data">Data di nascita</label>

                    <input type="date" class="form-control" name="data" id="data"/>
                    <div class="has-errors">
                        <form:errors path="birth" class="has-errors"/>
                    </div>
                    <form:hidden path="role" value="CUSTOMER"></form:hidden>
                </div>
            </div>

            <button class="btn btn-outline-primary btn-shadow text-mono" value="CUSTOMER" type="submit">Invia
            </button>
        </form:form>
    </div>
</div>
</body>
</html>
