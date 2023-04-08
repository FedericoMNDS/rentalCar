package it.si2001.dao;

import it.si2001.model.Car;
import it.si2001.model.User;

import java.util.List;

public interface CarDAO {
    public void addCar(Car c);

    public void deleteCar(Long id);

    public Car getCarById(Long id);

    public List<Car> listCar();
}
