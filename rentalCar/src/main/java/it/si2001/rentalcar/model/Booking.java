package it.si2001.rentalcar.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Booking {
    private Long id;
    private Long idUser;
    private Long idCar;
    private Date dateOn;
    private Date dateOff;
    private byte conf;

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
    @Column(name = "id_user")
    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    @Basic
    @Column(name = "id_car")
    public Long getIdCar() {
        return idCar;
    }

    public void setIdCar(Long idCar) {
        this.idCar = idCar;
    }

    @Basic
    @Column(name = "date_on")
    public Date getDateOn() {
        return dateOn;
    }

    public void setDateOn(Date dateOn) {
        this.dateOn = dateOn;
    }

    @Basic
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
        if (idUser != null ? !idUser.equals(booking.idUser) : booking.idUser != null) return false;
        if (idCar != null ? !idCar.equals(booking.idCar) : booking.idCar != null) return false;
        if (dateOn != null ? !dateOn.equals(booking.dateOn) : booking.dateOn != null) return false;
        if (dateOff != null ? !dateOff.equals(booking.dateOff) : booking.dateOff != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (idUser != null ? idUser.hashCode() : 0);
        result = 31 * result + (idCar != null ? idCar.hashCode() : 0);
        result = 31 * result + (dateOn != null ? dateOn.hashCode() : 0);
        result = 31 * result + (dateOff != null ? dateOff.hashCode() : 0);
        result = 31 * result + (int) conf;
        return result;
    }
}
