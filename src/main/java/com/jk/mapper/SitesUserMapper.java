package com.jk.mapper;

import com.jk.bean.CompanyBean;
import com.jk.bean.SitesUserBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SitesUserMapper {


    long querySitesUserTotal(@Param("sitesUserBean") SitesUserBean sitesUserBean);

    List<CompanyBean> querySitesUser(@Param("start") int start, @Param("rows") Integer rows, @Param("sitesUserBean")SitesUserBean sitesUserBean);

    //登录前端页面
    SitesUserBean queryLogin(String userEmail);

    //注册
    void enroll(@Param("sites") SitesUserBean sitesUserBean);
}
