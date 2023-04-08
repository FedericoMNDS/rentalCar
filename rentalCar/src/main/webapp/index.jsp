<%@ page import="it.si2001.rentalcar.model.Booking" %>
<%@ page import="java.util.List" %>
<%@ page import="it.si2001.rentalcar.dao.BookingDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="static java.time.temporal.ChronoUnit.DAYS" %>
<%@ page import="it.si2001.rentalcar.dao.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 22/04/2022
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Homepage Rental Car</title>
    <%@ include file="includes/navbar.jsp" %>
    <%
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
        BookingDAO x = new BookingDAO();
    %>
</head>

<body>
<div class="background"></div>
<%
    String s1 = (String) request.getSession().getAttribute("successMessage");
    String idM = request.getParameter("mod");
    if (s1 != null) {
%>
<div class="alert alert-success alertCent alert-dismissible fade show" role="alert">
    <%
        out.print(s1);
        request.getSession().removeAttribute("successMessage");
    %>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%}%>

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
            <img src="pictures/showroom.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="5000">
            <img src="pictures/showroom2.png" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="5000">
            <img src="pictures/showroom3.jpg" class="d-block w-100" alt="...">
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
    <%
        if (auth != null && auth.getRole().equals("CUSTOMER")) {
            List<Object[]> b = x.selectBooking(auth.getId());
    %>
    <h2>Buongiorno <%out.print(auth.getName());%>, ecco le tue prenotazioni</h2>
    <%@include file="pages/tabellaPrenotazioni.jsp" %>
    <%
    } else if (auth != null && auth.getRole().equals("ADMIN")) {
        String name = request.getParameter("name");
        String surname = request.getParameter("surn");
        List<Object[]> b;
        b = x.selectBooking();
        if (name != null) {
            if (name.equals(""))
                name = null;
            if (surname.equals(""))
                surname = null;
            b = x.selectBooking(name, surname);
        }
    %>

    <h2>Utente ADMIN, ecco le prenotazioni
    </h2>
    <form action="index.jsp" method="post" class="d-flex">
        <input class="form-control me-2 small3" type="search" name="name" placeholder="Filtro Nome Utente"
               aria-label="Search">
        <input class="form-control me-2 small3" type="search" name="surn" placeholder="Filtro Cognome Utente"
               aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Cerca</button>
    </form>
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
        <%for (int i = 0; i < b.size(); i++) {%>
        <tr class="table-info">
            <th scope="row"><%out.print(i + 1);%></th>
            <td><%out.print(b.get(i)[0]);%></td>
            <td><%out.print(b.get(i)[1]);%></td>
            <td><%out.print(b.get(i)[2]);%></td>
            <td><%out.print(b.get(i)[3]);%></td>
            <td><%out.print(b.get(i)[4]);%></td>
            <td><%out.print(sdf.format(b.get(i)[6]));%></td>
            <td><%out.print(sdf.format(b.get(i)[7]));%></td>
            <td>
                <form action="acceptServlet" method="post">
                    <input type="hidden" name="id" value="<%out.print(b.get(i)[8]);%>">
                    <button type="submit" name="val" value="1" class="small2 btn-success">Accetta</button>
                    <button type="submit" name="val" value="2" class="small2 btn-danger"> Declina
                    </button>
                </form>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <%} else {%><h3>ACCEDI PER VEDERE LE TUE PRENOTAZIONI</h3><%}%>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script>function show(name) {
    var myModal = new bootstrap.Modal(document.getElementById(name), {});
    myModal.show();
}
</script>
<%
    if (s != null) {
%>
<script>show('exampleModal');</script>
<%}%>
<%
    if (idM != null) {
%>
<script>show('modifyModal');</script>
<%}%>
</html>
