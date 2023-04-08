<%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 29/04/2022
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/includes/navbar2.jsp" %>
    <title>Registration</title>
</head>
<body>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
    X
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Registrazione nuovo veicolo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="needs-validation" action="../registrationCarServlet" method="post" novalidate>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="Brand">Brand</label>
                            <select class="form-select" name="brand" id="brand" aria-label="Default select example">
                                <option selected>Seleziona un brand</option>
                                <option value="VolkSwagen">VolkSwagen</option>
                                <option value="Audi">Audi</option>
                                <option value="BMW">BMW</option>
                                <option value="Alfa Romeo">Alfa Romeo</option>
                                <option value="Opel">Opel</option>
                            </select>
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
                            <select id="type" class="form-select" name="type" aria-label="Default select example">
                                <option selected value="Car">Auto</option>
                                <option value="Van">Furgone</option>
                                <option value="Sedan">Berlina</option>
                                <option value="Coupe">Coupe</option>
                                <option value="Hatchback">Hatchback</option>

                            </select>
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
                            <input type="text" class="form-control" name="plate" id="plate" placeholder="FN164AF"
                                   required>
                            <div class="invalid-feedback">
                                Inserire un modello valido
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="hp">Cavalli</label>
                            <input id="hp" type="number" class="form-control" name="hp" min="50" max="1500" step="1"
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
</body>
<%@include file="/includes/script.jsp" %>
</html>
