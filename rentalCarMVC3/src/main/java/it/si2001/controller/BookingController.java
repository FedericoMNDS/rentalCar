package it.si2001.controller;

import it.si2001.model.Booking;
import it.si2001.model.Car;
import it.si2001.model.User;
import it.si2001.service.BookingService;
import it.si2001.service.CarService;
import it.si2001.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private CarService carService;

    @Autowired
    private UserService userService;

    @PostMapping(value = "/aggiungiPrenotazione")
    public String addBooking(HttpSession session,@ModelAttribute("bookingX") Booking b, @RequestParam("idUser") Long idUser, @RequestParam("idCar") Long idCar) throws ParseException {
        b.setCarByIdCar(carService.getCarById(idCar));
        b.setUserByIdUser(userService.getUserById(idUser));
        this.bookingService.addBooking(b);
        session.setAttribute("successMessage", "Prenotazione effettuata con successo!");
        return "redirect:/updateIndexUser";
    }

    @PostMapping(value = "/eliminaPrenotazione")
    public String deleteBooking(@RequestParam("idBooking") Long idBooking, HttpSession session) {
        this.bookingService.deleteBooking(idBooking);
        session.setAttribute("successMessage", "Prenotazione eliminata con successo!");
        return "redirect:/updateIndexUser";
    }

    @PostMapping(value = "/confermaPrenotazione")
    public String confirmPrenotation(HttpSession session,@ModelAttribute("bookingX") Booking b, @RequestParam("val") byte conf) {
        b.setConf(conf);
        this.bookingService.updateBooking(b);
        session.setAttribute("successMessage", "Prenotazione <strong>CONFERMATA!</strong>");
        return "redirect:/indexUser";
    }


    @PostMapping(value = "/modificaPrenotazione")
    public String modBooking(HttpSession session,@ModelAttribute("bookingX") Booking b, @RequestParam(value = "date1", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateOn, @RequestParam(value = "date2", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateOff, @RequestParam(value = "idCar", required = false) Long idCar) throws ParseException {
        b.setDateOn(dateOn);
        b.setDateOff(dateOff);
        if (idCar != null)
            b.setCarByIdCar(carService.getCarById(idCar));
        this.bookingService.updateBooking(b);
        session.setAttribute("successMessage", "Prenotazione modificata con successo!");
        return "redirect:/updateIndexUser";
    }

    @ModelAttribute("bookingX")
    public Booking getBooking(@RequestParam(value = "id", required = false) Long id) {
        return id != null ? this.bookingService.getBookingById(id) : new Booking();
    }
}
