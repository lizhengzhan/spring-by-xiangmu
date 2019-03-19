package com.jk.bean;

import javax.persistence.*;

//车龄表

@Entity
@Table(name = "t_old")
public class OldBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String oldName;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setOldName(String oldName) {
        this.oldName = oldName;
    }

    public Integer getId() {
        return id;
    }

    public String getOldName() {
        return oldName;
    }
}
