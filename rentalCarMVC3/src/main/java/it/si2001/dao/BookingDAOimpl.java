package it.si2001.dao;

import it.si2001.model.Booking;
import it.si2001.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookingDAOimpl implements BookingDAO {
    private static final Logger logger = LoggerFactory.getLogger(UserDAOimpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addBooking(Booking b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(b);
        logger.info("Booking saved successfully, Booking Details=" + b);
    }

    @Override
    public void deleteBooking(Long id) {
        Session session = this.sessionFactory.getCurrentSession();
        Booking b = (Booking) session.load(Booking.class, new Long(id));
        if (b != null) {
            session.delete(b);
        }
    }

    @Override
    public Booking getBookingById(Long id) {
        Session session = this.sessionFactory.getCurrentSession();
        Booking b = (Booking) session.load(Booking.class, new Long(id));
        logger.info("Booking loaded successfully, Booking details=" + b);
        return b;
    }

    @Override
    public void updateBooking(Booking b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(b);
    }

    @Override
    public List<Booking> listBooking() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Booking where conf=0");
        logger.info("Bookings loaded successfully, Bookings details=");
        return query.list();
    }

    @Override
    public List<Booking> listBookingByNameSurname(String name, String surname) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query;
        if (name != "" && surname != "") {
            query = session.createQuery("from Booking where userByIdUser.name like :name and userByIdUser.surname like :surname and conf=0");
            query.setParameter("name", name);
            query.setParameter("surname", surname);
            return query.list();
        } else if (name != "") {
            query = session.createQuery("from Booking where userByIdUser.name like :name and conf=0");
            query.setParameter("name", name);
            return query.list();
        } else if (surname != "") {
            query = session.createQuery("from Booking where userByIdUser.surname like :surname and conf=0");
            query.setParameter("surname", surname);
            return query.list();
        } else
            return listBooking();
    }
}
