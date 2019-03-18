package com.jk.bean;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_user")
public class UserBean {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "useruid")
    private Integer useruId;

    @Column(name = "username")
    private String userName;

    @Column(name = "userpwd")
    private String userPwd;

    @Column(name = "usersex")
    private Integer userSex;

    @Column(name = "userbirthday")
    private Date userBirthday;

    @Column(name = "roleid")
    private Integer roleId;


    //业务字段

    @Transient
    private String rplename;

    public Integer getUseruId() {
        return useruId;
    }

    public void setUseruId(Integer useruId) {
        this.useruId = useruId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public Integer getUserSex() {
        return userSex;
    }

    public void setUserSex(Integer userSex) {
        this.userSex = userSex;
    }

    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
