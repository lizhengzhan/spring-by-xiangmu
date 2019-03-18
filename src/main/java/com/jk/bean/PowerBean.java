package com.jk.bean;

import javax.persistence.*;

@Entity
@Table(name = "t_power")
public class PowerBean {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;

    @Column(name = "text")
    private String text;

    @Column(name = "url")
    private String url;

    @Column(name = "treeid")
    private Integer treeid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getTreeid() {
        return treeid;
    }

    public void setTreeid(Integer treeid) {
        this.treeid = treeid;
    }
}
