<%@ page import="it.si2001.rentalcar.dao.UserDAO" %>
<%@ page import="it.si2001.rentalcar.model.Booking" %>
<%@ page import="it.si2001.rentalcar.dao.BookingDAO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 05/05/2022
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Prenotazioni Cliente</title>
    <%@include file="/includes/navbar2.jsp" %>
<%SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
    SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
    BookingDAO x = new BookingDAO();
    List<Object[]> b=x.selectBooking((Long) session.getAttribute("idPrenotazione"));%>
</head>
<body>
<div class="background"></div>
<div class="wrapper">
    <h2>Visualizzazione prenotazioni cliente</h2>
<%@include file="tabellaPrenotazioni.jsp"%>
</div>
</body>
<%@include file="/includes/script.jsp" %>
</html>
