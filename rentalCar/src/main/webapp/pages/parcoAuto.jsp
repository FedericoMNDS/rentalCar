<%@ page import="it.si2001.rentalcar.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="it.si2001.rentalcar.dao.CarDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 02/05/2022
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Parco Auto</title>
    <%@include file="/includes/navbar2.jsp" %>
    <%
        CarDAO x = new CarDAO();
        List<Car> allCars = x.findAllCars();
        String modBtn = request.getParameter("modBtn");
        String s1 = (String) request.getSession().getAttribute("successMessage");
        String s2 = (String) request.getSession().getAttribute("warningMessage");

    %>
</head>
<body>
<div class="background"></div>
<%
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

<div class="wrapper">
    <h3 class="titles">Parco Auto
        <%if (auth != null && auth.getRole().equals("ADMIN")) {%>
        <button type="button"
                class="btn com btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Nuovo
        </button>
    </h3>

    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Registrazione nuovo veicolo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%
                        if (s2 != null) {
                    %>
                    <div class="alert alert-warning alertCent alert-dismissible fade show" role="alert">
                        <%
                            out.print(s2);
                            request.getSession().removeAttribute("warningMessage");
                        %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%}%>

                    <form class="needs-validation" action="../registrationCarServlet" method="post"
                          enctype="multipart/form-data" novalidate>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="Brand">Brand</label>
                                <select class="form-select" name="brand" id="brand" required>
                                    <option selected disabled value="">Seleziona un brand</option>
                                    <option value="VolkSwagen">VolkSwagen</option>
                                    <option value="Audi">Audi</option>
                                    <option value="BMW">BMW</option>
                                    <option value="Alfa Romeo">Alfa Romeo</option>
                                    <option value="Opel">Opel</option>
                                    <option value="Ford">Opel</option>
                                    <option value="Citroen">Opel</option>
                                    <option value="Toyota">Opel</option>
                                    <option value="Lancia">Opel</option>
                                </select>
                                <div class="invalid-feedback">
                                    Inserire un brand valido.
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="model">Modello</label>
                                <input type="text" class="form-control" name="model" id="model" placeholder="Golf"
                                       required>
                                <div class="invalid-feedback">
                                    Inserire un modello valido
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="type">Tipo</label>
                                <select id="type" class="form-select" name="type" required>
                                    <option selected disabled value="">Seleziona un tipo</option>
                                    <option value="Van">Furgone</option>
                                    <option value="Sedan">Berlina</option>
                                    <option value="Coupe">Coupe</option>
                                    <option value="Hatchback">Hatchback</option>
                                </select>
                                <div class="invalid-feedback">
                                    Inserire un tipo di veicolo valido
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="registration">Anno di immatricolazione</label>
                                <input type="number" id="registration" class="form-control" name="registration"
                                       id=registration" min="1980"
                                       max="2022" step="1" value="2020"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="plate">Targa</label>
                                <input type="text" class="form-control" name="plate" id="plate"
                                       placeholder="FN164AF"
                                       required>
                                <div class="invalid-feedback">
                                    Inserire una targa valida
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
                                <input class="form-control" name="img" type="file" id="formFile">
                            </div>
                        </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                    <button type="submit" class="btn btn-primary">Salva</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <%}%>
    </h3>
    <%
        if (allCars != null) {
            Long id;
            for (int i = 0; i < allCars.size(); i++) {
                if (i % 2 == 0) {
    %>

    <div class="cont2"><%}%>
        <div class="card mb-3">
            <img src="../pictures/<%out.print(allCars.get(i).getImg());%>" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><%out.print(allCars.get(i).getBrand() + " " + allCars.get(i).getModel());%></h5>
                <p class="card-text">Specifiche del veicolo</p>
                <ul>
                    <li><b>Marca: </b><%out.print(allCars.get(i).getBrand());%></li>
                    <li><b>Modello: </b><%out.print(allCars.get(i).getModel());%></li>
                    <li><b>Cavalli: </b><%out.print(allCars.get(i).getHp() + "cv");%></li>
                    <li><b>Immatricolazione: </b><%out.print(allCars.get(i).getCarRegistration());%></li>
                </ul>
                <%if (auth != null && auth.getRole().equals("ADMIN")) {%>
                <form action="../removeServlet" method="post">
                    <button type="submit" value="<%out.print(allCars.get(i).getId());%>" name="del"
                            class="btn btn-danger"> Elimina
                    </button>
                </form>
                <%
                } else {
                    if (modBtn != null) {
                %>
                <form action="../modifyBookingServlet" method="post">
                        <%}else{%>
                    <form action="../registrationBooking" method="post">
                        <%}%>
                        <button type="button" onclick="getId(this)" class="btn btn-info" data-bs-toggle="modal"
                                value="<%out.print(allCars.get(i).getId());%>" data-bs-target="#carModal">Prenota
                        </button>
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

                                        <div class="row g-3">
                                            <div class="col">
                                                <label for="dateOn">Data di inizio prenotazione
                                                </label></button>
                                                <%
                                                    Date d = new Date();
                                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                %>
                                                <input type="date" class="form-control"
                                                       min="<%out.print(sdf.format(d).toString());%>" name="dateOn"
                                                       id="dateOn"
                                                       value="">
                                            </div>
                                        </div>
                                        <div class="row g-3">
                                            <div class="col">
                                                <label for="dateOff">Data di fine prenotazione
                                                </label></button>
                                                <input type="date" min="<%out.print(sdf.format(d).toString());%>"
                                                       class="form-control" name="dateOff" id="dateOff"
                                                       value="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi
                                        </button>
                                        <button type="submit" id="pren" name="pren"
                                                class="btn btn-info">Prenota Ora
                                        </button>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </form>
                        <%}%>
            </div>
        </div>
        <%if (i % 2 != 0) {%>
    </div>
    <%
                }
            }
        }
    %>
</div>
</div>
<script>
    function getId(objButton) {
        var x = objButton.value;
        document.getElementById("pren").value = x;
    }
</script>
<script src="../includes/validation.js"></script>
</body>
<%@include file="/includes/script.jsp" %>
<script>function show() {
    var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), {});
    myModal.show();
}
</script>
<%
    if (s2 != null) {
%>
<script>show();</script>
<%}%>
</html>
