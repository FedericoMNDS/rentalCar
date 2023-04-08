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
<c:choose>
    <c:when test="${not empty bookings}">
<h2>Buongiorno ${auth.name}, ecco le tue prenotazioni.</h2>
<table class="table table-success table-bordered">
    <thead>
    <tr>
        <th scope="col"></th>
        <th scope="col">Brand</th>
        <th scope="col">Modello</th>
        <th scope="col">Targa</th>
        <th scope="col">Inizio prenotazione</th>
        <th scope="col">Termine prenotazione</th>
        <th scope="col">Opzioni</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${bookings}" var="booking" varStatus="count">
        <tr class="table-info">
            <th scope="row">${count.index + 1}</th>
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
                <c:choose>
                    <c:when test="${booking.difference(booking.dateOn)}">
                        <a href="${pageContext.request.contextPath}/indexUser/${booking.id}" class="small2 btn-success">Modifica</a>
                        <form:form action="${pageContext.request.contextPath}/eliminaPrenotazione" style="float: left">
                            <button type="submit" name="idBooking" value="${booking.id}" class="small2 btn-danger">
                                Elimina
                            </button>
                        </form:form>
                    </c:when>
                    <c:otherwise>
                        <h5>NON DISPONIBILE</h5>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
    </c:when>
    <c:otherwise>
        <h2>Buongiorno ${auth.name}, nessuna prenotazione disponibile al momento.</h2>
    </c:otherwise>
</c:choose>


