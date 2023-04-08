package it.si2001.rentalcar.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/viewPrenotations")
public class viewPrenotations extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
Long id=Long.valueOf(request.getParameter("prenotazioni"));
request.getSession().setAttribute("idPrenotazione", id);
response.sendRedirect("pages/prenotazioni.jsp");
    }
}
