package it.si2001.rentalcar.dao;

import it.si2001.rentalcar.model.Car;
import it.si2001.rentalcar.model.User;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

public class CarDAO {


    public List<Car> findAllCars() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Query query = entityManager.createQuery("SELECT c FROM Car c");
        return (List<Car>) query.getResultList();
    }

    public void deleteCar(Long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Car c = (Car) entityManager.find(Car.class, id);
        transaction.begin();
        entityManager.remove(c);
        transaction.commit();
    }

    public boolean check(String brand, String model, String type, int hp) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        boolean b = false;
        Query query = entityManager.createQuery("SELECT c FROM Car c WHERE c.brand=:brand and c.model=:model and c.type=:type and c.hp=:hp ");
        query.setParameter("brand", brand);
        query.setParameter("model", model);
        query.setParameter("type", type);
        query.setParameter("hp", hp);
        Car c = (Car) query.getSingleResult();
        if (c != null)
            b = true;
        return b;
    }
}

