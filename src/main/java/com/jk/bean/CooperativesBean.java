package com.jk.bean;

import javax.persistence.*;

/**
 * 合作企业
 */
@Entity
@Table(name = "t_cooperatives")
public class CooperativesBean {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private  Integer  id;
    @Column(name = "phone")
    private  String   phone;//手机
    @Column(name = "email")
    private  String  email;//邮箱
    @Column(name = "officerNet")
    private  String   officerNet;//官网
    @Column(name = "site")
    private  String   site;//地址
    @Column(name = "info")
    private  String   info;//简介
    @Column(name = "capital")
    private  String    capital;//注册资金
    @Column(name = "creditUnionCode")
    private   String  credit;//统一社用社代码
    @Column(name = "registration")
    private   String   registration;//纳税人识别号
    @Column(name = "registrationNumber")
    private   String   registrationNumber;//注册号
    @Column(name = "organ")
    private     String   organ;//组织机构代码
    @Column(name = "companyType")
    private     String   companyType;  //公司类型
    @Column(name = "status")
    private   Integer   status;//   1/0

    @Column(name = "province")
     private   String  province;
    @Column(name = "city")
     private   String  city;

    @Transient
    private   String  fullName;
    @Transient
    private   String  name;

    public CooperativesBean(String phone, String email, String officerNet, String site, String info, String capital, String credit, String registration, String registrationNumber, String organ, String companyType, Integer status, String province, String city, String fullName, String name) {
        this.phone = phone;
        this.email = email;
        this.officerNet = officerNet;
        this.site = site;
        this.info = info;
        this.capital = capital;
        this.credit = credit;
        this.registration = registration;
        this.registrationNumber = registrationNumber;
        this.organ = organ;
        this.companyType = companyType;
        this.status = status;
        this.province = province;
        this.city = city;
        this.fullName = fullName;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOfficerNet() {
        return officerNet;
    }

    public void setOfficerNet(String officerNet) {
        this.officerNet = officerNet;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getCapital() {
        return capital;
    }

    public void setCapital(String capital) {
        this.capital = capital;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    public String getRegistration() {
        return registration;
    }

    public void setRegistration(String registration) {
        this.registration = registration;
    }

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getOrgan() {
        return organ;
    }

    public void setOrgan(String organ) {
        this.organ = organ;
    }

    public String getCompanyType() {
        return companyType;
    }

    public void setCompanyType(String companyType) {
        this.companyType = companyType;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CooperativesBean() {
    }

    @Override
    public String toString() {
        return "CooperativesBean{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", officerNet='" + officerNet + '\'' +
                ", site='" + site + '\'' +
                ", info='" + info + '\'' +
                ", capital='" + capital + '\'' +
                ", credit='" + credit + '\'' +
                ", registration='" + registration + '\'' +
                ", registrationNumber='" + registrationNumber + '\'' +
                ", organ='" + organ + '\'' +
                ", companyType='" + companyType + '\'' +
                ", status=" + status +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", fullName='" + fullName + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
