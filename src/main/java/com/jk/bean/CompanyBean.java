package com.jk.bean;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 *      企业管理
 */
@Entity
@Table(name = "t_company")
public class CompanyBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private   Integer  id;//企业id
    @Column(name = "companyName")
    private    String   companyName;//企业名称
    @Column(name = "companyPhone")
    private   String    companyPhone;//企业电话
    @Column(name = "companyEmall")
    private    String   companyEmall;//企业邮箱
    @Column(name = "userName")
    private    String   userName;//用户名称
    @Column(name = "contact")
    private    String   contact;//是否联系
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "createTime")
    private     Date     createTime;//创建时间
    @Column(name = "userId")
    private    Integer   userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    public String getCompanyEmall() {
        return companyEmall;
    }

    public void setCompanyEmall(String companyEmall) {
        this.companyEmall = companyEmall;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public CompanyBean(String companyName, String companyPhone, String companyEmall, String userName, String contact, Date createTime, Integer userId) {
        this.companyName = companyName;
        this.companyPhone = companyPhone;
        this.companyEmall = companyEmall;
        this.userName = userName;
        this.contact = contact;
        this.createTime = createTime;
        this.userId = userId;
    }

    public CompanyBean() {
    }

    @Override
    public String toString() {
        return "CompanyBean{" +
                "id=" + id +
                ", companyName='" + companyName + '\'' +
                ", companyPhone='" + companyPhone + '\'' +
                ", companyEmall='" + companyEmall + '\'' +
                ", userName='" + userName + '\'' +
                ", contact='" + contact + '\'' +
                ", createTime=" + createTime +
                ", userId=" + userId +
                '}';
    }
}
