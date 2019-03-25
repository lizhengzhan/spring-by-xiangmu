package com.jk.bean;

import javax.persistence.*;

//车辆过户服务
@Entity
@Table(name = "t_Tra")
public class TraBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "traName")
    private String traName;  //办理人

    @Column(name = "phone")
    private String phone; //手机号

    @Column(name = "identity")
    private String identity;  //身份证号

    @Column(name = "identityImg")
    private String identityImg;  //身份证图片

    @Column(name = "license")
    private String license;   //车牌号

    @Column(name = "vehicleImg")
    private String vehicleImg;    //车辆合同图片

    @Column(name = "people")
    private String people;  //代办人


    public void setId(Integer id) {
        this.id = id;
    }

    public void setTraName(String traName) {
        this.traName = traName;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public void setIdentityImg(String identityImg) {
        this.identityImg = identityImg;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public void setVehicleImg(String vehicleImg) {
        this.vehicleImg = vehicleImg;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public Integer getId() {
        return id;
    }

    public String getTraName() {
        return traName;
    }

    public String getPhone() {
        return phone;
    }

    public String getIdentity() {
        return identity;
    }

    public String getIdentityImg() {
        return identityImg;
    }

    public String getLicense() {
        return license;
    }

    public String getVehicleImg() {
        return vehicleImg;
    }

    public String getPeople() {
        return people;
    }
}
