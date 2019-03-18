package com.jk.service;

import com.jk.bean.CompanyBean;

import java.util.HashMap;

public interface CompanyService {

//查询
    HashMap<String, Object> queryCompany(Integer page, Integer rows, CompanyBean  companyBean);


//新增
    void  addCompany(CompanyBean  companyBean);
}
