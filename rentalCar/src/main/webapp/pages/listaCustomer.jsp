<%@ page import="java.util.List" %>
<%@ page import="it.si2001.rentalcar.dao.UserDAO" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 10/05/2022
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista Customer</title>
    <%@include file="/includes/navbar2.jsp" %>
    <%
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        UserDAO us = new UserDAO();
        List<User> cust = us.findAllCustomers();%>
</head>
<body>
<div class="background"></div>
<%
    String s1 = (String) request.getSession().getAttribute("successMessage");
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
    <h2>Utente ADMIN, ecco la lista dei customer
        <a href="registration.jsp" class="btn com btn-success">Nuovo</a>
    </h2>
    <table class="table table-success table-bordered">
        <thead>
        <tr>
            <th scope="col"></th>
            <th scope="col">Nome</th>
            <th scope="col">Cognome</th>
            <th scope="col">Data di nascita</th>
            <th scope="col">Email</th>
            <th scope="col">Password</th>
            <th scope="col">Opzioni</th>
        </tr>
        </thead>
        <tbody>
        <%for (int i = 0; i < cust.size(); i++) {%>
        <tr class="table-info">
            <th scope="row"><%out.print(i + 1);%></th>
            <td><%out.print(cust.get(i).getName());%></td>
            <td><%out.print(cust.get(i).getSurname());%></td>
            <td><%out.print(sdf.format(cust.get(i).getBirth()));%></td>
            <td><%out.print(cust.get(i).getEmail());%></td>
            <td><%out.print(cust.get(i).getPassword());%></td>
            <td>
                <form style="float: left" action="../viewPrenotations" method="post">

                    <button type="submit" value="<%out.print((Long)cust.get(i).getId());%>" name="prenotazioni"
                            class="small2 btn-info">Info
                    </button>
                </form>
                <form style="float: left" action="../pages/profiloUtente.jsp" method="post">
                    <input type="hidden" name="id" value="<%out.print((Long)cust.get(i).getId());%>">
                    <button type="submit" name="sub" value="mod" class="small2 btn-success">Modifica</button>
                </form>
                <form style="float: left" action="../removeServlet" method="post">
                    <input type="hidden" name="id" value="<%out.print((Long)cust.get(i).getId());%>">
                    <button type="submit" name="del" value="user" class="small2 btn-danger"> Elimina</button>
                </form>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
</body>
<%@include file="/includes/script.jsp" %>
</html>
