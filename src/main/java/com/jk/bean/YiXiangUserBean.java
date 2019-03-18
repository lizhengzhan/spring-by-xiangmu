package com.jk.bean;

import javax.persistence.*;

@Entity
@Table(name = "t_yixiang")
public class YiXiangUserBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "consumerid")
    private Integer consumerId;

    @Column(name = "wangzhanid")
    private Integer wangZhanId;

    @Column(name = "consumername")
    private String consumerName;

    @Column(name = "consumercastid")
    private String consumerCastId;

    @Column(name = "consumerphone")
    private String consumerPhone;

    @Column(name = "consumercode")
    private String consumerCode;

    @Column(name = "consumercity")
    private String consumerCity;

    @Column(name = "consumerjob")
    private String consumerJob;

    @Column(name = "consumerincome")
    private String consumerIncome;

    @Column(name = "kefuid")
    private String keFuId;

    public Integer getConsumerId() {
        return consumerId;
    }

    public void setConsumerId(Integer consumerId) {
        this.consumerId = consumerId;
    }

    public Integer getWangZhanId() {
        return wangZhanId;
    }

    public void setWangZhanId(Integer wangZhanId) {
        this.wangZhanId = wangZhanId;
    }

    public String getConsumerName() {
        return consumerName;
    }

    public void setConsumerName(String consumerName) {
        this.consumerName = consumerName;
    }

    public String getConsumerCastId() {
        return consumerCastId;
    }

    public void setConsumerCastId(String consumerCastId) {
        this.consumerCastId = consumerCastId;
    }

    public String getConsumerPhone() {
        return consumerPhone;
    }

    public void setConsumerPhone(String consumerPhone) {
        this.consumerPhone = consumerPhone;
    }

    public String getConsumerCode() {
        return consumerCode;
    }

    public void setConsumerCode(String consumerCode) {
        this.consumerCode = consumerCode;
    }

    public String getConsumerCity() {
        return consumerCity;
    }

    public void setConsumerCity(String consumerCity) {
        this.consumerCity = consumerCity;
    }

    public String getConsumerJob() {
        return consumerJob;
    }

    public void setConsumerJob(String consumerJob) {
        this.consumerJob = consumerJob;
    }

    public String getConsumerIncome() {
        return consumerIncome;
    }

    public void setConsumerIncome(String consumerIncome) {
        this.consumerIncome = consumerIncome;
    }

    public String getKeFuId() {
        return keFuId;
    }

    public void setKeFuId(String keFuId) {
        this.keFuId = keFuId;
    }
}
