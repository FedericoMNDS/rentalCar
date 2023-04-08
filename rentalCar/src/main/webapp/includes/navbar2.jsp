<%@ page import="it.si2001.rentalcar.model.User" %><%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 22/04/2022
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User auth = (User) session.getAttribute("auth");
    String s = (String) session.getAttribute("errorMessage");
%>

<head>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Rental Car</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="../index.jsp">Homepage</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="parcoAuto.jsp">Parco Auto</a>
                </li>
                <%if (auth != null && auth.getRole().equals("ADMIN")) {%>
                <li class="nav-item">
                    <a class="nav-link" href="listaCustomer.jsp">Customer(AD)</a>
                </li>
                <%}%>
            </ul>


            <!–Utente non LOGGATO->
                <%if (auth == null) {%>
            <div class="div-left">
                <button type="button" class="btn btn-left btn-warning" data-bs-toggle="modal"
                        data-bs-target="#exampleModal"
                        data-bs-whatever="@mdo">Login
                </button>


                <a href="registration.jsp" class="btn btn-secondary">Registrati</a>
            </div>
                <%} else {%>
                <div class="div-left"><%
                    if (auth.getRole().equals("CUSTOMER")) {
                %>
                    <a href="profiloUtente.jsp" class="btn btn-left btn-primary"><%out.print(auth.getName());%>
                    </a>
                    <%}%>
                    <a href="../logoutServlet" class="btn btn-danger">Logout</a>
                </div>
                <%}%>
            </div>


            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <form action="../loginServlet" method="post">
                                <%
                                    if (s != null) {

                                %>
                                <script></script>
                                <div class="alert alert-danger" id="errore" role="alert">
                                    <%out.print(s);%>
                                </div>
                                <%
                                        session.removeAttribute("errorMessage");
                                    }%>
                                <div class="mb-3">
                                    <label for="login-email" class="col-form-label">Email</label>
                                    <input type="email" class="form-control" name="email"
                                           placeholder="mandisfederico@gmail.com" id="login-email">
                                </div>
                                <div class="mb-3">
                                    <label for="login-password" class="col-form-label">Password</label>
                                    <input type="password" class="form-control" name="pass" placeholder="Password"
                                           id="login-password">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi
                                    </button>
                                    <button class="btn btn-primary" type="submit">Invia</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </nav>
</head>
