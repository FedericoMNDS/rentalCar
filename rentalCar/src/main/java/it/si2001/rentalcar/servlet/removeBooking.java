package it.si2001.rentalcar.servlet;

import it.si2001.rentalcar.dao.BookingDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/removeBooking")
public class removeBooking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("delBooking"));
        BookingDAO b = new BookingDAO();
        b.deleteBooking(id);
        response.sendRedirect("index.jsp");
    }
}
