package it.si2001.rentalcar.dao;

import it.si2001.rentalcar.model.Booking;
import it.si2001.rentalcar.model.Car;
import it.si2001.rentalcar.model.User;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BookingDAO {


    public Object[] findModifyBooking(Long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        Query query = entityManager.createQuery("SELECT c.brand, c.model, c.hp, c.img, c.carRegistration, b.dateOn, b.dateOff, b.id FROM Car c, Booking b where b.id=:id and b.idCar=c.id");
        query.setParameter("id", id);
        Object[] roba = (Object[]) query.getSingleResult();
        return roba;
    }

    public void updateBooking(Booking b, Long idCar, Date dateOn, Date dateOff) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        transaction.begin();
        b.setIdCar(idCar);
        b.setDateOn(dateOn);
        b.setDateOff(dateOff);
        entityManager.merge(b);
        transaction.commit();
    }

    public void updateBooking(Booking b, Date dateOn, Date dateOff) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        transaction.begin();
        b.setDateOn(dateOn);
        b.setDateOff(dateOff);
        entityManager.merge(b);
        transaction.commit();
    }

    public Booking findBooking(Long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        return entityManager.find(Booking.class, id);
    }

    public List<Object[]> selectBooking(Long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        Query query = entityManager.createQuery("SELECT c.brand, c.model, c.plate, b.conf, b.dateOn, b.dateOff, b.id, c.carRegistration, c.hp, c.img FROM Car c, Booking b where b.idUser=:id and b.idCar=c.id");
        query.setParameter("id", id);
        List<Object[]> roba = (List<Object[]>) query.getResultList();
        return roba;
    }

    public List<Object[]> selectBooking() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        Query query = entityManager.createQuery("SELECT u.name, u.surname,c.brand, c.model, c.plate, b.conf, b.dateOn, b.dateOff, b.id FROM User u, Car c, Booking b where b.idUser=u.id and b.idCar=c.id and b.conf=0");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");

        List<Object[]> roba = (List<Object[]>) query.getResultList();
        return roba;
    }

    public List<Object[]> selectBooking(String name, String surname) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Query query;
        List<Object[]> roba;
        if (name != null && surname != null) {
            query = entityManager.createQuery("SELECT u.name, u.surname,c.brand, c.model, c.plate, b.conf, b.dateOn, b.dateOff, b.id FROM User u, Car c, Booking b where b.idUser=u.id and b.idCar=c.id and u.name=:name and u.surname=:surname and b.conf=0");
            query.setParameter("name", name);
            query.setParameter("surname", surname);
            roba = (List<Object[]>) query.getResultList();
        } else if (name != null) {
            query = entityManager.createQuery("SELECT u.name, u.surname,c.brand, c.model, c.plate, b.conf, b.dateOn, b.dateOff, b.id FROM User u, Car c, Booking b where b.idUser=u.id and b.idCar=c.id and u.name=:name and b.conf=0");
            query.setParameter("name", name);
            roba = (List<Object[]>) query.getResultList();
        } else if (surname != null) {
            query = entityManager.createQuery("SELECT u.name, u.surname,c.brand, c.model, c.plate, b.conf, b.dateOn, b.dateOff, b.id FROM User u, Car c, Booking b where b.idUser=u.id and b.idCar=c.id and u.surname=:surname and b.conf=0");
            query.setParameter("surname", surname);
            roba = (List<Object[]>) query.getResultList();
        } else
            roba = selectBooking();
        return roba;
    }


    public void updBooking(Long id, byte val) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Booking b = entityManager.find(Booking.class, id);
        transaction.begin();
        b.setConf(val);
        entityManager.merge(b);
        transaction.commit();
    }


    public void deleteBooking(Long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.remove(entityManager.find(Booking.class, id));
        transaction.commit();
    }
}
