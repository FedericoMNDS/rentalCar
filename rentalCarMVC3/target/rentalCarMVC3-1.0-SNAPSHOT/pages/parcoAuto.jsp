<%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 03/06/2022
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <jsp:include page="../includes/navbar.jsp"></jsp:include>
    <title>Parco Auto</title>
</head>
<body>
<div class="background"></div>
<c:if test="${not empty successMessage}">
    <div class="alert alert-success alertCent alert-dismissible fade show" role="alert">
            ${successMessage}
        <%session.removeAttribute("successMessage");%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<div class="wrapper">
    <h3>Parco Auto
        <c:if test="${auth.role.equals('ADMIN')}">
            <button type="button"
                    class="btn com btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Nuovo
            </button>
        </c:if>
    </h3>
    <%int x = 2;%>

    <c:forEach items="${listCar}" var="car">
        <%if (x % 2 == 0) {%>
        <div class="cont2">
            <%}%>
            <div class="card mb-3">
                <img src="${pageContext.request.contextPath}/resources/carPictures/${car.img}" class="card-img-top"
                     alt="...">
                <div class="card-body">
                    <h5 class="card-title">${car.brand} ${car.model}</h5>
                    <p class="card-text">Specifiche del veicolo</p>
                    <ul>
                        <li><b>Marca:</b> ${car.brand}</li>
                        <li><b>Modello:</b> ${car.model}</li>
                        <li><b>Cavalli:</b> ${car.hp}cv</li>
                    </ul>
                    <c:choose>
                        <c:when test="${auth.getRole().equals('CUSTOMER')}">
                            <button type="button" onclick="getId(this)" class="btn btn-info" value="${car.id}"
                                    class="btn btn-info"
                                    data-bs-toggle="modal"
                                    data-bs-target="#carModal">Prenota Ora
                            </button>
                        </c:when>
                        <c:when test="${auth.getRole().equals('ADMIN')}">
                            <form:form action="${pageContext.request.contextPath}/eliminaAuto" style="float:left"
                                       method="post">
                                <button type="submit" name="idCar" value="${car.id}" class="btn btn-danger">Elimina
                                </button>
                            </form:form>
                        </c:when>
                    </c:choose>
                </div>
            </div>

            <%if (x % 2 != 0) {%>
        </div>
        <%}%>
        <%x++;%>
    </c:forEach>
</div>

<c:if test="${not empty path}">
    <div class="modal fade" id="carModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Conferma prenotazione di</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form:form action="${pageContext.request.contextPath}/${path}" method="post"
                               modelAttribute="bookingX">
                    <div class="row g-3">
                        <div class="col">
                            <label for="date1">Data di inizio prenotazione
                            </label></button>
                            <input type="hidden" name="id" value="${idBookingMod}"/>
                            <input type="hidden" name="idUser" value="${auth.id}"/>
                            <input type="hidden" name="idCar" id="pren"/>
                            <form:hidden path="conf" value="0"/>
                            <c:set var="now" value="<%=new java.util.Date()%>"/>
                            <fmt:formatDate pattern="yyyy-MM-dd"
                                            var="today" value="${now}"/>
                            <c:choose>
                                <c:when test="${path.equals('aggiungiPrenotazione')}">
                                    <form:input path="dateOn" type="date" class="form-control"
                                                name="date1" min="${today}" value="${today}" id="date1"/>

                                </c:when>
                                <c:otherwise>
                                    <input type="date" min="${today}" value="${today}" class="form-control" name="date1" id="date1">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="row g-3">
                        <div class="col">
                            <label for="date2">Data di fine prenotazione
                            </label></button>
                            <c:choose>
                                <c:when test="${path.equals('aggiungiPrenotazione')}">

                                    <form:input path="dateOff" type="date"
                                                class="form-control" min="${today}" value="${today}" name="date2" id="date2"/>
                                </c:when>
                                <c:otherwise>
                                    <input type="date" class="form-control" min="${today}" value="${today}" name="date2" id="date2">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi
                    </button>
                    <button type="submit" name="idC" class="btn btn-info">Prenota Ora
                    </button>
                </div>
                </form:form>
            </div>

        </div>
    </div>
</c:if>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Registrazione nuovo veicolo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <div class="modal-body">


                <form:form action="${pageContext.request.contextPath}/aggiungiAuto" method="post"
                           enctype="multipart/form-data" modelAttribute="car" class="form-horizontal">

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="Brand">Brand</label>
                        <form:select path="brand" class="form-select" id="brand">
                            <option selected disabled>Seleziona un brand</option>
                            <form:option value="VolkSwagen">VolkSwagen</form:option>
                            <form:option value="Audi">Audi</form:option>
                            <form:option value="BMW">BMW</form:option>
                            <form:option value="Alfa Romeo">Alfa Romeo</form:option>
                            <form:option value="Opel">Opel</form:option>
                            <form:option value="Ford">Ford</form:option>
                            <form:option value="Citroen">Citroen</form:option>
                            <form:option value="Toyota">Toyota</form:option>
                            <form:option value="Lancia">Lancia</form:option>
                        </form:select>
                        <div class="has-errors">
                            <form:errors path="brand" class="has-errors"/>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="model">Modello</label>
                        <form:input path="model" type="text" class="form-control" id="model" placeholder="Golf"/>
                        <div class="has-errors">
                            <form:errors path="model" class="has-errors"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="type">Tipo</label>
                        <form:select path="type" id="type" class="form-select">
                            <option selected disabled>Seleziona un tipo</option>
                            <option value="Van">Furgone</option>
                            <option value="Sedan">Berlina</option>
                            <option value="Coupe">Coupe</option>
                            <option value="Hatchback">Hatchback</option>
                        </form:select>
                        <div class="has-errors">
                            <form:errors path="type" class="has-errors"/>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="registration">Anno di immatricolazione</label>
                        <form:input path="carRegistration" type="number" id="registration" class="form-control"
                                    name="registration" min="1980"
                                    max="2022" step="1" value="2020"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="plate">Targa</label>
                        <form:input path="plate" type="text" class="form-control" id="plate"
                                    placeholder="FN164AF"/>
                        <div class="has-errors">
                            <form:errors path="plate" class="has-errors"/>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="hp">Cavalli</label>
                        <input id="hp" type="number" class="form-control" name="hp" min="50" max="1500"
                               step="1"
                               value="110"/>

                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="formFile" class="form-label">Immagine veicolo</label>
                        <input class="form-control" name="imgCar" type="file" id="formFile">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                <button type="submit" class="btn btn-primary">Salva</button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../includes/script.jsp"></jsp:include>
</body>
</html>
