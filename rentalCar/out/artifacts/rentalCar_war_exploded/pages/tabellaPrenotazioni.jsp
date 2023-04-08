<%@ page import="java.util.List" %>
<%@ page import="it.si2001.rentalcar.dao.BookingDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.time.Duration" %>
<%@ page import="static java.time.temporal.ChronoUnit.DAYS" %>
<%@ page import="it.si2001.rentalcar.model.Car" %><%--
  Created by IntelliJ IDEA.
  User: mandi
  Date: 05/05/2022
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Date oggi = new Date();
    Object[] modificare = new Object[8];
    if (idM != null) {
        Long bookingMod = Long.valueOf(idM);
        session.setAttribute("bookingMod", bookingMod);
        BookingDAO mod = new BookingDAO();
        modificare = mod.findModifyBooking(Long.valueOf(idM));
    }
%>
<table class="table table-success table-bordered">
    <thead>
    <tr>
        <th scope="col"></th>
        <th scope="col">Marca</th>
        <th scope="col">Modello</th>
        <th scope="col">Targa</th>
        <th scope="col">Inizio prenotazione</th>
        <th scope="col">Termine prenotazione</th>
        <th scope="col">Opzioni</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (int i = 0; i < b.size(); i++) {
            switch ((byte) (b.get(i)[3])) {
                case (byte) 0:%>
    <tr class="table-warning">
            <%break;
                case (byte)1:%>
    <tr class="table-info">
            <%break;
                case (byte)2:%>
    <tr class="table-danger">
            <%
                break;
            default:
        %>
    <tr>
        <%}%>
        <th scope="row"><%out.print(i + 1);%></th>
        <td><%out.print(b.get(i)[0]);%></td>
        <td><%out.print(b.get(i)[1]);%></td>
        <td><%out.print(b.get(i)[2]);%></td>
        <td><%out.print(sdf.format(b.get(i)[4]));%></td>
        <td><%out.print(sdf.format(b.get(i)[5]));%></td>
        <td>


            <%
                LocalDate o = LocalDate.now();
                Date v = (Date) sdf3.parse(b.get(i)[4].toString());
                LocalDate p = v.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                long diff = DAYS.between(p, o);
                if (diff >= 2 && auth.getRole().equals("CUSTOMER") && ((byte) (b.get(i)[3])) == 0) {
            %>

            <form style="float: left" action="index.jsp" method="post">
                <button type="submit" class="small2 btn-success" name="mod" value="<%out.print(b.get(i)[6]);%>">Modifica
                </button>
            </form>
            <form style="float: left" action="removeBooking" method="post">
                <button type="submit" class="small2 btn-danger" name="delBooking"
                        value="<%out.print(b.get(i)[6]);%>"> Elimina
                </button>
            </form>

            <%
            } else if (auth.getRole().equals("ADMIN")) {
                switch ((byte) (b.get(i)[3])) {
                    case (byte) 0:
            %>

            <form action="../acceptServlet" method="post">
                <input type="hidden" name="id" value="<%out.print(b.get(i)[6]);%>">
                <button type="submit" name="val" value="1" class="small2 btn-success">Accetta</button>
                <button type="submit" name="val" value="2" class="small2 btn-danger"> Declina
                </button>
            </form>

            <%
                    break;
                case (byte) 1:
            %>
            ACCETTATA
            <%
                    break;
                case (byte) 2:
            %>
            DECLINATA
            <%
                    break;
                default:
            %>
            <%}%>
            <%} else {%>
            NON DISPONIBILE
            <%}%>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
<%if(idM!=null){%>
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Scheda di Modifica Prenotazione</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="divLeft">
                    <div class="card mb-3">
                        <img src="pictures/<%out.print(modificare[3]);%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%out.print(modificare[0] + " " + modificare[1]);%></h5>
                            <p class="card-text">Specifiche</p>
                            <ul>
                                <li><b>Marca:</b> <%out.print(modificare[0]);%></li>
                                <li><b>Modello:</b> <%out.print(modificare[1]);%></li>
                                <li><b>CV:</b> <%out.print(modificare[2] + " cv");%></li>
                                <li><b>Immatricolazione:</b> <%out.print(modificare[4]);%></li>
                            </ul>
                            <form action="pages/parcoAuto.jsp" method="post">
                                <button type="submit" name="modBtn" value="mod" class="btn btn-info">Cambia Veicolo
                                </button>
                            </form>
                        </div>
                    </div>
                    <form action="modifyBookingServlet" method="post">
                        <div class="divRight">
                            <div class="row g-3">
                                <div class="col">
                                    <label for="dateOn">Data di inizio prenotazione
                                    </label></button>
                                    <input type="date" class="form-control"
                                           value="<%out.print(sdf3.format(modificare[5]).toString());%>"
                                           min="<%out.print(sdf3.format(oggi).toString());%>" name="dateOn"
                                           id="dateOn" value="">
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col">
                                    <label for="dateOff">Data di fine prenotazione
                                    </label></button>
                                    <input type="date" class="form-control"
                                           value="<%out.print(sdf3.format(modificare[6]).toString());%>"
                                           min="<%out.print(sdf3.format(oggi).toString());%>" name="dateOff"
                                           id="dateOff" value="">
                                </div>
                            </div>
                        </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                <button type="submit" name="date" value="date" class="btn btn-primary">Salva</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%}%>