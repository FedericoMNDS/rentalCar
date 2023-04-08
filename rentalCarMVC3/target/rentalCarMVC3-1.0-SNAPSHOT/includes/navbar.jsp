<%@ page import="it.si2001.model.User" %><%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 20/05/2022
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand">Rental Car</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/indexUser">Homepage</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"
                   href="${pageContext.request.contextPath}/showParcoAuto/aggiungiPrenotazione">Parco
                    Auto</a>
            </li>
            <c:if test="${auth.role.equals('ADMIN')}">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/listaCustomer">Lista Customer(AD)</a>
                </li>
            </c:if>

        </ul>


        <div class="div-left">
            <c:choose>
                <c:when test="${not empty auth}">
                    <c:if test="${auth.getRole().equals('CUSTOMER')}">
                    <a href="${pageContext.request.contextPath}/update" class="btn fLeft btn-primary">${auth.name}</a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/logout" class="btn fLeft btn-danger">Logout</a>
                </c:when>
                <c:when test="${empty auth}">
                    <button type="button" class="btn fLeft btn-warning" data-bs-toggle="modal"
                            data-bs-target="#loginModal"
                            data-bs-whatever="@mdo">Login
                    </button>
                    <a href="${pageContext.request.contextPath}/addUser" class="btn fLeft btn-secondary">Registrati</a>
                </c:when>
            </c:choose>
        </div>
    </div>

    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                                ${errorMessage}
                        </div>
                    </c:if>
                    <form:form action="${pageContext.request.contextPath}/loginUser" method="post">
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Email</label>
                        <input type="email" name="email" class="form-control" placeholder="mandisfederico@gmail.com"
                               id="recipient-name">
                    </div>
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Password"
                               id="message-text">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                    <button type="submit" class="btn btn-primary">Invia</button>
                </div>
                </form:form>
            </div>
        </div>
    </div>


</nav>



