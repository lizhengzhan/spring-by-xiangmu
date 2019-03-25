package com.jk.bean;

import org.apache.solr.client.solrj.beans.Field;

import java.io.Serializable;

public class Time implements Serializable {

    @Field("id")
    private String  id;
    @Field("name")
    private   String  name;
    @Field("rtime")
    private    String   rtime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRtime() {
        return rtime;
    }

    public void setRtime(String rtime) {
        this.rtime = rtime;
    }

    @Override
    public String toString() {
        return "Time{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", rtime='" + rtime + '\'' +
                '}';
    }

    public Time() {
    }

    public Time(String id, String name, String rtime) {
        this.id = id;
        this.name = name;
        this.rtime = rtime;
    }


}
