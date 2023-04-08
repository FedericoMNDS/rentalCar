package it.si2001;

import it.si2001.dao.BookingDAO;
import it.si2001.dao.BookingDAOimpl;
import it.si2001.model.Booking;
import it.si2001.service.BookingService;
import it.si2001.service.BookingServiceImpl;

import java.util.List;

public class main {
    public static void main(String[] args) {
        BookingDAOimpl imp=new BookingDAOimpl();
        List<Booking> l=imp.listBookingByNameSurname("Federico", "Mandis");
        System.out.println(l.get(0).getUserByIdUser().getName());
    }
}
