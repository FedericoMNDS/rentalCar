package it.si2001.service;

import it.si2001.model.User;

import java.util.List;

public interface UserService {

        public void addUser(User u);

        public void updateUser(User u);

        public List<User> listUsers();

        public User getUserById(Long id);

        public List<User> getCustomers();

        public User getUserByEmailPass(String email,String pass);

        public void removeUser(int id);
    }
