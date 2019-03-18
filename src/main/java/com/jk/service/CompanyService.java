package com.jk.service;

import com.jk.bean.CompanyBean;

import java.util.HashMap;

public interface CompanyService {


    HashMap<String, Object> queryCompany(Integer page, Integer rows, CompanyBean  companyBean);



}
