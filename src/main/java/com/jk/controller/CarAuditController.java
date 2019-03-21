package com.jk.controller;


import com.jk.bean.BrandBean;
import com.jk.service.CarAuditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class CarAuditController {

    @Autowired
    private CarAuditService  carAuditService;

    @RequestMapping("queryCarAudit")
    @ResponseBody
    public HashMap<String,Object> queryBrandList(Integer page, Integer rows, BrandBean brand){
        return carAuditService.queryCarAudit(page,rows,brand);
    }

    @RequestMapping("pass")
    @ResponseBody
    public  void pass(Integer  id){
        carAuditService.pass(id);
    }

    //认证
    @RequestMapping("authentication")
    @ResponseBody
    public  String  authentication(Integer  id){

        try {
            carAuditService.authentication(id);
            return  "1";
        } catch (Exception e) {
            return "0";
        }
    }

}
