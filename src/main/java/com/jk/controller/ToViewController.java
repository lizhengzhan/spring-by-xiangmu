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

    @RequestMapping("toUser")
    public  String  toUser() {
        return "user/list";
    }

}
