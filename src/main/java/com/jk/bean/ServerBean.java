package com.jk.bean;

import javax.persistence.*;

@Entity
@Table(name = "t_server")
public class ServerBean {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;

    //订单id
    @Column(name = "orderId")
    private Integer orderId;
    //车辆所在地址
    @Column(name = "adressId")
    private Integer adressId;
    //网站用户ID
    @Column(name = "userId")
    private Integer userId;
    //认证人
    @Column(name = "authMen")
    private String authMen;
    //退车状态
    @Column(name = "status")
    private Integer status; //0 未分配 1 已分配 2 已完成
    //打款账号
    @Column(name = "makeMoney")
    private String makeMoney;
    //收款人
    @Column(name = "getMoney")
    private String getMoney;

    //
    @Transient
    private String area;

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Integer getId() {
        return id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public Integer getAdressId() {
        return adressId;
    }

    public Integer getUserId() {
        return userId;
    }

    public String getAuthMen() {
        return authMen;
    }

    public Integer getStatus() {
        return status;
    }

    public String getMakeMoney() {
        return makeMoney;
    }

    public String getGetMoney() {
        return getMoney;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public void setAdressId(Integer adressId) {
        this.adressId = adressId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setAuthMen(String authMen) {
        this.authMen = authMen;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public void setMakeMoney(String makeMoney) {
        this.makeMoney = makeMoney;
    }

    public void setGetMoney(String getMoney) {
        this.getMoney = getMoney;
    }
}
