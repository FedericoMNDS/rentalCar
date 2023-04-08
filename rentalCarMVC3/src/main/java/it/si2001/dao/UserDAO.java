package it.si2001.dao;

import it.si2001.model.User;

import java.util.List;

public interface UserDAO {

    public void addUser(User u);

    public void updateUser(User u);

    public List<User> listUsers();

    public List<User> getCustomers();

    public User getUserById(Long id);


    public User getUserByEmailPass(String email,String pass);

    public void removeUser(int id);
}

