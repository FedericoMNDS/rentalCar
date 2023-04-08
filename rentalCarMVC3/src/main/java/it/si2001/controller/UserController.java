package it.si2001.controller;

import it.si2001.model.Booking;
import it.si2001.model.User;
import it.si2001.service.BookingService;
import it.si2001.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BookingService bookingService;

    @RequestMapping(value = "/addUser")
    public String addUserx(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "pages/registrationUser";
    }

    @PostMapping(value = "/addUser")
    public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result, @RequestParam("data") String s) throws ParseException {
        if (result.hasErrors())
            return "pages/registrationUser";
        SimpleDateFormat sdl = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdl.parse(s);
        user.setBirth(d);
        this.userService.addUser(user);
        return "index";
    }

    @PostMapping(value = "/loginUser")
    public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        User u;
        try {
            u = this.userService.getUserByEmailPass(email, password);
            session.setAttribute("successMessage", "Utente loggato con successo!");
            session.setAttribute("auth", u);
            if (u.getRole().equals("CUSTOMER")) {
                mv.addObject("bookings", u.getBookingsById());
                mv.addObject("view", "includes/customerView.jsp");
            } else {
                mv.addObject("bookingsConf", this.bookingService.listBooking());
                mv.addObject("view", "includes/adminView.jsp");
                mv.addObject("bookingX", new Booking());
            }
        } catch (Exception e) {
            if (email.equals("") || password.equals(""))
                mv.addObject("errorMessage", "<strong>ERRORE:</strong> Compilare i campi!");
            else
                mv.addObject("errorMessage", "<strong>ERRORE:</strong> Utente non trovato!");
        }
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping(value = "/updateIndexUser")
    public ModelAndView updateIndexUser(HttpSession session) {
        ModelAndView mv = new ModelAndView("index");
        User auth = (User) session.getAttribute("auth");
        User x = (User) (this.userService.getUserById(auth.getId()));
        session.setAttribute("auth", x);
        if (x.getRole().equals("CUSTOMER")) {
            mv.addObject("bookings", x.getBookingsById());
            mv.addObject("view", "includes/customerView.jsp");
        }
        return mv;
    }

    @RequestMapping(value = {"/indexUser/{idBookingMod}", "/customerBookings/{idUserConf}", "/indexUser"})
    public ModelAndView indexUser(HttpSession session, @RequestParam(value = "name", required = false) String name, @RequestParam(value = "surname", required = false) String surname, @PathVariable(value = "idUserConf", required = false) Long idUserConf, @PathVariable(value = "idBookingMod", required = false) Long idBookingMod) {
        User u = (User) session.getAttribute("auth");
        ModelAndView mv = new ModelAndView("index");
        if (idBookingMod != null) {
            Booking b = (Booking) this.bookingService.getBookingById(idBookingMod);
            mv.addObject("bookingMod", b);
        }
        if (u != null && u.getRole().equals("CUSTOMER")) {
            mv.addObject("bookings", u.getBookingsById());
            mv.addObject("view", "includes/customerView.jsp");
        } else if (u != null && u.getRole().equals("ADMIN")) {
            if (idUserConf != null) {
                mv.addObject("bookingsConf", this.userService.getUserById(idUserConf).getBookingsById());
            } else if (name != "" || surname != "") {
                mv.addObject("bookingsConf", this.bookingService.listBookingByNameSurname(name, surname));
                System.out.println(this.bookingService.listBookingByNameSurname(name, surname).isEmpty());
            } else {
                mv.addObject("bookingsConf", this.bookingService.listBooking());
            }
            mv.addObject("view", "includes/adminView.jsp");
            mv.addObject("bookingX", new Booking());
        }
        return mv;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/index.jsp";
    }

    @RequestMapping(value = {"/update", "update/{idUser}"})
    public String displayUpdate(Model model, HttpSession session, @PathVariable(value = "idUser", required = false) Long idUser) {
        User u;
        if (idUser != null)
            u = this.userService.getUserById(idUser);
        else
            u = (User) session.getAttribute("auth");
        model.addAttribute("modU", u);
        return "pages/profile";
    }

    @PostMapping(value = "/update")
    public String updateUser(HttpSession session, @ModelAttribute("mod") User user, @RequestParam("data") String s) throws ParseException {
        user.setBirth(new SimpleDateFormat("yyyy-MM-dd").parse(s));
        this.userService.updateUser(user);
        session.setAttribute("successMessage", "Utente aggiornato con successo!");
        User u = (User) session.getAttribute("auth");
        if (u.getRole().equals("CUSTOMER")) {
            session.setAttribute("auth", user);
            return "redirect:/updateIndexUser";
        } else {
            return "redirect:/listaCustomer";
        }
    }

    @RequestMapping(value = "listaCustomer")
    public ModelAndView listaCustomer() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("customers", this.userService.getCustomers());
        mv.addObject("view", "includes/customersPage.jsp");
        mv.setViewName("index");
        return mv;
    }
}
