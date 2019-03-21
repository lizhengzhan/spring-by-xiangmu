package com.jk.bean;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_yuyue")
public class YuYueBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;

    @Column(name = "yuyuename")
    private String yuYueName;

    @Column(name = "cheid")
    private Integer cheId;

    @Column(name = "chepinpai")
    private String chePinPai;

    @Column(name = "yuyuephone")
    private String yuYuePhone;

    @Column(name = "status")
    private Integer status;

    @Column(name = "yuyuetime")
    private Date yuYueTime;

    @Column(name = "yuyuecity")
    private String yuYueCity;

    @Column(name = "pingjia")
    private String pingJia;

    @Column(name = "ifpay")
    private Integer ifPay;

    @Column(name = "kefuid")
    private Integer keFuId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYuYueName() {
        return yuYueName;
    }

    public void setYuYueName(String yuYueName) {
        this.yuYueName = yuYueName;
    }

    public Integer getCheId() {
        return cheId;
    }

    public void setCheId(Integer cheId) {
        this.cheId = cheId;
    }

    public String getChePinPai() {
        return chePinPai;
    }

    public void setChePinPai(String chePinPai) {
        this.chePinPai = chePinPai;
    }

    public String getYuYuePhone() {
        return yuYuePhone;
    }

    public void setYuYuePhone(String yuYuePhone) {
        this.yuYuePhone = yuYuePhone;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getYuYueTime() {
        return yuYueTime;
    }

    public void setYuYueTime(Date yuYueTime) {
        this.yuYueTime = yuYueTime;
    }

    public String getYuYueCity() {
        return yuYueCity;
    }

    public void setYuYueCity(String yuYueCity) {
        this.yuYueCity = yuYueCity;
    }

    public String getPingJia() {
        return pingJia;
    }

    public void setPingJia(String pingJia) {
        this.pingJia = pingJia;
    }

    public Integer getIfPay() {
        return ifPay;
    }

    public void setIfPay(Integer ifPay) {
        this.ifPay = ifPay;
    }

    public Integer getKeFuId() {
        return keFuId;
    }

    public void setKeFuId(Integer keFuId) {
        this.keFuId = keFuId;
    }
}
