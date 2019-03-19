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
        companyService.addCompany(companyBean);

    }

    @RequestMapping("queryCompanyById")
    @ResponseBody
    public CompanyBean  queryCompanyById(Integer  id){

        return  companyService.queryCompanyById(id);
    }

    //批量删除
    @RequestMapping("deleteAll")
    @ResponseBody
    public void deleteAll(String[] ids){
        companyService.deleteAll(ids);
    }

    //联系
    @ResponseBody
    @RequestMapping("relation")
   public  void relation(Integer  id){
        companyService.relation(id);
   }

   //等待联系
   @ResponseBody
   @RequestMapping("await")
   public   void await(Integer  id){
        companyService.await(id);
   }


}
