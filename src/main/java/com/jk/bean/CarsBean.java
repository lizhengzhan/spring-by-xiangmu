package com.jk.bean;

import javax.persistence.*;

//车系表

@Entity
@Table(name = "t_cars")
public class CarsBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String carsName;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCarsName(String carsName) {
        this.carsName = carsName;
    }

    public Integer getId() {
        return id;
    }

    public String getCarsName() {
        return carsName;
    }
}
