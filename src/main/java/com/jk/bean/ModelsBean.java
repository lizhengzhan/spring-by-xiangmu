package com.jk.bean;

import javax.persistence.*;

//车型表

@Entity
@Table(name = "t_models")
public class ModelsBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String modelsName;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setModelsName(String modelsName) {
        this.modelsName = modelsName;
    }

    public Integer getId() {
        return id;
    }

    public String getModelsName() {
        return modelsName;
    }
}
