<%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 01/06/2022
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Profilo</title>
    <jsp:include page="../includes/navbar.jsp"></jsp:include>
</head>
<body>
<div class="background"></div>

<div class="wrapper">
    <h1 class="mb-5">Profilo Personale di ${modU.name} ${modU.surname}</h1>
    <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Informazioni Utente</h4>
        <c:url var="url" value="/update"/>
        <form:form action="${url}" method="post" modelAttribute="modU">
        <div class="row g-3">
            <div class="col">
                <label for="form-name">Nome</label>
                <button value="name" onclick="disable(this)" type="button"
                        class="btn small btn-light">Modifica
                </button>
                <form:input path="name" type="text" id="form-name" class="form-control" value="${modU.name}"
                            aria-label="First name" disabled="true"/>

            </div>
            <div class="col">
                <label for="form-surname">Cognome
                    <button value="surname" onclick="disable(this)" type="button"
                            class="btn small btn-light">Modifica
                </label></button>
                <form:input path="surname" type="text" id="form-surname" class="form-control"
                            value="${modU.surname}"
                            aria-label="Last name" disabled="true"/>

            </div>
        </div>

        <div class="row g-3">
            <div class="col">
                <label for="form-email">Email</label>
                <button id="btn" value="email" onclick="disable(this)"
                        type="button" class="btn small btn-light">Modifica
                </button>
                <form:input path="email" type="text" id="form-email" class="form-control"
                            value="${modU.email}"
                            disabled="true"/>
            </div>
            <div class="col">
                <label for="form-password">Password</label>
                <button value="password" onclick="disableP(this)"
                        type="button" class="btn small btn-light">Modifica
                </button>
                <form:input path="password" type="password" id="form-password" class="form-control"
                            value="${modU.password}"
                            aria-label="Last name" disabled="true"/>
                <form:hidden path="id" value="${modU.id}"/>
                <form:hidden path="role" value="${modU.role}"/>
            </div>
        </div>

        <div class="row g-3">

            <div class="col">
                <label for="form-birth">Data di nascita
                    <button value="birth" onclick="disable(this)" type="button"
                            class="btn btn-light small">Modifica
                </label></button>
                <fmt:formatDate pattern="yyyy-MM-dd"
                                var="birthconv" value="${modU.birth}"/>
                <input name="data" type="date" class="form-control" id="form-birth"
                            value="${birthconv}" disabled="true"/>
            </div>
        </div>
            <hr class="mb-4">
            <button onclick="disableAll()" class="btn btn-outline-success btn-shadow text-mono" name="sub"
                    type="submit">Conferma
            </button>
            </form:form>
        </div>
    </div>
    <jsp:include page="../includes/script.jsp"></jsp:include>
</body>
</html>
