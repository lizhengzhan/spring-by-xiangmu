package com.jk.bean;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_sitesUser")
public class SitesUserBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private   Integer id;

    @Column(name = "userName")
    private  String  userName;   //用户账号
    @Column(name = "password")
    private  String  password;  //用户密码
    @Column(name = "userEmail")
    private   String     userEmail;  //用户邮箱
    @Column(name = "userPhone")
    private    String   userPhone;  //用户联系方式
    @Column(name = "crtime")
    private     Date     crtime;  //创建时间
    @Column(name = "province")  //市
    private   String  province;
    @Column(name = "city")
    private   String  city;  //县
    @Column(name = "baycars")
    private   Integer  baycars;//买车
    @Column(name="sellcars")//卖车
    private  Integer  sellcars;

    @Transient
    private  String   fullname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public Date getCrtime() {
        return crtime;
    }

    public void setCrtime(Date crtime) {
        this.crtime = crtime;
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

    public Integer getBaycars() {
        return baycars;
    }

    public void setBaycars(Integer baycars) {
        this.baycars = baycars;
    }

    public Integer getSellcars() {
        return sellcars;
    }

    public void setSellcars(Integer sellcars) {
        this.sellcars = sellcars;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public SitesUserBean(String userName, String password, String userEmail, String userPhone, Date crtime, String province, String city, Integer baycars, Integer sellcars, String fullname) {
        this.userName = userName;
        this.password = password;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
        this.crtime = crtime;
        this.province = province;
        this.city = city;
        this.baycars = baycars;
        this.sellcars = sellcars;
        this.fullname = fullname;
    }

    public SitesUserBean() {
    }

    @Override
    public String toString() {
        return "SitesUserBean{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", crtime=" + crtime +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", baycars=" + baycars +
                ", sellcars=" + sellcars +
                ", fullname='" + fullname + '\'' +
                '}';
    }
}
