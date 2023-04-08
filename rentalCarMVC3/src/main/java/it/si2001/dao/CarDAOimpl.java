package it.si2001.dao;

import it.si2001.model.Car;
import it.si2001.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CarDAOimpl implements CarDAO{
    private static final Logger logger = LoggerFactory.getLogger(UserDAOimpl.class);

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void addCar(Car c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(c);
        logger.info("Car saved successfully, Car Details=" + c);
    }


    @Override
    public void deleteCar(Long id) {
        Session session = this.sessionFactory.getCurrentSession();
        Car c = (Car) session.load(Car.class, new Long(id));
        if (c != null) {
            session.delete(c);
        }
    }

    @Override
    public Car getCarById(Long id) {
        Session session = this.sessionFactory.getCurrentSession();
        Car c = (Car) session.load(Car.class, new Long(id));
        logger.info("User loaded successfully, User details=" + c);
        return c;
    }

    @Override
    public List<Car> listCar() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Car> carList = session.createQuery("from Car").list();
        return carList;
    }
}
