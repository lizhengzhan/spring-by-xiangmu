package com.jk.controller;

import com.jk.bean.CompanyBean;
import com.jk.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class CompanyController {

     @Autowired
    private CompanyService  companyService;


    @RequestMapping("queryCompany")
    @ResponseBody
    public HashMap<String, Object> queryUSer(Integer page, Integer rows, CompanyBean companyBean){
        return companyService.queryCompany(page,rows,companyBean);
    }


    @RequestMapping("addCompany")
    @ResponseBody
    public  void addCompany(CompanyBean companyBean) {
        System.out.println("com");
        companyService.addCompany(companyBean);

    }


}
