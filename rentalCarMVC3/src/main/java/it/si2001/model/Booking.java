package it.si2001.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import static java.time.temporal.ChronoUnit.DAYS;

@Entity
public class Booking {
    private Long id;
    @NotNull(message = "Inserire una data valida!")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOn;
    @NotNull(message = "Inserire una data valida!")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOff;
    private byte conf;
    private User userByIdUser;
    private Car carByIdCar;

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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "date_on")
    public Date getDateOn() {
        return dateOn;
    }

    public void setDateOn(Date dateOn) {
        this.dateOn = dateOn;
    }

    @Basic
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "date_off")
    public Date getDateOff() {
        return dateOff;
    }

    public void setDateOff(Date dateOff) {
        this.dateOff = dateOff;
    }

    @Basic
    @Column(name = "conf")
    public byte getConf() {
        return conf;
    }

    public void setConf(byte conf) {
        this.conf = conf;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Booking booking = (Booking) o;

        if (conf != booking.conf) return false;
        if (id != null ? !id.equals(booking.id) : booking.id != null) return false;
        if (dateOn != null ? !dateOn.equals(booking.dateOn) : booking.dateOn != null) return false;
        if (dateOff != null ? !dateOff.equals(booking.dateOff) : booking.dateOff != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (dateOn != null ? dateOn.hashCode() : 0);
        result = 31 * result + (dateOff != null ? dateOff.hashCode() : 0);
        result = 31 * result + (int) conf;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_user", referencedColumnName = "id")
    public User getUserByIdUser() {
        return userByIdUser;
    }

    public void setUserByIdUser(User userByIdUser) {
        this.userByIdUser = userByIdUser;
    }

    @ManyToOne
    @JoinColumn(name = "id_car", referencedColumnName = "id")
    public Car getCarByIdCar() {
        return carByIdCar;
    }

    public void setCarByIdCar(Car carByIdCar) {
        this.carByIdCar = carByIdCar;
    }

    public boolean difference(Date x){
        LocalDate o = LocalDate.now();
        LocalDate p = x.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        long diff = DAYS.between(p, o);
    return diff>=2;
    }

}
