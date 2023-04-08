<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="it.si2001.rentalcar.dao.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 27/04/2022
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profilo Utente</title>
    <%@include file="/includes/navbar2.jsp" %>
    <%
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        ;

    %>
</head>
<body>
<%
    User mod;
    if(auth.getRole().equals("CUSTOMER")){
    mod =(User)session.getAttribute("auth");}
else {
    UserDAO y = new UserDAO();
 mod=y.findUser(Long.valueOf(request.getParameter("id")));
}
%>
<div class="background"></div>

<div class="wrapper">
    <h1 class="mb-5">Profilo Personale di <%out.print(mod.getName() + " " + mod.getSurname());%></h1>

    <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Informazioni Utente</h4>
        <form action="../updateServlet" method="post" class="needs-validation" novalidate>
            <div class="row g-3">
                <div class="col">
                    <label for="form-name">Nome</label>
                    <button value="name" onclick="disable(this)" type="button"
                            class="btn small btn-light">Modifica
                    </button>
                    <input type="text" id="form-name" name="name" class="form-control"
                           value="<%out.print(mod.getName());%>"
                           aria-label="First name"
                           disabled="true">

                </div>
                <div class="col">
                    <label for="form-surname">Cognome
                        <button value="surname" onclick="disable(this)" type="button"
                                class="btn small btn-light">Modifica
                    </label></button>
                    <input type="text" id="form-surname" name="surname" class="form-control"
                           value="<%out.print(mod.getSurname());%>"
                           aria-label="Last name" disabled="true">

                </div>
            </div>

            <div class="row g-3">
                <div class="col">
                    <label for="form-email">Email</label>
                    <button id="btn" value="email" onclick="disable(this)"
                            type="button" class="btn small btn-light">Modifica
                    </button>
                    <input type="text" id="form-email" name="email" class="form-control"
                           value="<%out.print(mod.getEmail());%>"
                           disabled="true">
                </div>
                <div class="col">
                    <label for="form-password">Password</label>
                    <button value="password" onclick="disableP(this)"
                            type="button" class="btn small btn-light">Modifica
                    </button>
                    <input type="password" id="form-password" name="password" class="form-control"
                           value="<%out.print(mod.getPassword());%>"
                           aria-label="Last name" disabled="true">
                </div>
            </div>

            <div class="row g-3">
                <div class="col">
                    <label for="form-birth">Data di nascita
                        <button value="birth" onclick="disable(this)" type="button"
                                class="btn btn-light small">Modifica
                    </label></button>
                    <input type="date" class="form-control" name="birth" id="form-birth"
                           value="<%out.print(sdf.format(mod.getBirth()).toString());%>" disabled>
                </div>
            </div>
            <hr class="mb-4">
            <input type="hidden" name="idmod" value="<%out.print(mod.getId());%>">
            <button onclick="disableAll()" class="btn btn-outline-success btn-shadow text-mono" name="sub" type="submit">Conferma</button>
        </form>
    </div>
</div>
<script>
    function disable(objButton) {
        var x = objButton.value;
        if (document.getElementById("form-" + x).disabled == true) {
            document.getElementById("form-" + x).disabled = "";
        } else {
            document.getElementById("form-" + x).disabled = true;
        }
    }

    function disableP(objButton) {
        if (document.getElementById("form-password").disabled == true) {
            document.getElementById("form-password").disabled = "";
            document.getElementById("form-password").type = "text";
        } else {
            document.getElementById("form-password").disabled = true;
            document.getElementById("form-password").type = "password";
        }
    }

    function disableAll() {
        var slides = document.getElementsByClassName("form-control");
        for (var i = 0; i < slides.length; i++) {
            slides[i].disabled = "";
        }
    }

</script>
</body>
<%@include file="/includes/script.jsp" %>
</html>
