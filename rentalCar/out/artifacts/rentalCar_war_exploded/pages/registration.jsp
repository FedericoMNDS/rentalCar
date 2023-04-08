<%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 21/04/2022
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrazione</title>

    <%@include file="/includes/navbar2.jsp" %>

</head>

<body>
<div class="background"></div>
<%
    String s1 = (String) session.getAttribute("errorMessage");
    if (s1 != null) {
%>
<div class="alert alert-warning alertCent alert-dismissible fade show" role="alert">
    <%
        out.print(s1);
        request.getSession().removeAttribute("errorMessage");
    %>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%}%>
<div class="wrapper">
    <h1 class="mb-5 titles">Form di registrazione</h1>

    <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Informazioni nuovo utente</h4>
        <form action="../registrationServlet" method="post" class="needs-validation" novalidate>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="firstName">Nome</label>
                    <input type="text" class="form-control" id="firstName" placeholder="Federico" name="name" value=""
                           required>
                    <div class="invalid-feedback">
                        Inserire un nome valido
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="lastName">Cognome</label>
                    <input type="text" class="form-control" id="lastName" placeholder="Mandis" name="surname" value=""
                           required>
                    <div class="invalid-feedback">
                        Inserire un cognome valido
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com"
                           required>
                    <div class="invalid-feedback">
                        Inserire un indirizzo email valido
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="Password">Password</label>
                    <input type="password" class="form-control" id="Password" name="password" placeholder="Password"
                           value="" required>
                    <div class="invalid-feedback">
                        Inserire una password valida
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="birth">Data di nascita</label>
                    <input type="date" class="form-control" id="birth" name="birth" value="" required>
                    <div class="invalid-feedback">
                        Inserire una data corretta
                    </div>
                </div>
            </div>
            <button class="btn btn-outline-primary btn-shadow text-mono" name="sub" value="CUSTOMER" type="submit">
                Registrati
            </button>
        </form>
    </div>
</div>

<script src="../includes/validation.js"></script>
</body>
<%@include file="/includes/script.jsp" %>

</html>


