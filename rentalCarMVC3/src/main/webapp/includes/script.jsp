<%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 31/05/2022
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

function getId(objButton) {
    var x = objButton.value;
    document.getElementById("pren").value = x;
}



</script>
