<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Homepage Rental Car</title>
    <jsp:include page="includes/navbar.jsp"></jsp:include>
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
<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="5000">
            <img src="${pageContext.request.contextPath}/resources/pictures/showroom.jpg" class="d-block w-100"
                 alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="5000">
            <img src="${pageContext.request.contextPath}/resources/pictures/showroom2.png" class="d-block w-100"
                 alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="5000">
            <img src="${pageContext.request.contextPath}/resources/pictures/showroom3.jpg" class="d-block w-100"
                 alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


<div class="wrapper">
    <c:choose>
        <c:when test="${not empty view}">
            <jsp:include page="${view}"></jsp:include>
        </c:when>
        <c:otherwise>
            <h5>ACCEDI PER VISUALIZZARE LE TUE PRENOTAZIONI</h5>
        </c:otherwise>
    </c:choose>
</div>

<c:if test="${not empty bookingMod}">
    <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Scheda di Modifica Prenotazione</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="divLeft">
                        <div class="card mb-3">
                            <img src="${pageContext.request.contextPath}/resources/carPictures/${bookingMod.carByIdCar.img}"
                                 class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${bookingMod.carByIdCar.brand} ${bookingMod.carByIdCar.model}</h5>
                                <p class="card-text">Specifiche</p>
                                <ul>
                                    <li><b>Marca:</b> ${bookingMod.carByIdCar.brand} </li>
                                    <li><b>Modello:</b> ${bookingMod.carByIdCar.model}</li>
                                    <li><b>CV:</b> ${bookingMod.carByIdCar.hp}cv</li>
                                    <li><b>Immatricolazione:</b> ${bookingMod.carByIdCar.carRegistration}</li>
                                </ul>
                                <a href="${pageContext.request.contextPath}/showParcoAuto/modificaPrenotazione/${bookingMod.id}"
                                   class="btn btn-info">Cambia Veicolo
                                </a>
                            </div>
                        </div>
                        <form:form action="${pageContext.request.contextPath}/modificaPrenotazione"
                                   method="post"
                                   modelAttribute="bookingX">
                        <div class="divRight">
                            <div class="row g-3">
                                <div class="col">
                                    <label for="dateOn">Data di inizio prenotazione
                                    </label></button>
                                    <c:set var="now" value="<%=new java.util.Date()%>"/>
                                    <fmt:formatDate pattern="yyyy-MM-dd"
                                                    var="today" value="${now}"/>
                                    <input type="hidden" name="id" value="${bookingMod.id}"/>
                                    <input type="date" min="${today}" class="form-control"
                                           id="dateOn" name="date1"/>
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col">
                                    <label for="dateOff">Data di fine prenotazione
                                    </label></button>
                                    <input type="date" class="form-control"
                                           id="dateOff" min="${today}" name="date2"/>
                                </div>
                            </div>
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
</c:if>


<jsp:include page="includes/script.jsp"></jsp:include>

<c:if test="${!empty errorMessage}">
    <script>show('loginModal');</script>
</c:if>
<c:if test="${not empty bookingMod}">
    <script>show('modifyModal');</script>
</c:if>
</body>


</html>
