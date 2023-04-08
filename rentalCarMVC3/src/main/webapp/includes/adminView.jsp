<%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 11/06/2022
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h2>Ricerca prenotazioni per NOME e COGNOME</h2>
<form:form action="${pageContext.request.contextPath}/indexUser" method="post" class="d-flex">
    <input class="form-control me-2 small3" type="search" name="name" placeholder="Filtro Nome Utente"
           aria-label="Search">
    <input class="form-control me-2 small3" type="search" name="surname" placeholder="Filtro Cognome Utente"
           aria-label="Search">
    <button class="btn btn-outline-success" type="submit">Cerca</button>
</form:form>
<c:choose>
<c:when test="${not empty bookingsConf}">
<table class="table table-success table-bordered">
    <thead>
    <tr>
        <th scope="col"></th>
        <th scope="col">Nome</th>
        <th scope="col">Cognome</th>
        <th scope="col">Brand</th>
        <th scope="col">Modello</th>
        <th scope="col">Targa</th>
        <th scope="col">Data Inizio</th>
        <th scope="col">Data Fine</th>
        <th scope="col">Opzioni</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${bookingsConf}" var="booking" varStatus="count">
    <tr class="table-info">
        <th scope="row">${count.index + 1}</th>
        <td>${booking.userByIdUser.name}</td>
        <td>${booking.userByIdUser.surname}</td>
        <td>${booking.carByIdCar.brand}</td>
        <td>${booking.carByIdCar.model}</td>
        <td>${booking.carByIdCar.plate}</td>
        <fmt:formatDate pattern="yyyy-MM-dd"
                        var="dateOn" value="${booking.dateOn}"/>
        <td>${dateOn}</td>
        <fmt:formatDate pattern="yyyy-MM-dd"
                        var="dateOff" value="${booking.dateOff}"/>
        <td>${dateOff}</td>
        <td>
            <form:form action="${pageContext.request.contextPath}/confermaPrenotazione" method="post"
                       modelAttribute="bookingX">
            <input type="hidden" name="id" value="${booking.id}">
                <button type="submit" name="val" value="1" class="small2 btn-success">Accetta</button>
                <button type="submit" name="val" value="2" class="small2 btn-danger"> Declina
                </button>
            </form:form>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</c:when>
<c:otherwise>
    <h2><br>Utente ADMIN, nessuna prenotazione trovata.</h2>
</c:otherwise>
</c:choose>