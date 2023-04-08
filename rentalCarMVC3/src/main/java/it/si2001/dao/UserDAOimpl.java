package it.si2001.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import it.si2001.model.User;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOimpl implements UserDAO {
    private static final Logger logger = LoggerFactory.getLogger(UserDAOimpl.class);

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void addUser(User u) {

        Session session = this.sessionFactory.getCurrentSession();
        session.persist(u);
        logger.info("Person saved successfully, Person Details=" + u);
    }

    @Override
    public void updateUser(User u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(u);
        logger.info("Person updated successfully, Person Details=" + u);

    }

    @Override
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("from User").list();
        for (User u : userList) {
            logger.info("user List::" + u);
        }
        return userList;
    }

    @Override
    public List<User> getCustomers() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("from User where role='CUSTOMER'").list();
    }

    @Override
    public User getUserById(Long id) {
        Session session = this.sessionFactory.getCurrentSession();
        User u = (User) session.load(User.class, new Long(id));
        logger.info("User loaded successfully, User details=" + u);
        return u;
    }

    @Override
    public User getUserByEmailPass(String email, String pass) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where email=:email and password=:pass");
        query.setParameter("email", email);
        query.setParameter("pass", pass);
        User u = (User) query.getSingleResult();
        logger.info("User loaded successfully, User details=" + u);
        return u;
    }


    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User u = (User) session.load(User.class, new Integer(id));
        if (u != null) {
            session.delete(u);
        }
        logger.info("Person deleted successfully, person details=" + u);
    }
}
