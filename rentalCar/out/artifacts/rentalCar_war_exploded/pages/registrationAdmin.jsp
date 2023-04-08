<%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 22/04/2022
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrazione ADMIN</title>
    <%@include file="/includes/navbar2.jsp" %>
</head>
<body>

<div class="background"></div>

<div class="wrapper">
    <h1 class="mb-5">Registrazione ADMIN</h1>

    <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Informazioni</h4>
        <form action="../registrationServlet" method="post" class="needs-validation" novalidate>
            <div class="row">
                <label class="sr-only" for="inlineFormInputGroup">Nome</label>
                <div class="input-group col-md-6 mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">admin.</div>
                    </div>
                    <input type="text" class="form-control" id="inlineFormInputGroup" name="name"
                           placeholder="federico">
                </div>
            </div>

            <div class="col-auto">

            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="nomeadmin">
                    <div class="invalid-feedback">
                        Inserire un indirizzo email valido
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="Password">Password</label>
                    <input type="password" class="form-control" id="Password" name="password"
                           placeholder="Password" value="" required>
                    <div class="invalid-feedback">
                        Inserire una password valida
                    </div>
                </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-outline-primary btn-shadow text-mono" name="sub" value="ADMIN"
                    type="submit">Registrati
            </button>
        </form>
    </div>
</div>


</body>
<%@include file="/includes/script.jsp" %>
</html>
