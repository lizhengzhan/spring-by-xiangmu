package com.jk.service;

import com.jk.bean.CompanyBean;
import com.jk.bean.SitesUserBean;

import java.util.HashMap;

public interface SitesUserService {

    HashMap<String, Object> querySitesUser(Integer page, Integer rows, SitesUserBean  sitesUserBean);

    //登录前端页面
    SitesUserBean  queryLogin(String userEmail);

    ///注册
    String  enroll(SitesUserBean  sitesUserBean);
}
