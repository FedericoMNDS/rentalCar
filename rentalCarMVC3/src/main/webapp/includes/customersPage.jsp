<%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 17/06/2022
  Time: 01:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:choose>
    <c:when test="${not empty customers}">
        <h2>Utente ADMIN, ecco la lista dei customer.</h2>
        <table class="table table-success table-bordered">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Nome</th>
                <th scope="col">Cognome</th>
                <th scope="col">Data di nascita</th>
                <th scope="col">Email</th>
                <th scope="col">Password</th>
                <th scope="col">Opzioni</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customers}" var="customer" varStatus="count">
                <tr class="table-info">
                    <th scope="row">${count.index + 1}</th>
                    <td>${customer.name}</td>
                    <td>${customer.surname}</td>
                    <fmt:formatDate pattern="yyyy-MM-dd"
                                    var="birth" value="${customer.birth}"/>
                    <td>${birth}</td>
                    <td>${customer.email}</td>
                    <td>${customer.password}</td>
                    <td>

                        <a href="${pageContext.request.contextPath}/customerBookings/${customer.id}" class="small2 btn-info">Info
                        </a>
                        <a href="${pageContext.request.contextPath}/update/${customer.id}" class="small2 btn-success">Modifica</a>
                        <button type="submit" name="del" value="user" class="small2 btn-danger"> Elimina</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <h2>Utente ADMIN, nessun customer presente.</h2>
    </c:otherwise>
</c:choose>