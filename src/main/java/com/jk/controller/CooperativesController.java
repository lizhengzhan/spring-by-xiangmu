package com.jk.controller;

import com.jk.bean.CooperativesBean;
import com.jk.service.CooperativesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class CooperativesController {

    @Autowired
    private CooperativesService  cooperativesService;


    @ResponseBody
    @RequestMapping("queryCooperatives")
    public HashMap<String, Object> queryCooperatives(Integer page, Integer rows, CooperativesBean  cooperativesBean){
        return  cooperativesService.queryCooperatives(page,rows,cooperativesBean);
    }

}
