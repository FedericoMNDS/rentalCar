package it.si2001.rentalcar.dao;

import it.si2001.rentalcar.model.Car;
import it.si2001.rentalcar.model.User;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

public class UserDAO {


    public void saveUser(Object u) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(u);
            transaction.commit();
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
            entityManagerFactory.close();
        }
    }

    public static User findUser(String email, String password) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email and u.password = :password");
        query.setParameter("email", email);
        query.setParameter("password", password);
        User u = new User();
        u = (User) query.getSingleResult();
        System.out.println(u.toString());
        return u;
    }

    public static User findUser(Long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        return entityManager.find(User.class, id);
    }

    public List<User> findAllCustomers() {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.role='CUSTOMER'");
        return (List<User>) query.getResultList();
    }

    public List<User> findCustomersNameSurname(String name, String surname) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Query query;
        query = entityManager.createQuery("SELECT u FROM User u WHERE u.role='CUSTOMER' and u.name=:name and u.surname=:surname");
        if (name != null && surname != null) {
            query = entityManager.createQuery("SELECT u FROM User u WHERE u.role='CUSTOMER' and u.name=:name and u.surname=:surname");
            query.setParameter("name", name);
            query.setParameter("surname", surname);
        } else if (name != null) {
            query = entityManager.createQuery("SELECT u FROM User u WHERE u.role='CUSTOMER' and u.name=:name");
            query.setParameter("name", name);
        } else if (surname != null) {
            query = entityManager.createQuery("SELECT u FROM User u WHERE u.role='CUSTOMER' and u.surname=:surname");
            query.setParameter("surname", surname);
        }
        return (List<User>) query.getResultList();
    }

    public void update(User auth, String name, String surname, String email, String password, Date birth) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        transaction.begin();
        auth.setName(name);
        auth.setSurname(surname);
        auth.setEmail(email);
        auth.setPassword(password);
        auth.setBirth(birth);
        entityManager.merge(auth);
        transaction.commit();
    }

    public void deleteUser(Long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.remove(entityManager.find(User.class, id));
        transaction.commit();
    }

    public void updateUser(Long id, String name, String surname, String email, String password, Date birth) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        Query query = entityManager.createQuery("UPDATE User u SET u.name = :name , u.surname=:surname, u.email=:email, u.password=:password, u.birth=:birth WHERE (u.id = :id)");
        query.setParameter("name", name);
        query.setParameter("surname", surname);
        query.setParameter("email", email);
        query.setParameter("password", password);
        query.setParameter("birth", birth);
        try {
            transaction.begin();
            transaction.commit();
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            entityManager.close();
            entityManagerFactory.close();
        }
    }

    public boolean check(String name, String surname, String email, Date birth) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        boolean b = false;
        Query query = entityManager.createQuery("SELECT u FROM User u WHERE (u.name=:name and u.surname=:surname and u.birth=:birth) or (u.name=:name and u.surname=:surname and u.email=:email)");
        query.setParameter("name",name);
        query.setParameter("surname",surname);
        query.setParameter("birth",birth);
        query.setParameter("email",email);

        User u=(User)query.getSingleResult();
        if(u!=null)
            b=true;
        return b;
    }

}
