package com.jk.bean;

import javax.persistence.*;

//排量表

@Entity
@Table(name = "t_displace")
public class SisplacementBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)

    private Integer id;

    private String displacementName;

    public void setId(Integer id) {
        id = this.id = id;
    }

    public void setDisplacementName(String displacementName) {
        this.displacementName = displacementName;
    }

    public Integer getId() {
        return id;
    }

    public String getDisplacementName() {
        return displacementName;
    }
}
