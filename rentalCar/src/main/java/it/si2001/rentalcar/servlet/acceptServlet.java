package it.si2001.rentalcar.servlet;

import it.si2001.rentalcar.dao.BookingDAO;
import it.si2001.rentalcar.model.Booking;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/acceptServlet")
public class acceptServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    byte val=Byte.valueOf(request.getParameter("val"));
    Long id=Long.valueOf(request.getParameter("id"));
        BookingDAO b=new BookingDAO();
        b.updBooking(id, val);
        response.sendRedirect("index.jsp");
    }
}
