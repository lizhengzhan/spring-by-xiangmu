package com.jk.controller;

import com.jk.bean.UserBean;
import com.jk.service.UserServiec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserServiec userServiec;

    @RequestMapping("queryUser")
    @ResponseBody
    public HashMap<String, Object> queryUser(Integer page, Integer rows, UserBean userBean){
        return userServiec.queryUser(page,rows,userBean);
    }
}
