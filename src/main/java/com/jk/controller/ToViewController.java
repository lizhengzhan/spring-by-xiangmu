package com.jk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ToViewController {

    @RequestMapping("toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("toMain")
    public  String toMain(){
        return  "main";
    }



    @RequestMapping("tree")
    public   String  tree(){
        return  "tree";
    }

    @RequestMapping("toCompany")
    public  String  toCompany() {
        return "company/list";
    }
    @RequestMapping("toCooperatives")
    public  String  toCooperatives(){
        return  "Cooperatives/show";
    }

    @RequestMapping("toAdd")
    public  String  toAdd(){
        return "company/addCompany";

    }

    @RequestMapping("toYiXiang")
    public  String  toYiXiang(){
        return  "jinrong/list";
    }


    @RequestMapping("toAddCooper")
    public   String  toAddCooper(){
        return  "Cooperatives/addCooper";
    }

    @RequestMapping("toUser")
    public  String  toUser() {
        return "user/list";
    }

    @RequestMapping("toUserAdd")
    public String toUserAdd(){
        return "user/add";
    }

    //车辆品牌
    @RequestMapping("toBrand")
    public  String  toBrand(){
        return  "brand/brandList";
    }

    //跳转买车新增页面
    @RequestMapping("toBrandAdd")
    public String toBrandAdd(){
        return "brand/brandAdd";
    }


    //跳转汽车审核页面
    @RequestMapping("toCarAuditLits")
    public   String  toCarAuditLits(){
        return   "carAudit/list";
    }


}
