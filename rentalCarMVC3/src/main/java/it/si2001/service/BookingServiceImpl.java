package it.si2001.service;

import it.si2001.dao.BookingDAO;
import it.si2001.model.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    private BookingDAO bookingDAO;

    @Override
    @Transactional
    public void addBooking(Booking b) {
        this.bookingDAO.addBooking(b);
    }

    @Override
    @Transactional
    public void deleteBooking(Long id) {
        this.bookingDAO.deleteBooking(id);
    }

    @Override
    @Transactional
    public Booking getBookingById(Long id) {
        return this.bookingDAO.getBookingById(id);
    }

    @Override
    @Transactional
    public void updateBooking(Booking b) {
        this.bookingDAO.updateBooking(b);
    }

    @Override
    @Transactional
    public List<Booking> listBooking() {
        return this.bookingDAO.listBooking();
    }

    @Override
    @Transactional
    public List<Booking> listBookingByNameSurname(String name, String surname) {
        return this.bookingDAO.listBookingByNameSurname(name, surname);
    }
}
