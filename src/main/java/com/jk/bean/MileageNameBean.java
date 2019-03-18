package com.jk.bean;

import javax.persistence.*;

//里程表


@Entity
@Table(name = "t_mileage")
public class MileageNameBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String mileageName;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setMileageName(String mileageName) {
        this.mileageName = mileageName;
    }

    public Integer getId() {
        return id;
    }

    public String getMileageName() {
        return mileageName;
    }
}
