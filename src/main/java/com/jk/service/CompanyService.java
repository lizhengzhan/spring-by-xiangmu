package com.jk.service;

import com.jk.bean.CompanyBean;

import java.util.HashMap;

public interface CompanyService {

//查询
    HashMap<String, Object> queryCompany(Integer page, Integer rows, CompanyBean  companyBean);


//新增
    void  addCompany(CompanyBean  companyBean);

    //回显
    CompanyBean  queryCompanyById(Integer  id);


    //批量删除
    void  deleteAll(String[]  ids);

    //联系
    void  relation(Integer id);
    //等待联系
    void  await(Integer id);
}
