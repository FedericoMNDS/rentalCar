package it.si2001.rentalcar.model;

import javax.persistence.*;

@Entity
public class Car {
    private Long id;
    private String plate;
    private String brand;
    private String model;
    private String type;
    private short carRegistration;
    private Integer hp;
    private String img;



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "plate")
    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    @Basic
    @Column(name = "brand")
    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    @Basic
    @Column(name = "model")
    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "carRegistration")
    public short getCarRegistration() {
        return carRegistration;
    }

    public void setCarRegistration(short carRegistration) {
        this.carRegistration = carRegistration;
    }

    @Basic
    @Column(name = "hp")
    public Integer getHp() {
        return hp;
    }

    public void setHp(Integer hp) {
        this.hp = hp;
    }

    @Basic
    @Column(name = "img")
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Car car = (Car) o;

        if (carRegistration != car.carRegistration) return false;
        if (id != null ? !id.equals(car.id) : car.id != null) return false;
        if (plate != null ? !plate.equals(car.plate) : car.plate != null) return false;
        if (brand != null ? !brand.equals(car.brand) : car.brand != null) return false;
        if (model != null ? !model.equals(car.model) : car.model != null) return false;
        if (type != null ? !type.equals(car.type) : car.type != null) return false;
        if (hp != null ? !hp.equals(car.hp) : car.hp != null) return false;
        if (img != null ? !img.equals(car.img) : car.img != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (plate != null ? plate.hashCode() : 0);
        result = 31 * result + (brand != null ? brand.hashCode() : 0);
        result = 31 * result + (model != null ? model.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (int) carRegistration;
        result = 31 * result + (hp != null ? hp.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        return result;
    }
}
