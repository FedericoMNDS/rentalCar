package it.si2001.controller;

import it.si2001.model.Booking;
import it.si2001.model.Car;
import it.si2001.model.User;
import it.si2001.service.CarService;
import it.si2001.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.validation.Valid;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

@Controller
public class CarController {

    @Autowired
    private CarService carService;

    @RequestMapping(value = {"/showParcoAuto/{path}/{idBookingMod}", "/showParcoAuto/{path}", "/showParcoAuto"})
    public String parcoShow(Model model, @PathVariable(value = "path", required = false) String path, @PathVariable(value = "idBookingMod", required = false) Long id) {
        if (path != null || id != null) {
            model.addAttribute("path", path);
            model.addAttribute("idBookingMod", id);
        }
        model.addAttribute("listCar", this.carService.listCar());
        model.addAttribute("bookingX", new Booking());
        model.addAttribute("car", new Car());
        return "pages/parcoAuto";
    }

    public boolean uploadFile(InputStream is, String path) {
        boolean test = false;
        try {
            byte[] byt = new byte[is.available()];
            is.read(byt);

            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    @PostMapping(value = "/aggiungiAuto")
    public String addCar(@Valid @ModelAttribute("car") Car c, BindingResult result, @RequestParam("imgCar") MultipartFile img, HttpSession session) {
        if (result.hasErrors()){}
        c.setImg(img.getOriginalFilename());
        this.carService.addCar(c);
        session.setAttribute("successMessage", "Veicolo inserito con successo!");
        return "redirect:/showParcoAuto/aggiungiPrenotazione";
    }

    @PostMapping(value = "/eliminaAuto")
    public String deleteCar(@RequestParam("idCar") Long id, HttpSession session) {
        session.setAttribute("successMessage", "Veicolo eliminato con successo!");
        this.carService.deleteCar(id);
        return "redirect:/showParcoAuto/aggiungiPrenotazione";
    }

}

