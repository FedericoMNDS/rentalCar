package it.si2001.service;

import it.si2001.dao.UserDAO;
import it.si2001.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;


    @Override
    @Transactional
    public void addUser(User p) {
        this.userDAO.addUser(p);
    }

    @Override
    @Transactional
    public void updateUser(User p) {
        this.userDAO.updateUser(p);
    }

    @Override
    @Transactional
    public List<User> listUsers() {
        return this.userDAO.listUsers();
    }

    @Override
    @Transactional
    public List<User> getCustomers() {
        return this.userDAO.getCustomers();
    }

    @Override
    @Transactional
    public User getUserById(Long id) {
        return this.userDAO.getUserById(id);
    }

    @Override
    @Transactional
    public User getUserByEmailPass(String email, String pass) {
        return this.userDAO.getUserByEmailPass(email, pass);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDAO.removeUser(id);
    }
}

