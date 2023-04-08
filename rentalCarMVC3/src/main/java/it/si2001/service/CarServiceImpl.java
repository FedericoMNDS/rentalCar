package it.si2001.service;

import it.si2001.dao.CarDAO;
import it.si2001.dao.UserDAO;
import it.si2001.model.Car;
import it.si2001.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarDAO carDAO;

    @Override
    @Transactional
    public void addCar(Car c) {
        this.carDAO.addCar(c);
    }

    @Override
    @Transactional
    public void deleteCar(Long id) {
        this.carDAO.deleteCar(id);
    }

    @Override
    @Transactional
    public Car getCarById(Long id) {
        return this.carDAO.getCarById(id);
    }

    @Override
    @Transactional
    public List<Car> listCar() {
        return this.carDAO.listCar();
    }
}
