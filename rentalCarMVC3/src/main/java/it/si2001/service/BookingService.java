package it.si2001.service;



import it.si2001.model.Booking;

import java.util.List;

public interface BookingService {

    public void addBooking(Booking b);

    public void deleteBooking(Long id);

    public Booking getBookingById(Long id);

    public void updateBooking(Booking b);

    public List<Booking> listBooking();

    public List<Booking> listBookingByNameSurname(String name, String surname);
}
