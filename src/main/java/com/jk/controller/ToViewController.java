package com.jk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ToViewController {

    @RequestMapping("toLogin")
    public String toLogin(){
        return "../login.jsp";
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

    @RequestMapping("toQueryArea")
    public String toQueryArea(){
        return "area/area";
    }

    @RequestMapping("toAreaAdd")
    public String toAreaAdd(){
        return "area/add";
    }

    @RequestMapping("toUserUpdatePassword")
    public String toUserUpdatePassword(){
        return "user/upPassword";
    }
}
