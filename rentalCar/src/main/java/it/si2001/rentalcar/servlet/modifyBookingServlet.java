package it.si2001.rentalcar.servlet;

import it.si2001.rentalcar.dao.BookingDAO;
import it.si2001.rentalcar.model.Booking;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/modifyBookingServlet")
public class modifyBookingServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Object attribute = request.getSession().getAttribute("bookingMod");
        Long idBooking = Long.parseLong(String.valueOf(attribute));
        Booking b = entityManager.find(Booking.class, idBooking);
        BookingDAO b1 = new BookingDAO();
        String dateOn = request.getParameter("dateOn");
        String dateOff = request.getParameter("dateOff");
        try {
            Date on = new SimpleDateFormat("yyyy-MM-dd").parse(dateOn);
            Date off = new SimpleDateFormat("yyyy-MM-dd").parse(dateOff);
            String conferma=request.getParameter("date");
            if (conferma!=null) {
                b1.updateBooking(b, on, off);
            } else {
                Long idCar = Long.valueOf(request.getParameter("pren"));
                b1.updateBooking(b, idCar, on, off);
            }
            request.getSession().setAttribute("successMessage", "Prenoazione aggiornata con successo!");
            response.sendRedirect("index.jsp");
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
