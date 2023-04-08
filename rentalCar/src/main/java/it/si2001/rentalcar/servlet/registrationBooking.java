package it.si2001.rentalcar.servlet;

import it.si2001.rentalcar.dao.UserDAO;
import it.si2001.rentalcar.model.Booking;
import it.si2001.rentalcar.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "registrationBooking", value = "/registrationBooking")
public class registrationBooking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id_car = Long.valueOf(request.getParameter("pren"));
        User x = (User) request.getSession().getAttribute("auth");
        Booking b = new Booking();
        b.setIdCar(id_car);
        b.setIdUser(x.getId());
        String dateOn = request.getParameter("dateOn");
        String dateOff = request.getParameter("dateOff");
        try {
            Date on = new SimpleDateFormat("yyyy-MM-dd").parse(dateOn);
            Date off = new SimpleDateFormat("yyyy-MM-dd").parse(dateOff);
            b.setDateOn(on);
            b.setDateOff(off);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        b.setConf((byte) 0);
        UserDAO u = new UserDAO();
        u.saveUser(b);
        request.getSession().setAttribute("successMessage", "Prenoazione effettuata con successo!");
        response.sendRedirect("index.jsp");
    }
}
